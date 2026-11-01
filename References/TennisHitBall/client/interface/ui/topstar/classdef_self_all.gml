//大厅-明星榜-个人-总排行 类定义
//
importex("$./ClassDef_Tipe.gml");

class VTopStar_Self_All_UI item
{
	pos = "0,0";size="100%,100%";bgcolor="-1";alpha = -1;

	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_tital = new TopStar_TopTipes{size="565,32";}

		//new BaseText{src="排名方式"; pos="50,"+(parent.height-40);}
		staticvar s_TXT_Type = new BaseText{src="排名方式"; pos="400,83";}
		staticvar s_CB_Type = new VMyDropMenu_UI {pos = "460, 80";}

		//翻页：总排行-总场次
		staticvar s_PageCtrl_1 = new VPageCtrl_Base_UI_UserDef{pos="260,"+(parent.height-50);}
		//翻页：总排行-胜利场次
		staticvar s_PageCtrl_2 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}	
		//翻页：总排行-总得分
		staticvar s_PageCtrl_3 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}
		//翻页：总排行-一击得分总数
		staticvar s_PageCtrl_4 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}
		//翻页：总排行-技能总数
		staticvar s_PageCtrl_5 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}
		//翻页：总排行-满蓄力次数
		staticvar s_PageCtrl_6 = new VPageCtrl_Base_UI_UserDef{pos="273,"+(parent.height-49);}

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
		}
		// 页面跳转
		new BaseText{size="61,20";pos="421,444";ycenter=true;src="到";};
		new BaseText{ycenter=true;size="61,20";pos="497,444";src="页";};
		new VPic9_EditBK_UI{size="61,20";pos="436,444";};
		//页数:edit
		staticvar s_Edit_Page = new BaseEditNum{pos="436,444";size="61,20";maxsize = 5;xcenter = "true";ycenter=true;}
		//Go：按钮
		staticvar s_Btn_Go = new VBTN_43_New{pos="516,444";InitText("GO");}
		
//		new BaseText
//		{
//			ycenter = true; size="561,20";pos = "45,378";//bgcolor = "#FF";
//			src = "我的排名";bold = true;
//		}
		//我的排名-总排行
//		staticvar s_My_Data_2 = new item
//		{
//			size="561,28";pos = "45,400";bgcolor = "#F0F0F0";
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
//			var _Nickname = new BaseText{ycenter = true; xcenter = true;pos="90,0"; size="110,27";}	
//			
//			//等级
//			//参数 data1:
//			var _Level = new BaseText{ycenter = true; xcenter = true;pos="198,0"; size="80,27"; }
//			
//			//技术类型
//			//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
//			var _TechnicType = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="295,0"; size="130,27"; 
//				void SetData(type){src = window.GetTechnicByType(toint(type));}
//			}	
//
//			//得分
//			//参数 data1:
//			var _Point = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="426,0"; size="90,27";//  bkcolor="#FF";	
//				void SetData(data1)
//				{
//					if(parent.parent.parent.m_Index==7||parent.parent.parent.m_Index==10)
//					{
//						src = ""+data1+"%";
//					}
//					else
//					{
//						src = data1;
//					}
//				}
//			}
//
//			//升降
//			var _UpDown = new img
//			{
//				pos(500,0);valign(50,0);
//				
//				//updown:升降 1降 2未 3升
//				void SetData(updown)
//				{
//					updown = toint(updown);
//					if (updown == -1)
//					{
//						show = false;
//						src = "";
//					}
//					else
//					{
//						src = "$./imgs"+window.g_Sex+"/updown_"+updown+".tga";
//						show = true;
//					}
//				}
//			}
//		}
	}
	
	//在不同排名方式之间切换
	//序号：1-6 
	void OnChangeTypeUI(index)
	{
		
	}
};