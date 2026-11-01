/* smoke_ui.js — 用最小 DOM/WebGL stub 在 node 里执行 curve_ui_only.html 的内联脚本。
 * 本机沙箱禁止启动浏览器（mojo 命名管道被拒），所以只能离屏验证：
 *   1. 内联脚本能解析、能执行
 *   2. 没注入 provider 时用占位数据跑得动，读数不出现 NaN
 *   3. 全部交互（键/预设/视图/三个击球点滑块/蓄力/瞄点/开关）无异常
 *   4. 注入 provider 后，req 契约正确、曲线簇能铺满、数据源标签切换
 *   5. provider 返回 null / 抛异常时 UI 不崩
 * 用法：node smoke_ui.js
 */
'use strict';
const fs = require('fs');
const path = require('path');
const vm = require('vm');

const HTML = path.join(__dirname, 'curve_ui_only.html');
const html = fs.readFileSync(HTML, 'utf8');

/* 只取内联脚本（本文件设计上不允许有 src script —— 单文件、无依赖） */
if (/<script[^>]*\ssrc=/.test(html)) {
  console.error('FAIL: curve_ui_only.html 不应引用任何外部脚本');
  process.exit(1);
}
const blocks = [...html.matchAll(/<script(?:\s[^>]*)?>([\s\S]*?)<\/script>/g)];
if (blocks.length !== 1) {
  console.error('FAIL: 期望 1 个内联 script，实际 ' + blocks.length);
  process.exit(1);
}
const src = blocks[0][1];

/* ============================ DOM stub ============================ */
function El(tag) {
  this.tagName = tag;
  this.children = [];
  this.style = {};
  this._attrs = {};
  this._listeners = {};
  this.textContent = '';
  this.className = '';
  this.value = '0';
  this.clientWidth = 1600;
  this.clientHeight = 900;
  const set = new Set();
  this.classList = {
    _s: set,
    add: (c) => set.add(c),
    remove: (c) => set.delete(c),
    toggle: (c, on) => {
      if (on === undefined) { set.has(c) ? set.delete(c) : set.add(c); }
      else if (on) set.add(c); else set.delete(c);
    },
    contains: (c) => set.has(c)
  };
}
El.prototype.setAttribute = function (k, v) { this._attrs[k] = v; };
El.prototype.getAttribute = function (k) { return this._attrs[k] === undefined ? null : this._attrs[k]; };
El.prototype.appendChild = function (c) { this.children.push(c); return c; };
El.prototype.addEventListener = function (t, f) { (this._listeners[t] = this._listeners[t] || []).push(f); };
/* 事件沿 _parent 链冒泡 —— 网页用的是「行级事件委托」，不冒泡的话所有按钮都点不动，
   会产生「测试通过但页面实际坏掉」的假阳性。 */
