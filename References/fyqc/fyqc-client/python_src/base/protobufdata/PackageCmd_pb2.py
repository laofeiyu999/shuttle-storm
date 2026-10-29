# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\protobufdata\PackageCmd_pb2.py
# Compiled at: 2023-04-06 17:04:10
# Size of source mod 2**32: 6295 bytes
from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
_sym_db = _symbol_database.Default()
DESCRIPTOR = _descriptor.FileDescriptor(name="PackageCmd.proto",
  package="Cmd",
  syntax="proto3",
  serialized_options=None,
  serialized_pb=b'\n\x10PackageCmd.proto\x12\x03Cmd"0\n\x0fCouponsItemData\x12\x0e\n\x06ItemID\x18\x01 \x01(\x05\x12\r\n\x05Value\x18\x02 \x01(\x05"D\n\x1dPackageSyncCouponsItemInfoMsg\x12#\n\x05Datas\x18\x01 \x03(\x0b2\x14.Cmd.CouponsItemData"A\n\x1bPackageUpdateCouponsItemMsg\x12"\n\x04Data\x18\x01 \x01(\x0b2\x14.Cmd.CouponsItemData*p\n\x0bPACKAGE_MSG\x12\x14\n\x10PACKAGE_MSG_NONE\x10\x00\x12&\n"PACKAGE_SYNC_COUPONS_ITEM_INFO_MSG\x10\x01\x12#\n\x1fPACKAGE_UPDATE_COUPONS_ITEM_MSG\x10\x02b\x06proto3')
_PACKAGE_MSG = _descriptor.EnumDescriptor(name="PACKAGE_MSG",
  full_name="Cmd.PACKAGE_MSG",
  filename=None,
  file=DESCRIPTOR,
  values=[
 _descriptor.EnumValueDescriptor(name="PACKAGE_MSG_NONE",
   index=0,
   number=0,
   serialized_options=None,
   type=None),
 _descriptor.EnumValueDescriptor(name="PACKAGE_SYNC_COUPONS_ITEM_INFO_MSG",
   index=1,
   number=1,
   serialized_options=None,
   type=None),
 _descriptor.EnumValueDescriptor(name="PACKAGE_UPDATE_COUPONS_ITEM_MSG",
   index=2,
   number=2,
   serialized_options=None,
   type=None)],
  containing_type=None,
  serialized_options=None,
  serialized_start=212,
  serialized_end=324)
_sym_db.RegisterEnumDescriptor(_PACKAGE_MSG)
PACKAGE_MSG = enum_type_wrapper.EnumTypeWrapper(_PACKAGE_MSG)
PACKAGE_MSG_NONE = 0
PACKAGE_SYNC_COUPONS_ITEM_INFO_MSG = 1
PACKAGE_UPDATE_COUPONS_ITEM_MSG = 2
_COUPONSITEMDATA = _descriptor.Descriptor(name="CouponsItemData",
  full_name="Cmd.CouponsItemData",
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
 _descriptor.FieldDescriptor(name="ItemID",
   full_name="Cmd.CouponsItemData.ItemID",
   index=0,
   number=1,
   type=5,
   cpp_type=1,
   label=1,
   has_default_value=False,
   default_value=0,
   message_type=None,
   enum_type=None,
   containing_type=None,
   is_extension=False,
   extension_scope=None,
   serialized_options=None,
   file=DESCRIPTOR),
 _descriptor.FieldDescriptor(name="Value",
   full_name="Cmd.CouponsItemData.Value",
   index=1,
   number=2,
   type=5,
   cpp_type=1,
   label=1,
   has_default_value=False,
   default_value=0,
   message_type=None,
   enum_type=None,
   containing_type=None,
   is_extension=False,
   extension_scope=None,
   serialized_options=None,
   file=DESCRIPTOR)],
  extensions=[],
  nested_types=[],
  enum_types=[],
  serialized_options=None,
  is_extendable=False,
  syntax="proto3",
  extension_ranges=[],
  oneofs=[],
  serialized_start=25,
  serialized_end=73)
