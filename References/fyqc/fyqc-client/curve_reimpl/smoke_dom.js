/* smoke_dom.js — 用最小 DOM/WebGL stub 执行 curve_viewer.html 的内联脚本，
 * 抓语法错误与运行时异常（本机沙箱禁止启动浏览器）。 */
'use strict';
const fs = require('fs');
const path = require('path');
const vm = require('vm');

const html = fs.readFileSync(path.join(__dirname, 'curve_viewer.html'), 'utf8');

// 取最后一个 <script> ... </script>（内联）
const scripts = [...html.matchAll(/<script(?:\s[^>]*)?>([\s\S]*?)<\/script>/g)]
  .filter(m => !/\bsrc=/.test(m[0]));
if (scripts.length !== 1) throw new Error('expected 1 inline script, got ' + scripts.length);
const src = scripts[0][1];

/* ---------------- DOM stub ---------------- */
function El(tag) {
  this.tagName = tag; this.children = []; this.style = {}; this._attrs = {};
  this.classList = {
    _s: new Set(),
    add: function (c) { this._s.add(c); },
    remove: function (c) { this._s.delete(c); },
    toggle: function (c, on) { if (on === undefined) { this._s.has(c) ? this._s.delete(c) : this._s.add(c); } else if (on) this._s.add(c); else this._s.delete(c); },
    contains: function (c) { return this._s.has(c); }
  };
  this._listeners = {};
  this.textContent = '';
  this.className = '';
  this.value = '0';
  this.clientWidth = 1600; this.clientHeight = 900;
}
El.prototype.setAttribute = function (k, v) { this._attrs[k] = v; };
El.prototype.getAttribute = function (k) { return this._attrs[k] === undefined ? null : this._attrs[k]; };
El.prototype.appendChild = function (c) { this.children.push(c); return c; };
El.prototype.addEventListener = function (t, f) { (this._listeners[t] = this._listeners[t] || []).push(f); };
El.prototype.dispatchEvent = function (e) {
  e.target = e.target || this;
  let n = this, depth = 0;
  while (n && depth++ < 20) {
    (n._listeners[e.type] || []).forEach(f => f(e));
    if (!e.bubbles) break;
    n = n._parent;
  }
  return true;
};
El.prototype.closest = function (sel) {
  const cls = sel.replace('.', '');
  let n = this;
  while (n) { if (n.classList && n.classList.contains(cls)) return n; n = n._parent; }
  return null;
};

const byId = {};
function ensure(id) {
  if (!byId[id]) { byId[id] = new El('div'); byId[id].id = id; }
  return byId[id];
}

// 面板 id 列表（与 HTML 一致）
['cv', 'lb-key', 'lb-hit', 'lb-charge', 'lb-aim', 'lb-view', 'rd-land', 'rd-time', 'rd-net',
 'rd-apex', 'rd-speed', 'rd-kind', 'rd-hit', 'status', 'keyRow', 'hitRow', 'viewRow', 'charge', 'aim',
 'btnFamily', 'btnPlay',
 // 击球点自由滑块（X 横向 / Y 纵深 / H 高度）
 'hitX', 'hitZ', 'hitH', 'lb-hx', 'lb-hz', 'lb-hh'].forEach(ensure);

// 三行按钮的子元素
function addBtns(rowId, attr, vals) {
  const row = ensure(rowId);
  row.children = vals.map(v => {
    const b = new El('div'); b.setAttribute(attr, v); b._parent = row;
    b.classList.add('btn');
    return b;
  });
}
addBtns('keyRow', 'data-key', ['P', 'D', 'GY']);
addBtns('hitRow', 'data-preset', ['front', 'mid', 'back']);
addBtns('viewRow', 'data-view', ['persp', 'top', 'side']);
byId['charge'].value = '0.55';
byId['aim'].value = '0';
byId['hitX'].value = '0';
byId['hitZ'].value = '-110';
byId['hitH'].value = '168';

