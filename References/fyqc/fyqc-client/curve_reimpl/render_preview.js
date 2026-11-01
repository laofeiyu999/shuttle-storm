/* render_preview.js — 无依赖软件光栅化器
 * 用与 curve_viewer.html 完全相同的相机/场景/几何，离屏渲染 PNG 预览。
 * 目的：本机沙箱禁止启动浏览器（命名管道被拒），用它做视觉校验。
 */
'use strict';
const fs = require('fs');
const zlib = require('zlib');
const C = require('./charge_math.js');

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

/* ---------- 场景 ---------- */
const CL = C.COURT_HALF_L, CW = C.COURT_HALF_W, DUAL = 305, NET = C.NET_H, SSv = C.SHORT_SERVICE, DLS = C.DBL_LONG_SERVICE;

function drawCourt(mvp) {
  // 地面
  const f1 = [0.035, 0.055, 0.078], f2 = [0.052, 0.082, 0.112];
  tri3(mvp, [-DUAL - 90, 0, -CW - 60], [DUAL + 90, 0, -CW - 60], [DUAL + 90, 0, CW + 60], f1[0], f1[1], f1[2]);
  tri3(mvp, [-DUAL - 90, 0, -CW - 60], [DUAL + 90, 0, CW + 60], [-DUAL - 90, 0, CW + 60], f1[0], f1[1], f1[2]);
  tri3(mvp, [-DUAL, 0.2, -CW], [DUAL, 0.2, -CW], [DUAL, 0.2, CW], f2[0], f2[1], f2[2]);
  tri3(mvp, [-DUAL, 0.2, -CW], [DUAL, 0.2, CW], [-DUAL, 0.2, CW], f2[0], f2[1], f2[2]);

  const seg = (x1, z1, x2, z2, c, y) => line3(mvp, [x1, y === undefined ? 0.5 : y, z1], [x2, y === undefined ? 0.5 : y, z2], c[0], c[1], c[2], c[3] === undefined ? 1 : c[3], 1.4);
  const L1 = [0.17, 0.33, 0.44], L2 = [0.11, 0.22, 0.31], GR = [0.075, 0.14, 0.19];

  for (let gx = -600; gx <= 600; gx += 100) seg(gx, -CW - 40, gx, CW + 40, GR, 0.3);
  for (let gz = -700; gz <= 700; gz += 100) seg(-DUAL - 60, gz, DUAL + 60, gz, GR, 0.3);

  seg(-CL, -CW, -CL, CW, L1); seg(CL, -CW, CL, CW, L1);
  seg(-DUAL, -CW, -DUAL, CW, L2); seg(DUAL, -CW, DUAL, CW, L2);
  seg(-DUAL, -CW, DUAL, -CW, L1); seg(-DUAL, CW, DUAL, CW, L1);
  seg(-DUAL, -SSv, DUAL, -SSv, L1); seg(-DUAL, SSv, DUAL, SSv, L1);
  seg(-DUAL, -DLS, DUAL, -DLS, L2); seg(-DUAL, DLS, DUAL, DLS, L2);
  seg(0, -SSv, 0, -CW, L2); seg(0, SSv, 0, CW, L2);

  // 网
  const post = [0.72, 0.87, 0.96], mesh = [0.40, 0.63, 0.76];
  line3(mvp, [-DUAL, 0, 0], [-DUAL, NET, 0], post[0], post[1], post[2], 1, 2.2);
  line3(mvp, [DUAL, 0, 0], [DUAL, NET, 0], post[0], post[1], post[2], 1, 2.2);
  line3(mvp, [-DUAL, NET, 0], [DUAL, NET, 0], post[0], post[1], post[2], 1, 1.8);
  line3(mvp, [-DUAL, 0.5, 0], [DUAL, 0.5, 0], mesh[0], mesh[1], mesh[2], 0.7, 1.2);
  for (let wx = -DUAL; wx <= DUAL; wx += 25) line3(mvp, [wx, 0.5, 0], [wx, NET, 0], mesh[0], mesh[1], mesh[2], 0.24, 0.8);
  for (let wy = 10; wy < NET; wy += 12) line3(mvp, [-DUAL, wy, 0], [DUAL, wy, 0], mesh[0], mesh[1], mesh[2], 0.17, 0.8);
}

const COL = { in: [0.37, 0.94, 0.75], net: [1.0, 0.44, 0.54], out: [1.0, 0.76, 0.36] };
function cfor(cur, a) { const b = COL[cur.status] || COL.in; return [b[0], b[1], b[2], a === undefined ? 1 : a]; }

