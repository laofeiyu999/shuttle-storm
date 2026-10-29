# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\config\curveconfig.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 855 bytes
from base.protobufdata import BattleCmd_pb2
from base.data.curve.normalcurve import g_NormalCurveData
from base.data.curve.turnaroundcurve import g_TurnAroundCurveData
from base.data.curve.paraboladowncurve import g_ParabolaDownCurveData
from base.data.curve.fallingcurve import g_FallingCurveData
from base.data.curve.normalfakedropcurve import g_NormalFakeDropCurveData
BADMINTON_MAPPER = {(BattleCmd_pb2.SHAPE_TYPE_NORMAL): {"shapeData": g_NormalCurveData}, 
 
 (BattleCmd_pb2.SHAPE_TYPE_TURN_AROUND): {"shapeData": g_TurnAroundCurveData}, 
 
 (BattleCmd_pb2.SHAPE_TYPE_PARABOLA_DOWN): {"shapeData": g_ParabolaDownCurveData}, 
 
 (BattleCmd_pb2.SHAPE_TYPE_FALLING): {"shapeData": g_FallingCurveData}, 
 
 (BattleCmd_pb2.SHAPE_TYPE_NORMAL_FAKE_DROP): {"shapeData": g_NormalFakeDropCurveData}}
