# src_fy：《飞羽青春》源码专题研究（AI / 双打 / 发球 / 相机 / 提示 / 能量 / 回放）

> 范围：只读 References/fyqc/fyqc-client/。路径简写：FY/ = References/fyqc/fyqc-client/；BL/ = FY/python_src/battlelogic/；TX/ = FY/text/。
> 证据等级：[代码确认] = Python 源码或 text 配置原文；[推测解释] = 根据代码的解读。前人速查见 .ua/v15/find_E.md（下文引用写作 find_E §x）。
> 状态：撰写中。


## 1 专题结论

### 1.1 AI 难度与“地狱人机”

飞羽里有三套互不相同的 AI，难度机制分开看。

A. 行为树 BOT（本地逻辑，练习场/房间/补位用）
- 练习模式三档 [代码确认]：BL/common/defines.py:72-86
  `GAME_AI_DIFFICULTY_LEVEL = {TEST_AI_DIFFICULTY_NEWBIE: 1, TEST_AI_DIFFICULTY_MASTER: 7, TEST_AI_DIFFICULTY_GRANDMASTER: 15}`
  `GAME_BOT_DIFFICULTY_LEVEL = {NEWBIE: [2101..2108], MASTER: [2111..2118], GRANDMASTER: [3010]}`
  `GAME_AI_DIFFICULTY_NAME = {NEWBIE: "新手级训练员", MASTER: "高手级训练员", GRANDMASTER: "大师级训练员"}`
  枚举 TEST_AI_DIFFICULTY_NONE/NEWBIE/MASTER/GRANDMASTER = 0/1/2/3（FY/python_src/base/protobufdata/BattleRoomCmd_pb2.py）。
- 选取 [代码确认]：BL/scenebattle.py:789-791 `practiceBotLst = GAME_BOT_DIFFICULTY_LEVEL[self.m_GameAIDifficulty]; iBOTPlayerID = random.choice(practiceBotLst)`；非练习模式走 TryMatchOneBotPlayer 按对手平均 Elo/胜率挑 BOT（:776-785）。
- BOT 名单 [代码确认]：TX/botplayer.txt（与 aiplayer.txt 内容相同）有 2101-2108 低级训练员、2111-2118 中级、2121-2126 高级、2201-2244 常规/福利/充数 AI、3000 羽球社学长、5001-5003 考试、6001-6019 DYAI。每个 BOT 对应 FY/python_src/base/btdata/bt<id>.py 行为树（共 75 个文件）。
- 难度差异靠行为树规模和分支，不靠反应延迟参数 [代码确认 + 推测解释]：
  - 文件规模：bt2101 约 20KB，bt2111 约 21KB，bt2121 约 33KB，bt3010（大师）约 211KB，bt3001 约 221KB。
  - 行为树调用的 CAgent 方法计数：bt2101 Hit 19 次；bt2111 Hit 24；bt2121 Hit 39；bt3010 Hit 276、IsDropPosInTheArea 19、GetDropPosToNetDistance 8、MoveToStarMarkArea/IsInStarMarkArea/HasStarMarkArea 各 1。
  - 低级 bt2101 的接球逻辑（btdata/bt2101.py:80-538）：发球固定 `Hit(2,0)`（远球、中路，权重 100）；防守时 `GetBadmintonHigh() < 50` 时随机 P/D/GY 全走中路（权重 40/10/50）；`GetHorzDistFromBadminton() > 250` 时 60% 直接挥拍、40% 继续跑；离球 <200 且球高 <150 时九选一（P/D/GY × 中/右/左），左右路权重只有 4–16；跑位 `MoveToDropPos(50, 50)`（落点偏移 50cm）。
  - 大师 bt3010（btdata/bt3010.py:276-4272）：发球站位 `MoveToDefensePos(±20, 50)` 后 50/50 打 D 或 P；防守时先判星标（有星标区就 `MoveToStarMarkArea` 去接星标）；再按“球高 ≤30/<60/≤150/≤270/≤300”“离球 ≤150/≤250/≤420 cm”“落点离网 <335/<586 cm”（335 正是 frontBackLine 3.35m）“落点在左/右半区 IsDropPosInTheArea(5)”“对方击球者是否在后场（GetAttackerToNetDistanc ≥335）、在左/右”层层细分；每个叶子是 6–9 个 `Hit(key, dir)` 的加权随机，权重明显偏向“打到与落点/对手相反的一侧”（例如落点在左时 Hit(1,2)/Hit(2,2) 权重 29，在右时镜像）。跑位用 `MoveToDropPos(0, 50)`（不偏左右，只后撤 50）。还会用 `CouldUseHitKey(4)` 判断主动技能键是否可用。
  - Hit 参数含义 [代码确认]：BL/bot/agent/a5agent.py:28-48 CHITKEY 1=近球 P、2=远球 D、32=高远球 GY、4=主动技能 ZD、64=道具 DJ；CHITOUTTYPE 0=中、1=右、2=左。
