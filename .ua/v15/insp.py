
from docx import Document
from lxml import etree
d=Document(r"D:\GameDev\shuttle-storm\Docs\羽毛球大作战_游戏开发设计文档_V1.4(最终版).docx")
body=d.element.body
t=body.xpath('./w:tbl')[0]
x=etree.tostring(t,encoding='unicode')
i=x.find('<w:tr')
out=x[i:i+3500]
# a body paragraph xml
ps=body.xpath('./w:p')
p47=[p for p in ps if p.xpath('./w:pPr/w:pStyle[@w:val="17"]')][3]
out+='\n\n'+etree.tostring(p47,encoding='unicode')[:1500]
h=[p for p in ps if p.xpath('./w:pPr/w:pStyle[@w:val="21"]')][0]
out+='\n\n'+etree.tostring(h,encoding='unicode')[:1200]
sect=body.xpath('./w:sectPr')
out+='\n\n'+etree.tostring(sect[0],encoding='unicode')[:1500]
open(r"D:\GameDev\shuttle-storm\.ua\v15\insp_out.txt",'w',encoding='utf-8').write(out)
