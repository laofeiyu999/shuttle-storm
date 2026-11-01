---
AIGC:
  ContentProducer: '001191110102MAD55U9H0F10002'
  ContentPropagator: '001191110102MAD55U9H0F10002'
  Label: '1'
  ProduceID: 'c0f91a6d-5906-4ee6-b0cb-a3be3ee6d756'
  PropagateID: 'c0f91a6d-5906-4ee6-b0cb-a3be3ee6d756'
  ReservedCode1: '80c6c5d7-1786-4f50-8879-4725d64f289f'
  ReservedCode2: '80c6c5d7-1786-4f50-8879-4725d64f289f'
---

# Pure Badminton 反编译源码总览

> 由 ilspycmd 8.2 项目模式生成，每类一个 .cs，含 8 个 .csproj（可用 VS/ Rider 直接打开）
> 引擎：Unity 6000.3.15f1，Mono 后端 ｜ 混淆：OPS.Obfuscator（类型名部分混淆，字段/常量/字符串全保留）

## 工程结构

| 工程 | 文件数 | 内容 |
|---|---|---|
| **Match** | 140 | 玩法核心：击球/移动/球轨迹/AI/体力/发球/训练/球场 |
| **Utils** | 136 | ShotType、CharacterStats、MatchSettings、Bot难度、随机工具 |
| **Match.Utils** | 5 | 击球动画表、Lambert W 数学 |
| **UI** | 49 | 力度条/体力条/面板 |
| **MainMenu / CareerMenu / TournamentMenu** | 45 | 三大菜单 |
| **Assembly-CSharp** | 39 | 入口引导 + TMP 示例（无玩法） |

## 重点文件导航（游戏手感全在这）

| 文件 | 对应职责 |
|---|---|
| `Match\CharacterShotManager.cs` | 击球主控：蓄力/PlannedShot/时机判定/四类型分发 |
| `Match\CharacterMovementManager.cs` | 移动：MoveTarget/Rigidbody 驱动/走跑动画分区 |
| `Match\CharacterAnimationDriver.cs` | 动画驱动/MovementDeltaTable 位移 |
| `Match\CharacterBotAI.cs` | 机器人决策（nextShotType/Power/方向） |
| `Match\CourtManager.cs` | 场地常量（13.41/6.705/1.55 网高等） |
| `Match\ShuttleBounceParameters.cs` | 反弹参数 SO |
| `Match\ShuttleManager.cs` | 球实体/落点判定/碰网事件 |
| `Match\ShuttleTrajectoryRunner.cs` | 每帧二分插值推进 |
| `Match\ShuttleRotation.cs` / `ShuttleNetCollisionFix.cs` | 朝向/穿网修正 |

## 混淆类名对照（逆向确认）

| 混淆文件 | 真实语义 | 原理 |
|---|---|---|
| **`Match\jj.cs`** | ShotForceCalculation 击球力度→初速 | `dvd()` 四类型公式；`dve()` 抬升试探；`dvf()` 过网三采样校验 |
| **`Match\jo.cs`** | ShuttleTrajectorySimulation 轨迹生成 | `dwm()` ≤8 段碰网/落地反弹迭代 |
| **`Match\jn.cs`** | ShuttleTrajectory 轨迹数据 | 点表 jlw + NetHit jly + FloorBounce jlz + 落点 jma + 过网 jmb |
| **`Match\jr.cs`** | 轨迹物理查询（表封装） | `dxu()` 阻力积分；`dxo/dxp()` 表反解初速/时间；`dxs()` 过网高度 |
| `Match\xm` 命名空间 | 动作时序数据（`xi` = 动作条目） | lfw 时长 / lge 速度 / lgf 升力 / lgt 可取消 |
| `Utils\hq.cs` | Bot 难度函数 | `cve/cvf/cvg/cvh/cvi` |
| `Utils\or.cs` | 随机封装 | `ffw(a,b)` 均匀 / `ffv()` 0~1 / `ffx()` 布尔 / `ffz()` ±1 |
| `Utils\oq.cs` | 全局设置枚举 | `DifficultyLevel` / `ShuttleTrajectoryOptions` |

## 对应静态资源

资源导出在 `..\AssetExport\`（纹理/网格/精灵/动画/音频/材质）；运行参数（ShuttleTrajectoryTable 等）为 ScriptableObject，存于 `..\..\Pure Badminton_Data\globalgamemanagers.assets` / `resources.assets`。

> AI生成