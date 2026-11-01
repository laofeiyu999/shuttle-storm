//游戏中快速购买显示类
//吴楠
//import("$./../GmlCtrls/UI_BG/ClassDef.gml");

class VRole_Skill_Buy_UI VUIBG_UI
{
	size(237,200);bkcolor=-1;alpha=0;pos(parent.width,parent.height-256);
	
	m_FocusItem.del();

	void Init()
	{
		/**
		new img
		{
			size(227,165);
			src="$./imgs"+window.g_Sex+"/FastBuy.tga";
		}*/
		
		OpenDrag();
		InitBG("");
		InitClose();
		InitBtnBG();
		
		new VPic9_BK2_UI
		{
			size(parent.width-28,parent.height-96);pos = "14,33";
		}
		staticvar s_Icon = new VGoodsIconNew_Logic
		{
			SetMySizeEx(82,82);pos(22,36);
		}
		//说明
		staticvar _Explain = new BaseText
		{
			size(100,75);pos(110,60);autoenter=true;
		//	font("宋体",-1,13);
			src="  点击“确定”完成购买,可立即使用!";
		}
		//价格
		staticvar _Money = new BaseText
		{
			size(120,20);pos(30,120);
			
			void SetData(data,index)
			{
				var _money = window.GetPriceByIndex(data,index)
				var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);
				if ( _DeadORLive >0)
				{
					_money = toint(_money)*0.8;
				}
				src="价格:"+toint(_money);
				var _type = window.GetPriceTypeByID(data);
				src += ""+window.GetPriceNameByType(_type);
			}
		}
		//购买
		staticvar _Buy = new VBTN_A_New
		{
			pos(23,150);
			InitText("确定");
		}
		//取消
		staticvar _Canel = new VBTN_A_New
		{
			pos(132,150);
			InitText("取消");
		}
	}// end Init()

	void OnShow()
	{
		var posHide = ""+parent.width+","+(parent.height-256);
		var posShow = ""+(parent.width-233)+","+(parent.height-256);

		this.setParamTimer("pos",posHide,posShow,150,0);
	}
	void OnShowfalse()
	{
		var posHide = ""+parent.width+","+(parent.height-256);
		var posShow = ""+(parent.width-233)+","+(parent.height-256);

		this.setParamTimer("pos",posShow,posHide,150,0);
	}
};