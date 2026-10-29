---
name: shuttle-storm-project
description: shuttle-storm（羽毛球大作战）项目总纲。任何涉及本项目设计文档、玩法数值、仿真系统、Unity 实现的工作开始前先读本技能：它给出唯一真源文档位置、不可违背的设计公理、坐标与帧率硬约束、目录约定，以及在“设计文档大改期”该如何区分已定稿与推演中内容。
---

# shuttle-storm 项目总纲

## 1. 现在处于什么阶段

- 阶段：**设计文档大改（磨合期）**，尚未进入正式游戏开发。
- 本阶段的两类产出：① 设计与数值的推演、修订、评审；② 一个 **Three.js 仿真可视化系统**，用来把弹道与判定规则“跑给人看”，并作为后续 Unity 实现的对照基准。
- 因此：文档条文可能被推翻，**不要把当前数值当成永久常量写死在代码里**；一律从配置表读，配置表可整体替换。

## 2. 唯一真源

- 设计文档：`Docs/羽毛球大作战_游戏开发设计文档_V1.4(最终版).docx`
- 仿真系统 UI 参考：`Docs/仿真系统的UI参考.html`（只有外壳与 provider 契约，无球路算法）
- 第三方资源包：`References/fyqc/`，**只读**，不要修改、不要假设其许可与引擎。
- 冲突处理顺序：设计文档正文 > 仿真 UI 壳里的常量 > 任何既有代码注释。发现冲突时不要私自选定，记录到 `Docs/decisions/` 下的 ADR 并标注待裁决。

## 3. 硬约束（改动前必须确认自己没有违反）

1. 逻辑固定 **60Hz tick**（1 tick≈16.7ms），渲染帧率跟随屏幕（60/90/120Hz）并与逻辑完全解耦。
2. 逻辑真值统一 **int32 厘米**，渲染层才转 float；禁用浮点做逻辑存储。
3. 弹道是 **六参数曲线驱动**，不做重力积分、不做球—网碰撞、落地不反弹。
4. 回放 = 输入序列 + 显式 seed 的确定性重建，不录逐帧坐标；同 seed 同输入必须逐 tick 一致。
5. 落点在生成阶段即被钳制在安全带内，**出界在数学上不可能发生**；`is_in_bounds` 只作断言与日志。
6. 判定按 tick 权威定义（perfect 窗口、杀球高度带、挥拍冷却），不按渲染帧或毫秒近似。
7. 术语表全文统一、禁止混用；沿用文档既有术语，不要引入同义新词。

## 4. 目录约定

- `Docs/`：设计文档与 ADR；`Docs/decisions/` 放决策记录。
- `sim/`：仿真系统（纯逻辑 domain 与渲染 render 分离，domain 不得 import three.js）。
- `.dsh/skills/`：项目级技能（本技能所在处），第三方技能不在此改写，项目约定写在本技能与 `shuttle-storm-sim`。

## 5. 与其他技能的分工

| 场景 | 先读 |
|---|---|
| 仿真系统实现 | `shuttle-storm-sim` → `threejs-game-ui-designer` → `game-engine` |
| 数值/循环/难度讨论 | `game-design-theory` → `brainstorming` |
| 需要多步落地与恢复 | `planning-with-files` |
| Unity 正式开发（后续） | `unity-skills`（需 UnitySkills 包）→ `gamedev-agent-skills/skills/unity` |
| 只想要最小改动 | `ponytail`、`karpathy-guidelines` |

## 6. 工作纪律

- 不臆造数值：文档没写的量，写进配置并标 `assumed: true`，同时在 ADR 说明推导依据。
- 不改 `References/`；不把第三方资源提交进 `sim/`。
- 每次改规则，同步检查三处：设计文档条文、仿真配置、golden 测试。