- 反应延迟 [代码确认]：没有按难度的反应延迟参数。所有 BOT 共用调度：BL/scene.py:213-224 CalcRobotUpdateInterval，球未在飞 → 每 12 帧更新一次；飞行中 `ClampFloat(int(Sec2Frame(FullTime - PassTime)/2), 4, 15)`，即“剩余飞行时间的一半”，夹在 4–15 帧（0.16–0.6s）；BL/scene.py:227-236 OnBotUpdate 按此间隔轮流更新 BOT。
- 预判/作弊 [代码确认]：行为树直接读球的“最终落点”和预判位置：a5agent.py:332-339 `GetDropPosToNetDistance` 用 `oBadminton.GetDropPos()`；:350-357 `GetBadmintonHigh` 用 `GetPreJudgePos(HITACTION_PREJUDGE_FRAME)`；bot/agent/common.py:38-50 GetMoveTargetPosOfDrop 直接把落点当跑位目标，且只有队内离落点最近的人去（`GetClosestOne`）。也就是说 AI 在对方出手瞬间就知道精确落点，不需要看弹道估算。玩家的摇杆/按键输入不被读取（未找到任何读取对手 HitKey/方向的条件）[代码确认：搜过 a5agent 全部条件方法]。
- 移动速度与失误率 [代码确认]：没有为 AI 单独设移动速度乘数（走的是同一个 WalkTo → m_Phys.SetWalkTo，BL/combatobjectdynamic.py:489-495）；没有“故意失误率”参数。失误只来自：跑位偏移（低级 50cm 横偏）、“球太远就随机直接挥”（低级 60% 分支）、以及动作/落点本身的随机。

B. 服务器 GameAI（“DYAI”，外部 AI 服务）
- BL/sceneplugins/gameai/defines.py:9-25 [代码确认]：`GAME_DIFFICULTY_LEVEL_MAX = 20`、`GAME_DIFFICULTY_RANGE = 3`；`iLevel = int(20 * (iElo - AIMinElo) / (AIMaxElo - AIMinElo))`，再在 [iLevel+波动-3, iLevel+波动] 内随机取，夹在 1–20。AIMinElo/AIMaxElo 来自匹配规则数据，不在 text/ 中。
- gameaiservice.py:73-82：练习难度命中三档时直接用 1/7/15；否则按真人平均 Elo 算；挑战模式强制 1 级。:52-63 房间模式给 AI 改名 `Name + "-AL%s"`。
- gameaiservice.py:38-50 TryReq：把场面数据打包发给 AI 服务（m_ReqGameAIActionFunc），服务端不可用时 OnAIServerBlocked → 退回行为树（gameplayer.py:829-833）。
- gameai.py:32-56 发给服务的数据 [代码确认]：球的未来 5 帧预判位置 `nps`、落点 `dp`、曲线 ID `cid`、星标位置 `smp`、击球者 `oid`；每个玩家的位置、四向速度、连击数、当前动作、debuff、技能 CD（:121-156）；gameairerun.py 还加上比分、可击球名单、hitQuality、Elo。→ 真正的 AI 决策在外部服务，Python 里没有模型，参数未找到。
- 行为树 6001（btdata/bt6001.py，DY_GAME_AI_BTCONFID=6001，defines.py:56）只是 GameAI 的骨架：发球站位后 50/50 打 P/D，其余靠服务下发。

C. 为什么最强档难赢（推测解释，基于上面的代码）
1. 读精确落点：AI 一开始就跑向真实落点，不存在“看错球”；而人要靠落点标记和弹道判断。
2. 反向出球：大师树按落点左右和对手站位分支，权重偏向把球打到对手空档。
3. 大师 BOT 只有一个 3010，规则多达几百个叶子，几乎覆盖所有高度/距离组合，很少走“随机挥空”的兜底分支。
4. GameAI 服务（DYAI）还能看到所有玩家技能 CD、连击、debuff，属于信息全知。
玩家口中“地狱人机”具体对应哪一档在源码里没有名字，可能是大师级训练员（3010）或高等级 DYAI，属 [推测解释]。

D. AI 回球选择逻辑小结 [代码确认]：按键（P/D/GY）+ 方向（左中右）由行为树加权随机决定；动作和曲线仍走玩家同一套 CalcHitAction / DoChooseCurve（find_E §2.1、§4.1）。dohitaction.py:235-236 的 `m_AICurveID` 只在测试场景 scenetest.py:21、54 赋值，不是 AI 作弊通道。

### 1.2 双打：发球轮转、站位、AI 队友补位

发球轮转 [代码确认]
- 得分方发球（标准羽毛球规则）：BL/scenebattle.py:334-341 ResetServeAndPosIndex
  `iScoreTeam = self.m_LastScoreTeam; iRemainder = iScore % 2`，单打走 ResetPosIndexForSingle，双打走 ResetPosIndexForDouble。