/* ---------------- WebGL stub ---------------- */
let drawCalls = 0, buffersMade = 0, attrPointers = 0, lastError = null;
const drawCounts = [];
const GLC = {
  ARRAY_BUFFER: 34962, STATIC_DRAW: 35044, DYNAMIC_DRAW: 35048, FLOAT: 5126,
  LINES: 1, TRIANGLES: 4, POINTS: 0, DEPTH_TEST: 2929, BLEND: 3042,
  SRC_ALPHA: 770, ONE_MINUS_SRC_ALPHA: 771, COLOR_BUFFER_BIT: 16384, DEPTH_BUFFER_BIT: 256,
  VERTEX_SHADER: 35633, FRAGMENT_SHADER: 35632, COMPILE_STATUS: 35713, LINK_STATUS: 35714
};
const gl = {
  createShader: () => ({}), shaderSource: () => {}, compileShader: () => {},
  getShaderParameter: () => true, getShaderInfoLog: () => '',
  createProgram: () => ({}), attachShader: () => {}, linkProgram: () => {},
  getProgramParameter: () => true, getProgramInfoLog: () => '',
  useProgram: () => {},
  getAttribLocation: () => 0, getUniformLocation: () => ({}),
  enableVertexAttribArray: () => {}, vertexAttribPointer: () => { attrPointers++; },
  enable: () => {}, blendFunc: () => {}, clearColor: () => {},
  createBuffer: () => { buffersMade++; return { id: buffersMade }; },
  bindBuffer: () => {}, bufferData: () => {}, deleteBuffer: () => {},
  uniformMatrix4fv: () => {}, uniform1f: () => {},
  drawArrays: (mode, first, count) => { drawCalls++; drawCounts.push(count); }, clear: () => {}, viewport: () => {},
  depthMask: () => {}
};
Object.assign(gl, GLC);

const canvasEl = ensure('cv');
canvasEl.getContext = () => gl;
canvasEl.classList = canvasEl.classList;

/* ---------------- window / document ---------------- */
const rafQueue = [];
let rafCount = 0;
const win = {
  devicePixelRatio: 2,
  CURVE: require('./charge_math.js'),
  requestAnimationFrame: (f) => { rafQueue.push(f); return ++rafCount; },
  addEventListener: () => {},
  MouseEvent: function (t) { this.type = t; }
};
const doc = {
  body: new El('body'),
  getElementById: (id) => ensure(id),
  addEventListener: () => {}
};

const sandbox = {
  window: win, document: doc, console,
  requestAnimationFrame: win.requestAnimationFrame,
  Math, Float32Array, Date, JSON, parseInt, parseFloat, isNaN, Array, Object, String, Number,
  setTimeout, clearTimeout
};
sandbox.globalThis = sandbox;
vm.createContext(sandbox);

try {
  vm.runInContext(src, sandbox, { filename: 'curve_viewer.inline.js' });
  console.log('inline script parsed + executed OK');
} catch (e) {
  console.error('SCRIPT ERROR:', e && e.stack || e);
  process.exit(1);
}

// 跑 30 帧
let frames = 0;
try {
  for (let i = 0; i < 30; i++) {
    const fn = rafQueue.shift();
    if (!fn) { console.log('WARN: raf queue empty at frame ' + i); break; }
    fn(16 * (i + 1));
    frames++;
  }
  console.log('frames run:', frames, 'drawCalls:', drawCalls, 'buffers:', buffersMade, 'attrPointers:', attrPointers);
  // 曲线簇分帧渐进构建：30 帧后应当已经铺满 21 条（顶点数远大于单条主曲线）
  const maxCount = Math.max.apply(null, drawCounts.concat([0]));
  console.log('max drawArrays count:', maxCount);
  if (maxCount < 400) {
    console.error('FAMILY NOT FILLED: max vertex count ' + maxCount + ' (expect >= 400)');
    process.exit(1);
  }
} catch (e) {
  console.error('FRAME ERROR:', e && e.stack || e);
  process.exit(1);
}

