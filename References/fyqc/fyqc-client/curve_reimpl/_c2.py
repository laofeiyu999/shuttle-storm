
import sys, io
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables()
cd = t["curvedata"]
print("heights", len(cd))
for h in (10, 100, 260):
    byang = cd[h]
    angs = sorted(byang.keys())
    for a in (angs[0], 20, 80):
        if a not in byang: continue
        lst = byang[a]
        print("h=%d a=%d n=%d  first5=%s  last3=%s" % (
            h, a, len(lst),
            [(p["v"], round(p["s"],3)) for p in lst[:5]],
            [(p["v"], round(p["s"],3)) for p in lst[-3:]]))
