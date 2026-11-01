
//
//目前基本没用
//

/*
class VMyItemChag_Logic item
{
	//自己的数据
	var _VNet2DBRow = new VNet2DBRow
	{
		void InitDB(enterID)
		{
			InitByInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,enterID);
			AddDBEvent("OnMyNumChange",0,4);
		}
		//索引，物品ID,物品数量
		void OnMyNumChange(index,enterID,Num)
		{
			if (window.g_DEBUG)
			{
				printf("dsadsadsad:index:"+index+",enterID:"+enterID+",Num:"+Num);
			}	
			switch (index)
			{
				case 4:
				{
					parent.parent.s_SkillNum.SetData(enterID);
					break;
				}
			}
		}
	}
	void SetEntryID(enterID)
	{
		alert("SetEntryID:"+enterID);
		_VNet2DBRow.InitDB(enterID);
	}
};
*/