// 交互：切换所有键/视角/滑块
try {
  const fire = (rowId, attr, val) => {
    const row = byId[rowId];
    const b = row.children.find(c => c.getAttribute(attr) === val);
    if (!b) throw new Error('no btn ' + val);
    b.dispatchEvent({ type: 'click', target: b, bubbles: true });
  };
  // 切键后应自动跳到该键的默认击球点（P→网前、D→中场、GY→后场）
  const DEFAULT_HIT = { P: 'front', D: 'mid', GY: 'back' };
  const HIT_LABEL = { front: '网前', mid: '中场', back: '后场' };
  for (const k of ['P', 'D', 'GY']) {
    fire('keyRow', 'data-key', k);
    const want = HIT_LABEL[DEFAULT_HIT[k]];
    const got = byId['lb-hit'].textContent;
    if (got !== want) {
      console.error('PRESET SYNC ' + k + ' -> ' + got + ' want ' + want);
      process.exit(1);
    }
  }
  ['P', 'D', 'GY'].forEach(v => fire('keyRow', 'data-key', v));
  ['front', 'mid', 'back'].forEach(v => fire('hitRow', 'data-preset', v));
  ['persp', 'top', 'side'].forEach(v => fire('viewRow', 'data-view', v));
  // 滑块
  for (const cv of [0, 0.2, 0.34, 0.8, 1.0]) {
    byId['charge'].value = String(cv);
    byId['charge'].dispatchEvent({ type: 'input' });
  }
  for (const a of [-260, 0, 260]) {
    byId['aim'].value = String(a);
    byId['aim'].dispatchEvent({ type: 'input' });
  }
  byId['btnFamily'].dispatchEvent({ type: 'click', target: byId['btnFamily'], bubbles: true });
  byId['btnPlay'].dispatchEvent({ type: 'click', target: byId['btnPlay'], bubbles: true });

  /* 击球点自由滑块：拖到任意 X/Y/H，读数与预设高亮必须跟着变 */
  let clock = 5000;
  const dragHit = (x, z, h) => {
    byId['hitX'].value = String(x);
    byId['hitZ'].value = String(z);
    byId['hitH'].value = String(h);
    ['hitX', 'hitZ', 'hitH'].forEach(id => byId[id].dispatchEvent({ type: 'input', bubbles: true }));
    // 松手：解除限流并安排重建
    ['hitX', 'hitZ', 'hitH'].forEach(id => byId[id].dispatchEvent({ type: 'change', bubbles: true }));
    // rebuild 走 rAF 合并，跑两帧让它落地
    for (let i = 0; i < 2; i++) { const fn = rafQueue.shift(); if (fn) fn(clock += 60); }
  };
  const CUSTOM = [
    [0, -110, 168],      // 正好是网前预设 -> 高亮应回到「网前」
    [180, -420, 235],    // 普通自由点 -> 「自由」
    [-260, -660, 60],    // 极端角：左后场低点
    [300, -45, 390]      // 极端角：右前场高点（贴网、超出手臂高度）
  ];
  for (const [x, z, h] of CUSTOM) {
    dragHit(x, z, h);
    const gotHit = byId['rd-hit'].textContent;
    const want = Math.round(x) + ', ' + Math.round(z) + ', ' + Math.round(h) + ' cm';
    if (gotHit !== want) {
      console.error('HIT DRAG readout ' + gotHit + ' want ' + want);
      process.exit(1);
    }
    const land = parseFloat(byId['rd-land'].textContent);
    const t = parseFloat(byId['rd-time'].textContent);
    if (!isFinite(land) || !isFinite(t) || t <= 0) {
      console.error('HIT DRAG bad numbers at ' + want + ' land=' + land + ' T=' + t);
      process.exit(1);
    }
  }
  if (byId['lb-hit'].textContent !== '自由') {
    console.error('HIT DRAG label want 自由 got ' + byId['lb-hit'].textContent);
    process.exit(1);
  }
  dragHit(0, -110, 168);
  if (byId['lb-hit'].textContent !== '网前') {
    console.error('HIT DRAG back-to-preset want 网前 got ' + byId['lb-hit'].textContent);
    process.exit(1);
  }

  /* 用户已经把击球点摆成自由位置时，切键不该把他的手摆位置覆盖掉 */
  dragHit(120, -350, 210);
  fire('keyRow', 'data-key', 'GY');
  const kept = byId['rd-hit'].textContent;
  if (kept !== '120, -350, 210 cm') {
    console.error('CUSTOM HIT preserved across key switch: got ' + kept);
    process.exit(1);
  }
  // 回到预设态再切键，应当跟随默认击球点
  fire('hitRow', 'data-preset', 'front');
  fire('keyRow', 'data-key', 'GY');
  if (byId['lb-hit'].textContent !== '后场') {
    console.error('PRESET follows key switch: got ' + byId['lb-hit'].textContent);
    process.exit(1);
  }
  console.log('hit sliders OK');
  // 再跑 10 帧
  for (let i = 0; i < 10; i++) { const fn = rafQueue.shift(); if (!fn) break; fn(1000 + i * 16); }
  console.log('interaction OK; drawCalls total:', drawCalls, 'buffers total:', buffersMade);
} catch (e) {
  console.error('INTERACTION ERROR:', e && e.stack || e);
  process.exit(1);
}

// 检查读数字段有没有写成 NaN / undefined
const rd = ['rd-land', 'rd-time', 'rd-net', 'rd-apex', 'rd-speed', 'rd-kind'].map(id => id + '=' + byId[id].textContent);
console.log('readout:', rd.join(' | '));
const bad = rd.filter(s => /NaN|undefined|null/.test(s));
if (bad.length) { console.error('BAD READOUT:', bad.join(', ')); process.exit(1); }
console.log('SMOKE: ALL PASS');
