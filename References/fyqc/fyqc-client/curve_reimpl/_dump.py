
import json, io, sys
sys.path.insert(0, r"D:\fyqc\curve_reimpl")
import fls_curve as F

t = F.load_tables()

def arr(x):
    return list(x) if isinstance(x, (list, tuple)) else x

out = {"constants": {}, "normal": [], "paraboladown": [], "turnaround": [],
       "falling": [], "normalfakedrop": [], "curvedrop": {}, "curvedata": {},
       "hmin": t["hmin"], "hmax": t["hmax"]}

for k, v in t["curveconstant"].items():
    out["constants"][str(k)] = {kk: v[kk] for kk in v}

for cid, d in sorted(t["normal"].items()):
    out["normal"].append({"id": cid, **{k: d[k] for k in d}})
for cid, d in sorted(t["paraboladown"].items()):
    out["paraboladown"].append({"id": cid, **{k: d[k] for k in d}})
for cid, d in sorted(t["turnaround"].items()):
    out["turnaround"].append({"id": cid, **{k: d[k] for k in d}})
for cid, d in sorted(t["falling"].items()):
    out["falling"].append({"id": cid, **{k: d[k] for k in d}})
for cid, d in sorted(t["normalfakedrop"].items()):
    out["normalfakedrop"].append({"id": cid, **{k: d[k] for k in d}})
for cid, d in sorted(t["curvedrop"].items()):
    out["curvedrop"][str(cid)] = {k: d[k] for k in d}

for h, byang in sorted(t["curvedata"].items()):
    hh = {}
    for ang, lst in sorted(byang.items()):
        s = [p["s"] for p in lst]
        hh[str(ang)] = {"n": len(lst), "t": round(s[-1], 4), "r": round(lst[-1]["v"], 3),
                        "s0": s[0], "s1": s[1] if len(s) > 1 else None}
    out["curvedata"][str(h)] = hh

with io.open(r"D:\fyqc\curve_reimpl\_curves.json", "w", encoding="utf-8") as fp:
    json.dump(out, fp, ensure_ascii=False, indent=1)
print("normal", len(out["normal"]), "para", len(out["paraboladown"]),
      "turn", len(out["turnaround"]), "fall", len(out["falling"]),
      "fake", len(out["normalfakedrop"]), "drop", len(out["curvedrop"]),
      "heights", len(out["curvedata"]))
print("sample normal keys:", list(out["normal"][0].keys()))
print("sample para keys:", list(out["paraboladown"][0].keys()))
print("sample turn keys:", list(out["turnaround"][0].keys()))
print("sample fall keys:", list(out["falling"][0].keys()))
print("sample fake keys:", list(out["normalfakedrop"][0].keys()))
print("sample curvedrop keys:", list(list(out["curvedrop"].values())[0].keys()))
