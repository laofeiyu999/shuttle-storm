//大厅-明星榜-人气榜 类定义
//
importex("$./ClassDef_Favor_Tipe.gml");


class VTopStar_Favor_UI item
{
	pos = "0,0";size="100%,100%";bgcolor="-1";alpha = -1;

	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_Favor_tital = new VFavor_TopStar_TopTipes{size="565,32";}

		//翻页
		staticvar s_Favor_PageCtrl = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}

		// 段晓彤新加
		// 搜索结果显示, 提示字"搜索结果显示"
		staticvar s_Srch = new img { pos = "45, 75"; src = "$./imgs"+window.g_Sex+"/ssjg.tga"; show = false;}
		// 返回按钮
		staticvar s_Btn_Back = new VBTN_A_New
		{
			InitText("返回");
			pos = "525, 65";
			show = false;
		}
		// 搜索提示字"昵称"
		new BaseText{size="61,20";pos="30,444";ycenter=true;src="昵称";};
		//搜索输入框背景
		staticvar s_EditBk_SearchConeten = new VPic9_EditBK_UI
		{
			size = "90,20";
			pos = "60,444";
		}
		//搜索内容框
		staticvar s_Edit_SearchContent = new BaseEdit
		{
			setNoAddChr(" ",true);
			size = "90,20";
			pos = "60,444";
			maxsize = 12;ycenter = true;xcenter = true;

			void GetSrc()
			{
				return src;
			}
		}
		//搜索按钮
		staticvar s_Btn_Search = new VBTN_A_New
		{
			InitText("搜索");
			left = parent.s_Edit_SearchContent.left + parent.s_Edit_SearchContent.width+10;
			top = parent.s_Edit_SearchContent.top - 3;
		}
		// 页面跳转
		new BaseText{size="61,20";pos="421,444";ycenter=true;src="到";};
		new BaseText{ycenter=true;size="61,20";pos="497,444";src="页";};
		new VPic9_EditBK_UI{size="61,20";pos="436,444";};
		//页数:edit
		staticvar s_Edit_Page = new BaseEditNum{pos="436,444";size="61,20";maxsize = 5;xcenter = "true";ycenter=true;}
		//Go：按钮
		staticvar s_Btn_Go = new VBTN_43_New{pos="516,444";InitText("GO");}
		
		//献花
//		staticvar s_Btn_PresentFlower = new VBTN_A_New
//		{
//			InitText("献花");pos(parent.width-120,parent.height-50);
//		}
//
//		new BaseText
//		{
//			ycenter = true; size="561,20";pos = "45,392";//bgcolor = "#FF";
//			src = "我的排名";bold = true;
//		}
		//我的排名-总排行
//		staticvar s_My_Data = new item
//		{
//			size="561,25";pos = "45,413";bgcolor = "#F0F0F0";
//			new VListBG2_UI{size="100%,27";}
//			//排名
//			//参数 data1:
//			var _Rank = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="0,0"; size="90,27";
//			}
//
//			//昵称
//			//参数 data1:
//			var _Nickname = new BaseText{ycenter = true; xcenter = true;pos="89,0"; size="110,27";}	
//			
//			//等级
//			//参数 data1:
//			var _Level = new BaseText{ycenter = true; xcenter = true;pos="197,0"; size="80,27"; }
//			
//			//技术类型
//			//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
//			var _TechnicType = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="294,0"; size="130,27"; 
//				void SetData(type)
//				{
//					src = window.GetTechnicByType(toint(type));
//				}
//			}	
//
//			//人气
//			//参数 data1:
//			var _Point = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="427,0"; size="90,27";//  bkcolor="#FF";	
//			}
//		}
	}
};