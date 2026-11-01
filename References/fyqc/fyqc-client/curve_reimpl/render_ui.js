/* render_ui.js — 离屏软件光栅化渲染器（零依赖，不需要浏览器）
 * ----------------------------------------------------------------------------
 * 为什么要有这个文件：本机沙箱禁止启动浏览器（mojo 命名管道被拒），无法截图，
 * 所以这里用与 curve_ui_only.html **完全相同的**相机/场景数学，把一个软件光栅化
 * 的画面输出成 PNG，用来肉眼校验「界面壳的球场/网/相机是不是对的」。
 *
 * 它渲染的曲线是【占位数据】（与网页内置的 placeholderCurve 同一套正弦拱公式），
 * 只用于确认曲线渲染通道能出图，不代表任何球路结果。
 *
 * 用法：node render_ui.js
 */
'use strict';
const fs = require('fs');
const zlib = require('zlib');

const W = 1600, H = 900, SS = 2;          // 2x 超采样
const RW = W * SS, RH = H * SS;

/* ---------- 矩阵 ---------- */
function ident() { const m = new Float64Array(16); m[0] = m[5] = m[10] = m[15] = 1; return m; }
function persp(fovy, aspect, near, far) {
  const m = new Float64Array(16), f = 1 / Math.tan(fovy / 2), nf = 1 / (near - far);
  m[0] = f / aspect; m[5] = f; m[10] = (far + near) * nf; m[11] = -1; m[14] = 2 * far * near * nf;
  return m;
}
function lookAt(eye, ctr, up) {
  let zx = eye[0] - ctr[0], zy = eye[1] - ctr[1], zz = eye[2] - ctr[2];
  let zl = Math.hypot(zx, zy, zz) || 1; zx /= zl; zy /= zl; zz /= zl;
  let xx = up[1] * zz - up[2] * zy, xy = up[2] * zx - up[0] * zz, xz = up[0] * zy - up[1] * zx;
  let xl = Math.hypot(xx, xy, xz) || 1; xx /= xl; xy /= xl; xz /= xl;
  const yx = zy * xz - zz * xy, yy = zz * xx - zx * xz, yz = zx * xy - zy * xx;
  const m = new Float64Array(16);
  m[0] = xx; m[1] = yx; m[2] = zx; m[3] = 0;
  m[4] = xy; m[5] = yy; m[6] = zy; m[7] = 0;
  m[8] = xz; m[9] = yz; m[10] = zz; m[11] = 0;
  m[12] = -(xx * eye[0] + xy * eye[1] + xz * eye[2]);
  m[13] = -(yx * eye[0] + yy * eye[1] + yz * eye[2]);
  m[14] = -(zx * eye[0] + zy * eye[1] + zz * eye[2]);
  m[15] = 1;
  return m;
}
function mul(a, b) {
  const o = new Float64Array(16);
  for (let i = 0; i < 4; i++) {
    const a0 = a[i], a1 = a[i + 4], a2 = a[i + 8], a3 = a[i + 12];
    for (let j = 0; j < 4; j++) o[i + j * 4] = a0 * b[j * 4] + a1 * b[j * 4 + 1] + a2 * b[j * 4 + 2] + a3 * b[j * 4 + 3];
  }
  return o;
}
function xform(m, p) {
  const x = p[0], y = p[1], z = p[2];
  const w = m[3] * x + m[7] * y + m[11] * z + m[15];
  return [(m[0] * x + m[4] * y + m[8] * z + m[12]) / w,
          (m[1] * x + m[5] * y + m[9] * z + m[13]) / w,
          (m[2] * x + m[6] * y + m[10] * z + m[14]) / w, w];
}

/* ---------- 缓冲 ---------- */
const colBuf = new Float32Array(RW * RH * 3);
const depBuf = new Float32Array(RW * RH).fill(Infinity);

