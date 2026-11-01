
import sys
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F
t = F.load_tables(); cd = t["curvedata"]
shown=0
for h in sorted(cd):
    for a in sorted(cd[h]):
        lst = cd[h][a]
        bad = [i for i,p in enumerate(lst) if p["v"] != i]
        if bad and shown < 6:
            shown += 1
            i = bad[0]
            print("h=%d a=%d n=%d  第一处异常 idx=%d 附近 v=%s" % (
                h,a,len(lst), i, [p["v"] for p in lst[max(0,i-2):i+4]]))
            print("   s=%s" % ([p["s"] for p in lst[max(0,i-2):i+4]]))
            print("   v末=%d  s末=%.2f" % (lst[-1]["v"], lst[-1]["s"]))