- 单打 BL/scenebattle.py:291-302：双方同时换站位，`iPosIndex = 2 if iRemainder == 1 else 1`（得分方分数奇数站 2 号位、偶数站 1 号位，即奇左偶右）。
- 双打 BL/scenebattle.py:307-332：只有“得分队且就是上一球发球队”时，本队两人才交换位置（上一发球人按奇偶站 2/1，队友站另一格）；接发球队与“换发权”的得分队都不换位，只按得分队分数奇偶决定发球格 iServePosIndex。随后 ReCalcServePlayer → DoSelectServePlayer（:358-365）选该格上的队员发球。这就是标准双打规则。
- 接发人 BL/scene.py:318-333 CalcCatchServePlayerID：对方队里与发球人 PosIndex 相同的人接发；找不到同格的人就把最后遍历到的敌人强行 SetPosIndex 到同格。BL/scene.py:1112-1118 CouldCatchServe：发球球只允许这个接发人击球。
- 开局发球方 BL/scenebattle.py:374-377 GameStartInitServe：主客队各 50% 随机，从 1 号位发。另有 SERVE_TYPE_ONLY_HOST/ONLY_GUEST（:367-372，用于关卡/教学固定一方发球）。
- 发球前站位 BL/scenebattle.py:340-348 ResetPosition：`oPos = m_ServePosDict[iMemberType][iPosIndex]; oObj.SetPos(oPos, bNoLerp=True)`，瞬移到固定发球点，不插值。m_ServePosDict 的具体坐标数据未在 text/ 或 python_src 找到（courtData 由引擎侧 base.data 提供，只在 TX courtconfig.txt 看到 frontServeLine 1.9、dualCourtSize 6.1×13.4、singleCourtSize 5.2×13.4、moveableCourtSize 9.0×16.4、frontBackLine 3.35）。

站位与 AI 队友补位 [代码确认]
- BL/bot/agent/common.py:53-88 DoGetDefensePos：双打防守点 = `courtData.m_ServePosDict[memberType][posIndex]`（回到自己发球格的中心），单打防守点 = `(0, 0, ±iWidth/2)`（半场中点）。也就是说 AI 双打的“基准阵型”是左右并列（按 PosIndex 的左右格），没有前后阵型切换代码。
- 谁去接球：common.py:38-50 GetMoveTargetPosOfDrop → BL/scene.py:843 GetClosestOne，按与落点的 Distance 取队内最近的一人去落点；另一人执行防守分支回 DefensePos。没有“攻守转换→前后站位”逻辑，搜过 FrontBack、Formation、阵型、前后站、ATTACK_FORMATION 均未找到。
- 行为树里 `IsAttacker()`（是否本队刚击球的人）分支：bt3010 中击球者回位用 `MoveToDefensePos(0, -20)`（btdata/bt3010.py:4257，向后 20cm 的防守点）；bt2101 用 `MoveToDefensePos(0, 0)`（btdata/bt2101.py:508/523）；非击球者 Noop（原地不动或交由队友逻辑）。
- 推测解释：飞羽的双打 AI 本质是“最近者接球、其他人回自己左右格中心”，所以会出现两人同时追同一个球极少、但前后空当明显的情况；本作若做双打 AI，需自建攻守阵型（攻：前后；守：左右）。

### 1.3 发球：发球前移动范围与发球后相机

发球前能否移动 [代码确认]
- 发球状态可移动：BL/combatobjectdynamic.py:225-233 CouldMove `if GetGameState() not in (GAME_STATE_SERVE, GAME_STATE_PLAYING): return False`。READY_SERVE（准备）阶段不能动，进入 SERVE 后可以动。
- 移动范围限制：BL/gameplayer.py:397-409 GetCorrectPos——发球状态下，PosIndex 与发球人相同的玩家（即发球人和接发人，双打的两个“同格”人）`bNeedServeCorrect = True`，位置被夹在 `m_SingleServeMoveableDict / m_DualServeMoveableDict[iMemberType][iPosIndex]` 的 MinPos/MaxPos 矩形内（BL/config/courtconfig.py:12-29 CorrectPos，还扣除模型外包围 boundExternPosDict）；双打中另外两名非发/接发队员不受发球格限制，可在本方全场可动区 m_MoveableCornerPosDict 内自由走。
- 发球区边界：BL/scene.py:827-836 GetServeRange `fFront = m_FrontServeLine; fBack = iWidth (单打) / m_DualBackServeLine (双打)`；BL/scene.py:105-120 InitPhys 把 ServeX、ServeFrontZ、ServeBackZ 传入物理层 InitCourt。ServeMoveableDict 的具体矩形数值未找到（引擎侧数据，非 txt）。
- 发球时限：BL/config/gamestatetimeconf.py:10-14 `GAME_STATE_READY_SERVE: 8 + 2*FRAME`、`GAME_STATE_SERVE: 15*FRAME`（FRAME=25，BL/common/defines.py:28，即准备约 2.3 s、发球 15 s），超时 BL/scenebattle.py:254-259 ServeOverTime 判罚；实际值可被 text/gametime.txt 覆盖（该文件只含 animTime 90、countDown 1000、releaseTime 90）。
- TestIsStopServe() 为真时取消发球格限制（测试/教学用）。