function clear(rc, gc, bc) {
  for (let i = 0; i < RW * RH; i++) { colBuf[i * 3] = rc; colBuf[i * 3 + 1] = gc; colBuf[i * 3 + 2] = bc; }
  depBuf.fill(Infinity);
}
function blendPx(x, y, r, g, b, a) {
  if (x < 0 || y < 0 || x >= RW || y >= RH) return;
  const i = (y * RW + x) * 3;
  colBuf[i] = colBuf[i] * (1 - a) + r * a;
  colBuf[i + 1] = colBuf[i + 1] * (1 - a) + g * a;
  colBuf[i + 2] = colBuf[i + 2] * (1 - a) + b * a;
}

/* 画线段（屏幕空间钳制到近裁面），带 z 测试 */
function line3(mvp, p, q, r, g, b, a, thick) {
  let A = xform(mvp, p), B = xform(mvp, q);
  const NEARZ = -1;
  if (A[3] <= 0.001 && B[3] <= 0.001) return;
  if (A[3] <= 0.001) { const t = (0.001 - A[3]) / (B[3] - A[3]); A = A.map((v, i) => v + (B[i] - v) * t); }
  if (B[3] <= 0.001) { const t = (0.001 - B[3]) / (A[3] - B[3]); B = B.map((v, i) => v + (A[i] - v) * t); }
  const x0 = (A[0] * 0.5 + 0.5) * RW, y0 = (1 - (A[1] * 0.5 + 0.5)) * RH, z0 = A[2];
  const x1 = (B[0] * 0.5 + 0.5) * RW, y1 = (1 - (B[1] * 0.5 + 0.5)) * RH, z1 = B[2];
  const dx = x1 - x0, dy = y1 - y0;
  const n = Math.max(1, Math.ceil(Math.max(Math.abs(dx), Math.abs(dy))));
  const rad = (thick || 1) * SS / 2;
  for (let i = 0; i <= n; i++) {
    const t = i / n;
    const x = x0 + dx * t, y = y0 + dy * t, z = z0 + (z1 - z0) * t;
    const xi = Math.round(x), yi = Math.round(y);
    for (let oy = -Math.floor(rad); oy <= Math.floor(rad); oy++) {
      for (let ox = -Math.floor(rad); ox <= Math.floor(rad); ox++) {
        const px = xi + ox, py = yi + oy;
        if (px < 0 || py < 0 || px >= RW || py >= RH) continue;
        const di = py * RW + px;
        if (z <= depBuf[di] + 1e-6) { if (rad <= 0.5) depBuf[di] = z; blendPx(px, py, r, g, b, a); }
      }
    }
  }
}

/* 填充三角形（z 缓冲） */
function tri3(mvp, p, q, s, r, g, b) {
  const A = xform(mvp, p), B = xform(mvp, q), Cc = xform(mvp, s);
  if (A[3] <= 0.01 || B[3] <= 0.01 || Cc[3] <= 0.01) return;
  const toS = (P) => [(P[0] * 0.5 + 0.5) * RW, (1 - (P[1] * 0.5 + 0.5)) * RH, P[2]];
  const a = toS(A), c2 = toS(B), c3 = toS(Cc);
  const minX = Math.max(0, Math.floor(Math.min(a[0], c2[0], c3[0])));
  const maxX = Math.min(RW - 1, Math.ceil(Math.max(a[0], c2[0], c3[0])));
  const minY = Math.max(0, Math.floor(Math.min(a[1], c2[1], c3[1])));
  const maxY = Math.min(RH - 1, Math.ceil(Math.max(a[1], c2[1], c3[1])));
  const d = (c2[1] - c3[1]) * (a[0] - c3[0]) + (c3[0] - c2[0]) * (a[1] - c3[1]);
  if (Math.abs(d) < 1e-9) return;
  for (let y = minY; y <= maxY; y++) {
    for (let x = minX; x <= maxX; x++) {
      const w0 = ((c2[1] - c3[1]) * (x - c3[0]) + (c3[0] - c2[0]) * (y - c3[1])) / d;
      const w1 = ((c3[1] - a[1]) * (x - c3[0]) + (a[0] - c3[0]) * (y - c3[1])) / d;
      const w2 = 1 - w0 - w1;
      if (w0 < -0.002 || w1 < -0.002 || w2 < -0.002) continue;
      const di = y * RW + x;
      const z = w0 * a[2] + w1 * c2[2] + w2 * c3[2];
      if (z <= depBuf[di] + 1e-6) { depBuf[di] = z; blendPx(x, y, r, g, b, 1); }
    }
  }
}

