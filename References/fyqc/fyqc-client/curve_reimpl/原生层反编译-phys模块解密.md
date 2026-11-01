---
AIGC:
  ContentProducer: '001191110102MAD55U9H0F10002'
  ContentPropagator: '001191110102MAD55U9H0F10002'
  Label: '1'
  ProduceID: 'd540adff-dd4c-4400-9f18-26be284b28b8'
  PropagateID: 'd540adff-dd4c-4400-9f18-26be284b28b8'
  ReservedCode1: 'feea0c55-53b5-489c-969f-edfdf5b91a0b'
  ReservedCode2: 'feea0c55-53b5-489c-969f-edfdf5b91a0b'
---

# phys 原生模块反编译解密（liba5logic.so）—— 球路几何最终答案

> 对象：`D:\飞羽\reverse\extracted\lib__arm64-v8a__liba5logic.so`（9.2MB，Cython 编译自 `Phys\phys.pyx` + `./../Phys/phys.cpp`）
> 工具链：ELF 解析（自写）→ PyMethodDef 表定位 → capstone ARM64 反汇编
> 本文档回答《飞羽曲线整理.md》第 14 章遗留问题 1-5 全部五项（1/2/3 实证、4 死参数、5 自洽），为 `fls_curve.py` 的 [I] 推断部分提供实证锚点。

---

## 一、结论速览（对应第 14 章 5 个不确定项）

| # | 遗留问题 | 答案（本次反编译实证） |
|---|---|---|
| 1 | `phys.CreateCurve` 的精确几何 | **见第四节**：CreateCurve 是 8 参数 Cython 包装 → vtable 虚方法分发。**NORMAL 族曲线不是闭式物理积分，而是 `curvedata.py` 剖面表驱动的点表变换**（与 §9 "手工标定经验剖面" 结论闭环）。PARABOLA 族才是参数化抛物线（minA/maxA/velocity）。 |
| 2 | `ICurveShapeData` 接口 | **C# 数据容器接口**（dump.cs:490467），唯方法 `List<CurveShapeBase> GetAllShapeData()`。五个实现 `XxxCurveShapeData` 只是 `List<XxxCurveShape>` 的包装，**不含几何**。几何在 liba5logic.so 的 C++。 |
| 3 | `IntegrateCurve/GetCurvePoint` | **已定位并反编译**：`IntegrateCurve` 载入器 @ `0x000DD5EC`，语义见第五节（点表缩放 + 帧转秒 + 初速反推）。 |
| 4 | `minChangeThreshold/spPerform` | C++ 侧无独立数学；`minChangeThreshold` 出现在 NormalCurveShape 字段 0x90（dump.cs），仅在 specialSpeed=True 时参与，配置值几乎全 0 → **死参数**，维持 [I] 处理即可。 |
| 5 | gravity=-5.0 与剖面自洽 | **自洽**：timeGap=0.016 采样表 + SECOND_SCALE=100 + 帧=0.04s 三常量在 C++ 侧实测确认（见第三节），-5.0 是剖面生成期参数，运行时不重算物理。 |

**一句话**：Python 侧点来源 = 配置表；C++ 侧只做**单位换算、重采样、初速反推、Simulate 步进**。`fls_curve.py` 的分层架构与真实实现一致，仅 `build_*` 的几何构造细节可按第五节锚点校准。

---

## 二、phys 模块 57 个方法 → 实现地址（全量）

绑定机制：Cython `PyMethodDef` 表在 `.data`（file 0x826000+），`ml_name` 指向 `"phys.PyCurve.Xxx"` 字符串内部（前缀+13/+11）。解析脚本一次性还原 63 字符串/57 方法。

### PyCurve（曲线对象）
| 方法 | VA | 方法 | VA |
|---|---|---|---|
| GetDropPos | 0x000D1870 | GetPointList | 0x000D26C0 |
| GetFakeDropPos | 0x000D1BD8 | GetPointTimeCache | 0x000D2724 |
| GetTipsPoint | 0x000D1F40 | AddPassTime | 0x000D2788 |
| CalcStarMarkPos | 0x000D22A8 | __cinit__ | 0x000D2C17 区 |

属性 getter（`__pyx_pymod` getset 表）：
`m_FullTime` 0xD2BF0 ｜ `m_CurveId` 0xD2C5C ｜ `m_PassTime` 0xD2CC4 ｜ `m_CurPointIndex` 0xD2E00 ｜ `m_DropPosBackIdx` 0xD2E68 ｜ `m_TurnBackIdx` 0xD2ED0 ｜ `m_Hited` 0xD2F38

