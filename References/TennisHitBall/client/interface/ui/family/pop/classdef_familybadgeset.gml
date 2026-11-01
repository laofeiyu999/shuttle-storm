//徽章设置
//夏洋洋 2010-3-4

class VFamilyBadgeSet_UI VUIBG_UI
{
	size = "350,370";//bgcolor = "#ff";
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/hzsz-title.tga");	
		InitClose();
		InitBtnBG();

		new VPic9_BK2_UI{pos = "15,35";size = "100%,100%,-35,-100";}

		//徽章设计效果图
		staticvar s_BadgeDesignResult = new item
		{
			size = "50,50";//bgcolor = "#ff";
			valign(17,0);
			halign(49,-1);
			var s_BadgeOutInfo = sysarray(3);	//外框信息
			var s_BadgeInInfo = sysarray(3);	//内框信息
			//徽章显示框
			var s_Badge_Frame = new img
			{
				size = "100%,100%";
				src = "$./imgs"+window.g_Sex+"/k01.tga";
			}
			var s_Badge_Out = new img
			{
				valign(50,0);halign(50,0);
			}
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
			left = 25;
			top = parent.s_BadgeDesignResult.top + parent.s_BadgeDesignResult.height+20;
			SetData("选择徽章外框图形");
		}
		//选择徽章外框图形 底
		staticvar s_Bk_BadgeOut = new img
		{
			size = "73%,50";
			left = parent.s_Text_BadgeOutTip.left+20;
			top = parent.s_Text_BadgeOutTip.top + parent.s_Text_BadgeOutTip.height + 13;
			src = "$./imgs"+window.g_Sex+"/kkkkk.tga";
		}
		//选择徽章外框图形
		staticvar s_PageCtrl_Out = new VPageCtrl_ChangeFamilyBadge_UI
		{
			size = "85%,30";//bgcolor = "#ff";
			left = parent.s_Text_BadgeOutTip.left+5;
			top = parent.s_Text_BadgeOutTip.top + parent.s_Text_BadgeOutTip.height+30;
		}
		//选择徽章中心图形 字
		staticvar s_Text_BadgeInTip = new BaseText
		{
			left = parent.s_PageCtrl_Out.left-5;
			top = parent.s_PageCtrl_Out.top + parent.s_PageCtrl_Out.height+17;
			SetData("选择徽章中心图形");
		}
		//选择徽章中心图形 底
		staticvar s_Bk_BadgeIn = new img
		{
			size = "73%,50";
			left = parent.s_Text_BadgeInTip.left+20;
			top = parent.s_Text_BadgeInTip.top + parent.s_Text_BadgeInTip.height + 13;
			src = "$./imgs"+window.g_Sex+"/kkkkk.tga";
		}
		//选择徽章中心图形
		staticvar s_PageCtrl_In = new VPageCtrl_ChangeFamilyBadge_UI
		{
			size = "85%,30";//bgcolor = "#ff";
			left = parent.s_Text_BadgeInTip.left+5;
			top = parent.s_Text_BadgeInTip.top + parent.s_Text_BadgeInTip.height+30;
		}
		//确定
		staticvar s_Btn_SetOk = new VBTN_A_New
		{
			InitText("确定");
			valign(93,0);halign(50,0);
		}
	}
}