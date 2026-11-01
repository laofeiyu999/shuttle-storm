# -*- coding: utf-8 -*-
"""飞羽曲线复刻层的最小可运行示例（固定随机种子，输出可复现）。

用法： python _demo_curves.py
"""
import random
import sys

sys.path.insert(0, r'D:\fyqc\curve_reimpl')
import fls_curve as F

SEED = 20231101
T = F.load_tables()
START = (0.0, 250.0, -320.0)          # 击球点：本方半场靠网、高 2.5 m（cm）

FAMILY = {1: 'NORMAL', 2: 'DOWN', 3: 'TURN_AROUND', 4: 'PARABOLA_DOWN',
          5: 'FALLING', 6: 'NORMAL_FAKE_DROP'}


def build(curve_id, hit_key):
    drop = F.calc_drop_pos(T, curve_id, START, hit_key, F.OUT_DIR_NONE,
                           F.TEAM_HOST, gather=100, rand=random.Random(SEED))
    curve = F.create_curve(T, curve_id, START, drop, rand=random.Random(SEED))
    return drop, curve


def main():
    print('%-6s %-14s %4s %8s %8s %8s  %s' % (
        'ID', 'family', 'pts', 'T(s)', 'apex', 'netY', 'drop(x,z)'))
    for cid, key in ((1000, F.HIT_KEY_KEY_P), (1003, F.HIT_KEY_KEY_GY),
                     (4002, F.HIT_KEY_KEY_D), (3000, F.HIT_KEY_KEY_GY),
                     (5000, F.HIT_KEY_KEY_P), (6000, F.HIT_KEY_KEY_P)):
        drop, c = build(cid, key)
        net_y = c.GetNetCrossY()
        print('%-6d %-14s %4d %8.3f %8.1f %8s  (%.1f, %.1f)' % (
            cid, FAMILY.get(c.m_ShapeType, '?'), len(c.GetPointList()),
            c.m_FullTime, c.GetApex(),
            '--' if net_y is None else '%.1f' % net_y, drop[0], drop[2]))

    drop, c = build(1000, F.HIT_KEY_KEY_P)
    print()
    print('curve      :', c)
    print('point[0]   :', tuple(round(v, 1) for v in c.GetPointList()[0]))
    print('point[-1]  :', tuple(round(v, 1) for v in c.GetPointList()[-1]))
    print('t at 0.5s  :', tuple(round(v, 1) for v in c.GetPointBySecond(0.5)))
    print('tips point :', tuple(round(v, 1) for v in c.GetTipsPoint()))
    msg = F.pack_curve_res(c)
    print('proto pack :', msg['ShapeType'], len(msg['PosLst']), 'pts,', len(msg['PointTime']), 'times')


if __name__ == '__main__':
    main()
