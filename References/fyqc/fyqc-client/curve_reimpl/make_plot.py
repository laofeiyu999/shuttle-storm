# -*- coding: utf-8 -*-
"""生成曲线对比图：五大球路族的俯视 / 侧视 / 高度-时间三联图"""
import sys
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import random
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import fls_curve as F

random.seed(7)
t = F.load_tables()
start = (0.0, 250.0, -320.0)

groups = [
    ("NORMAL 常规", [1000, 1003, 1012, 1024, 1029],
     [(10.0, 0.0, 160.0), (-20.0, 0.0, 300.0), (0.0, 0.0, 420.0),
      (15.0, 0.0, 90.0), (-30.0, 0.0, 350.0)]),
    ("TURN_AROUND 旋转 / FAKE_DROP 假动作", [3000, 3001, 6000],
     [(-60.0, 0.0, 220.0), (60.0, 0.0, 260.0), (20.0, 0.0, 160.0)]),
    ("PARABOLA_DOWN 下压", [4002, 4003, 4004, 4005],
     [(10.0, 0.0, 180.0), (0.0, 0.0, 380.0), (0.0, 0.0, 250.0), (0.0, 0.0, 120.0)]),
]

fig, axes = plt.subplots(1, 3, figsize=(17, 5.6))
ax_top, ax_side, ax_time = axes

for gname, ids, drops in groups:
    for cid, dp in zip(ids, drops):
        c = F.create_curve(t, cid, start, dp)
        name = F.get_curve_type_and_data(t, cid)[1].get("name", "")
        label = "%d %s" % (cid, name)
        zs = [-p[2] for p in c.m_Points]
        xs = [p[0] for p in c.m_Points]
        ys = [p[1] for p in c.m_Points]
        ax_top.plot(zs, xs, lw=1.4, label=label)
        ax_side.plot(zs, ys, lw=1.4, label=label)
        ax_time.plot(c.m_PointTime, ys, lw=1.4, label=label)

# 重力陨石单独配色（高度跨 10 倍，放侧视图但画虚线）
c = F.create_curve(t, 5000, start, (0.0, 0.0, 200.0))
ax_side.plot([-p[2] for p in c.m_Points], [p[1] for p in c.m_Points],
             lw=1.6, ls="--", color="crimson", label="5000 重力陨石")
ax_time.plot(c.m_PointTime, [p[1] for p in c.m_Points],
             lw=1.6, ls="--", color="crimson", label="5000 重力陨石")

for ax in (ax_top, ax_side):
    ax.axvline(0, color="k", lw=0.9, ls=":")
ax_side.axhline(F.COURT_NET_HEIGHT, color="r", lw=0.9, ls="--", alpha=0.7)
ax_side.text(8, F.COURT_NET_HEIGHT + 8, "net 150cm", color="r", fontsize=8)

ax_top.set_xlabel("distance from net (cm)  [ + = 对方半场 ]")
ax_top.set_ylabel("X (cm)")
ax_top.set_title("Top view")
ax_side.set_xlabel("distance from net (cm)")
ax_side.set_ylabel("Y height (cm)")
ax_side.set_title("Side view")
ax_time.set_xlabel("time (s)")
ax_time.set_ylabel("Y height (cm)")
ax_time.set_title("Height vs time")

for ax in axes:
    ax.grid(alpha=0.3)
    ax.legend(fontsize=6.5, loc="best")

fig.suptitle("FLS badminton curve reconstruction  (start (0,250,-320) cm, HOST side)")
fig.tight_layout(rect=[0, 0, 1, 0.95])
out = r"D:\fyqc\curve_reimpl\curves.png"
fig.savefig(out, dpi=125)
print("saved", out)
