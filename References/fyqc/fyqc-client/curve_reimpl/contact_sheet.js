/* contact_sheet.js — 把预览图拼成一张总览图（纯 PNG 编解码，无依赖） */
'use strict';
const fs = require('fs');
const zlib = require('zlib');

function decodePNG(buf) {
  let pos = 8, w = 0, h = 0, colorType = 2;
  const idat = [];
  while (pos < buf.length) {
    const len = buf.readUInt32BE(pos);
    const type = buf.toString('ascii', pos + 4, pos + 8);
    const data = buf.subarray(pos + 8, pos + 8 + len);
    if (type === 'IHDR') { w = data.readUInt32BE(0); h = data.readUInt32BE(4); colorType = data[9]; }
    else if (type === 'IDAT') idat.push(data);
    pos += 12 + len;
  }
  const raw = zlib.inflateSync(Buffer.concat(idat));
  const bpp = colorType === 6 ? 4 : 3;
  const stride = w * bpp;
  const out = Buffer.alloc(w * h * 3);
  let prev = Buffer.alloc(stride);
  for (let y = 0; y < h; y++) {
    const ft = raw[y * (stride + 1)];
    const line = Buffer.from(raw.subarray(y * (stride + 1) + 1, y * (stride + 1) + 1 + stride));
    for (let x = 0; x < stride; x++) {
      const a = x >= bpp ? line[x - bpp] : 0;
      const b = prev[x];
      const c = x >= bpp ? prev[x - bpp] : 0;
      let v = line[x];
      if (ft === 1) v = (v + a) & 255;
      else if (ft === 2) v = (v + b) & 255;
      else if (ft === 3) v = (v + ((a + b) >> 1)) & 255;
      else if (ft === 4) {
        const p = a + b - c, pa = Math.abs(p - a), pb = Math.abs(p - b), pc = Math.abs(p - c);
        v = (v + (pa <= pb && pa <= pc ? a : pb <= pc ? b : c)) & 255;
      }
      line[x] = v;
    }
    for (let x = 0; x < w; x++) {
      out[(y * w + x) * 3] = line[x * bpp];
      out[(y * w + x) * 3 + 1] = line[x * bpp + 1];
      out[(y * w + x) * 3 + 2] = line[x * bpp + 2];
    }
    prev = line;
  }
  return { w, h, data: out };
}

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
  ihdr[8] = 8; ihdr[9] = 2;
  fs.writeFileSync(path, Buffer.concat([
    Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]),
    chunk('IHDR', ihdr), chunk('IDAT', zlib.deflateSync(raw, { level: 9 })), chunk('IEND', Buffer.alloc(0))
  ]));
}

/* 布局：3 列 x 3 行，格子 800x450，留间隙
   第一行 三个预设击球点 · 第二行 三套相机 · 第三行 三个自由击球点 */
const files = [
  ['preview_persp_GY.png', '高远 GY / 后场'],
  ['preview_persp_D.png', '杀球 D / 中场'],
  ['preview_persp_P.png', '小球 P / 网前'],
  ['preview_top.png', '顶视'],
  ['preview_side.png', '侧视'],
  ['preview_free_high.png', '自由点 高位击球 380cm'],
  ['preview_free_left.png', '自由点 左后场高点'],
  ['preview_free_front.png', '自由点 右前场低点'],
  ['preview_free_mid.png', '自由点 右中后场']
];
const CW2 = 800, CH2 = 450, GAP = 4, COLS = 3, ROWS = 3;
const OW = COLS * CW2 + (COLS - 1) * GAP;
const OH = ROWS * CH2 + (ROWS - 1) * GAP;
const out = Buffer.alloc(OW * OH * 3, 6);

files.forEach((ent, i) => {
  if (!ent) return;   // 空格留背景色
  const img = decodePNG(fs.readFileSync(ent[0]));
  const cx = (i % COLS) * (CW2 + GAP), cy = Math.floor(i / COLS) * (CH2 + GAP);
  for (let y = 0; y < CH2; y++) {
    const sy = Math.min(img.h - 1, Math.floor(y * img.h / CH2));
    for (let x = 0; x < CW2; x++) {
      const sx = Math.min(img.w - 1, Math.floor(x * img.w / CW2));
      const si = (sy * img.w + sx) * 3, di = ((cy + y) * OW + (cx + x)) * 3;
      out[di] = img.data[si]; out[di + 1] = img.data[si + 1]; out[di + 2] = img.data[si + 2];
    }
  }
});
writePNG('contact_sheet.png', OW, OH, out);
console.log('contact_sheet.png', OW + 'x' + OH);
