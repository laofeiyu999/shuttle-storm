# -*- coding: utf-8 -*-
"""把 _build/_p1..p4.py 拼回 fls_curve.py。

fls_curve.py 是权威文件；只有在改 _build 分片后才需要跑这个脚本。
用法:  python _build/build.py
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(ROOT, "fls_curve.py")
PARTS = ["_p1.py", "_p2.py", "_p3.py", "_p4.py"]

chunks = []
for name in PARTS:
    p = os.path.join(HERE, name)
    with io.open(p, "r", encoding="utf-8") as f:
        chunks.append(f.read().rstrip("\n"))
text = "\n\n".join(chunks) + "\n"
with io.open(OUT, "w", encoding="utf-8", newline="\n") as f:
    f.write(text)
print("built %s (%d lines)" % (OUT, text.count("\n")))
