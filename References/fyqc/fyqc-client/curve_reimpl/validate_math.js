/* validate_math.js — charge_math.js(JS) vs charge_families.json(Python) + 细步长连续性 */
'use strict';
const fs = require('fs');
const path = require('path');
const CURVE = require('./charge_math.js');

const data = JSON.parse(fs.readFileSync(path.join(__dirname, 'charge_families.json'), 'utf8'));

function near(a, b, tolAbs, tolRel) {
  if (a === null && b === null) return true;
  if (a === null || b === null) return false;
  const d = Math.abs(a - b);
  return d <= tolAbs || d <= tolRel * Math.max(Math.abs(a), Math.abs(b), 1e-9);
}

let fails = [];
let n = 0;

const C = data.constants;
['NET_H', 'COURT_HALF_L', 'COURT_HALF_W', 'SHORT_SERVICE', 'MID_LINE', 'BASELINE', 'DBL_LONG_SERVICE', 'G', 'K']
  .forEach(k => { if (CURVE[k] !== C[k]) fails.push('CONST ' + k + ' js=' + CURVE[k] + ' py=' + C[k]); });

/* ---- 1. 逐条数值对齐 ---- */
for (const fam of data.families) {
  const hit = fam.hit;
  fam.curves.forEach(c => {
    n++;
    const j = CURVE.buildShot(fam.key, hit, c.charge, 0);
    const tag = fam.key + '/' + fam.preset + '@' + c.charge.toFixed(2);
    if (j.kind !== c.kind) fails.push(tag + ' kind js=' + j.kind + ' py=' + c.kind);
    if (j.status !== c.status) fails.push(tag + ' status js=' + j.status + ' py=' + c.status);
    if (!near(j.drop[2], c.drop[2], 1.0, 0.01)) fails.push(tag + ' dropZ js=' + j.drop[2].toFixed(2) + ' py=' + c.drop[2].toFixed(2));
    if (!near(j.T, c.T, 0.01, 0.02)) fails.push(tag + ' T js=' + j.T.toFixed(4) + ' py=' + c.T.toFixed(4));
    if (!near(j.apex, c.apex, 2.0, 0.02)) fails.push(tag + ' apex js=' + j.apex.toFixed(1) + ' py=' + c.apex.toFixed(1));
    if (!near(j.netY, c.netY, 2.0, 0.02)) fails.push(tag + ' netY js=' + (j.netY === null ? 'null' : j.netY.toFixed(1)) + ' py=' + (c.netY === null ? 'null' : c.netY.toFixed(1)));
    if (!near(j.speed, c.speed, 5.0, 0.02)) fails.push(tag + ' speed js=' + j.speed.toFixed(1) + ' py=' + c.speed.toFixed(1));
    if (j.times.length !== j.points.length) fails.push(tag + ' len mismatch');
    if (Math.abs(j.times[0]) > 1e-9) fails.push(tag + ' t0 != 0');
    for (let i = 1; i < j.times.length; i++) {
      if (!(j.times[i] > j.times[i - 1])) { fails.push(tag + ' time not increasing at ' + i); break; }
    }
    for (let i = 0; i < j.points.length; i++) {
      if (j.points[i][1] < -1.0) { fails.push(tag + ' y<0 at ' + i); break; }
    }
  });
}

/* ---- 2. 细步长连续性（c=0..1, 501 点）---- */
const FINE = 500;
for (const fam of data.families) {
  const hit = fam.hit;
  let prev = null;
  let prevKind = null;
  const jumpZ = [], jumpT = [];
  for (let i = 0; i <= FINE; i++) {
    const c = i / FINE;
    const cur = CURVE.buildShot(fam.key, hit, c, 0);
    if (prev && cur.kind === prev.kind) {
      const dz = Math.abs(cur.drop[2] - prev.drop[2]);
      const dT = Math.abs(cur.T - prev.T);
      // 0.002 蓄力步长下：落点位移不应超过 12cm，时长不应超过 0.05s
      if (dz > 12) jumpZ.push([c, dz]);
      if (dT > 0.05) jumpT.push([c, dT]);
    }
    // 分段 kind 变化只允许出现在两个已知边界
    if (prev && cur.kind !== prev.kind) {
      const okEdge =
        (fam.key === 'P' && prev.kind === 'drop_net' && cur.kind === 'drop') ||
        (fam.key === 'D' && prev.kind === 'smash_straight' && cur.kind === 'smash_net') ||
        (fam.key === 'D' && prev.kind === 'smash_straight' && cur.kind === 'drive') ||
        (fam.key === 'D' && prev.kind === 'drive' && cur.kind === 'drive_out');
      if (!okEdge && prevKind !== null) fails.push('KIND ' + fam.key + '/' + fam.preset + ' c=' + c.toFixed(3) + ' ' + prev.kind + ' -> ' + cur.kind);
    }
    prev = cur; prevKind = cur.kind;
  }
  if (jumpZ.length) fails.push('JUMPZ ' + fam.key + '/' + fam.preset + ' x' + jumpZ.length + ' max=' + Math.max(...jumpZ.map(a => a[1])).toFixed(1) + ' at c=' + jumpZ[0][0].toFixed(3));
  if (jumpT.length) fails.push('JUMPT ' + fam.key + '/' + fam.preset + ' x' + jumpT.length + ' max=' + Math.max(...jumpT.map(a => a[1])).toFixed(3) + ' at c=' + jumpT[0][0].toFixed(3));
}