发球后相机 [代码确认：仅类名/资源名；具体时长 推测解释]
- python_src 下无任何相机代码（grep -i camera 于 python_src 全部 .py，排除 _pb2/btdata，结果为空）。相机全部在热更 C# FY/hotfix_dll/Game_dll.dll（无源码，只能抽取字符串，我把字符串导出到临时文件检索）。
- 发球机位是独立的 Cinemachine 虚拟相机：字符串 `Camera/ServeCommonVCam`、`Camera/ServeCommonCamTrack`、`CommonServeCamTargetGroup`、`Camera/ServePlayerVCam`、`Camera/ServePlayerCamTrack`/`ServePlayerCamTrack1`、`ServeCommonCamTrack1`；类 `M2A5.Battle.BattleCamera.ServeVCamHandler`（方法 InitServeCam/InitServeCommonCam/InitServePlayerCam/SetServeCam/SetServeVCam/SetServeCamParams/ChangeServeCamNoDamping/HandleCommonServeCamRotation/SetDelay）。比赛中主机位是 `Camera/MainVCam` + `Camera/MainCamTrack`/`MainCamTrack1` + `MainCamTargetGroup`，类 MainVCamHandler（ChangeMainCamNoDamping、HandleMainCamRotation、SetMainVCamImmediately）。另有 `SetCam2Serve`、`DelaySetCameraBlender`、`m_OriCamBlendTime`、`DelayResetBrainBlendTime`、`CinemachineBlendDefinition`、`m_DefaultBlend`。
- 推测解释：发球时分“发球人机位 ServePlayerVCam（自己发球）”与“通用发球机位 ServeCommonVCam（对方发球/接发）”两种，均挂在轨道（CamTrack，CinemachineDollyCart 字符串也存在）上；发球出手后切回 MainVCam，通过 CinemachineBrain 的 Blend 过渡（有 BlendTime 与 DelaySetCameraBlender，说明是带混合的过渡而不是硬切；SetMainVCamImmediately / ChangeMainCamNoDamping 用于需要瞬切的场合，例如每球重置）。混合时长数值未找到（在 prefab/Brain 设置里，不在导出资源中）。
- 发球 UI：`UI/Prefabs/Battle/ServeMark`、`UI/Prefabs/Battle/GUI_ServeText`、`GUI_ServeTimeoutTips`、音效 `Play_vo_referee_serve`。

### 1.4 比赛相机

已确认的配置 [代码确认]
- FY/text/CameraGroupDataConfig.txt（全文）：
  `"badmintonGroupData": {"weight": 1.0, "radius": 0.0}, "myGroupData": {"weight": 4.0, "radius": 2.0}, "otherPlayerGroupData": {"weight": 2.0, "radius": 0.0}, "dropPosGroupData": {"weight": 3.0, "radius": 1.8}, "dropPosLerpSpeed": 10.0, "mainCamHSpeed": 6.0`
  即主相机是 CinemachineTargetGroup 跟随：成员 = 球（权重 1）、自己（权重 4、半径 2 m）、其他玩家（权重 2）、落点（权重 3、半径 1.8 m）；落点成员以 10 的速度插值（DLL 字符串 m_DropLerpSpeed、m_LerpDropPosUpdateId、StopLerpDropPosProj），主相机水平速度 6。
- FY/text/CameraValues.txt（全文）：`"yOffsetMax": -0.1, "yOffsetMin": -1.2, "zOffsetMax": 3.5, "zOffsetMin": -3.5`。推测解释：相机目标点在 Z（纵深，沿球场长度）上随焦点在 ±3.5 m 内平移，Y 偏移在 -1.2 到 -0.1 之间变化（DLL 有 yOffsetFactor、get_yOffset），即焦点靠近网/靠后时相机高度偏移不同。
- DLL 相关字符串：`CinemachineTargetGroupExtension`、`CinemachineGroupComposer`、`m_MainComposer`、`HandleFOV`、`m_MinimumFOV`、`m_MaximumFOV`、`m_FOVAdder`、`m_MinFov`/`m_MaxFov`、`SetZoomLevel`、`m_XDamping`/`m_YDamping`/`m_ZDamping`、`m_VerticalDamping`/`m_HorizontalDamping`、`SetCamDamping`、`CameraShake`/`CameraShakeConfig`、`CameraBlackDownEffect`、`FocusCameraEffect`、`Change2TopViewCam`、测试机位 `TopViewHalfTestVCam`/`TopViewFullTestVCam`。

回答用户问题
- “前场拉近只显示部分球场、中后场显示全场”：源码中无“按前中后场切机位”的分支；但 GroupComposer 会按组包围盒自动调整 FOV（m_MinimumFOV~m_MaximumFOV）。球和落点都在网前、玩家也在网前时，组包围盒小 → FOV 收紧，看起来就是“拉近只看半场”；球打到后场时组包围盒覆盖两端 → FOV 放大显示全场。[推测解释，机制来自 CinemachineGroupComposer 的标准行为 + 上述权重配置]
- 起跳杀球是否拉远/变视野：未找到“杀球/起跳专用机位或 FOV 修改”的字符串（搜过 Smash.*Cam、Jump.*Cam、Kill、Spike、FovSmash）。有 `m_FOVAdder`（FOV 叠加量）和 CameraShake/FocusCameraEffect/CameraBlackDownEffect，可能用于技能/星标扣杀演出：FY/text/CameraBlackDownEffectConfig.txt 定义 blackDownType、blackInTime 3.0、strength 5.0、maskScaleCurve/strengthCurve（全屏压暗聚焦效果）。[推测解释]
- 双打与单打：DLL 只有一套 MainVCamHandler + 一份 CameraGroupDataConfig，otherPlayerGroupData 统一处理“其他玩家”（双打多一个队友和一个对手），所以是同一逻辑、权重相同，双打因成员更多包围盒更大 → 平均视野更广。[推测解释]
- 具体相机位置、高度、俯角、FOV 数值：未找到（在 prefab 中，导出资源不含 prefab；搜过 FieldOfView、fov、CameraValues、Camera/MainVCam 相关 txt）。
- 观战机位：DLL 有 WatchVCamHandler、ShowWatchVCam、SHOW_WatchCAM_PRIORITY、SetWatchVCamCullingMask；text/SceneSpector.txt 只是“场边观众站位”（如 1001 室内练习场 pos x ±4.8 z ±1.5 rot y 90/270），不是相机。

