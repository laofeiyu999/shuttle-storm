//创建家族 界面
//夏洋洋 2010-3-2

class VCreateFamily_UI VUIBG_UI
{
	size = "350,400";
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/cjjz-bt-text.tga");	
		InitClose();
		InitBtnBG();
		
		new VPic9_BK2_UI{pos = "15,35";size = "100%,100%,-35,-100";}

		//确定创建
		staticvar s_Btn_Create = new VBTN_A_New
		{
			InitText("确定创建");
			valign(95,0);halign(7,30);
		}
		//取消
		staticvar s_Btn_Cancle = new VBTN_A_New
		{
			InitText("取消");
			valign(95,0);halign(70,30);
		}
		//家族名称 图
		staticvar s_Img_FamilyName = new img
		{
			src = "$./imgs"+window.g_Sex+"/jzmc-text.tga";
			pos = "20,42";
		}
		// 家族名称:edit 背景
		staticvar s_EditBk_FamilyName = new VPic9_EditBK_UI
		{
			size = "145,20";
			left = parent.s_Img_FamilyName.left + parent.s_Img_FamilyName.width +10;
			top = parent.s_Img_FamilyName.top-2;
		}
		//家族名称:edit
		staticvar s_Edit_FamilyName = new BaseEdit
		{
			size = "145,20";
			left = parent.s_EditBk_FamilyName.left;
			top = parent.s_EditBk_FamilyName.top;
			maxsize = 16;ycenter = true;xcenter = true;
			//[功能]获取输入的内容
			//[参数]无
			//[返回值]返回输入的内容
			void GetEditContent()
			{
				return src;
			}
		}
		//名称检测 按钮
		staticvar s_Btn_NameCheck = new VBTN_58_New
		{
			InitText("名称检测");
			left = parent.s_Edit_FamilyName.left + parent.s_Edit_FamilyName.width +10;
			top = parent.s_Edit_FamilyName.top;
		}
		//名称检测结果
		staticvar s_NameCheckResult = new item
		{
			size = "70%,23";//bgcolor = "#ff";
			left = parent.s_Img_FamilyName.left+10;
			top = parent.s_Img_FamilyName.top + parent.s_Img_FamilyName.height +3;
			var s_Img_CheckResult = new img
			{
				pos = "0,7";
			}
			var s_Text_CheckResult = new BaseText
			{
				left = parent.s_Img_CheckResult.left + parent.s_Img_CheckResult.width + 20;
				top = parent.s_Img_CheckResult.top;
			}
			//[功能]检测家族名称是否可用
			//[参数]type：true为可用；false为不可用
			//[返回值]无
			void showResult(type)
			{
				if(type)
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/dg.tga";
					s_Text_CheckResult.SetData("可用的名称");
				}
				else
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/xz.tga";
					s_Text_CheckResult.SetData("名称已存在或包含不可用字符");
				}
			}

			//[功能]显示家族名称为空信息
			//[参数]无
			//[返回值]无
			void showEditContentNullInfo()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/xz.tga";
				s_Text_CheckResult.SetData("家族名称不能为空");
			}
		}
		//家族口号 图
		staticvar s_Img_FamilySlogan = new img
		{
			src = "$./imgs"+window.g_Sex+"/jzqm-text .tga";
			left = parent.s_Img_FamilyName.left;
			top = parent.s_NameCheckResult.top + parent.s_NameCheckResult.height + 5;
		}
		// 家族口号:edit 背景
		staticvar s_EditBk_FamilySlogan = new VPic9_EditBK_UI
		{
			size = "60%,20";
			left = parent.s_Img_FamilySlogan.left + parent.s_Img_FamilySlogan.width +10;
			top = parent.s_Img_FamilySlogan.top-2;
		}
		//家族口号:edit
		staticvar s_Edit_FamilySlogan = new BaseEdit
		{
			size = "60%,20";
			left = parent.s_EditBk_FamilySlogan.left;
			top = parent.s_EditBk_FamilySlogan.top;
			maxsize = 16;

			//[功能]获取家族签名内容
			//[参数]无
			//[返回值]家族签名内容
			void GetSloganContent()
			{
				return src;
			}
		}
		//徽章设计 图
		staticvar s_Text_DesignBadge = new img
		{
			src = "$./imgs"+window.g_Sex+"/hzsz-text.tga";
			left = parent.s_Img_FamilySlogan.left;
			top = parent.s_Img_FamilySlogan.top + parent.s_Img_FamilySlogan.height + 15;
		}
		//徽章设计效果图
		staticvar s_BadgeDesignResult = new item
		{
			size = "50,50";//bgcolor = "#ff";
			top = parent.s_Text_DesignBadge.top + parent.s_Text_DesignBadge.height+3;
			halign(47,0);
			
			var s_BadgeOutInfo = sysarray(3);	//外框信息
			var s_BadgeInInfo = sysarray(3);	//内框信息
			
			//徽章显示框
			var s_Badge_Frame = new img
			{
				size = "100%,100%";
				src = "$./imgs"+window.g_Sex+"/k01.tga";
			}
			//外框
			var s_Badge_Out = new img
			{
				valign(50,0);halign(50,0);
			}
			//内框
			var s_Badge_In = new img
			{
				valign(50,0);halign(50,0);
			}
			//[功能]设置内外框图
			//[参数]data1：内外框标志；data2：徽章等级；data3：图片索引
			//[返回值]
			void DesignBadge(data1,data2,data3)
			{
				if(data1 == window.FAMILY_BADGE_OUT)
				{
					s_Badge_Out.src = "$./../imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
					s_BadgeOutInfo[0] = data1;
					s_BadgeOutInfo[1] = data2;
					s_BadgeOutInfo[2] = data3;
				}
				if(data1 == window.FAMILY_BADGE_IN)
				{
					s_Badge_In.src = "$./../imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
					s_BadgeInInfo[0] = data1;
					s_BadgeInInfo[1] = data2;
					s_BadgeInInfo[2] = data3;
				}
			}
			//[功能]获取徽章信息	外框标志,徽章等级,图片索引;内框标志,徽章等级,图片索引
			//[参数]无
			//[返回值]徽章信息
			void GetBadgeInfo()
			{
				var _badgeOutInfo = window.FAMILY_BAGEE_BITNUM*s_BadgeOutInfo[0] + window.FAMILY_BAGEE_BITNUM*s_BadgeOutInfo[1]/100+s_BadgeOutInfo[2];
				var _badgeInInfo = window.FAMILY_BAGEE_BITNUM*s_BadgeInInfo[0] + window.FAMILY_BAGEE_BITNUM*s_BadgeInInfo[1]/100+s_BadgeInInfo[2];
				var _badgeInf = toint(window.FAMILY_BAGEE_BITNUM*10*_badgeOutInfo + _badgeInInfo);
				return _badgeInf;
			}

		}
		//选择徽章外框图形 字
		staticvar s_Text_BadgeOutTip = new BaseText
		{
			left = parent.s_Text_DesignBadge.left;
			top = parent.s_BadgeDesignResult.top + parent.s_BadgeDesignResult.height+7;
			SetData("选择徽章外框图形");
		}
		//选择徽章外框图形 底
		staticvar s_Bk_BadgeOut = new img
		{
			size = "73%,50";
			left = parent.s_Text_BadgeOutTip.left+20;
			top = parent.s_Text_BadgeOutTip.top + parent.s_Text_BadgeOutTip.height + 3;
			src = "$./imgs"+window.g_Sex+"/kkkkk.tga";
		}
		//选择徽章外框图形
		staticvar s_PageCtrl_Out = new VPageCtrl_ChangeFamilyBadge_UI
		{
			size = "85%,30";//bgcolor = "#ff";
			left = parent.s_Text_BadgeOutTip.left+5;
			top = parent.s_Text_BadgeOutTip.top + parent.s_Text_BadgeOutTip.height + 20;
		}
		//选择徽章中心图形 字
		staticvar s_Text_BadgeInTip = new BaseText
		{
			left = parent.s_PageCtrl_Out.left-5;
			top = parent.s_PageCtrl_Out.top + parent.s_PageCtrl_Out.height+7;
			SetData("选择徽章中心图形");
		}
		//选择徽章中心图形 底
		staticvar s_Bk_BadgeIn = new img
		{
			size = "73%,50";
			left = parent.s_Text_BadgeInTip.left+20;
			top = parent.s_Text_BadgeInTip.top + parent.s_Text_BadgeInTip.height + 3;
			src = "$./imgs"+window.g_Sex+"/kkkkk.tga";
		}
		//选择徽章中心图形
		staticvar s_PageCtrl_In = new VPageCtrl_ChangeFamilyBadge_UI
		{
			size = "85%,30";//bgcolor = "#ff";
			left = parent.s_Text_BadgeInTip.left+5;
			top = parent.s_Text_BadgeInTip.top + parent.s_Text_BadgeInTip.height + 20;
		}
	}
}