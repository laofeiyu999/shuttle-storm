
import sys
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables()
cd = t["curvedata"]
TG = t["curveconstant"][1000]["timeGap"]
print("timeGap =", TG)
for h, a in ((10,0),(100,0),(100,20),(200,20),(260,80)):
    lst = cd[h][a]
    s = [p["s"] for p in lst]
    v = [p["v"] for p in lst]
    n = len(lst)
    T = (n-1)*TG
    ds = [round(s[i+1]-s[i],3) for i in range(min(6,n-1))]
    mid = n//2
    ds_mid = round(s[mid+1]-s[mid],4) if mid+1<n else None
    ds_end = round(s[-1]-s[-2],4)
    print("h=%3d a=%2d n=%3d T=%.3fs 总距=%.2fm v末=%d" % (h,a,n,T,s[-1],v[-1]))
    print("      前6帧位移 %s  中段Δ=%.4f  末段Δ=%.4f  初速≈%.1fm/s 末速≈%.1fm/s 均速≈%.1fm/s"
          % (ds, ds_mid, ds_end, ds[0]/TG, ds_end/TG, s[-1]/T))
# 统计封顶
cap=0; tot=0
for h in cd:
    for a in cd[h]:
        tot+=1
        if cd[h][a][-1]["s"]>=14.99: cap+=1
print("\n条目 %d，末距>=14.99m 的 %d 条" % (tot,cap))
# v 是否恒等于序号
bad=0
for h in cd:
    for a in cd[h]:
        for i,p in enumerate(cd[h][a]):
            if p["v"]!=i: bad+=1; break
print("v != 序号的条目数:", bad)
