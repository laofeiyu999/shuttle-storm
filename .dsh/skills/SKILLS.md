# shuttle-storm 项目技能清单（project skills）

本目录是项目级技能根（DSH 发现顺序 rank 100，高于用户级 `~/.dsh/skills` 的 rank 400）。
技能来源均为公开仓库，逐个核对过 `SKILL.md` 正文，不是只看名字。

## 已随仓库提交的技能

| 技能 | 来源 | 本项目用途 |
|---|---|---|
| `threejs-game-ui-designer` | majidmanzarpour/threejs-game-skills | 仿真系统的 Three.js 场景、HUD、播控与响应式 |
| `game-engine` | github/awesome-copilot | WebGL 游戏循环、相机、输入、渲染组织 |
| `game-ui-ux` | gamedev-skills/awesome-gamedev-agent-skills | 控制台信息层级、输入与状态流、HUD 更新方式 |
| `game-ui-design` | omer-metin/skills-for-antigravity | 界面视觉语言与可读性 |
| `game-feel` | gamedev-skills/awesome-gamedev-agent-skills | 拖尾、落点提示、命中与死球反馈 |
| `game-design-theory` | pluginagentmarketplace/custom-plugin-game-developer | 数值与循环设计的推演（体力/意志/觉醒/难度曲线） |
| `game-studio` | openai/plugins | 浏览器游戏打法路由（three-webgl-game / game-ui-frontend） |
| `brainstorming` | obra/superpowers | 新系统开工前的需求收敛 |
| `planning-with-files` | OthmanAdi/planning-with-files | 多步交付落盘 task_plan / findings / progress |
| `karpathy-guidelines` | multica-ai/andrej-karpathy-skills | 防过度设计，界定可验证的成功标准 |
| `ponytail` | DietrichGebert/ponytail | 最小改动优先（lite/full/ultra） |
| `diagram-design` | cathrynlavery/diagram-design | 架构图、回放时序、状态机图 |
| `unity-skills` | Besty0728/Unity-Skills | Unity 编辑器自动化（84 模块：animator/ui/profiler/urp/test…），正式开发阶段用 |
| `gamedev-agent-skills` | gamedev-skills/awesome-gamedev-agent-skills | 引擎无关手法 + skills/unity/ 专章（需 Unity 工程后启用） |
| `game-developer` | jeffallan/claude-skills | Unity/引擎实现模式速查 |
| `blender-skills` | arjun988/blender-skills | 3D 资产与动画管线（附录 A 相关），自制资产时用 |
| `higgsfield-game-generation` | higgsfield-ai/skills | 浏览器游戏与素材生成（需 Higgsfield CLI） |
| `understand-anything` | Donchitos/understand-anything-plugin | 代码库知识图谱与可浏览看板；后续 Unity/C# 工程与 sim 代码的架构梳理 |

## 未复制、但全局可用的内置技能

`test-driven-development`、`webapp-testing`、`agent-browser`、`office-docx`、`office-xlsx`、`writing-plans`、`executing-plans`、`screenshot`、`ffmpeg-skills` 等属于 DSH 内置技能（rank 600），已随运行环境提供，不需要也不应该复制进仓库。

## 已知前置条件

- `unity-skills`：需要 Unity 2022.3+/6000.x 且项目安装 UnitySkills 包（本地 REST 服务 localhost:8090–8100）、Python 3。当前仓库无 Unity 工程，暂为“已装待用”。
- `gamedev-agent-skills`：`skills/unity/` 章节按 Unity 语义编写，无工程时只作知识参考。
- `blender-skills`：咨询型技能包（references/*.md），不驱动 Blender 进程。
- `higgsfield-game-generation`：需要 Higgsfield CLI 与账号授权。
- `understand-anything`：已排除 `node_modules/`（496 MB，可重建），首次使用需在该目录执行 `pnpm install && pnpm --filter @understand-anything/core build`。

## 明确排除

- `multiplayer-game`：正文要求先读 `BASE_SKILL.md`，且明确只适用于 **RivetKit** 平台，与本项目自研服务端冲突，不安装。

维护说明：升级技能时替换对应目录并同步更新本表；项目专属约定写在 `shuttle-storm-project` 与 `shuttle-storm-sim` 两个技能里，不直接改第三方 `SKILL.md`。