El.prototype.dispatchEvent = function (e) {
  e.target = e.target || this;
  let n = this, depth = 0;
  while (n && depth++ < 20) {
    (n._listeners[e.type] || []).forEach((f) => f(e));
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

/* 与 HTML 里的 id 一一对应（新增 id 必须同步加进这个数组，否则漏测） */
['cv', 'panel', 'lb-key', 'keyRow', 'lb-hit', 'hitRow',
 'lb-hx', 'hitX', 'lb-hz', 'hitZ', 'lb-hh', 'hitH',
 'lb-charge', 'charge', 'lb-aim', 'aim', 'lb-view', 'viewRow',
 'btnFamily', 'btnPlay', 'readout', 'lb-src',
 'rd-land', 'rd-time', 'rd-net', 'rd-apex', 'rd-speed', 'rd-kind', 'rd-hit', 'status',
 'legend', 'hint'].forEach(ensure);

function addBtns(rowId, attr, vals) {
  const row = ensure(rowId);
  row.children = vals.map((v) => {
    const b = new El('div');
    b.setAttribute(attr, v);
    b._parent = row;
    b.classList.add('btn');
    return b;
  });
}
addBtns('keyRow', 'data-key', ['P', 'D', 'GY']);
addBtns('hitRow', 'data-preset', ['front', 'mid', 'back']);
addBtns('viewRow', 'data-view', ['persp', 'top', 'side']);

/* 滑块初值（与 HTML 里的 value 属性一致） */
byId['charge'].value = '0.55';
byId['aim'].value = '0';
byId['hitX'].value = '0';
byId['hitZ'].value = '-110';
byId['hitH'].value = '168';

/* ============================ WebGL stub ============================ */
let drawCalls = 0, buffersMade = 0, buffersDeleted = 0, attrPointers = 0;
const drawCounts = [];
const GLC = {
  ARRAY_BUFFER: 34962, STATIC_DRAW: 35044, DYNAMIC_DRAW: 35048, FLOAT: 5126,
  LINES: 1, TRIANGLES: 4, POINTS: 0, DEPTH_TEST: 2929, BLEND: 3042,
  SRC_ALPHA: 770, ONE_MINUS_SRC_ALPHA: 771,
  COLOR_BUFFER_BIT: 16384, DEPTH_BUFFER_BIT: 256,
  VERTEX_SHADER: 35633, FRAGMENT_SHADER: 35632,
  COMPILE_STATUS: 35713, LINK_STATUS: 35714
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
  bindBuffer: () => {}, bufferData: () => {},
  deleteBuffer: () => { buffersDeleted++; },
  uniformMatrix4fv: () => {}, uniform1f: () => {},
  drawArrays: (mode, first, count) => { drawCalls++; drawCounts.push(count); },
  clear: () => {}, viewport: () => {}, depthMask: () => {}
};
Object.assign(gl, GLC);

const canvasEl = ensure('cv');
canvasEl.getContext = () => gl;

/* ============================ window / document ============================ */
const rafQueue = [];
let clock = 0;
const winListeners = {};
const win = {
  devicePixelRatio: 2,
  console: console,
  requestAnimationFrame: (f) => { rafQueue.push(f); return rafQueue.length; },
  addEventListener: (t, f) => { (winListeners[t] = winListeners[t] || []).push(f); },
  MouseEvent: function (type, o) { this.type = type; this.bubbles = !!(o && o.bubbles); }
};
const doc = {
  body: new El('body'),
  getElementById: (id) => ensure(id),
  addEventListener: () => {}
};
const sandbox = {
  window: win,
  document: doc,
  console: console,
  requestAnimationFrame: win.requestAnimationFrame,
  performance: { now: () => clock },
  MouseEvent: win.MouseEvent,
  setTimeout: () => 0,
  clearTimeout: () => {}
};
sandbox.globalThis = sandbox;
vm.createContext(sandbox);

function runFrames(n, stepMs) {
  stepMs = stepMs || 16;
  for (let i = 0; i < n; i++) {
    const fn = rafQueue.shift();
    if (!fn) { console.log('WARN: raf queue empty at frame ' + i); break; }
    clock += stepMs;
    fn(clock);
  }
}

/* ============================ 1. 解析 + 执行 ============================ */
try {
  vm.runInContext(src, sandbox, { filename: 'curve_ui_only.inline.js' });
  console.log('[1] inline script parsed + executed OK');
} catch (e) {
  console.error('SCRIPT ERROR:', (e && e.stack) || e);
  process.exit(1);
}

/* ============================ 2. 无 provider 时跑得动 ============================ */
const fail = [];
function check(cond, msg) { if (!cond) { fail.push(msg); console.error('  FAIL: ' + msg); } }

try {
  runFrames(30);
  console.log('[2] frames run: 30, drawCalls:', drawCalls, 'buffers:', buffersMade, 'deleted:', buffersDeleted);
  check(drawCalls > 0, 'no draw calls at all');
  const maxCount = Math.max.apply(null, drawCounts.concat([0]));
  console.log('    max drawArrays count:', maxCount, '(占位模式下曲线簇也会铺，应远大于单条主曲线)');
  check(maxCount >= 400, 'family not filled in placeholder mode (max count ' + maxCount + ')');
  check(byId['lb-src'].textContent === '占位演示', "lb-src 应为 '占位演示'，实际 '" + byId['lb-src'].textContent + "'");
  check(byId['status'].textContent === '界 内' || byId['status'].textContent === '下 网' || byId['status'].textContent === '出 界',
    'status 文案异常: ' + byId['status'].textContent);
  const rd0 = ['rd-land', 'rd-time', 'rd-net', 'rd-apex', 'rd-speed', 'rd-kind', 'rd-hit'];
  rd0.forEach((id) => {
    const t = byId[id].textContent;
    check(t !== '' && !/NaN|undefined|null/.test(t), id + ' 读到 ' + JSON.stringify(t));
  });
  console.log('    readout:', rd0.map((id) => id + '=' + byId[id].textContent).join(' | '));
} catch (e) {
  console.error('FRAME ERROR:', (e && e.stack) || e);
  process.exit(1);
}

/* ============================ 3. 交互 ============================ */
function fire(rowId, attr, val) {
  const row = byId[rowId];
  const b = row.children.find((c) => c.getAttribute(attr) === val);
  if (!b) throw new Error('no button ' + val + ' in ' + rowId);
  b.dispatchEvent({ type: 'click', target: b, bubbles: true });
}
function dragHit(x, z, h) {
  byId['hitX'].value = String(x);
  byId['hitZ'].value = String(z);
  byId['hitH'].value = String(h);
  ['hitX', 'hitZ', 'hitH'].forEach((id) => byId[id].dispatchEvent({ type: 'input', bubbles: true }));
  ['hitX', 'hitZ', 'hitH'].forEach((id) => byId[id].dispatchEvent({ type: 'change', bubbles: true }));
  runFrames(2, 60);
}

try {
  const HIT_LABEL = { front: '网前', mid: '中场', back: '后场' };
  const DEFAULT_HIT = { P: 'front', D: 'mid', GY: 'back' };

  // 三个键 × 三个视图 × 预设按钮
  ['P', 'D', 'GY'].forEach((k) => {
    fire('keyRow', 'data-key', k);
    check(byId['lb-hit'].textContent === HIT_LABEL[DEFAULT_HIT[k]],
      'preset follows key ' + k + ': got ' + byId['lb-hit'].textContent);
  });
  ['persp', 'top', 'side'].forEach((v) => { fire('viewRow', 'data-view', v); check(byId['lb-view'].textContent !== '', 'view label empty'); });
  ['front', 'mid', 'back'].forEach((p) => fire('hitRow', 'data-preset', p));

  // 蓄力 / 瞄点滑块
  [0, 0.2, 0.34, 0.55, 0.8, 1.0].forEach((cv) => {
    byId['charge'].value = String(cv);
    byId['charge'].dispatchEvent({ type: 'input', bubbles: true });
  });
  runFrames(2, 60);
  check(Math.abs(parseFloat(byId['lb-charge'].textContent) - 1.0) < 1e-6, 'charge label not 1.000: ' + byId['lb-charge'].textContent);
  [-260, 0, 260].forEach((a) => {
    byId['aim'].value = String(a);
    byId['aim'].dispatchEvent({ type: 'input', bubbles: true });
  });
  runFrames(2, 60);
  check(byId['lb-aim'].textContent === '260 cm', 'aim label: ' + byId['lb-aim'].textContent);

  // 两个开关
  byId['btnFamily'].dispatchEvent({ type: 'click', target: byId['btnFamily'], bubbles: true });
  byId['btnPlay'].dispatchEvent({ type: 'click', target: byId['btnPlay'], bubbles: true });
  runFrames(5);

  // 击球点自由滑块：读数格式 + 预设高亮
  const CUSTOM = [
    [0, -110, 168],      // 正好等于网前预设 -> 应回到「网前」
    [180, -420, 235],    // 普通自由点 -> 「自由」
    [-260, -660, 60],    // 左后场低点
    [300, -45, 390]      // 右前场高点
  ];
  CUSTOM.forEach(([x, z, h]) => {
    dragHit(x, z, h);
    const want = Math.round(x) + ', ' + Math.round(z) + ', ' + Math.round(h) + ' cm';
    check(byId['rd-hit'].textContent === want, 'hit readout got ' + byId['rd-hit'].textContent + ' want ' + want);
  });
  check(byId['lb-hit'].textContent === '自由', "自由态标签应为 '自由'，实际 '" + byId['lb-hit'].textContent + "'");
  dragHit(0, -110, 168);
  check(byId['lb-hit'].textContent === '网前', "拖回预设应显示 '网前'，实际 '" + byId['lb-hit'].textContent + "'");

  // 自由态切键不覆盖用户摆的击球点；预设态切键要跟随
  dragHit(120, -350, 210);
  fire('keyRow', 'data-key', 'GY');
  check(byId['rd-hit'].textContent === '120, -350, 210 cm', 'custom hit overwritten by key switch: ' + byId['rd-hit'].textContent);
  fire('hitRow', 'data-preset', 'front');
  fire('keyRow', 'data-key', 'GY');
  check(byId['lb-hit'].textContent === '后场', 'preset should follow key switch: ' + byId['lb-hit'].textContent);

  // 键盘快捷键
  (winListeners['keydown'] || []).forEach((f) => f({ key: '1', code: 'Digit1', preventDefault: () => {} }));
  check(byId['lb-key'].textContent !== '', 'key label empty after keydown 1');
  (winListeners['keydown'] || []).forEach((f) => f({ key: 'v', code: 'KeyV', preventDefault: () => {} }));
  check(byId['lb-view'].textContent !== '', 'view label empty after keydown v');
  runFrames(3);
  console.log('[3] interaction OK, drawCalls:', drawCalls);
} catch (e) {
  console.error('INTERACTION ERROR:', (e && e.stack) || e);
  process.exit(1);
}

/* ============================ 4. 注入 provider ============================ */
try {
  // 记录 provider 收到的请求，检查契约字段
  const seen = [];
  const fakeProvider = function (req) {
    seen.push({ key: req.key, hit: req.hit.slice(), charge: req.charge, aimX: req.aimX });
    const hx = req.hit[0], hy = req.hit[1], hz = req.hit[2];
    const landZ = 200 + 400 * req.charge;
    const T = 1.4, N = 60, pts = [], ts = [];
    for (let i = 0; i <= N; i++) {
      const u = i / N;
      pts.push([hx * (1 - u), hy * (1 - u) + 120 * 4 * u * (1 - u), hz + (landZ - hz) * u]);
      ts.push(T * u);
    }
    return {
      points: pts, times: ts, T: T, drop: [0, 0, landZ], status: 'in',
      kind: 'clear', netY: 200, apex: hy + 120, speed: 800
    };
  };
  // 曲线簇开关可能在交互测试里被点掉了，显式打开（否则曲线簇不构建，是假阳性来源）
  if (!sandbox.window.CurveUI.getState().showFamily) {
    byId['btnFamily'].dispatchEvent({ type: 'click', target: byId['btnFamily'], bubbles: true });
    runFrames(1);
  }
  check(sandbox.window.CurveUI.getState().showFamily === true, 'showFamily should be on before provider test');
  const okSet = sandbox.window.CurveUI.setProvider(fakeProvider);
  check(okSet === true, 'setProvider should return true');
  runFrames(40);
  check(seen.length >= 21, 'provider calls should cover the family (21) but got ' + seen.length);
  const s0 = seen[seen.length - 1];
  check(s0 && s0.key && Array.isArray(s0.hit) && s0.hit.length === 3, 'req.hit malformed');
  check(typeof s0.charge === 'number' && typeof s0.aimX === 'number', 'req.charge/aimX malformed');
  check(byId['lb-src'].textContent === '外部注入', "lb-src 应为 '外部注入'，实际 '" + byId['lb-src'].textContent + "'");
  const maxCount2 = Math.max.apply(null, drawCounts.concat([0]));
  console.log('[4] provider injected, calls:', seen.length, 'max drawArrays count:', maxCount2);
  check(maxCount2 >= 400, 'FAMILY NOT FILLED with provider: max count ' + maxCount2);
  check(byId['rd-kind'].textContent === '高远', 'KIND_NAME mapping broken: ' + byId['rd-kind'].textContent);
  check(byId['rd-land'].textContent === '600.0 cm', 'provider drop not shown: ' + byId['rd-land'].textContent);

  // getState 反映界面状态
  const st = sandbox.window.CurveUI.getState();
  check(st.key && Array.isArray(st.hit) && typeof st.charge === 'number', 'getState malformed');

  // provider 返回 null -> UI 退回占位，不该崩
  sandbox.window.CurveUI.setProvider(function () { return null; });
  runFrames(10);
  check(byId['lb-src'].textContent === '外部注入', 'null provider still counts as injected');
  check(!/NaN|undefined/.test(byId['rd-land'].textContent), 'null provider broke readout: ' + byId['rd-land'].textContent);

  // provider 抛异常 -> 被 try/catch 吞掉，退回占位（顺便验证只警告一次，不刷屏）
  const realWarn = console.warn;
  let warnCount = 0;
  console.warn = function () { warnCount++; };
  sandbox.window.CurveUI.setProvider(function () { throw new Error('boom'); });
  runFrames(20);
  console.warn = realWarn;
  check(warnCount === 1, 'provider 异常应只警告一次，实际 ' + warnCount + ' 次');
  check(!/NaN|undefined/.test(byId['rd-time'].textContent), 'throwing provider broke readout: ' + byId['rd-time'].textContent);

  // 撤销 provider -> 回到占位
  sandbox.window.CurveUI.setProvider(null);
  runFrames(10);
  check(byId['lb-src'].textContent === '占位演示', 'setProvider(null) should revert to placeholder');
  console.log('[5] null / throwing provider handled, revert OK');
} catch (e) {
  console.error('PROVIDER ERROR:', (e && e.stack) || e);
  process.exit(1);
}

/* ============================ 4b. 接真实曲线逻辑（charge_math.js） ============================ */
try {
  // 只是验证「这个 UI 壳能挂上真逻辑」：把 charge_math 的 buildShot 包成 provider。
  // 注意 curve_ui_only.html 本身不 require 它 —— 这是使用者自己要写的一行胶水。
  const C = require('./charge_math.js');
  const ok = sandbox.window.CurveUI.setProvider(function (req) {
    return C.buildShot(req.key, req.hit, req.charge, req.aimX);
  });
  check(ok === true, 'setProvider(charge_math) should return true');
  runFrames(40);
  check(byId['lb-src'].textContent === '外部注入', 'lb-src should be 外部注入');
  // 网前小球中蓄力：应给出有限读数
  ['P', 'D', 'GY'].forEach((k) => {
    fire('keyRow', 'data-key', k);
    runFrames(3);
    const land = parseFloat(byId['rd-land'].textContent);
    const T = parseFloat(byId['rd-time'].textContent);
    check(isFinite(land) && isFinite(T) && T > 0, 'charge_math provider bad numbers for ' + k +
      ': land=' + byId['rd-land'].textContent + ' T=' + byId['rd-time'].textContent);
    check(!/NaN|undefined/.test(byId['rd-kind'].textContent), 'kind broken for ' + k);
  });
  console.log('[4b] charge_math.js provider OK, readout:',
    ['rd-land', 'rd-time', 'rd-kind', 'status'].map((id) => id + '=' + byId[id].textContent).join(' | '));
  sandbox.window.CurveUI.setProvider(null);
  runFrames(5);
} catch (e) {
  console.error('CHARGE_MATH PROVIDER ERROR:', (e && e.stack) || e);
  process.exit(1);
}

/* ============================ 5. 最终读数体检 ============================ */
const ids = ['rd-land', 'rd-time', 'rd-net', 'rd-apex', 'rd-speed', 'rd-kind', 'rd-hit'];
const bad = ids.map((id) => id + '=' + byId[id].textContent).filter((s) => /NaN|undefined|null/.test(s));
check(bad.length === 0, 'BAD READOUT: ' + bad.join(', '));
console.log('readout:', ids.map((id) => id + '=' + byId[id].textContent).join(' | '));

if (fail.length) {
  console.error('SMOKE FAIL: ' + fail.length + ' issue(s)');
  process.exit(1);
}
console.log('SMOKE: ALL PASS');
