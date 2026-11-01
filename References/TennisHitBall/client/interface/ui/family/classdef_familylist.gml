//家族列表
//夏洋洋 2010-3-4

class VFamilyList_UI item
{
	size = "91%,80%";//bgcolor = "#ff";
	pos = "30,70";
	void Init()
	{
		
		//家族名称 Radio
		staticvar s_R_FamilyName = new VRadio_Single_New_UI 
		{
			pos = "7,3";
			
		}
		staticvar s_Text_FamilyName = new BaseText
		{
			left = parent.s_R_FamilyName.left + parent.s_R_FamilyName.width + 10;
			top = parent.s_R_FamilyName.top;
			SetData("家族名称");
		}
		//族长名称 Radio
		staticvar s_R_HeaderName = new VRadio_Single_New_UI 
		{
			left = parent.s_Text_FamilyName.left + parent.s_Text_FamilyName.width + 30;
			top = parent.s_Text_FamilyName.top;
		}
		staticvar s_Text_HeaderName = new BaseText
		{
			left = parent.s_R_HeaderName.left + parent.s_R_HeaderName.width + 10;
			top = parent.s_R_HeaderName.top;
			SetData("族长名称");
		}
		//查找
		staticvar s_EditBk_SearchContent = new VPic9_EditBK_UI
		{
			size = "145,20";
			left = parent.s_Text_HeaderName.left + parent.s_Text_HeaderName.width +70;
			top = parent.s_Text_HeaderName.top;
		}
		staticvar s_Edit_SearchContent = new BaseEdit
		{
			size = "145,20";
			left = parent.s_EditBk_SearchContent.left;
			top = parent.s_EditBk_SearchContent.top;
			maxsize = 16;ycenter = true;xcenter = true;
			//[功能]获取搜索内容
			//[参数]无
			//[返回值]搜索内容
			void GetSearchContent()
			{
				return src;
			}
		}
		staticvar s_Btn_Search = new VBTN_43_New
		{
			InitText("查找");
			left = parent.s_Edit_SearchContent.left + parent.s_Edit_SearchContent.width + 3;
			top = parent.s_Edit_SearchContent.top;
		}
		//刷新列表
		staticvar s_Btn_Flash = new VBTN_43_New
		{
			InitText("刷新");
			left = parent.s_Btn_Search.left + parent.s_Btn_Search.width + 10;
			top = parent.s_Btn_Search.top;
		}
		//家族列表标志条
		staticvar s_FamilyListFlag = new VPic3_GreyTop_UI
		{
			size = "100%,32";
			top = parent.s_R_HeaderName.top + parent.s_R_HeaderName.height + 3;
			//家族名称
			staticvar m_Img_FamilyName = new img
			{
				src = "$./imgs"+window.g_Sex+"/FamilyList/jzmc-text.tga";
				pos = "7,7";
			}
			//族长
			staticvar m_Img_HeaderName = new img
			{
				src = "$./imgs"+window.g_Sex+"/FamilyList/zz-text.tga";
				left = parent.m_Img_FamilyName.left + parent.m_Img_FamilyName.width + 70;
				top = parent.m_Img_FamilyName.top;
			}
			//等级
			staticvar m_Img_FamilyLev = new img
			{
				src = "$./imgs"+window.g_Sex+"/FamilyList/dj-text.tga";
				left = parent.m_Img_HeaderName.left + parent.m_Img_HeaderName.width + 70;
				top = parent.m_Img_HeaderName.top;
			}
			//人数
			staticvar m_Img_FamilyPeopleNum = new img
			{
				src = "$./imgs"+window.g_Sex+"/FamilyList/rs-text.tga";
				left = parent.m_Img_FamilyLev.left + parent.m_Img_FamilyLev.width + 70;
				top = parent.m_Img_FamilyLev.top;
			}
			//家族签名
			staticvar m_Img_FamilySlogan = new img
			{
				src = "$./imgs"+window.g_Sex+"/FamilyList/jzqm-text.tga";
				left = parent.m_Img_FamilyPeopleNum.left + parent.m_Img_FamilyPeopleNum.width + 70;
				top = parent.m_Img_FamilyPeopleNum.top;
			}
		}
		//查看信息
		staticvar s_Btn_LookupInfo = new VBTN_A_New
		{
			InitText("查看信息");
			valign(97,0);halign(75,0);
		}
		//申请加入
		staticvar s_Btn_ApplyForFamily = new VBTN_A_New
		{
			InitText("申请加入");
			valign(97,0);halign(95,0);
		}
	}
}