### 1.5 完美时机提示“泡泡”

逻辑层（Python）[代码确认]
- 唯一的击球时机提示：FY/python_src/clientlogic/badmintonhithint.py:13-52 CBadmintonHitHint（仅客户端，CClientLogic 每帧调用，clientlogic/__init__.py:15-27）。
  CheckShowHint（:35-46）：
  `if not oPlayer.m_DoHitAction.CouldHitBadminton(): return False`
  `oBadmintonPos = oBadminton.GetPreJudgePos(HITACTION_PREJUDGE_FRAME)`（HITACTION_PREJUDGE_FRAME = 3，BL/common/defines.py:18，即 3 帧后的球位置，25fps 下约 0.12 s）
  `if oBadmintonPos.m_Y <= 250: if fDis <= 150: return True`
  条件 = 当前能击球 + 3 帧后球高 ≤ 2.5 m + 与自己水平距离 ≤ 1.5 m。显示/隐藏只在状态翻转时发一次 `BadmintonHitHintMsg{IsShowHint}`（BATTLE_BADMINTON_HIT_HINT_MSG = 47），没有时长或闪烁参数，提示一直显示到条件不满足（球落低于可击高度/离开范围/已击球）为止。
- 同一个 Update 里还处理星标重置（:30-33）：`if StarMarkPos.IsZero() or 球在下降: if Pos.Y < BADMINTON_STARMARK_HEIGHT(270): ResetStarMarkState()`——星标在球下降穿过 2.7 m 时消失。

