//明星榜-黄金联赛-标题栏设计
//武文博 2010-8-30

class VTopStar_GoldenLMatch_UI item
{
	pos = "0,0";size="100%,100%";bgcolor="-1";
	void Init()
	{
		//家族排行榜标志横条
		staticvar m_GoldenLMatchTopStarFlag = new VPic3_GreyTop_UI
		{
			size = "94%,32";
			pos = "20,91";
				var m_TopStar = new img					// 显示排名
			{
				pos="20,8";
				src="$./imgs"+window.g_Sex +"/pm-text.tga"
			}

				var m_Username = new img					// 显示昵称
			{
				src="$./imgs"+window.g_Sex +"/nc-text.tga"
				left=parent.m_TopStar.left + parent.m_TopStar.width+45;
				top =parent.m_TopStar.top-1;
			}

				var m_FamilyName = new img					//家族名称
			{	
				src="$./imgs"+window.g_Sex +"/jzmc-text.tga"
				left = parent.m_Username.left + parent.m_Username.width + 65;
				top = parent.m_Username.top;
			}

				var m_lev = new img					// 显示等级
			{
				src="$./imgs"+window.g_Sex +"/dj-text.tga"
				left = parent.m_FamilyName.left + parent.m_FamilyName.width + 40;
				top = parent.m_FamilyName.top+1;
			}

				var m_Tech = new img					// 显示技术特长
			{
				src="$./imgs"+window.g_Sex +"/jslx-text-bs.tga"
				left = parent.m_lev.left + parent.m_lev.width + 30;
				top = parent.m_lev.top-1;
			}

				var _ConfInVic = new img	// 胜率
			{
				src="$./imgs"+window.g_Sex +"/sl-text.tga";
				left = parent.m_Tech.left + parent.m_Tech.width + 50;
				top = parent.m_Tech.top+1;
			}

				var _VicTimes = new img	// 胜利场次
			{
				src="$./imgs"+window.g_Sex +"/slcc-text.tga";
				left = parent._ConfInVic.left + parent._ConfInVic.width +40;
				top = parent._ConfInVic.top;
			}

		}
		staticvar s_GoldenLMatch_PageCtrl = new VPageCtrl_Base_UI_UserDef{pos="260,"+(parent.height-50);}

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


		
	}

};