/* ---- 3. 设计目标抽查（边界作为目标，容差放宽）---- */
const P_FRONT = CURVE.HIT_PRESETS.front, P_MID = CURVE.HIT_PRESETS.mid, P_BACK = CURVE.HIT_PRESETS.back;
function shot(k, p, c) { return CURVE.buildShot(k, [p.x, p.y, p.z], c, 0); }
function check(cond, msg) { if (!cond) fails.push('DESIGN ' + msg); }

// 小球：<1/3 下网
check(shot('P', P_FRONT, 0.0).status === 'net', 'drop c=0 should net');
check(shot('P', P_FRONT, 0.2).status === 'net', 'drop c=0.20 should net');
check(shot('P', P_FRONT, 0.32).status === 'net', 'drop c=0.32 should net');
check(shot('P', P_FRONT, 0.4).status === 'in', 'drop c=0.40 should be in');
// 小球满蓄力落到发球线附近
const pFull = shot('P', P_FRONT, 1.0);
check(Math.abs(pFull.drop[2] - CURVE.SHORT_SERVICE) < 8, 'drop c=1 land z=' + pFull.drop[2].toFixed(1) + ' want ~' + CURVE.SHORT_SERVICE);
// 高远：0 → 中线，1 → 底线
const g0 = shot('GY', P_BACK, 0.0), g1 = shot('GY', P_BACK, 1.0);
check(Math.abs(g0.drop[2] - CURVE.MID_LINE) < 10, 'clear c=0 land=' + g0.drop[2].toFixed(1) + ' want ~' + CURVE.MID_LINE);
check(Math.abs(g1.drop[2] - CURVE.BASELINE) < 10, 'clear c=1 land=' + g1.drop[2].toFixed(1) + ' want ~' + CURVE.BASELINE);
check(g0.status === 'in' && g1.status === 'in', 'clear all in');
// 杀球：中场直线，c=0 最远(中线)，c>4/5 下网
check(shot('D', P_MID, 0.0).kind === 'smash_straight', 'smash mid c=0 straight');
check(Math.abs(shot('D', P_MID, 0.0).drop[2] - CURVE.MID_LINE) < 10, 'smash mid c=0 land=' + shot('D', P_MID, 0.0).drop[2].toFixed(1));
check(shot('D', P_MID, 0.82).status === 'net', 'smash mid c=0.82 should net, got ' + shot('D', P_MID, 0.82).status);
check(shot('D', P_MID, 1.0).status === 'net', 'smash mid c=1 should net');
// 回归：抬角粗搜覆盖 + 弧顶夹取（后修 bug）—— 后场/中场小球 >=1/3 必须真过网
for (const [k, p] of [['P', P_BACK], ['P', P_MID]]) {
  for (const c of [0.34, 0.5, 0.75, 1.0]) {
    const s = shot(k, p, c);
    check(s.kind === 'drop' && s.status === 'in', 'drop ' + p.label + ' c=' + c.toFixed(2) + ' kind=' + s.kind + ' status=' + s.status);
    check(s.netY !== null && s.netY >= CURVE.NET_H + 10, 'drop ' + p.label + ' c=' + c.toFixed(2) + ' netY=' + (s.netY === null ? 'null' : s.netY.toFixed(1)));
    check(s.apex >= p.y + 15, 'drop ' + p.label + ' c=' + c.toFixed(2) + ' apex=' + s.apex.toFixed(1) + ' hitY=' + p.y);
  }
}
// 平抽：网前阈值 1/4、后场 3/4
const fOut = CURVE.driveOutCharge(P_FRONT.z), bOut = CURVE.driveOutCharge(P_BACK.z);
check(Math.abs(fOut - 0.25) < 0.06, 'drive front out charge=' + fOut.toFixed(3));
check(Math.abs(bOut - 0.75) < 0.06, 'drive back out charge=' + bOut.toFixed(3));
check(shot('D', P_FRONT, fOut - 0.06).status === 'in', 'drive front below threshold in');
check(shot('D', P_FRONT, fOut + 0.10).status === 'out', 'drive front above threshold out');
check(shot('D', P_BACK, bOut - 0.06).status === 'in', 'drive back below threshold in');
check(shot('D', P_BACK, bOut + 0.10).status === 'out', 'drive back above threshold out');

console.log('curves compared:', n);
console.log('fails:', fails.length);
if (fails.length) { fails.slice(0, 40).forEach(f => console.log('  ' + f)); process.exit(1); }
console.log('JS <-> PY + DESIGN: ALL PASS');