/* ---------- PNG 编码 ---------- */
function crc32(buf) {
  let c, crc = 0xffffffff;
  for (let n = 0; n < buf.length; n++) {
    c = (crc ^ buf[n]) & 0xff;
    for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
    crc = (crc >>> 8) ^ c;
  }
  return (crc ^ 0xffffffff) >>> 0;
}
function chunk(type, data) {
  const len = Buffer.alloc(4); len.writeUInt32BE(data.length);
  const td = Buffer.concat([Buffer.from(type, 'ascii'), data]);
  const crc = Buffer.alloc(4); crc.writeUInt32BE(crc32(td));
  return Buffer.concat([len, td, crc]);
}
function writePNG(path, w, h, rgb) {
  const raw = Buffer.alloc((w * 3 + 1) * h);
  for (let y = 0; y < h; y++) {
    raw[y * (w * 3 + 1)] = 0;
    for (let x = 0; x < w * 3; x++) raw[y * (w * 3 + 1) + 1 + x] = rgb[y * w * 3 + x];
  }
  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(w, 0); ihdr.writeUInt32BE(h, 4);
  ihdr[8] = 8; ihdr[9] = 2; ihdr[10] = 0; ihdr[11] = 0; ihdr[12] = 0;
  const png = Buffer.concat([
    Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]),
    chunk('IHDR', ihdr),
    chunk('IDAT', zlib.deflateSync(raw, { level: 9 })),
    chunk('IEND', Buffer.alloc(0))
  ]);
  fs.writeFileSync(path, png);
}
/* ============================================================================
   一、球场常量（与 curve_ui_only.html 第一节逐字一致）
   ========================================================================== */
const NET_H = 150;            // 网高
const COURT_HALF_L = 260;     // 单打边线
const COURT_HALF_W = 670;     // 底线
const DUAL = 305;             // 双打边线 / 网柱位置
const SHORT_SERVICE = 198;    // 前发球线
const DBL_LONG_SERVICE = 594; // 双打后发球线
const CL = COURT_HALF_L, CW = COURT_HALF_W, SSv = SHORT_SERVICE, DLS = DBL_LONG_SERVICE;

/* ============================================================================
   二、静态场景：地面 + 场地线 + 网格 + 网
   ----------------------------------------------------------------------------
   与网页 buildScene() 逐条对应，只是把 pushLine 换成了光栅化器的 line3。
   ========================================================================== */
