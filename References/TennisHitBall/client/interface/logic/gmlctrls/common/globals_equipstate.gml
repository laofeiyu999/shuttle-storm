//----------------[功能]判断是否使用某项道具-----------------
//[参数]_entryID:物品ID
//[返回值]0为未使用，1为使用
void GetPropItemEquipState(_CID)
{
	var _VNet2DBTable = new VNet2DBTable
	{
		var _equipState = 0;
		void GetData(_equipPos)
		{
			if(_equipPos == 1)
			{
				_equipState = 1;
			}
		}
	}
	var _SQL = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_CID;
	_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
	var _count = _VNet2DBTable.GetSize();
	if(_count == 0)
	{
		_VNet2DBTable.del();
		return 0;
	}
	_VNet2DBTable.ReadData("GetData",window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);
	var _equip = _VNet2DBTable._equipState;
	_VNet2DBTable.del();
	return _equip;
}