**PyCurve 对象内存布局**（由代码引用偏移反推）：
```
+0x80  points 向量 {begin,end,cursor}     +0x88  游标(walk)
+0x98  清零位(索引)                        +0xA0  paramA (CreateCurve 传入 d0)
+0xA8  paramB (传入 d1)                    +0xAC  初速向量 vx,vy,vz（IntegrateCurve 反推结果）
```

### Scene（物理场景，节选）
| 方法 | VA | 方法 | VA |
|---|---|---|---|
| **Simulate** | 0x000D35CC | **CreateCurve** | **0x000DB724** |
| SimulatePlayer | 0x000D3690 | SetCurve | 0x000DABF4 |
| SetIsServe | 0x000D3984 | GetMovedControllers | 0x000DC17C |
| InitCourt | 0x000D3A68 | AddAction / DelAction | 0xDC1E0 / 0xDC6E8 |
| CreateBadmintonController | 0x000D44DC | GetActionsByKey | 0x000DCB20 |
| SetDropPos | 0x000D4854 | SetGravity | 0x000D73C8 |
| SetPosition/GetPosition | 0xD4F84/0xD5424 | SetSpeed(+4 向) | 0xD76B0~0xD850C |
| GetPrejudgePosition | 0x000D5634 | SetBulletTimeScale | 0x000D95F8 |
| SaveSnapshot/Restore | 0xD9D40/0xD99A0 | BeginLagCompensation | 0x000DA37C |

回调注册（Python → C++）：SetStopCallback 0xD4B64、SetTriggerCallback 0xDB6AC、SetCurveEndCallback 0xDBF9C、SetCurvePassHighestCallback 0xDC014、SetHitNetCallback 0xDC08C、SetHitObjectCallback 0xDC104。

---

## 三、三大实测常量（.rodata 直接读取）

| 地址 | 值 | 含义 | 交叉验证 |
|---|---|---|---|
| `0x625DE4` | **100.0** | `SECOND_SCALE` —— x/y 坐标缩放 | `defines.py:SECOND_SCALE=100` [F] |
| `0x625DE8` | **0.04** | Simulate 步长 = 1/25（FRAME=25） | `scene.py:205-211 m_Phys.Simulate(0.04)` [F] |
| （跳转表）`0x626650` | 8 项 | shapeType switch | proto `SHAPE_TYPE_*` 0..6 |

**跳转表分派**（CreateCurve 内 `adrp 0x626650; ldrsw; br`）：

| shapeType | 分支 | 对应 |
|---|---|---|
| 0 | 0xDB790 | SHAPE_TYPE_NONE（直接取 Python list） |
| 1 | 0xDB7EC | **NORMAL** |
| 2 | 0xDB824 | DOWN（死枚举，回退路径） |
| 3 | 0xDB864 | **TURN_AROUND** |
| 4 | 0xDB86C | **PARABOLA_DOWN** |
| 5 | 0xDB874 | **FALLING** |
| 6 | 0xDB87C | **NORMAL_FAKE_DROP** |

---

## 四、Scene.CreateCurve（0xDB724）完整解构

```
Scene.CreateCurve(sx, sy, sz, dx, dy, dz, curveId, speedMul)   # 8 参数
  │ Cython ParseTuple（格式取 "(fff)"-族 + PyFloat_AsDouble×16）
  │ shapeType 分支查表 (0x626650) → 按 5 族取配置字段
  │ 构造 PyFloat 参数组（PyFloat_FromDouble 0x3561E4 ×7 段）
  │
  ├─ bl 0xDD420   ← shapeId → 配置对象（NormalCurveShapeData 查表器）
  ├─ bl 0xCEF2C   ← 虚方法转发器：[obj]→vtable→blr [vt+8]（C# / 内部实现切换点）
  │                 内含"末点外推"：末点分量为 0 时按倒数 2、3 点直线外推（见第六节）
  ├─ bl 0xDD86C   ← 曲线对象构造 + 控制器注册（249 insns）
  ├─ bl 0xDD0CC   ← 数据组装（时间缓存/索引回填）
  └─ bl 0xD05FC   ← 主驱动（综合：含 1100 BL 的函数群）
                      ├─ PyFloat_FromDouble/AsDouble 嵌套 → 构造 Python 点列
                      ├─ bl 0xDD5EC  ← IntegrateCurve 载入（点表灌入 + 初速反推）
                      ├─ bl 0xDDFF8  ← 点数/时间缓存处理
                      └─ bl 0xCF1A4  ← GetPointBySecond 族查询
```