function drawCourt(mvp) {
  /* 地面：外圈底板 + 内圈稍亮（内圈抬 0.2 避免 z-fighting） */
  const f1 = [0.035, 0.055, 0.078], f2 = [0.055, 0.085, 0.115];
  tri3(mvp, [-DUAL - 90, 0, -CW - 60], [DUAL + 90, 0, -CW - 60], [DUAL + 90, 0, CW + 60], f1[0], f1[1], f1[2]);
  tri3(mvp, [-DUAL - 90, 0, -CW - 60], [DUAL + 90, 0, CW + 60], [-DUAL - 90, 0, CW + 60], f1[0], f1[1], f1[2]);
  tri3(mvp, [-DUAL, 0.2, -CW], [DUAL, 0.2, -CW], [DUAL, 0.2, CW], f2[0], f2[1], f2[2]);
  tri3(mvp, [-DUAL, 0.2, -CW], [DUAL, 0.2, CW], [-DUAL, 0.2, CW], f2[0], f2[1], f2[2]);

  /* 场地线：默认抬到 y=0.6 避免和地面重叠闪烁 */
  const seg = (x1, z1, x2, z2, c, y) =>
    line3(mvp, [x1, y === undefined ? 0.6 : y, z1], [x2, y === undefined ? 0.6 : y, z2],
          c[0], c[1], c[2], c[3] === undefined ? 1 : c[3], 1.4);
  const L1 = [0.17, 0.33, 0.44, 0.85];   // 主线
  const L2 = [0.11, 0.22, 0.31, 0.55];   // 次线
  const GR = [0.075, 0.14, 0.19, 0.45];  // 网格

  /* 地面网格先画（在场地线下面，被覆盖也没关系） */
  for (let gx = -600; gx <= 600; gx += 100) seg(gx, -CW - 40, gx, CW + 40, GR, 0.35);
  for (let gz = -700; gz <= 700; gz += 100) seg(-DUAL - 60, gz, DUAL + 60, gz, GR, 0.35);

  seg(-CL, -CW, -CL, CW, L1);              // 单打左边线
  seg(CL, -CW, CL, CW, L1);                // 单打右边线
  seg(-DUAL, -CW, -DUAL, CW, L2);          // 双打左边线
  seg(DUAL, -CW, DUAL, CW, L2);            // 双打右边线
  seg(-DUAL, -CW, DUAL, -CW, L1);          // 底线（我方）
  seg(-DUAL, CW, DUAL, CW, L1);            // 底线（对方）
  seg(-DUAL, -SSv, DUAL, -SSv, L1);        // 前发球线（我方）
  seg(-DUAL, SSv, DUAL, SSv, L1);          // 前发球线（对方）
  seg(-DUAL, -DLS, DUAL, -DLS, L2);        // 双打后发球线（我方）
  seg(-DUAL, DLS, DUAL, DLS, L2);          // 双打后发球线（对方）
  seg(0, -SSv, 0, -CW, L2);                // 中线（我方）
  seg(0, SSv, 0, CW, L2);                  // 中线（对方）

  /* 球网：立柱 + 上框 + 网底 + 网线 */
  const post = [0.72, 0.87, 0.96], mesh = [0.42, 0.66, 0.78];
  line3(mvp, [-DUAL, 0, 0], [-DUAL, NET_H, 0], post[0], post[1], post[2], 0.95, 2.2);  // 左立柱
  line3(mvp, [DUAL, 0, 0], [DUAL, NET_H, 0], post[0], post[1], post[2], 0.95, 2.2);    // 右立柱
  line3(mvp, [-DUAL, NET_H, 0], [DUAL, NET_H, 0], post[0], post[1], post[2], 0.95, 1.8); // 上框
  line3(mvp, [-DUAL, 0.5, 0], [DUAL, 0.5, 0], mesh[0], mesh[1], mesh[2], 0.7, 1.2);     // 网底
  for (let wx = -DUAL; wx <= DUAL; wx += 25) line3(mvp, [wx, 0.5, 0], [wx, NET_H, 0], mesh[0], mesh[1], mesh[2], 0.28, 0.8);
  for (let wy = 10; wy < NET_H; wy += 12) line3(mvp, [-DUAL, wy, 0], [DUAL, wy, 0], mesh[0], mesh[1], mesh[2], 0.2, 0.8);
}

/* ============================================================================
   三、占位曲线（与网页 placeholderCurve 同一套公式）
   ----------------------------------------------------------------------------
   再次强调：这不是球路逻辑，只是 4u(1-u) 的正弦拱，用来让画面里有条线。
   ========================================================================== */
