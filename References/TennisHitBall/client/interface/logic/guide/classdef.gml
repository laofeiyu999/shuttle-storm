//引导系统的类定义
//yxf 2009年3月25日
//

import("$./../../UI/Guide/ClassDef.gml");

//界面引导类定义-单个的定义
class VGuide_Logic item
{
	size = "150,50";bgcolor = "#FF";
	//=============================与界面交互========================================
	void Init()
	{	
		//箭头
		//[参数]_src:图片文件名
		//		_pos:图片位置
		staticvar s_Img = new VMyText
		{
			void SetData(_src,_pos)
			{
				src = _src;
				parent.pos = ""+_pos;
			}
		}
	}
	inclass("VGuide_UI");//界面显示类
	//==============================function=========================================
	Init();
};

//界面引导管理类
class VGuideMgr_Logic item
{
	name = "GUIDE_LOGIC";
	var _layerName = "";

	//外部接口
	//id：GameUI.mdb / UIGuide(表)
	void SetData(id)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.UIGUIDE,window.GAMEUI_UIGUIDE_ID,id);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error:VGuideMgr_Logic-DBname:"+window.GAMEUI+",TBName1:"+window.UIGUIDE+",id:"+id);
			return;
		}
		var _src = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDE_SRC);
		var _pos = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDE_POS);
		var _uiname = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDE_UINAME);
		_layerName = _uiname;
		_VNet2DBRow.del();
		set window.find(""+_uiname)
		{
			window.find(""+_uiname).find("VGuide_Logic"+id).del();
			new VGuide_Logic
			{
				name = "VGuide_Logic"+id;
			}
		}
		window.find(""+_uiname).find("VGuide_Logic"+id).s_Img.SetData(_src,_pos);
	}
};