_PACKAGESYNCCOUPONSITEMINFOMSG = _descriptor.Descriptor(name="PackageSyncCouponsItemInfoMsg",
  full_name="Cmd.PackageSyncCouponsItemInfoMsg",
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
 _descriptor.FieldDescriptor(name="Datas",
   full_name="Cmd.PackageSyncCouponsItemInfoMsg.Datas",
   index=0,
   number=1,
   type=11,
   cpp_type=10,
   label=3,
   has_default_value=False,
   default_value=[],
   message_type=None,
   enum_type=None,
   containing_type=None,
   is_extension=False,
   extension_scope=None,
   serialized_options=None,
   file=DESCRIPTOR)],
  extensions=[],
  nested_types=[],
  enum_types=[],
  serialized_options=None,
  is_extendable=False,
  syntax="proto3",
  extension_ranges=[],
  oneofs=[],
  serialized_start=75,
  serialized_end=143)
_PACKAGEUPDATECOUPONSITEMMSG = _descriptor.Descriptor(name="PackageUpdateCouponsItemMsg",
  full_name="Cmd.PackageUpdateCouponsItemMsg",
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
 _descriptor.FieldDescriptor(name="Data",
   full_name="Cmd.PackageUpdateCouponsItemMsg.Data",
   index=0,
   number=1,
   type=11,
   cpp_type=10,
   label=1,
   has_default_value=False,
   default_value=None,
   message_type=None,
   enum_type=None,
   containing_type=None,
   is_extension=False,
   extension_scope=None,
   serialized_options=None,
   file=DESCRIPTOR)],
  extensions=[],
  nested_types=[],
  enum_types=[],
  serialized_options=None,
  is_extendable=False,
  syntax="proto3",
  extension_ranges=[],
  oneofs=[],
  serialized_start=145,
  serialized_end=210)
_PACKAGESYNCCOUPONSITEMINFOMSG.fields_by_name["Datas"].message_type = _COUPONSITEMDATA
_PACKAGEUPDATECOUPONSITEMMSG.fields_by_name["Data"].message_type = _COUPONSITEMDATA
DESCRIPTOR.message_types_by_name["CouponsItemData"] = _COUPONSITEMDATA
DESCRIPTOR.message_types_by_name["PackageSyncCouponsItemInfoMsg"] = _PACKAGESYNCCOUPONSITEMINFOMSG
DESCRIPTOR.message_types_by_name["PackageUpdateCouponsItemMsg"] = _PACKAGEUPDATECOUPONSITEMMSG
DESCRIPTOR.enum_types_by_name["PACKAGE_MSG"] = _PACKAGE_MSG
_sym_db.RegisterFileDescriptor(DESCRIPTOR)
CouponsItemData = _reflection.GeneratedProtocolMessageType("CouponsItemData", (_message.Message,), {'DESCRIPTOR':_COUPONSITEMDATA, 
 '__module__':"PackageCmd_pb2"})
_sym_db.RegisterMessage(CouponsItemData)
PackageSyncCouponsItemInfoMsg = _reflection.GeneratedProtocolMessageType("PackageSyncCouponsItemInfoMsg", (_message.Message,), {'DESCRIPTOR':_PACKAGESYNCCOUPONSITEMINFOMSG, 
 '__module__':"PackageCmd_pb2"})
_sym_db.RegisterMessage(PackageSyncCouponsItemInfoMsg)
PackageUpdateCouponsItemMsg = _reflection.GeneratedProtocolMessageType("PackageUpdateCouponsItemMsg", (_message.Message,), {'DESCRIPTOR':_PACKAGEUPDATECOUPONSITEMMSG, 
 '__module__':"PackageCmd_pb2"})
_sym_db.RegisterMessage(PackageUpdateCouponsItemMsg)
