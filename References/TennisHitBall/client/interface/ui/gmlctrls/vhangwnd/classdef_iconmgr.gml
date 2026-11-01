//
//物品的图标管理类定义
//yxf	2009年10月26日
//

importex("$./ClassDef_GoodsIcon_New.gml");

class VIconMgr_UI item
{
	size = "119,147";bgcolor = -1;
	var m_IsOverOpen = false; //是否支持 鼠标滑过效果
	//显示相关-----------------------------------------------------
	void Init()
	{
		//底图
		staticvar s_Bk = new img
		{
			size = "100%,100%";
			halign(50,0);
			src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/wpk01.tga";
			pos(0,0);
			void OnMySelect()
			{
				src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/wpk03.tga";
			}
			void OnMyUnSelect()
			{
				src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/wpk01.tga";;
			}
			void OnMouseOver()
			{
				if (!parent.m_IsOverOpen) return;
				src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/wpk02.tga";
			}
			void OnMouseOut()
			{
				if (!parent.m_IsOverOpen) return;
				OnMyUnSelect();
			}
		}

		
		//物品名称
		//参数1 
		staticvar s_Name = new BaseText
		{
			size = "119,20";xcenter = true;ycenter = true;//valign(100,0);
			pos(0,4);//bgcolor = "#FF";alpha = 80;
		}

		//图标类(含物品图标+数量+等级)
		//参数1 物品ID
		//参数2 数量
		//参数3 等级
		staticvar s_GoodsIcon = new VGoodsIconNew_Logic
		{
			//bgcolor = "#FF";
			halign(50,0);
			valign(65,0);
		}

		//使用状态
		//参数1 true false
		staticvar s_State = new img
		{
			pos(0,10);//bgcolor = "#FF";alpha = 80;
			src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/ysy-text.tga";show = false;

			void SetData(data1)
			{
				show = data1;
			}
		}
//		if(window.GetUIPos() != window.POS_PACK && window.GetUIPos() != window.POS_MALL 
//			&& window.GetUIPos() != window.POS_BUYCAR)
//		{
//			size = "100,120";
//			s_Bk.size = "100,120";
//			s_Name.size = "100,15";
//			s_GoodsIcon.size = "90,90";
//			s_GoodsIcon.halign(50,0);
//			s_GoodsIcon.valign(85,0);
//		}
	}
	//-------------------------------------------------------------
	//[外部接口]设置选中效果
	//参数：true false
	void SetSelectUI(select)
	{
		if (select)
		{
			s_Bk.OnMySelect();
		}
		else
		{
			s_Bk.OnMyUnSelect();
		}
	}

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	void SetMouseOverOpenUI(_open)
	{
		m_IsOverOpen = _open;
	}
};