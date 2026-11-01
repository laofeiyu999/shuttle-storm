/* ============================================================================
 * charge_math.js —  charge_curves.py 的 JS 移植（纯几何，无 DOM）
 * 与 Python 版逐函数对应，用于网页实时计算 + node 侧一致性校验。
 * 单位：cm / 秒
 * ==========================================================================*/
(function (root) {
  'use strict';

  var NET_H = 150.0;
  var NET_HALF_W = 305.0;
  var COURT_HALF_L = 260.0;
  var COURT_HALF_W = 670.0;
  var SHORT_SERVICE = 198.0;
  var MID_LINE = 335.0;
  var BASELINE = 670.0;
  var DBL_LONG_SERVICE = 594.0;

  var G = 500.0;
  var K = 0.00024;

  var CHARGE_STEPS = 21;

  var DROP_NET_CHARGE = 1.0 / 3.0;
  var DROP_LAND_MIN = 55.0;
  var DROP_LAND_MAX = SHORT_SERVICE;
  var DROP_NET_CROSS_LOW = 70.0;
  var DROP_NET_CROSS_HIGH = 147.0;
  var DROP_TARGET_APEX = 205.0;

  var CLEAR_LAND_MIN = MID_LINE;
  var CLEAR_LAND_MAX = BASELINE;
  var CLEAR_TARGET_APEX = 620.0;

  var SMASH_NET_CHARGE = 4.0 / 5.0;
  var SMASH_MIN_H = 240.0;
  var SMASH_LAND_MAX = MID_LINE;
  var SMASH_SPEED = 3400.0;
  var SMASH_NET_CROSS_LOW = 60.0;
  var SMASH_NET_CROSS_HIGH = 148.0;
  var SMASH_NET_SPEED = 2600.0;

  var DRIVE_DEPTH_FRONT = 240.0;
  var DRIVE_DEPTH_BACK = 500.0;
  var DRIVE_OUT_FRONT = 0.25;
  var DRIVE_OUT_BACK = 0.75;
  var DRIVE_LAND_MIN = 150.0;
  var DRIVE_LAND_MAX_OUT = 800.0;
  var DRIVE_MAX_SPEED = 2600.0;

  var CLEAR_MARGIN = 12.0;
  var ANGLE_STEP = 2.0;
  var ANGLE_MAX_RAISE = 40;
  var ANGLE_FLOOR = -22.0;
  var ANGLE_CEIL = 87.0;
  var MIN_APEX_LIFT = 20.0;   // 弧顶至少高出击球点这么多，避免二分退化

  var SAMPLE_DT = 0.01;
  var MAX_POINTS = 400;

  var VEL_MIN = 20.0;
  var VEL_MAX = 8000.0;
  var ANGLE_BIAS_DEG = 0.0;

  /* ---------------- 基础 ---------------- */
  function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }
  function clamp01(v) { return v < 0 ? 0 : (v > 1 ? 1 : v); }
  function lerp(a, b, t) { return a + (b - a) * t; }
  function hypot2(a, b) { return Math.sqrt(a * a + b * b); }

  function accel(vx, vy) {
    var sp = hypot2(vx, vy);
    return [-K * sp * vx, -G - K * sp * vy];
  }

  /* RK4，与 Python integrate 完全一致 */
  function integrate(vx0, vy0, T, steps) {
    var dt = T / steps;
    var x = 0, y = 0, vx = vx0, vy = vy0;
    var xs = [0], ys = [0];
    for (var i = 0; i < steps; i++) {
      var a1 = accel(vx, vy);
      var k2x = vx + 0.5 * dt * a1[0], k2y = vy + 0.5 * dt * a1[1];
      var a2 = accel(k2x, k2y);
      var k3x = vx + 0.5 * dt * a2[0], k3y = vy + 0.5 * dt * a2[1];
      var a3 = accel(k3x, k3y);
      var k4x = vx + dt * a3[0], k4y = vy + dt * a3[1];
      var a4 = accel(k4x, k4y);
      x += dt / 6.0 * (vx + 2 * k2x + 2 * k3x + k4x);
      y += dt / 6.0 * (vy + 2 * k2y + 2 * k3y + k4y);
      vx += dt / 6.0 * (a1[0] + 2 * a2[0] + 2 * a3[0] + a4[0]);
      vy += dt / 6.0 * (a1[1] + 2 * a2[1] + 2 * a3[1] + a4[1]);
      xs.push(x); ys.push(y);
    }
    return [xs, ys];
  }

  /* 积分到水平位移 >= dist；返回 [y_at, t_at, apex, t_apex] 或 null */
  function flyTo(vx0, vy0, dist, dt, maxT) {
    dt = dt || 0.002; maxT = maxT || 12.0;
    var x = 0, y = 0, t = 0, vx = vx0, vy = vy0;
    var apex = y, tApex = 0;
    while (t < maxT) {
      var a1 = accel(vx, vy);
      var k2x = vx + 0.5 * dt * a1[0], k2y = vy + 0.5 * dt * a1[1];
      var a2 = accel(k2x, k2y);
      var k3x = vx + 0.5 * dt * a2[0], k3y = vy + 0.5 * dt * a2[1];
      var a3 = accel(k3x, k3y);
      var k4x = vx + dt * a3[0], k4y = vy + dt * a3[1];
      var a4 = accel(k4x, k4y);
      var px = x, py = y, pt = t;
      var ddx = dt / 6.0 * (vx + 2 * k2x + 2 * k3x + k4x);
      var ddy = dt / 6.0 * (vy + 2 * k2y + 2 * k3y + k4y);
      x += ddx; y += ddy;
      vx += dt / 6.0 * (a1[0] + 2 * a2[0] + 2 * a3[0] + a4[0]);
      vy += dt / 6.0 * (a1[1] + 2 * a2[1] + 2 * a3[1] + a4[1]);
      t += dt;
      if (y > apex) { apex = y; tApex = t; }
      if (x >= dist) {
        var span = x - px;
        var r = span <= 0 ? 0 : (dist - px) / span;
        return [py + (y - py) * r, pt + (t - pt) * r, apex, tApex];
      }
      if (y < -3000 || t > maxT) break;
    }
    return null;
  }

  /* 固定仰角二分初速，使轨迹经过 (dist, dy) */
  function solveByAngle(dist, dy, angleDeg) {
    var a = (angleDeg + ANGLE_BIAS_DEG) * Math.PI / 180.0;
    var ca = Math.cos(a), sa = Math.sin(a);
    function h(v) { var r = flyTo(v * ca, v * sa, dist); return r === null ? null : r[0]; }
    var hi = VEL_MAX, lo = VEL_MIN;
    var rHi = h(hi);
    if (rHi === null) {
      var res0 = flyTo(hi * ca, hi * sa, dist);
      var t0 = res0 ? res0[1] : dist / Math.max(1e-6, hi * ca);
      return [hi * ca, hi * sa, t0, 0, 0];
    }
    if (rHi < dy) {
      var res1 = flyTo(hi * ca, hi * sa, dist);
      return [hi * ca, hi * sa, res1[1], res1[2], res1[3]];
    }
    for (var i = 0; i < 48; i++) {
      var mid = 0.5 * (lo + hi);
      var hm = h(mid);
      if (hm === null || hm < dy) lo = mid; else hi = mid;
      if (hi - lo < 0.5) break;
    }
    var v = 0.5 * (lo + hi);
    var res = flyTo(v * ca, v * sa, dist);
    if (res === null) return [v * ca, v * sa, dist / Math.max(1e-6, v * ca), 0, 0];
    return [v * ca, v * sa, res[1], res[2], res[3]];
  }

  function netCrossY(points) {
    for (var i = 0; i < points.length - 1; i++) {
      var z0 = points[i][2], z1 = points[i + 1][2];
      if (z0 === 0) return points[i][1];
      if (z0 * z1 < 0) {
        var r = Math.abs(z0) / (Math.abs(z0) + Math.abs(z1));
        return points[i][1] + (points[i + 1][1] - points[i][1]) * r;
      }
    }
    return null;
  }

  function lerpAt(ts, vals, t) {
    if (t <= ts[0]) return vals[0];
    if (t >= ts[ts.length - 1]) return vals[vals.length - 1];
    var lo = 0, hi = ts.length - 1;
    while (hi - lo > 1) {
      var mid = (lo + hi) >> 1;
      if (ts[mid] <= t) lo = mid; else hi = mid;
    }
    var span = ts[hi] - ts[lo];
    var r = span <= 0 ? 0 : (t - ts[lo]) / span;
    return vals[lo] + (vals[hi] - vals[lo]) * r;
  }

  function resample(ts, pts, T, dt) {
    dt = dt || SAMPLE_DT;
    if (T <= 1e-6) return [[0, 0], [pts[0], pts[0]]];
    var n = clamp(Math.round(T / dt) + 1, 2, MAX_POINTS);
    var grid = [], out = [];
    var xs = [], ys = [], zs = [];
    for (var i = 0; i < pts.length; i++) { xs.push(pts[i][0]); ys.push(pts[i][1]); zs.push(pts[i][2]); }
    for (var k = 0; k < n; k++) {
      var t = T * k / (n - 1);
      grid.push(t);
      out.push([lerpAt(ts, xs, t), lerpAt(ts, ys, t), lerpAt(ts, zs, t)]);
    }
    return [grid, out];
  }

  function dense(hit, ux, uz, vx, vy, T, dt) {
    dt = dt || 0.002;
    var n = clamp(Math.round(T / dt), 4, 6000);
    var ts = [], i;
    var res = integrate(vx, vy, T, n);
    var xs = res[0], ys = res[1];
    var pts = [];
    for (i = 0; i <= n; i++) {
      ts.push(T * i / n);
      pts.push([hit[0] + ux * xs[i], hit[1] + ys[i], hit[2] + uz * xs[i]]);
    }
    return [ts, pts];
  }

  function unit2(dx, dz) {
    var d = hypot2(dx, dz);
    if (d < 1e-9) return [1.0, 0.0, 1e-9];
    return [dx / d, dz / d, d];
  }

  /* ---------------- 弹道基元 ---------------- */
  function ballistic(hit, land, angleDeg) {
    var u = unit2(land[0] - hit[0], land[2] - hit[2]);
    var dy = land[1] - hit[1];
    var s = solveByAngle(u[2], dy, angleDeg);
    var dp = dense(hit, u[0], u[1], s[0], s[1], s[2]);
    return { ts: dp[0], pts: dp[1], T: s[2], v: hypot2(s[0], s[1]) };
  }

  function angleForApex(hit, land, apexTarget) {
    var lo = ANGLE_FLOOR, hi = ANGLE_CEIL, best = ANGLE_FLOOR, i, mid, b;
    for (i = 0; i < 40; i++) {
      mid = 0.5 * (lo + hi);
      b = ballistic(hit, land, mid);
      var ap = 0;
      for (var k = 0; k < b.pts.length; k++) if (b.pts[k][1] > ap) ap = b.pts[k][1];
      if (ap < apexTarget) lo = mid; else hi = mid;
      best = mid;
      if (hi - lo < 0.02) break;
    }
    b = ballistic(hit, land, best);
    return { angle: best, ts: b.ts, pts: b.pts, T: b.T, v: b.v };
  }

  function finishCurve(kind, start, land, ts, pts, T, v, ang, forcedNet) {
    var r = resample(ts, pts, T, SAMPLE_DT);
    var grid = r[0], out = r[1];
    out[0] = [start[0], start[1], start[2]];
    out[out.length - 1] = [land[0], land[1], land[2]];
    var apex = 0;
    for (var i = 0; i < out.length; i++) if (out[i][1] > apex) apex = out[i][1];
    return {
      kind: kind, points: out, times: grid, T: grid[grid.length - 1],
      drop: [land[0], land[1], land[2]], start: [start[0], start[1], start[2]],
      angle: ang, speed: v, apex: apex, netY: netCrossY(out),
      forcedNet: !!forcedNet
    };
  }

  /* 从 ang0 起找"最小的能过网仰角"。二分而非 2 度台阶：
     台阶会让仰角随蓄力值阶梯变化，时间列/落点在台阶处跳变。 */
  function clearAngle(hit, land, ang0, need, maxRaise) {
    maxRaise = maxRaise || ANGLE_MAX_RAISE;
    function probe(a) {
      var b = ballistic(hit, land, a);
      var ny = netCrossY(b.pts);
      return [(ny !== null && ny >= need), { ang: a, ts: b.ts, pts: b.pts, T: b.T, v: b.v, netY: ny }];
    }
    var r0 = probe(ang0);
    if (r0[0]) return r0[1];
    var lo = ang0, hi = ang0, res = r0[1], okHi = false;
    /* 粗搜必须覆盖整个 [ang0, ANGLE_CEIL]：起始仰角很负时（后场吊球 ang0≈-22°），
       固定 2 度台阶 40 次只到 58 度，够不到能过网的 ~64 度，会误判成下网。 */
    var step = Math.max(ANGLE_STEP, (ANGLE_CEIL - ang0) / maxRaise);
    for (var i = 0; i <= maxRaise; i++) {
      hi = Math.min(ANGLE_CEIL, hi + step);
      var rh = probe(hi);
      okHi = rh[0]; res = rh[1];
      if (okHi || hi >= ANGLE_CEIL - 1e-9) break;
    }
    if (!okHi) return res;
    for (var j = 0; j < 24; j++) {
      var mid = 0.5 * (lo + hi);
      var rm = probe(mid);
      if (rm[0]) { hi = mid; res = rm[1]; } else { lo = mid; }
      if (hi - lo < 0.02) break;
    }
    var rf = probe(hi);
    return rf[0] ? rf[1] : res;
  }

  function lofted(hit, land, apexTarget, kind) {
    var start = [hit[0], hit[1], hit[2]];
    land = [land[0], land[1], land[2]];
    var need = NET_H + CLEAR_MARGIN;
    var crosses = start[2] * land[2] < 0;
    /* 弧顶目标必须高于击球点，否则 angleForApex 的二分退化到最低仰角，
       后场高点击球（y=268/285）配 apexTarget=185 时整条弧变成平射。 */
    apexTarget = Math.max(apexTarget, start[1] + MIN_APEX_LIFT);
    var r = angleForApex(start, land, apexTarget);
    var ang = r.angle, ts = r.ts, pts = r.pts, T = r.T, v = r.v;
    if (crosses) {
      var c = clearAngle(start, land, ang, need);
      ang = c.ang; ts = c.ts; pts = c.pts; T = c.T; v = c.v;
    }
    return finishCurve(kind, start, land, ts, pts, T, v, ang, false);
  }

  function minAngleNoDrag(hit, land, needY) {
    var dx = land[0] - hit[0], dz = land[2] - hit[2];
    var D = hypot2(dx, dz);
    if (D < 1e-6) return null;
    var dn = Math.abs(dz) > 1e-9 ? (-hit[2] * D / dz) : 0;
    dn = Math.abs(dn);
    if (dn <= 1e-6 || dn >= D - 1e-6) return null;
    var q = dn / D;
    var den = dn - dn * dn / D;
    if (Math.abs(den) < 1e-9) return null;
    var t = (needY - hit[1] * (1 - q * q)) / den;
    return Math.atan(t) * 180 / Math.PI;
  }

  function loftedMin(hit, land, kind) {
    var start = [hit[0], hit[1], hit[2]];
    land = [land[0], land[1], land[2]];
    var need = NET_H + CLEAR_MARGIN;
    var ang = minAngleNoDrag(start, land, need);
    if (ang === null) ang = -10.0;
    ang = clamp(ang, ANGLE_FLOOR, ANGLE_CEIL);
    var ca = clearAngle(start, land, ang, need);
    ang = ca.ang;
    var b = { ts: ca.ts, pts: ca.pts, T: ca.T, v: ca.v };
    var ts = b.ts, pts = b.pts, T = b.T, v = b.v;
    if (v > DRIVE_MAX_SPEED) {
      var lo = ang, hi = ANGLE_CEIL;
      for (var i = 0; i < 18; i++) {
        var mid = 0.5 * (lo + hi);
        var bb = ballistic(start, land, mid);
        if (bb.v > DRIVE_MAX_SPEED) lo = mid; else hi = mid;
      }
      ang = hi;
      b = ballistic(start, land, ang);
      ts = b.ts; pts = b.pts; T = b.T; v = b.v;
    }
    return finishCurve(kind, start, land, ts, pts, T, v, ang, false);
  }

  function straight(hit, land, speed, kind, dt) {
    dt = dt || 0.008;
    var start = [hit[0], hit[1], hit[2]];
    land = [land[0], land[1], land[2]];
    var L3 = Math.sqrt(Math.pow(land[0] - start[0], 2) + Math.pow(land[1] - start[1], 2) +
                       Math.pow(land[2] - start[2], 2));
    var T = Math.max(0.02, L3 / speed);
    var n = clamp(Math.round(T / dt) + 1, 2, MAX_POINTS);
    var grid = [], pts = [];
    for (var i = 0; i < n; i++) {
      var r = i / (n - 1);
      grid.push(T * r);
      pts.push([lerp(start[0], land[0], r), lerp(start[1], land[1], r),
                lerp(start[2], land[2], r)]);
    }
    var apex = 0;
    for (var k = 0; k < pts.length; k++) if (pts[k][1] > apex) apex = pts[k][1];
    return {
      kind: kind, points: pts, times: grid, T: T, drop: land, start: start,
      angle: Math.atan2(land[1] - start[1], L3) * 180 / Math.PI,
      speed: speed, apex: apex, netY: netCrossY(pts), forcedNet: false
    };
  }

  function netFault(hit, crossY, aimX, kind, speed) {
    var start = [hit[0], hit[1], hit[2]];
    var ax = aimX, az = 0;
    var dNet = Math.max(hypot2(ax - start[0], az - start[2]), 1.0);
    var tNet = dNet / Math.max(speed, 1.0);
    var ux = (ax - start[0]) / dNet, uz = (az - start[2]) / dNet;
    var vh = dNet / tNet;
    var vy0 = (crossY - start[1] + 0.5 * G * tNet * tNet) / tNet;
    var n = clamp(Math.round(tNet / SAMPLE_DT) + 1, 3, MAX_POINTS);
    var grid = [], out = [];
    for (var i = 0; i < n; i++) {
      var t = tNet * i / (n - 1);
      grid.push(t);
      out.push([start[0] + ux * vh * t,
                Math.max(0, start[1] + vy0 * t - 0.5 * G * t * t),
                start[2] + uz * vh * t]);
    }
    out[out.length - 1] = [ax, crossY, az];
    var h = Math.max(5.0, crossY);
    var tFall = Math.sqrt(2 * h / G);
    var nf = clamp(Math.round(tFall / SAMPLE_DT), 2, 120);
    for (var j = 1; j <= nf; j++) {
      var r = j / nf;
      grid.push(tNet + tFall * r);
      out.push([ax, Math.max(0, h - 0.5 * G * Math.pow(tFall * r, 2)), -10.0 * r]);
    }
    out[out.length - 1] = [ax, 0, -10.0];
    var apex = 0;
    for (var k = 0; k < out.length; k++) if (out[k][1] > apex) apex = out[k][1];
    return {
      kind: kind, points: out, times: grid, T: grid[grid.length - 1],
      drop: out[out.length - 1], start: start, angle: 0,
      speed: hypot2(vh, vy0), apex: apex, netY: crossY, forcedNet: true
    };
  }

  /* ---------------- 杀球下网池（平滑互插）---------------- */
  var SMASH_POOL_N = 13;
  var smashPoolCache = {};

  function resampleNorm(cur, n) {
    n = n || 64;
    var ts = cur.times, pts = cur.points, T = ts[ts.length - 1];
    var xs = [], ys = [], zs = [], i;
    for (i = 0; i < pts.length; i++) { xs.push(pts[i][0]); ys.push(pts[i][1]); zs.push(pts[i][2]); }
    var out = [], uu = [];
    for (i = 0; i < n; i++) {
      var t = T * i / (n - 1);
      out.push([lerpAt(ts, xs, t), lerpAt(ts, ys, t), lerpAt(ts, zs, t)]);
      uu.push(i / (n - 1));
    }
    return [out, uu];
  }

  function smashPool(hit, aimX) {
    var key = [hit[0].toFixed(2), hit[1].toFixed(2), hit[2].toFixed(2), aimX.toFixed(2)].join('|');
    if (smashPoolCache[key]) return smashPoolCache[key];
    var pool = [];
    for (var i = 0; i < SMASH_POOL_N; i++) {
      var r = i / (SMASH_POOL_N - 1);
      var crossY = lerp(SMASH_NET_CROSS_HIGH, SMASH_NET_CROSS_LOW, r);
      var spd = lerp(SMASH_NET_SPEED, SMASH_NET_SPEED * 0.62, r);
      var c = netFault(hit, crossY, aimX, 'smash_net', spd);
      var rn = resampleNorm(c);
      pool.push({ r: r, normPoints: rn[0], T: c.T, netY: crossY, speed: spd });
    }
    smashPoolCache[key] = pool;
    return pool;
  }

  function smashNetCurve(hit, r, aimX) {
    var pool = smashPool(hit, aimX);
    r = clamp01(r);
    var f = r * (SMASH_POOL_N - 1);
    var i0 = clamp(Math.floor(f), 0, SMASH_POOL_N - 2);
    var w = f - i0;
    var a = pool[i0], b = pool[i0 + 1];
    var T = lerp(a.T, b.T, w);
    var n = a.normPoints.length;
    var pts = [], ts = [];
    for (var k = 0; k < n; k++) {
      pts.push([lerp(a.normPoints[k][0], b.normPoints[k][0], w),
                lerp(a.normPoints[k][1], b.normPoints[k][1], w),
                lerp(a.normPoints[k][2], b.normPoints[k][2], w)]);
      ts.push(T * k / (n - 1));
    }
    var apex = 0;
    for (var j = 0; j < pts.length; j++) if (pts[j][1] > apex) apex = pts[j][1];
    return {
      kind: 'smash_net', points: pts, times: ts, T: T,
      drop: pts[pts.length - 1], start: pts[0], angle: 0,
      speed: lerp(a.speed, b.speed, w), apex: apex,
      netY: lerp(a.netY, b.netY, w), forcedNet: true
    };
  }

  /* ---------------- 三个击球键 ---------------- */
  function shotDrop(hit, charge, aimX) {
    if (charge < DROP_NET_CHARGE) {
      var r = clamp01(charge / DROP_NET_CHARGE);
      var crossY = lerp(DROP_NET_CROSS_LOW, DROP_NET_CROSS_HIGH, r);
      var spd = lerp(320.0, 900.0, r);
      return netFault(hit, crossY, aimX, 'drop_net', spd);
    }
    var t = clamp01((charge - DROP_NET_CHARGE) / (1.0 - DROP_NET_CHARGE));
    var zLand = lerp(DROP_LAND_MIN, DROP_LAND_MAX, t);
    var apex = lerp(185.0, DROP_TARGET_APEX, t);
    return lofted(hit, [aimX, 0, zLand], apex, 'drop');
  }

  function shotClear(hit, charge, aimX) {
    var c = clamp01(charge);
    var zLand = lerp(CLEAR_LAND_MIN, CLEAR_LAND_MAX, c);
    var apex = lerp(CLEAR_TARGET_APEX, CLEAR_TARGET_APEX + 40.0, c);
    return lofted(hit, [aimX, 0, zLand], apex, 'clear');
  }

  function smashReachLimit(y0) {
    return SMASH_LAND_MAX * (y0 - NET_H) / NET_H;
  }

  function driveOutCharge(hitZ) {
    var depth = clamp01((Math.abs(hitZ) - DRIVE_DEPTH_FRONT) / (DRIVE_DEPTH_BACK - DRIVE_DEPTH_FRONT));
    return lerp(DRIVE_OUT_FRONT, DRIVE_OUT_BACK, depth);
  }

  function shotSmash(hit, charge, aimX) {
    var y0 = hit[1], L = Math.abs(hit[2]);
    var straightOk = (y0 >= SMASH_MIN_H) && (L <= smashReachLimit(y0) + 1e-6);
    var c = clamp01(charge);
    if (straightOk) {
      if (c > SMASH_NET_CHARGE) {
        var r = (c - SMASH_NET_CHARGE) / (1.0 - SMASH_NET_CHARGE);
        return smashNetCurve(hit, r, aimX);
      }
      var zGraze = Math.max(NET_H * L / (y0 - NET_H), 1.0);
      var t = clamp01((SMASH_NET_CHARGE - c) / SMASH_NET_CHARGE);
      var zLand = lerp(zGraze, SMASH_LAND_MAX, t);
      var cur = straight(hit, [aimX, 0, zLand], SMASH_SPEED, 'smash_straight');
      cur.zGraze = zGraze;
      return cur;
    }
    var cOut = driveOutCharge(hit[2]);
    var zl;
    if (c <= cOut) {
      zl = lerp(DRIVE_LAND_MIN, BASELINE, c / Math.max(cOut, 1e-6));
    } else {
      zl = lerp(BASELINE, DRIVE_LAND_MAX_OUT, (c - cOut) / Math.max(1.0 - cOut, 1e-6));
    }
    var d = loftedMin(hit, [aimX, 0, zl], 'drive');
    d.driveOutCharge = cOut;
    return d;
  }

  var SHOT_FN = { P: shotDrop, GY: shotClear, D: shotSmash };
  var SHOT_KEYS = ['P', 'D', 'GY'];
  var SHOT_NAMES = { P: '小球', D: '杀球/平抽', GY: '高远' };

  var HIT_PRESETS = {
    front: { label: '网前', x: 0.0, y: 168.0, z: -110.0 },
    mid: { label: '中场', x: 0.0, y: 285.0, z: -280.0 },
    back: { label: '后场', x: 0.0, y: 268.0, z: -600.0 }
  };
  var DEFAULT_PRESET = { P: 'front', D: 'mid', GY: 'back' };

  function classify(cur) {
    if (cur.forcedNet) return 'net';
    if (cur.netY !== null && cur.netY < NET_H) return 'net';
    var x = cur.drop[0], z = cur.drop[2];
    if (Math.abs(x) > COURT_HALF_L + 1e-6 || z > COURT_HALF_W + 1e-6) return 'out';
    return 'in';
  }

  function buildShot(key, hit, charge, aimX) {
    aimX = aimX || 0;
    var cur = SHOT_FN[key]([hit[0], hit[1], hit[2]], clamp01(charge), aimX);
    cur.charge = clamp01(charge);
    cur.key = key;
    cur.status = classify(cur);
    return cur;
  }

  function buildFamily(key, hit, aimX, n) {
    aimX = aimX || 0; n = n || CHARGE_STEPS;
    var out = [];
    for (var i = 0; i < n; i++) out.push(buildShot(key, hit, i / (n - 1), aimX));
    return out;
  }

  var API = {
    NET_H: NET_H, NET_HALF_W: NET_HALF_W, COURT_HALF_L: COURT_HALF_L,
    COURT_HALF_W: COURT_HALF_W, SHORT_SERVICE: SHORT_SERVICE, MID_LINE: MID_LINE,
    BASELINE: BASELINE, DBL_LONG_SERVICE: DBL_LONG_SERVICE, G: G, K: K,
    CHARGE_STEPS: CHARGE_STEPS, DROP_NET_CHARGE: DROP_NET_CHARGE,
    SMASH_NET_CHARGE: SMASH_NET_CHARGE, SMASH_MIN_H: SMASH_MIN_H,
    HYPER: hypot2, lerp: lerp, clamp: clamp, clamp01: clamp01,
    integrate: integrate, flyTo: flyTo, solveByAngle: solveByAngle,
    netCrossY: netCrossY, lerpAt: lerpAt, resample: resample,
    ballistic: ballistic, lofted: lofted, loftedMin: loftedMin,
    straight: straight, netFault: netFault,
    shotDrop: shotDrop, shotClear: shotClear, shotSmash: shotSmash,
    smashReachLimit: smashReachLimit, driveOutCharge: driveOutCharge,
    classify: classify, buildShot: buildShot, buildFamily: buildFamily,
    SHOT_KEYS: SHOT_KEYS, SHOT_NAMES: SHOT_NAMES,
    HIT_PRESETS: HIT_PRESETS, DEFAULT_PRESET: DEFAULT_PRESET
  };

  if (typeof module !== 'undefined' && module.exports) module.exports = API;
  root.CURVE = API;
})(typeof window !== 'undefined' ? window : globalThis);
