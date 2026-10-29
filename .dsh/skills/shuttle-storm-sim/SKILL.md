---
name: shuttle-storm-sim
description: shuttle-storm 仿真可视化系统的实现约定。开始写或改 sim/ 下任何代码前读本技能：它固定了 provider 契约、六参数弹道的计算口径、int32 厘米与 60Hz 的单位纪律、domain/render 分层、四个演示模式、以及必须存在的 golden 测试锚点。
---

# shuttle-storm 仿真系统约定

## 1. 目标

用 Three.js 场景复现“真实弹道”的可视化：给定击球点、击球键、蓄力、瞄点，算出与游戏逻辑一致的曲线、落点、飞行时长、过网高度、最高点与出球速度，并能按球种做全量对比。

## 2. provider 契约（沿用 UI 壳，不要改签名）

输入：

```ts
type SimRequest = {
  key: 'P' | 'D' | 'GY'   // 控球键 / 高球键 / 高远键
  hit: [number, number, number]  // 击球点 cm，y 为高度
  charge: number          // 0..1
  aimX: number            // 横向瞄点 cm
}
```

输出：

```ts
type SimCurve = {
  points: [number, number, number][]
  times: number[]         // 与 points 等长，t0=0，严格递增（秒）
  T: number               // 总时长（秒）
  drop: [number, number, number]
  status: 'in' | 'net' | 'out'
  kind?: string
  netY?: number | null    // 网平面处高度 cm
  apex?: number           // 最高点 cm
  speed?: number          // 出球速度 cm/s
}
```

## 3. 计算口径（第 6 章）

- 六参数：起点 XYZ、落点 XYZ、顶点高度、前半段帧数、后半段帧数、曲线枚举。
- XZ 匀速线性插值；Y 分段二次曲线：前段缓出上升、后段加速下落；下坠感来自「后半段 < 前半段」。
- 枚举：`NORMAL / PARABOLA_HIGH / FALLING / FLAT_FAST / FAKE_DROP`；落地即结束。
- 过网校验：算出网平面处高度，若不足阈值则整体垫高并重算（顶点 ≠ 过网点）。
- 落点：九宫格锚点 → `lerp(fBad, fGood, fOffset)`，`fOffset = fRand^((100−Gather)/100)` → clamp 安全带；`Gather=100` 时恒等于 `fGood`。
- 时长：基础时长 × 档位乘数 × 质量乘数 × 觉醒乘数，下限 0.35s；帧数 = 四舍五入(时长×60)。

## 4. 单位与分层纪律

- `sim/domain/`：纯函数、零浏览器依赖、四则运算只用厘米整数；禁止 import three.js；禁止 `Math.random`，随机数走显式 seed 的自研 PRNG。
- `sim/render/`：唯一允许把厘米转成米/float 的地方。
- 渲染表现（球 2×、最小 14px、地面阴影 0.12m、拖尾 0.20/0.28s、落点提示 100ms/0.40m）只进 render，不进 domain。

## 5. 四个模式

1. 单条演示：一个请求 → 一条曲线 + 读数。
2. 曲线簇：同一击球点按蓄力档位扫出多条，比较形状。
3. 全量矩阵：球种 × 档位 × 质量（× 觉醒）枚举，导出 JSON/CSV，供 Unity 侧逐条比对。
4. 判定窗口可视化：perfect 窗口（12/8 tick）、杀球高度带、落点提示圈，画在场景与时间轴上。

## 6. 必须有测试

- `Gather=100` 时同输入恒落 `fGood`。
- `Gather=0` 时落点分布在格内均匀（卡方或分箱）。
- 10 万拍随机输入无一越过安全带。
- 同 seed 同输入两次运行逐点相等。
- 网平面高度不足时垫高后确实过网。
- 每条曲线 `times` 严格递增、`t0=0`、末点 y 落地。

## 7. 已知待裁决冲突

- 网高：设计文档第 6 章按 1.55m 做垫高校验，`Docs/仿真系统的UI参考.html` 的 `COURT.NET_H` 写 150cm。当前实现以「校验 1.55m、显示 1.50m」为准，并在 UI 标注，等 ADR 定稿。
- `fGoodCm` 九点与 `AnchorGrid` 表：文档只给公式未给数值，先用推导值并标 `assumed: true`，拿到策划配置后整体替换。
