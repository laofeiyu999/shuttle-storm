
import sys, os, json
from docx import Document
from docx.oxml.ns import qn
from docx.table import Table
from docx.text.paragraph import Paragraph

def iter_block(doc):
    body = doc.element.body
    for child in body.iterchildren():
        if child.tag == qn('w:p'):
            yield Paragraph(child, doc)
        elif child.tag == qn('w:tbl'):
            yield Table(child, doc)

def dump(src, dst):
    doc = Document(src)
    out = []
    stats = {'para':0,'table':0,'img':0}
    for b in iter_block(doc):
        if isinstance(b, Paragraph):
            t = b.text
            sty = b.style.name if b.style is not None else ''
            if b._p.xpath('.//w:drawing') or b._p.xpath('.//w:pict'):
                stats['img'] += 1
                out.append('[IMAGE]')
            if not t.strip():
                continue
            stats['para'] += 1
            if sty.lower().startswith('heading') or sty.startswith('标题') or sty == 'Title':
                lvl = ''.join(c for c in sty if c.isdigit()) or '0'
                out.append('#'*(int(lvl)+1) + ' ' + t + '   {'+sty+'}')
            else:
                pre = '- ' if 'List' in sty else ''
                out.append(pre + t)
        else:
            stats['table'] += 1
            out.append('<TABLE %d>' % stats['table'])
            for r in b.rows:
                cells = []
                prev = None
                for c in r.cells:
                    if prev is not None and c._tc is prev: continue
                    prev = c._tc
                    cells.append(c.text.replace('\n',' / '))
                out.append('| ' + ' | '.join(cells) + ' |')
            out.append('</TABLE>')
    with open(dst,'w',encoding='utf-8') as f:
        f.write('\n'.join(out))
    print(dst, stats, sum(len(x) for x in out))

pairs = json.loads(sys.argv[1])
for s,d in pairs: dump(s,d)
