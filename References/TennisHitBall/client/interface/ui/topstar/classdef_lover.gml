//大厅-明星榜-情侣排行 类定义
//yxf 2010年9月27日
importex("$./ClassDef_Lover_Model.gml");

class VTopStar_Lover_UI item
{
	pos = "0,0";size="100%,100%";bgcolor="-1";alpha = -1;

	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_tital = new TopStar_TopTipes{size="565,32";}
		s_tital.SetData(100);//显示亲密度字样

		//new BaseText{src="排名方式"; pos="50,"+(parent.height-40);}
//		staticvar s_TXT_Type = new BaseText{src="排名方式"; pos="400,82";}
//		staticvar s_CB_Type = new VMyDropMenu_UI {pos = "460, 80";}

		//翻页：爱情指数
		staticvar s_PageCtrl_1 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}

		// 段晓彤新加
		// 搜索结果显示, 提示字"搜索结果显示"
		staticvar s_Srch = new img { pos = "45, 75"; src = "$./imgs"+window.g_Sex+"/ssjg.tga"; show = false;}
		// 返回按钮
		staticvar s_Btn_Back = new VBTN_A_New
		{
			InitText("返回");
			pos = "525, 75";
			show = false;
		}
		//// 搜索提示字"昵称"
		//new BaseText{size="61,20";pos="30,444";ycenter=true;src="昵称";};
		////搜索输入框背景
		//staticvar s_EditBk_SearchConeten = new VPic9_EditBK_UI
		//{
			//size = "90,20";
			//pos = "60,444";
		//}
	/*	//搜索内容框
		staticvar s_Edit_SearchContent = new BaseEdit
		{
			setNoAddChr(" ",true);
			maxsize = 6;
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
		}*/
		// 页面跳转
		new BaseText{size="61,20";pos="421,444";ycenter=true;src="到";};
		new BaseText{ycenter=true;size="61,20";pos="497,444";src="页";};
		new VPic9_EditBK_UI{size="61,20";pos="436,444";};
		//页数:edit
		staticvar s_Edit_Page = new BaseEditNum{pos="436,444";size="61,20";maxsize = 5;xcenter = "true";ycenter=true;}
		//Go：按钮
		staticvar s_Btn_Go = new VBTN_43_New{pos="516,444";InitText("GO");}
	}
};