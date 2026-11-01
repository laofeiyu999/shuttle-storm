
import sys, math, statistics as st
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables(); cd = t["curvedata"]
TG = t["curveconstant"][1000]["timeGap"]

def series(h,a):
    lst = cd[h][a]
    s = [p["s"] for p in lst]
    out=[]
    for i in range(len(s)-1):
        d = s[i+1]-s[i]
        if d < 0.015:      # 量化噪声：s 分辨率 0.01
            continue
        out.append((i*TG, d/TG))   # (t, v)
    return out

def linfit(xs, ys):
    n=len(xs); sx=sum(xs); sy=sum(ys)
    sxx=sum(x*x for x in xs); sxy=sum(x*y for x,y in zip(xs,ys))
    den=n*sxx-sx*sx
    if den==0: return None
    m=(n*sxy-sx*sy)/den; b=(sy-m*sx)/n
    my=sy/n
    ssr=sum((y-(m*x+b))**2 for x,y in zip(xs,ys))
    sst=sum((y-my)**2 for y in ys)
    return m,b,(1-ssr/sst if sst else 0)

rows=[]
for h in sorted(cd):
    for a in sorted(cd[h]):
        ser = series(h,a)
        if len(ser) < 10: continue
        ts=[x[0] for x in ser]; vs=[x[1] for x in ser]
        # 线性阻力: v = v0*exp(-t/tau) -> ln v 线性
        f1 = linfit(ts, [math.log(v) for v in vs])
        # 二次阻力: v = v0/(1+k v0 t) -> 1/v 线性
        f2 = linfit(ts, [1.0/v for v in vs])
        if not f1 or not f2: continue
        rows.append((h,a,len(ser),f1[2],f2[2],f1[1],f2[0],f2[1]))

print("样本 %d 条 (h,angle) 剖面" % len(rows))
print("线性阻力 ln v~t  : R2 中位 %.4f 均值 %.4f" % (st.median([r[3] for r in rows]), st.mean([r[3] for r in rows])))
print("二次阻力 1/v~t   : R2 中位 %.4f 均值 %.4f" % (st.median([r[4] for r in rows]), st.mean([r[4] for r in rows])))
better1=sum(1 for r in rows if r[3]>r[4]); better2=len(rows)-better1
print("线性阻力拟合更好: %d 条 / 二次阻力更好: %d 条" % (better1,better2))

print("\n%-14s %10s %10s %10s %10s %10s" % ("(h,angle)","tau(s)","v0=exp(b)","k(1/m)","1/v0","R2_lin"))
for h,a,n,r1,r2,m1,m2,b2 in rows[:10]:
    v0=math.exp(m1); tau=-1.0/m1 if m1 else float("nan")
    print("h=%3d a=%3d    %10.3f %10.2f %10.4f %10.5f %10.4f" % (h,a,tau,v0,m2,b2,r1))