function drawCurves(mvp, key, hit, charge, aimX) {

  const fam = C.buildFamily(key, hit, aimX, 21);
  fam.forEach((f, i) => {
    const c = cfor(f, 0.13 + 0.22 * (i / (fam.length - 1)));
    for (let k = 0; k + 2 < f.points.length; k += 2) {
      line3(mvp, f.points[k], f.points[k + 2], c[0], c[1], c[2], c[3], 1.0);
    }
    const n = f.points.length - 1, kk = n % 2 === 0 ? n - 2 : n - 1;
    line3(mvp, f.points[Math.max(0, kk)], f.points[n], c[0], c[1], c[2], c[3], 1.0);
  });

  const cur = C.buildShot(key, hit, charge, aimX);
  const c = cfor(cur, 1);
  for (let k = 0; k + 1 < cur.points.length; k++) line3(mvp, cur.points[k], cur.points[k + 1], c[0], c[1], c[2], 1, 2.4);

  // 落点 + 击球点
  const d = cur.drop, r = 34;
  line3(mvp, [d[0] - r, 1.2, d[2]], [d[0] + r, 1.2, d[2]], c[0], c[1], c[2], 1, 2);
  line3(mvp, [d[0], 1.2, d[2] - r], [d[0], 1.2, d[2] + r], c[0], c[1], c[2], 1, 2);
  line3(mvp, [d[0], 0, d[2]], [d[0], 58, d[2]], c[0], c[1], c[2], 0.5, 1.4);
  const hr = 26, hc = [0.85, 0.93, 1.0];
  line3(mvp, [hit[0] - hr, hit[1], hit[2]], [hit[0] + hr, hit[1], hit[2]], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], hit[1], hit[2] - hr], [hit[0], hit[1], hit[2] + hr], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], hit[1] - hr, hit[2]], [hit[0], hit[1] + hr, hit[2]], hc[0], hc[1], hc[2], 0.9, 1.6);
  line3(mvp, [hit[0], 0, hit[2]], [hit[0], hit[1], hit[2]], 0.6, 0.72, 0.85, 0.2, 1.0);
  return cur;
}

/* ---------- 渲染一帧 ---------- */
function render(outPath, view, key, hit, charge, aimX, yaw, pitch, dist, tgt) {
  const target = tgt || [0, 60, 0];
  const c = (view === 'top') ? { eye: [0, 4200, 0.001], ctr: [0, 0, 0], up: [-1, 0, 0], fov: 16 * Math.PI / 180 }
    : (view === 'side') ? { eye: [-2050, 380, 0], ctr: [0, 210, 0], up: [0, 1, 0], fov: 30 * Math.PI / 180 }
    : (() => {
        const cp = Math.cos(pitch), sp = Math.sin(pitch);
        return { eye: [target[0] + dist * cp * Math.sin(yaw), target[1] + dist * sp, target[2] + dist * cp * Math.cos(yaw)],
                 ctr: target, up: [0, 1, 0], fov: 42 * Math.PI / 180 };
      })();

  const proj = persp(c.fov, RW / RH, 8, 9000);
  const mv = lookAt(c.eye, c.ctr, c.up);
  const mvp = mul(proj, mv);

  clear(0.016, 0.026, 0.043);
  drawCourt(mvp);
  const cur = drawCurves(mvp, key, hit, charge, aimX);

  // 下采样 2x 输出
  const out = Buffer.alloc(W * H * 3);
  for (let y = 0; y < H; y++) for (let x = 0; x < W; x++) {
    let r = 0, g = 0, b = 0;
    for (let sy = 0; sy < SS; sy++) for (let sx = 0; sx < SS; sx++) {
      const i = ((y * SS + sy) * RW + (x * SS + sx)) * 3;
      r += colBuf[i]; g += colBuf[i + 1]; b += colBuf[i + 2];
    }
    const n = SS * SS, o = (y * W + x) * 3;
    out[o] = Math.max(0, Math.min(255, Math.round(Math.pow(r / n, 1 / 1.05) * 255)));
    out[o + 1] = Math.max(0, Math.min(255, Math.round(Math.pow(g / n, 1 / 1.05) * 255)));
    out[o + 2] = Math.max(0, Math.min(255, Math.round(Math.pow(b / n, 1 / 1.05) * 255)));
  }
  writePNG(outPath, W, H, out);
  return { file: outPath, kind: cur.kind, status: cur.status, dropZ: cur.drop[2], T: cur.T, netY: cur.netY, apex: cur.apex };
}

// 击球点现在可以任意摆，jobs 直接给 [x, y(高度), z(纵深)]
const HP = C.HIT_PRESETS;
const PRESET = [HP.front.x, HP.front.y, HP.front.z];
const jobs = [
  // file, view, key, hit, charge, aim, yaw, pitch, dist, target
  ['preview_persp_GY.png', 'persp', 'GY', [HP.back.x, HP.back.y, HP.back.z], 0.70, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_persp_D.png', 'persp', 'D', [HP.mid.x, HP.mid.y, HP.mid.z], 0.45, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_persp_P.png', 'persp', 'P', PRESET, 0.55, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_top.png', 'top', 'GY', [HP.back.x, HP.back.y, HP.back.z], 0.70, 0, 0, 0, 2100, [0, 0, 0]],
  ['preview_side.png', 'side', 'GY', [HP.back.x, HP.back.y, HP.back.z], 0.70, 0, 0, 0, 2050, [0, 210, 0]],
  // 自由击球点的三张：左侧后场高点 / 右前场低点 / 极右中后场
  ['preview_free_left.png', 'persp', 'GY', [-260, 300, -560], 0.65, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_free_front.png', 'persp', 'P', [210, 95, -70], 0.55, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_free_mid.png', 'persp', 'D', [280, 235, -300], 0.45, 0, -0.50, 0.58, 1900, [0, 55, 20]],
  ['preview_free_high.png', 'persp', 'GY', [0, 380, -450], 0.55, 0, -0.50, 0.58, 1900, [0, 55, 20]]
];
const infos = [];
for (const [file, view, key, hit, charge, aim, yaw, pitch, dist, tgt] of jobs) {
  const info = render(file, view, key, hit, charge, aim, yaw, pitch, dist, tgt);
  info.hit = hit;
  infos.push(info);
  console.log(JSON.stringify(info));
}
console.log('previews done');

