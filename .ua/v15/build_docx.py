
import sys, re, copy
from docx import Document
from docx.shared import Pt, Emu
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

SRC = r"D:\GameDev\shuttle-storm\Docs\羽毛球大作战_游戏开发设计文档_V1.4(最终版).docx"
md_path, out_path = sys.argv[1], sys.argv[2]

doc = Document(SRC)
body = doc.element.body
sect = body.xpath('./w:sectPr')[0]
for ch in list(body.iterchildren()):
    if ch is not sect:
        body.remove(ch)

S = {s.style_id: s for s in doc.styles}
def sty(sid): return S[sid]
TITLE, SUB, H1, H2, H3, BODY, TOCT, TOC = '12','13','19','21','23','17','44','45'

def para(text, sid):
    p = doc.add_paragraph(style=sty(sid))
    add_runs(p, text)
    return p

def add_runs(p, text):
    p.add_run(text)

def set_cell(cell, text, header, width):
    tcPr = cell._tc.get_or_add_tcPr()
    w = OxmlElement('w:tcW'); w.set(qn('w:w'), str(width)); w.set(qn('w:type'), 'dxa')
    for old in tcPr.findall(qn('w:tcW')): tcPr.remove(old)
    tcPr.append(w)
    if header:
        shd = OxmlElement('w:shd'); shd.set(qn('w:val'),'clear'); shd.set(qn('w:color'),'auto'); shd.set(qn('w:fill'),'D9E2F3')
        tcPr.append(shd)
    p = cell.paragraphs[0]
    pPr = p._p.get_or_add_pPr()
    sp = OxmlElement('w:spacing'); sp.set(qn('w:before'),'0'); sp.set(qn('w:after'),'0'); sp.set(qn('w:line'),'276'); sp.set(qn('w:lineRule'),'auto')
    pPr.append(sp)
    if header:
        jc = OxmlElement('w:jc'); jc.set(qn('w:val'),'center'); pPr.append(jc)
    r = p.add_run(text)
    r.font.size = Pt(9)
    r.font.bold = header
    r.font.name = 'Times New Roman'
    r._element.rPr.rFonts.set(qn('w:eastAsia'), '宋体')

TOTAL = 9694
def add_table(rows):
    ncol = max(len(r) for r in rows)
    rows = [r + ['']*(ncol-len(r)) for r in rows]
    # column widths by content length
    lens = [max(min(len(r[c]), 60) for r in rows) + 4 for c in range(ncol)]
    tot = sum(lens)
    widths = [max(700, int(TOTAL*l/tot)) for l in lens]
    k = TOTAL/sum(widths); widths=[int(w*k) for w in widths]
    t = doc.add_table(rows=len(rows), cols=ncol)
    tbl = t._tbl
    tblPr = tbl.tblPr
    st = OxmlElement('w:tblStyle'); st.set(qn('w:val'),'9')
    for old in tblPr.findall(qn('w:tblStyle')): tblPr.remove(old)
    tblPr.insert(0, st)
    tw = OxmlElement('w:tblW'); tw.set(qn('w:w'), str(TOTAL)); tw.set(qn('w:type'),'dxa')
    for old in tblPr.findall(qn('w:tblW')): tblPr.remove(old)
    tblPr.append(tw)
    b = OxmlElement('w:tblBorders')
    for side,color,sz in [('top','888888','6'),('left','888888','6'),('bottom','888888','6'),('right','888888','6'),('insideH','AAAAAA','4'),('insideV','AAAAAA','4')]:
        e = OxmlElement('w:'+side); e.set(qn('w:val'),'single'); e.set(qn('w:color'),color); e.set(qn('w:sz'),sz); e.set(qn('w:space'),'0'); b.append(e)
    tblPr.append(b)
    for i,r in enumerate(rows):
        tr = t.rows[i]._tr
        trPr = tr.get_or_add_trPr()
        trPr.append(OxmlElement('w:cantSplit'))
        if i == 0: trPr.append(OxmlElement('w:tblHeader'))
        for j,c in enumerate(r):
            set_cell(t.rows[i].cells[j], c, i==0, widths[j])
    doc.add_paragraph(style=sty(BODY))

lines = open(md_path, encoding='utf-8').read().split('\n')
# front matter: first lines starting with '%' : title/subtitle/meta
toc = [l[2:].strip() for l in lines if l.startswith('# ')]
i = 0
meta = []
while i < len(lines) and lines[i].startswith('%'):
    meta.append(lines[i][1:].strip()); i += 1
if meta:
    para(meta[0], TITLE)
    if len(meta) > 1: para(meta[1], SUB)
    for _ in range(3): doc.add_paragraph()
    for m in meta[2:]:
        para(m, BODY)
    doc.add_paragraph()
    para('目  录', TOCT)
    for h in toc: para(h, TOC)
    para('注：本目录按章节顺序排列，页码以最终排版为准。', BODY)
    doc.add_paragraph()

tbuf = []
def flush():
    global tbuf
    if tbuf:
        rows = []
        for l in tbuf:
            cells = [c.strip() for c in l.strip().strip('|').split('|')]
            if all(re.fullmatch(r':?-{2,}:?', c) for c in cells if c): continue
            rows.append(cells)
        if rows: add_table(rows)
        tbuf = []
for l in lines[i:]:
    s = l.rstrip()
    if s.startswith('|'):
        tbuf.append(s); continue
    flush()
    if not s.strip(): continue
    if s.startswith('### '): para(s[4:].strip(), H3)
    elif s.startswith('## '): para(s[3:].strip(), H2)
    elif s.startswith('# '): para(s[2:].strip(), H1)
    elif s.startswith('- '): para('· ' + s[2:].strip(), BODY)
    else: para(s.strip(), BODY)
flush()
body.remove(sect); body.append(sect)
doc.core_properties.title = meta[0] if meta else ''
doc.save(out_path)
print('saved', out_path, 'h1', len(toc))
