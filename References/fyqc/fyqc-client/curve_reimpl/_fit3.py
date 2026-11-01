
import sys, math
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables(); cd = t["curvedata"]
TG = t["curveconstant"][1000]["timeGap"]

def ser(h,a):
    lst = cd[h][a]; s=[p["s"] for p in lst]
    return [(i*TG, (s[i+1]-s[i])/TG) for i in range(len(s)-1)]

def linfit(xs,ys):
    n=len(xs); sx=sum(xs); sy=sum(ys); sxx=sum(x*x for x in xs); sxy=sum(x*y for x,y in zip(xs,ys))
    den=n*sxx-sx*sx
    if den==0: return None
    m=(n*sxy-sx*sy)/den; b=(sy-m*sx)/n
    my=sy/n
    ssr=sum((y-(m*x+b))**2 for x,y in zip(xs,ys)); sst=sum((y-my)**2 for y in ys)
    return m,b,(1-ssr/sst if sst else 0)

print("== 固定角度 20°，看高度对初速的影响 ==")
print("%6s %10s %10s %8s %8s" % ("h","v0(m/s)","tau(s)","R2","总距m"))
for h in range(10, 261, 20):
    if 20 not in cd[h]: continue
    ss = ser(h,20)
    if len(ss)<10: continue
    f = linfit([x[0] for x in ss], [math.log(x[1]) for x in ss])
    v0 = math.exp(f[1]); tau=-1/f[0]
    print("%6d %10.2f %10.3f %8.3f %8.2f" % (h, v0, tau, f[2], cd[h][20][-1]["s"]))

print("\n== 固定高度 100，看角度对初速的影响 ==")
print("%6s %10s %10s %8s %8s" % ("ang","v0(m/s)","tau(s)","R2","总距m"))
for a in sorted(cd[100]):
    ss = ser(100,a)
    if len(ss)<10: continue
    f = linfit([x[0] for x in ss], [math.log(x[1]) for x in ss])
    v0 = math.exp(f[1]); tau=-1/f[0]
    print("%6d %10.2f %10.3f %8.3f %8.2f" % (a, v0, tau, f[2], cd[100][a][-1]["s"]))