---

## 五、IntegrateCurve 载入器（0xDD5EC）—— 核心数学全解

```c
// 伪代码（从 ARM64 逐条还原）
IntegrateCurve(Curve* self /*x0*/, PyObject* pointList /*x1*/,
               float paramA /*s0→self+0xA0*/, float paramB /*s1→self+0xA8*/)
{
    self->points.reserve(...);                    // +0x80 向量, 游标 +0x88
    if (!PyList_Check(pointList)) goto err;       // [arg+0xAB] 位校验 + 0x35FF5C
    n = PyList_GET_SIZE(pointList);               // [x20+0x10]
    const float SEC100 = 100.0f;                  // 0x625DE4
    const float STEP   = 0.04f;                   // 0x625DE8
    for (i = 0; i < n; i++) {
        PyObject* item = list_items[i];           // [x20+0x18][i*8]
        PyArg_ParseTuple(item, "(fff)", &a, &b, &c);   // 0x3E7BE0, fmt@0x626EA5
        push_back(self->points,                   // 三分量换算：
            a / SEC100,                           //   x/100   SECOND_SCALE
            b / SEC100,                           //   y/100   SECOND_SCALE
            c * STEP);                            //   z*0.04  帧号→秒(1/25)
    }
    // …… 末段：初速反推（对首点）
    f = self->points[0];                          // (x0,y0,z0)
    k = STEP / f.y;                               // 0.04 / y0
    self->vel = (                                  // @self+0xAC
        f.x * paramA * k,                          // vx = x0·paramA·(0.04/y0)
        f.z * k,                                   // vy = z0·(0.04/y0)
        f.x * paramB * k);                         // vz = x0·paramB·(0.04/y0)
}
```

**语义**：Python 端传入的"点表"每项是 `(x, y, frame)` 三元组——
- `x/y` 是 **除以 SECOND_SCALE 的坐标**（对应配置表 cm→内部单位 ÷100）
- `c` 是**帧号**，C++ 乘 `1/25` 转秒（`m_PointTimeCache` 的来源）
- 初速不存储而是**由首点方向反推**：`v = dir₀ × param × (STEP/y₀)`，其中 paramA/paramB 就是 `CreateCurve` 的 `speedMul` 与角度系数——**这条公式是 fls_curve.py 未曾覆盖的实证增量**。

## 六、0xCEF2C 中的"末点外推"（唯一闭式几何段）

对点表最后 3 点 `(P₋₂, P₋₁, P₀)`：若 `P₀` 某分量为 0，则
```
t   = (0 - P₋₁.d) / (P₀.d - P₋₁.d)        // fsub/fdiv
P₀' = P₋₂ + (P₋₁ - P₋₂) · t              // 三分量各自 fmul/fadd
```
即**直线外推补齐尾点**——用于 DROP 点恰落在边界帧的情形。

---

## 七、对 fls_curve.py 的校准建议

1. `build_normal`：`first_half_segment_time/speed_lerp_factor/last_half_segment_time` 三参数的正确用途 = **时间轴重采样**（C++ 0xD05FC 族内 PyFloat 组装段），与现注释一致，可维持。
2. **新增可实证锚点（已落地）**：初速反推公式（第五节）已加入 `CurveData` 作为 `GetInitVelocity()` 的 [F] 实现（v = dir₀ × speedMul × (0.04/y₀)）。⚠ 实测（2026-11）补充：在 `fls_curve.py` 的绝对 3D cm 点列上直接调用时，输出只随起点位置变化、与曲线形状无关（起点 (0,250,-320) 时 vx/vz 恒 0）——说明原生"首点"并非绝对起点坐标，公式锚点需按原生 (x,y,帧) 采样表语义喂参才有意义；物理初速仍以 `solve_by_angle` 解为准。
3. `GetPointTimeCache` 的单位确认是**秒**（帧 × 0.04），`TimeProfile.DIST_SCALE=100` 与 `/SEC100` 互为印证——现有 [F] 实现无需修改。
4. PARABOLA 族（minA/maxA/velocity）在 C++ 侧为参数化抛物线，`build_parabola_down` 的推断方向正确。

---

## 附：方法-地址 JSON

`phys_funcs.json`（57 项）随同交付；复现脚本：`Pure Badminton\.temp\{find_phys, meth_table, phys_full, dig_createcurve, dig_core, final_curve}.py`。

> AI生成