function placeholderCurve(key, hit, charge, aimX) {
  const hx = hit[0], hy = hit[1], hz = hit[2];
  const far  = key === 'GY' ? COURT_HALF_W : (key === 'D' ? 335 : SHORT_SERVICE);
  const near = key === 'GY' ? 335 : 55;
  const landZ = near + (far - near) * charge;
  const landX = Math.max(-DUAL, Math.min(DUAL, aimX));
  const T = 0.7 + 1.9 * Math.abs(landZ - hz) / 1200;
  const bulge = key === 'GY' ? 380 : (key === 'D' ? 60 : 150);

  const N = 90, pts = [], ts = [];
  for (let i = 0; i <= N; i++) {
    const u = i / N;
    let y = hy * (1 - u) + bulge * 4 * u * (1 - u);
    if (i === N) y = 0;
    pts.push([hx + (landX - hx) * u, y, hz + (landZ - hz) * u]);
    ts.push(T * u);
  }
  const status = charge < 0.12 ? 'net' : (Math.abs(landX) > COURT_HALF_L ? 'out' : 'in');
  return {
    points: pts, times: ts, T: T,
    drop: [landX, 0, status === 'net' ? -10 : landZ],
    status: status,
    netY: status === 'net' ? 80 : Math.max(hy, NET_H + 20),
    apex: hy + bulge,
    speed: 300 + 900 * charge
  };
}

/* 曲线状态色（与网页 COL 一致） */
const COL = { in: [0.37, 0.94, 0.75], net: [1.0, 0.44, 0.54], out: [1.0, 0.76, 0.36] };
function cfor(cur, a) { const b = COL[cur.status] || COL.in; return [b[0], b[1], b[2], a === undefined ? 1 : a]; }

/* 画一条曲线 + 落点十字 + 击球点十字（与网页 buildCurveVertices 同几何） */
function drawCurve(mvp, cur, hit, thick) {
  const c = cfor(cur, 1);
  for (let k = 0; k + 1 < cur.points.length; k++) {
    line3(mvp, cur.points[k], cur.points[k + 1], c[0], c[1], c[2], 1, thick || 2.4);
  }
  const d = cur.drop, r = 34;
  line3(mvp, [d[0] - r, 1.2, d[2]], [d[0] + r, 1.2, d[2]], c[0], c[1], c[2], 1, 2);
  line3(mvp, [d[0], 1.2, d[2] - r], [d[0], 1.2, d[2] + r], c[0], c[1], c[2], 1, 2);
  line3(mvp, [d[0], 0, d[2]], [d[0], 58, d[2]], c[0], c[1], c[2], 0.5, 1.4);
  const hr = 26, hc = [0.85, 0.93, 1.0];
  line3(mvp, [hit[0] - hr, hit[1], hit[2]], [hit[0] + hr, hit[1], hit[2]], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], hit[1], hit[2] - hr], [hit[0], hit[1], hit[2] + hr], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], hit[1] - hr, hit[2]], [hit[0], hit[1] + hr, hit[2]], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], 0, hit[2]], [hit[0], hit[1], hit[2]], 0.6, 0.72, 0.85, 0.2, 1.0);
}

/* ============================================================================
   三·B、三套相机（参数与网页 currentEye() 逐字一致）
   ========================================================================== */
function currentEye(view, yaw, pitch, dist, target) {
  // 顶视：相机放很高 + 窄视角 ≈ 正交；球场长轴横放才装得进 16:9
  if (view === 'top')  return { eye: [0, 4200, 0.001], ctr: [0, 0, 0], up: [-1, 0, 0], fov: 16 * Math.PI / 180 };
  // 侧视：站场地侧面看整条抛物线剖面
  if (view === 'side') return { eye: [-2050, 380, 0], ctr: [0, 210, 0], up: [0, 1, 0], fov: 30 * Math.PI / 180 };
  // 透视：球坐标 -> 笛卡尔，绕 target 转
  const cp = Math.cos(pitch), sp = Math.sin(pitch);
  return {
    eye: [target[0] + dist * cp * Math.sin(yaw),
          target[1] + dist * sp,
          target[2] + dist * cp * Math.cos(yaw)],
    ctr: target, up: [0, 1, 0], fov: 42 * Math.PI / 180
  };
}

