//大厅-明星榜-家族 类定义
//
importex("$./ClassDef_Tipe.gml");
class VTopStar_Family_UI item
{
	pos = "0,0";size="100%,100%";bgcolor="-1";
	void Init()
	{
		//家族排行榜标志横条
		staticvar m_FamilyTopStarFlag = new VPic3_GreyTop_UI
		{
			size = "94%,32";
			pos = "20,91";
			//名次
			var m_TopStar = new img
			{
				src="$./imgs"+window.g_Sex +"/pm-text.tga"
				pos = "20,7";
			}
			//家族名称
			var m_FamilyName = new img
			{
				src="$./imgs"+window.g_Sex +"/jzmc-text.tga"
				left = parent.m_TopStar.left + parent.m_TopStar.width + 70;
				top = parent.m_TopStar.top;
			}
			//族长
			var m_Header = new img
			{
				src="$./imgs"+window.g_Sex +"/zz-text.tga"
				left = parent.m_FamilyName.left + parent.m_FamilyName.width + 70;
				top = parent.m_FamilyName.top;
			}
			//级别
			var m_Lev = new img
			{
				src="$./imgs"+window.g_Sex +"/dj-text.tga"
				left = parent.m_Header.left + parent.m_Header.width + 70;
				top = parent.m_Header.top;
			}
			//积分
			var m_Score = new img
			{
				src="$./imgs"+window.g_Sex +"/jf-text.tga"
				left = parent.m_Lev.left + parent.m_Lev.width + 40;
				top = parent.m_TopStar.top;
			}
			//人数
			var m_PeopleNum = new img
			{
				src="$./imgs"+window.g_Sex +"/rs-text.tga"
				left = parent.m_Score.left + parent.m_Score.width + 30;
				top = parent.m_Score.top;
			}
		}

//		new BaseText
//		{
//			ycenter = true; size="590,20";pos = "30,378";//bgcolor = "#FF";
//			src = "我的家族";bold = true;
//		}
		//我的家族排名
//		staticvar s_My_Data = new item
//		{
//			size="590,28";pos = "30,400";bgcolor = "#F0F0F0";
//			new VListBG2_UI{size="100%,27";}
//			//排名
//			//参数 data1:
//			var _Rank = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="0,0"; size="50,27";
//			}
//
//			//家族名称
//			//参数 data1:
//			var _FamilyName = new BaseText{ycenter = true; xcenter = true;pos="65,0"; size="110,27";}	
//			
//			//族长
//			var _HeadName = new BaseText{ycenter = true; xcenter = true;pos="170,0"; size="110,27";}
//
//			//等级
//			var _Level = new BaseText{ycenter = true; xcenter = true;pos="291,0"; size="80,27"; }
//			
//			//积分
//			var _FamilyPoint = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="346,0"; size="130,27"; 
//			}	
//
//			//人数
//			var _peopleNum = new BaseText
//			{
//				ycenter = true; xcenter = true;pos="476,0"; size="90,27";//  bkcolor="#FF";	
//			}
//		}
		//翻页
		staticvar s_PageCtrl = new VPageCtrl_Base_UI_UserDef{pos="300,"+(parent.height-49);}

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
		//new BaseText{size="61,20";pos="30,444";ycenter=true;src="称";};
		// 家族名称, 族长名称
		staticvar s_CB_Family = new VMyDropMenu_UI 
		{
			pos="20,444";
			SetID(toint(window.POS_TOPSTAR)+10);
			SetPos(20,444);
			SetWidthAndType(80,0);
			SetData("家族名称,族长名称");
			SetDefaultSrc("家族名称");
			parent.s_tital.SetData(2);//设置标题 

		}
		//搜索输入框背景
		staticvar s_EditBk_SearchConeten = new VPic9_EditBK_UI
		{
			size = "90,20";
			pos = "110,444";
		}
		//搜索内容框
		staticvar s_Edit_SearchContent = new BaseEdit
		{
			setNoAddChr(" ",true);
			maxsize = 6;
			size = "90,20";
			pos = "110,444";
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

	}
};