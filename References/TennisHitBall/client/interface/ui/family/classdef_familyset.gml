//家族设置
//夏洋洋 2010-3-4

//importex("$./../GmlCtrls/VHangWnd/ClassDef_BtnHangWnd.gml");
importex("$./../GmlCtrls/VHangWnd/ClassDef_HangWnd.gml");

class VFamilySet_UI item
{
	size = "91%,56%";//bgcolor = "#ff";
	pos = "30,97";
	void Init()
	{
		//家族名称
		staticvar s_Img_FamilyName = new img
		{
			src = "$./imgs"+window.g_Sex+"/Set/jzmc-text.tga";
			pos = "20,30";
		}
		staticvar s_EditBk_FamilyName = new VPic9_EditBK_UI
		{
			size = "145,20";
			left = parent.s_Img_FamilyName.left + parent.s_Img_FamilyName.width +10;
			top = parent.s_Img_FamilyName.top-3;
		}
		staticvar s_Edit_FamilyName = new BaseEdit
		{
			size = "145,20";
			left = parent.s_EditBk_FamilyName.left;
			top = parent.s_EditBk_FamilyName.top;
			maxsize = 16;ycenter = true;xcenter = true;
		}
		staticvar s_Mask_FamilyName = new item
		{
			size = "145,20";
			left = parent.s_Edit_FamilyName.left;
			top = parent.s_Edit_FamilyName.top;
			capturemouse = true;//bgcolor = "#ff";
			parent.s_Edit_FamilyName.bgcolor = "#D4D6E1";
		}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{
			src = "$./imgs"+window.g_Sex+"/Set/jzqm-text.tga";
			left = parent.s_Img_FamilyName.left;
			top = parent.s_Edit_FamilyName.top + parent.s_Edit_FamilyName.height + 20;
		}
		staticvar s_EditBk_FamilySlogan = new VPic9_EditBK_UI
		{
			size = "145,20";
			left = parent.s_Img_FamilySlogan.left + parent.s_Img_FamilySlogan.width +10;
			top = parent.s_Img_FamilySlogan.top;
		}
		staticvar s_Edit_FamilySlogan = new BaseEdit
		{
			size = "145,20";
			left = parent.s_EditBk_FamilySlogan.left;
			top = parent.s_EditBk_FamilySlogan.top;
			maxsize = 16;
			
			//[功能]获取家族签名
			//[参数]无
			//[返回值]家族签名
			void GetFamilySlogan()
			{
				return src;
			}
		}
		//家族公告
		staticvar s_Img_FamilyAffiche = new img
		{
			src = "$./imgs"+window.g_Sex+"/Set/jzgg-text.tga";
			left = parent.s_Img_FamilySlogan.left;
			top = parent.s_Img_FamilySlogan.top + parent.s_Img_FamilySlogan.height + 20;
		}
		staticvar s_EditBk_FamilyAffiche = new VPic9_EditBK_UI
		{
			size = "150,70";
			left = parent.s_Img_FamilyAffiche.left + parent.s_Img_FamilyAffiche.width +10;
			top = parent.s_Img_FamilyAffiche.top;
		}
		staticvar s_Edit_FamilyAffiche = new BaseEdit
		{
			size = "145,70";
			left = parent.s_EditBk_FamilyAffiche.left+3;
			top = parent.s_EditBk_FamilyAffiche.top;
			autoenter = true;
			maxsize = 120;

			//[功能]获取家族公告
			//[参数]无
			//[返回值]家族公告
			void GetFamilyAffiche()
			{
				return src;
			}
		}
		//加入家族是否需要验证
		staticvar s_ApplyForFamilyCheck = new img
		{
			src = "$./imgs"+window.g_Sex+"/Set/jzjzsf-text.tga";
			left = parent.s_Img_FamilyAffiche.left;
			top = parent.s_Edit_FamilyAffiche.top + parent.s_Edit_FamilyAffiche.height + 20;

			void SetState(_state)
			{
				if(_state)
				{
					src = "$./imgs"+window.g_Sex+"/Set/jzjzsf-text.tga";
				}
				else
				{
					src = "$./imgs"+window.g_Sex+"/Set/jzjzsf-hb-text.tga";
				}
			}
		}
		staticvar s_R_checkChoice1 = new VRadio_Single_New_UI 
		{
			left = parent.s_ApplyForFamilyCheck.left;
			top = parent.s_ApplyForFamilyCheck.top + parent.s_ApplyForFamilyCheck.height + 20;
		}
		staticvar s_Text_checkChoice1 = new BaseText
		{
			left = parent.s_R_checkChoice1.left + parent.s_R_checkChoice1.width + 20;
			top = parent.s_R_checkChoice1.top;
			SetData("是");
		}
		staticvar s_checkChoice2 = new VRadio_Single_New_UI 
		{
			left = parent.s_Text_checkChoice1.left + parent.s_Text_checkChoice1.width + 50;
			top = parent.s_Text_checkChoice1.top;
		}
		staticvar s_Text_checkChoice1 = new BaseText
		{
			left = parent.s_checkChoice2.left + parent.s_checkChoice2.width + 20;
			top = parent.s_checkChoice2.top;
			SetData("否");
		}
		staticvar s_Mask_checkChoice = new item
		{
			size = "160,30";//bgcolor = "#ff";
			capturemouse = true;
			left = parent.s_ApplyForFamilyCheck.left;
			top = parent.s_ApplyForFamilyCheck.top + parent.s_ApplyForFamilyCheck.height + 20;
		}
		//徽章设置
		staticvar s_Img_FamilyBadgeSet = new img
		{
			src = "$./imgs"+window.g_Sex+"/Set/hzsz-text.tga";
			left = parent.s_Edit_FamilyName.left + parent.s_Edit_FamilyName.width + 50;
			top = parent.s_Img_FamilyName.top;

			void SetState(_state)
			{
				if(_state)
				{
					src = "$./imgs"+window.g_Sex+"/Set/hzsz-text.tga";
				}
				else
				{
					src = "$./imgs"+window.g_Sex+"/Set/hzsz-hb-text.tga";
				}
			}
		}
		staticvar s_Text_FamilyBadgeSet = new BaseText
		{
			width = parent.s_Img_FamilyBadgeSet.width+20;
			height = parent.s_Img_FamilyBadgeSet.height*2;
			autoenter = true;
			left = parent.s_Img_FamilyBadgeSet.left;
			top = parent.s_Img_FamilyBadgeSet.top + parent.s_Img_FamilyBadgeSet.height;
			//SetData("(点击图标进行徽章设置)");
		}
		staticvar s_BadgeDesignResult = new item
		{
			size = "60,60";//bgcolor = "#ff";
			left = parent.s_Img_FamilyBadgeSet.left + parent.s_Img_FamilyBadgeSet.width + 30;
			top = parent.s_Img_FamilyBadgeSet.top +3;
			var _badgeData = 0;	//徽章数据
			
			
			//徽章闪烁框
			var s_Badge_Frame = new img
			{
				size = "100%,100%";//show = false;
				src = "$./pop/imgs"+window.g_Sex+"/kss.tga";
				clipani(100,99,1,2);//anispeed = 3;
			}
			var s_Badge_Out = new img
			{
				valign(50,0);halign(50,0);
			}
			var s_Badge_In = new img
			{
				valign(50,0);halign(50,0);
			}
			
			//[功能]设置徽章状态
			//[参数]无
			//[返回值]无
			void SetBadgeState(data)
			{
				if(data)
				{
					s_Badge_Frame.anispeed = 3;
				}
				else
				{
					s_Badge_Frame.anispeed = 0;
					s_Badge_Frame.aniindex = 0;
				}
			}

			//[功能]显示徽章图
			//[参数]data1：外框标志，data2：徽章等级，data3：图片索引，data4：内框标志，data5：徽章等级，data6：图片索引
			//[返回值]无
			void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
			{
				s_Badge_Out.src = "$./imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
				s_Badge_In.src = "$./imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
				_badgeData = window.ComputeFamilyBageData(data1,data2,data3,data4,data5,data6);
			}

			//[功能]获取徽章信息	外框标志,徽章等级,图片索引;内框标志,徽章等级,图片索引
			//[参数]无
			//[返回值]徽章信息
			void GetBadgeInfo()
			{
				return _badgeData;
			}
		}
		//悬停框
		staticvar s_hangConten = new VHangWnd_UI
		{
			size = "150,50";
			left = parent.s_BadgeDesignResult.left + parent.s_BadgeDesignResult.width/2;
			top = parent.s_BadgeDesignResult.top + parent.s_BadgeDesignResult.height/2;
			show = false;
		}
		//保存设置
		staticvar s_SaveSet = new VBTN_A_New
		{
			InitText("保存设置");
			valign(95,0);halign(95,0);
		}
	}
}