/* ============================================================================
   四、渲染一帧 -> PNG
   ========================================================================== */
function render(outPath, view, key, hit, charge, aimX, yaw, pitch, dist, tgt) {
  const target = tgt || [0, 150, 10];
  const c = currentEye(view, yaw, pitch, dist, target);

  const proj = persp(c.fov, RW / RH, 8, 9000);
  const mv = lookAt(c.eye, c.ctr, c.up);
  const mvp = mul(proj, mv);

  clear(0.016, 0.026, 0.043);
  drawCourt(mvp);

  // 曲线簇：占位数据，同样按 21 档画成扇形，亮度递增
  const FN = 21;
  for (let i = 0; i < FN; i++) {
    const f = placeholderCurve(key, hit, i / (FN - 1), aimX);
    const cc = cfor(f, 0.13 + 0.22 * (i / (FN - 1)));
    for (let k = 0; k + 2 < f.points.length; k += 2) {
      line3(mvp, f.points[k], f.points[k + 2], cc[0], cc[1], cc[2], cc[3], 1.0);
    }
  }
  const cur = placeholderCurve(key, hit, charge, aimX);
  drawCurve(mvp, cur, hit, 2.4);

  // 2x 超采样降采样
  const out = Buffer.alloc(W * H * 3);
  for (let y = 0; y < H; y++) for (let x = 0; x < W; x++) {
    let r = 0, g = 0, b = 0;
    for (let sy = 0; sy < SS; sy++) for (let sx = 0; sx < SS; sx++) {
      const i = ((y * SS + sy) * RW + (x * SS + sx)) * 3;
      r += colBuf[i]; g += colBuf[i + 1]; b += colBuf[i + 2];
    }
    const n = SS * SS, o = (y * W + x) * 3;
    out[o]     = Math.max(0, Math.min(255, Math.round(Math.pow(r / n, 1 / 1.05) * 255)));
    out[o + 1] = Math.max(0, Math.min(255, Math.round(Math.pow(g / n, 1 / 1.05) * 255)));
    out[o + 2] = Math.max(0, Math.min(255, Math.round(Math.pow(b / n, 1 / 1.05) * 255)));
  }
  writePNG(outPath, W, H, out);
  return { file: outPath, kind: cur.status, dropZ: cur.drop[2], T: cur.T, apex: cur.apex };
}

/* ============================================================================
   五、作业表：与网页默认状态一致的三张（透视 / 顶视 / 侧视）
   ========================================================================== */
const HIT = { front: [0, 168, -110], mid: [0, 285, -280], back: [0, 268, -600] };
const jobs = [
  // 输出文件, 视图, 键, 击球点, 蓄力, 瞄点, yaw, pitch, dist, 目标点
  ['ui_persp.png', 'persp', 'P',  HIT.front, 0.55, 0, -0.50, 0.58, 1900, [0, 150, 10]],
  ['ui_top.png',   'top',   'GY', HIT.back,  0.70, 0,  0,    0,    2100, [0, 0, 0]],
  ['ui_side.png',  'side',  'GY', HIT.back,  0.70, 0,  0,    0,    2050, [0, 210, 0]]
];

const infos = [];
for (const [file, view, key, hit, charge, aim, yaw, pitch, dist, tgt] of jobs) {
  const info = render(file, view, key, hit, charge, aim, yaw, pitch, dist, tgt);
  infos.push(info);
  console.log(file + '  status=' + info.kind + '  dropZ=' + info.dropZ.toFixed(1) +
              '  T=' + info.T.toFixed(3) + '  apex=' + info.apex.toFixed(1));
}
console.log('done: ' + infos.length + ' PNG');
