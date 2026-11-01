//宝箱的逻辑类定义
//yangxf 2009年5月26日
//

import("$./../../UI/TreasureBox/ClassDef.gml");

class VTreasureBox_Logic item
{
	size = "500,250";bgcolor = "#FF";alpha = 50;
	//=============================与界面交互========================================
	void Init()
	{	
		//所得物品
		staticvar s_Goods = new VMyText
		{
			size(100,100);pos(10,50);bkcolor="#00ff00";alpha=60;
		}
	}
	inclass("VTreasureBox_UI");//界面显示类
	//==============================function=========================================
	Init();

	//取显示几个物品
	void GetNumFromDB(entryid)
	{
		printf("B# VTreasureBox_Logic:GetNumFromDB():entryid:"+entryid);
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,entryid);

		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VTreasureBox_Logic:GetNumFromDB:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",entryid:"+entryid);
			return;
		}

		var _boxid = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_OPENBOXID);
		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.BOXINFO,window.M_G_GOODS_BOXINFO_ENTRYID,_boxid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VTreasureBox_Logic:GetNumFromDB:DBname:"+window.M_G_GOODS+",TBName:"+window.BOXINFO+",_boxid:"+_boxid);
			return;
		}
		var _malezone = _VNet2DBRow.GetData(window.M_G_GOODS_BOXINFO_MALEZONE1);
		_VNet2DBRow.Release();
		
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.DROPZONE,window.M_G_GOODS_DROPZONE_ENTRYID,_malezone);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VTreasureBox_Logic:GetNumFromDB:DBname:"+window.M_G_GOODS+",TBName:"+window.DROPZONE+",_malezone:"+_malezone);
			return;
		}
		var _numStr = _VNet2DBRow.GetData(window.M_G_GOODS_DROPZONE_DROPNUMODDS);
		_VNet2DBRow.del();
		
		var _Arrnum = window.SplitStr2(_numStr,",",2);
		s_Goods.SetNum(toint(_Arrnum[0]));
	}
};