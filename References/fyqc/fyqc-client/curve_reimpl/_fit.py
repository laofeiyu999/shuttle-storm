
import sys
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables(); cd = t["curvedata"]
TG = t["curveconstant"][1000]["timeGap"]
AF = t["curveconstant"][1000]["airFriction"]

print("timeGap=%.4f  airFriction=%.3f" % (TG, AF))
print("假设 二次阻力 v(t)=v0/(1+k*v0*t) -> 1/v = 1/v0 + k*t （线性）")
print("%-16s %8s %8s %8s %8s" % ("(h,angle)", "v0(m/s)", "k_fit", "R2", "n"))

import math
def fit(h, a):
    lst = cd[h][a]
    s = [p["s"] for p in lst]
    ts, inv = [], []
    for i in range(len(s)-1):
        d = s[i+1]-s[i]
        if d <= 0.005:      # 0.01 量化下限以下噪声太大
            continue
        v = d/TG
        ts.append(i*TG)
        inv.append(1.0/v)
    if len(ts) < 8:
        return None
    n = len(ts)
    sx = sum(ts); sy = sum(inv); sxx = sum(x*x for x in ts); sxy = sum(x*y for x,y in zip(ts,inv))
    den = n*sxx - sx*sx
    k = (n*sxy - sx*sy)/den
    b = (sy - k*sx)/n          # = 1/v0
    v0 = 1.0/b if b > 0 else float("nan")
    my = sy/n
    ss_res = sum((y-(k*x+b))**2 for x,y in zip(ts,inv))
    ss_tot = sum((y-my)**2 for y in inv)
    r2 = 1-ss_res/ss_tot if ss_tot else 0
    return v0, k, r2, n

rows=[]
for h in sorted(cd):
    for a in sorted(cd[h]):
        r = fit(h,a)
        if r: rows.append((h,a)+r)
for h,a,v0,k,r2,n in rows[:14]:
    print("h=%3d a=%3d     %8.2f %8.4f %8.4f %8d" % (h,a,v0,k,r2,n))
ks = sorted(r[3] for r in rows)
import statistics as st
print("\n全部 %d 条：k 中位数=%.4f  均值=%.4f  25%%=%.4f  75%%=%.4f" % (
    len(ks), st.median(ks), st.mean(ks), ks[len(ks)//4], ks[3*len(ks)//4]))