表现层（DLL 字符串）[代码确认：名字；颜色/闪烁 推测解释]
- 客户端处理：`BadmintonHitHintMsgCmdExecute`、`SetHitHintEffectActive`、`SetHitHintEffect`、`m_HitHintEffect`；星标：`BadmintonStarMarkCmdHandlerExecute`、`OnBadmintonStarMarkState`、`SetStarMarkAnimatorState`、`m_StarMarkAnimator`、`RefreshStarMarkState`、`SelfEnterStarMark`/`SelfExitStarMark`（BATTLE_EVENT_TYPE_SELF_ENTER_STARMARK=13 / EXIT=14）、`StarMarkDeath`、`StarMarkRadius`。
- 球体环特效资源：`Effects/Battle/Efx_ball_ring`（球上的环）；贴图 FY/textures/APK/UI_ring_02.png、Star_001.png。
- 对应用户观察的两阶段 [推测解释]：
  1) 头顶高处紫色快闪 = 星标阶段。星标位置由曲线 CalcStarMarkPos 给出（BL/badminton/badminton.py:393-395），击球时 CheckStarMark（:397-405，非发球才检查，:277-278）：只有击球者星标计数器满（`GetCounterValue(COUNTER_TYPE_STARMARK) >= maxvalue`，:562-572）才亮；玩家可起跳击球的判定 BL/combatobjectdynamic.py:383-391 IsInStarMarkRange：`球3帧预判高度 + 容差 > 270 且 与星标水平距离 ≤ STAR_MARK_RADIUS 属性 + 容差`。由 m_StarMarkAnimator 播放，球降到 270 以下即熄灭。
  2) 随后浅蓝慢闪直到落地 = HitHint 阶段，条件为上面的“3 帧后球高 ≤250 且距自己 ≤150”。由 m_HitHintEffect（推测就是 Efx_ball_ring）显示。
  颜色与闪烁频率在特效 prefab/材质中，导出资源里未找到（搜过 hint、bubble、paopao、Efx_ball_ring 于 text/*.txt，均无配置项）。

### 1.6 落点标记与扣杀星标

[代码确认]
- 落点标记资源（DLL 字符串）：`Badminton/Attachment/BadmintonDropPoint`、`Effects/Battle/Efx_ground_1003`、`Badminton/Attachment/BadmintonProjection`（球在地面的投影）、`VirtualDropPos`、`DropPosGuideLine`/`Common_DropPosGuideLine`/`LoadDropPosGuideLine`/`DropPosGuideLineSetting`（落点引导线，可在设置里开关）、`OnBadmintonDropPosChanged`、`OnBadmintonDropPosUpdate`、`m_LerpDropPosUpdateId`。
- 显示时机：击球即下发曲线消息 BattleBadmintonCurveMsg（含 DropPos、FullFrame），客户端立刻显示落点，即“出手即显示真实落点”；BattleHitBadmintonMsg 另带 ShowUIPos、TipsPos 字段（BattleCmd_pb2 描述）。
- 假落点（欺骗球）：FY/python_src/clientlogic/curvedropposhandler.py:18-61 CCurveDropPosHandler——曲线形状 SHAPE_TYPE_TURN_AROUND(3) 和 SHAPE_TYPE_NORMAL_FAKE_DROP(6) 先显示 `GetFakeDropPos()`，当曲线点序号到达 m_TurnBackIdx / m_DropPosBackIdx 后，按 `fPercent = (PassTime - StartBackTime)/(FullTime - StartBackTime)` 把标记从假落点 Lerp 到真落点（BATTLE_UPDATE_DROP_POS，IsLerp）。普通曲线不发更新，落点标记从出手起固定。
- 扣杀星标触发：见 1.5(1)。星标只在击球者星标计数器充满时出现（COUNTER_TYPE_STARMARK），位置在弹道上 270 以上一点；进入范围起跳击中即走星标扣球动作 STAR_MARK_HIT_ACTION_ID = 1076（BL/common/defines.py:45），HIT_TYPE_STARMARK = 4。音效 `play_1p_battle_tips_smash` triggerKey 2031（FY/text/BattleCommonEffect.txt）。星标计数器 maxvalue 的数值未找到（GetCounterData 数据不在 text/）。
- 注意 find_E 已把星标与技能列为“不照搬”项，此处只做事实记录。

### 1.7 能量 0–100 与远球（KEY_D）弹道；高点/低点击球差异

结论：飞羽没有“能量 0–100 影响远球弹道”的机制，未找到。[代码确认：搜索结果为空]
- 搜过：python_src 下 energy / Energy / m_Power / PowerValue / 能量 / 怒气 / SKILL_VALUE；text/ 下 能量（只在 GeneName.txt 的昵称词库里出现，:1012“小妖AND能量”、:2085“小宇宙大能量”）；DLL 字符串只有 InitEnergyTabBar、CrowdEnergy_、MaxEnergyCountEvent（界面/观众相关，和弹道无关）。
- 远球速度只由“属性倍率”修正，倍率是离散的角色属性，不是战斗中实时变化的槽：
  FY/python_src/battlelogic/badminton/badminton.py:650-660
  `elif iHitKey == BattleCmd_pb2.HIT_KEY_KEY_D: iAverageSpeedAddition = oAttacker.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_D_BADMINTON_SPEED_MUL)` … `return iAverageSpeedAddition - 10000`
  :259-263 `iSpeedMul = (oHitArgs.m_AverageSpeedMul + iAverageSpeedMultiAddition) / 10000` → `CreateCurve(start, drop, iCurveId, iSpeedMul)`
  :518-520 m_AverageSpeedMul 取 BATTLE_PROP_TYPE_HIT_BADMINTON_AVERAGE_SPEED_MUL。也就是 速度倍率 = 通用击球均速倍率 + 按键专属倍率 − 1（万分比）。它是连续数值，只缩放飞行速度；弧线形状由曲线 ID 决定，倍率不改。[代码确认]
  同类属性还有 P_/GY_BADMINTON_SPEED_MUL、DROPPOS_FAR/NEAR/LEFT/RIGHT_OFFSET、DROPPOS_GATHER（Common_pb2 BATTLE_PROP_TYPE_*），来源是角色/技能/符文属性。
- 弧度来源：曲线 ID 由“动作”选，动作由球的高度、距离自动选（find_E §2 引 dohitaction.py:526-578 HeightRange/DistanceRange）；各族 Choose 函数原样返回配置 ID：FY/python_src/battlelogic/plugins/hitaction/hitactionfunc.py:125-150 `def ChooseNormalCurve(oObject, oHitAction, iCurveID): return iCurveID`，另有 RandChooseNormalCurve（:129-133，配置列表里随机选一个）。[代码确认]
- 高点与低点击球的差异 [代码确认 + 推测解释]：
  1) 击球起点就是球在击球帧的实际位置：dohitaction.py:379-380 `return CDVec3.CopyFrom(oBadminton.GetPreJudgePos(self.m_Owner.m_PreJudgeFrame))`，所以起点高度直接进入 CreateCurve。
  2) NORMAL 族在原生层按“起点高度 × 出球角度”查剖面表（find_E §2：26 个高度 10..260 × 角度 -30..80）[推测·复原数据]，同一个按键在不同高度出来的弧线不同。
  3) 高度分档在协议里有 HIT_HIGH_TYPE_JUMP/HIGH/MIDDLE/LOW/LOSE（BattleCmd_pb2 枚举），记录项 BATTLE_RECORD_HIGH_/MIDDLE_/LOW_CONTINUOUS；动作库按高度分不同动作 → 不同曲线（如跳扣 4006-4008 只在高位）。
  4) 低于网带的击球：几乎所有曲线 crossNetFix=T，生成时保证过网（find_E §撞网，netFixH 0.08）。所以低点击球会“自然变高”：过网约束把弧线顶点抬到网上方，这是生成规则带来的，不是能量造成的。[推测解释，依据 find_E 的 crossNetFix 解读]

### 1.8 回放、导出与观战延迟

回放 = 指令流录像，不是视频 [代码确认]
- 录像开关：FY/python_src/battlelogic/common/defines.py:59 `NEED_REC_REPLAY = True`；装饰器 battlelogic/common/decorator.py:96-104 `def RecReplayOnly(func): if defines.NEED_REC_REPLAY: return func`。
- 录像格式：protobuf `Common_pb2.GameReplayData`，含 CreateGameData（建局消息：场景、随机种子、玩家数据）+ Datas 列表（每条 CurFrame + BinData 玩家指令）。读取代码 FY/python_src/rerunreplay/rerunserverreplay.py:81-86 `oGameReplayData.ParseFromString(sReplayBuffer); self.InitGame(oGameReplayData.CreateGameData); self.InitFrameData(oGameReplayData)`，回放时逐帧把指令重新喂给同一套战斗逻辑 :88-102 `DoServerCmd(self.m_Owner, pid, iMsgID, sBuffer)` → `self.m_Scene.Simulate()`。也就是确定性帧同步重算（同随机种子），不存球的轨迹。
- 样本文件：FY/replays/ 下 9 个 `<id>-<时间戳>-1-<数字>.replay`，约 250 KB/局，文件头是 protobuf（可见 "2026-05-17 21:40:39" 字串）。
- rerunreplay 的主要用途是服务器离线重跑生成 GameAI 训练输出（rerunserverreplay.py:77-79 `InitGameAIReRun`、`COutPutForGameAI`，OnGameEnd 输出 "ops"+UUID 文件）。
- 客户端 DLL 字符串：ReplayBattle、StartReplay/PauseReplay/ContinueReplay/EndReplay、SetReplayMultiply/m_ReplayMultiply（倍速）、SetStartReplayIdx、LoadReplay、GetReplayDir、LimitReplayFile（本地数量上限）、StartSaveReplay/StopSaveReplay、UploadReplayFileToServer、CNormalUploadReplayMsg、BattleRecordPrivacySetting（战绩/录像隐私）；中文串“需要回放的比赛”“GM指令获取玩家 {0} 战局UUID: {1} 的录像文件”。

导出视频 / m4a：未找到 [代码确认：搜索为空]
- 搜过 DLL 字符串与 text/：m4a、mp4、Encode/Recorder/ReplayKit/ScreenRecord、导出、视频；FY 全目录 find *.m4a 为 0 个。
- 有的是：video_real/ 85 个 .m4v（APK_2100001.m4v 等，H.264 60fps 教学/剧情视频，客户端资源说明.md），用户说的“m4a”可能是把 .m4v 看错 [推测解释]。DLL 的 StartRecording/m_IsRecording/StartRecordCall/UploadRecordCall/UIChatRecord 属于语音聊天录音；VideoPlayer/m_VideoRT/UISkillVideoPreviewNew/RenderVideo 是播放技能预览视频；ScreenShare/ShareGame/NativeSharePhoto/ShareMvp 是截图分享。没有把对局编码为视频文件的迹象。

观战 [代码确认：机制；推测解释：缓冲大小]
- 逻辑层不加延迟：FY/python_src/battlelogic/scene.py:411-413 `def AddPersonalSpectatorsFrameMsg(self, pid, iMsg, oMsg): self.m_SendToPid(pid, iMsg, oMsg); self.m_SendToSpectators(pid, iMsg, oMsg)`——给观众的消息和给玩家的同帧发出；观众显示上限 defines.py:58 `SPECTATOR_SHOW_MAX_AMOUNT = 10`；观众站位 text/SceneSpector.txt（每场景 SpectorPos pos/rot/动画，例 id 1001 室内练习场 pos(-4.8,0,1.5)）；观众动作 text/spectateaction.txt、BoyWatchingGameAnim.txt/GirlWatchingGameAnim.txt。
- 客户端 DLL 有延迟播放结构：PushDelayFrame、GetDelayFrameItem、m_DelayFrameId、DelayFrameHandleEvent、AddDelayFrameCounter、m_DelayPlayDataQueue、DelayPlayData、delayFrameCount、ServerDelayData、IsWatchBattle、WatchVCamHandler/ShowWatchVCam/SHOW_WatchCAM_PRIORITY、C2GSReqWatchGameMsg、FriendCanWatch/IsAllowWatch、WatcherNumSetting。推测：观战客户端把收到的帧放进 m_DelayPlayDataQueue 缓冲后再播，用来平滑网络抖动。缓冲帧数未找到（不在 python_src 和 text/，可能在 DLL 常量或服务器配置）。搜过 delayFrame、WatchDelay、SpectatorDelay、观战、延迟。

### 1.9 完美/糟糕击球弹图

[代码确认：资源存在；触发 部分推测]
- 资源：FY/sprites/APK/GUI_Hitgood_zi.png（135×67，紫粉色“完美”字）、GUI_Hitgood_di01~04.png（底板/光效）；GUI_Hitbad_zi.png（135×68，青蓝色“糟糕”字）、GUI_Hitbad_di01~04.png。同名也在 sprites/DEVICE、textures/APK。
- 其他飞字：`Effects/Battle/FlyText/ComboMax`、`FlyText/ComboUp`、`FlyText/ComboDown`、`FlyText/BodyShot`（DLL 字符串）。
- 触发：击球质量 = 空间圈层 INSIDE/MIDDLE/OUTSIDE（find_E §4，HIT_ACTION_TYPE_INSIDE=1/MIDDLE=2/OUTSIDE=3），DLL 有 `m_HighQualityKey`、`m_MediumQualityKey`、`m_BadQualityKey`、`m_HighQualityComboKey`、`HitBallQuality`、`ContinuousPerfect`、`CalcPerfectCount`、`PerfectHitTimes`；记录 BATTLE_RECORD_PERFECT_HIT_TIMES=54、COUNTER_TYPE_CONTINUOUS_PERFECT=7。推测解释：INSIDE（内圈）→“完美”，OUTSIDE（外圈）→“糟糕”，MIDDLE 不弹图；连续完美累计连击条（GUI_ComboBar）。具体映射代码在 DLL 内，未能直接确认。
- 补证：质量分级的代码映射在 FY/python_src/battlelogic/sceneplugins/gameai/gameairerun.py:64-74（反编译缩进有错位，但取值清楚）：`if oHitAction.m_HitActionType == BattleCmd_pb2.HIT_ACTION_TYPE_INSIDE: iHitQuality = 1` / `HIT_ACTION_TYPE_MIDDLE: iHitQuality = 2` / `HIT_ACTION_TYPE_OUTSIDE: iHitQuality = 3`，未命中为 0，写入 dPlayerData["hq"] 发给 GameAI。说明“击球质量”就是动作的圈层类型（内圈=1 最好），和按键时机无关。[代码确认] 弹图与 1/3 的对应仍属推测。

## 2 对本作的可借鉴建议

以下都是研究建议，不是本作默认值（遵守 find_E 总原则：飞羽数值只作证据）。

1. AI 难度：飞羽的“强”主要来自信息完全（直接读真实落点）+ 统一的决策间隔 + 动作库随高度自动选，不靠加速或作弊读输入。本作若要做“地狱人机”，建议把难度拆成可调的几项：决策间隔/反应延迟、落点信息噪声（读到的落点加偏差）、回球选择权重（攻击性）、圈层质量概率。最强档也保留可感知的弱点（如对假落点曲线的反应），否则玩家只觉得“它全知”。
2. 双打补位：飞羽规则很简单——离落点最近的队友去接，另一人回防守位（发球站位表）。本作可以先照这个最小规则做，再加“前后/左右阵型”切换条件（例如己方进攻时前后站、防守时左右站），这一点飞羽没有，需要本作自己设计。
3. 发球阶段：飞羽允许发/接发方在限定矩形内移动（ServeMoveable 夹取），发球后由 Cinemachine 发球机位切到主机位（推测为带 blend 的过渡，依据是 DelaySetCameraBlender/m_OriCamBlendTime 字符串，时长未知）。本作可采用“发球区内可移动 + 发球后短过渡到主镜头”。
4. 相机：飞羽用 TargetGroup 加权（自己权重 4、落点 3、球 1、其他人 2）+ FOV 上下限自适应，自然产生“前场时拉近、后场时拉远”。本作可用同类思路，单打/双打共用一套逻辑，只是成员数不同。权重数值需本作自行调。
5. 击球提示：飞羽只有一个二元提示（“3 帧后球进入可击范围”），没有分级时间窗。用户观察到的两阶段，前段是星标（属于不照搬项）。本作若要做“时机泡泡”，建议明确定义为本作自有的窗口逻辑，不要以飞羽为数值依据。
6. 落点标记：出手即显示落点，欺骗球先显示假落点再插值到真落点——这个“落点标记可迁移”的做法可以借鉴，用在本作的假动作/吊球上。
7. 能量/高低点：飞羽没有能量影响弹道，高低点差异来自“起点高度 + 曲线剖面 + 过网修正”。本作如果要能量 0–100 连续映射远球，需要自己定曲线，飞羽只能证明“过网修正让低点回球自然变高”这种做法可行。
8. 回放：飞羽用确定性帧同步录指令（约 250 KB/局），回放即重算，可倍速。本作若是确定性逻辑可走同样路线，成本最低；导出视频需另做（飞羽没有）。观战可借鉴“观战端延迟队列”（DelayPlayDataQueue）做抖动缓冲。
9. 完美/糟糕弹图：飞羽按空间圈层判质量。本作若按时机判质量，弹图可以借鉴形式（紫粉“完美”、青蓝“糟糕”的字+底板），判定依据要本作自定。

## 3 未找到 / 存疑项

- AI 反应延迟、失误率、移动速度倍率的独立参数：未找到（搜 reaction、delay、miss、error、speed 于 bot/agent、btdata）；难度差异体现在行为树结构和 GameAI 服务等级上。GameAI 服务（1–20 级）的模型在服务器端，客户端看不到策略。
- 双打前后/左右阵型切换：未找到，代码里只有“最近者接球 + 回防守位”。ServeMoveableDict / m_ServePosDict 的具体数值不在 text/（courtconfig 加载自其他数据）。
- 相机：全部在 hotfix_dll/Game_dll.dll，只能拿到类名/字段名和 text/ 的权重配置；高度、俯角、FOV 上下限具体数值、blend 时长未找到；起跳杀球是否单独变视野未找到（搜 Jump/Smash + Cam），只有 CameraBlackDownEffectConfig（压黑特效）可能与技能/星标扣杀相关 [推测]。
- 泡泡颜色、闪烁频率、两阶段的特效 prefab 名：只找到 m_HitHintEffect、m_StarMarkAnimator、Efx_ball_ring，颜色和闪烁在 prefab 里，未导出。
- 星标计数器满值、STAR_MARK_RADIUS 属性默认值：未找到。
- 能量 0–100：未找到对应机制（见 1.7 搜索词）。
- m4a / 视频导出：未找到；只有 .m4v 教学视频。观战缓冲帧数：未找到。
- 完美/糟糕弹图与质量 1/3 的直接映射代码：在 DLL 内，未确认。
