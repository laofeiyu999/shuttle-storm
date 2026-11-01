//查看家族信息
//夏洋洋 2010-3-4

class VLookupFamilyInfo_UI VUIBG_UI
{
	size = "350,460";//bgcolor = "#ff";
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("");
		InitClose();
		InitBtnBG();

		staticvar s_Bk = new VPic9_BK2_UI
		{
			pos = "15,40";
			size = "315,350";
		}

		//家族名称
		staticvar s_Img_FamilyName = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzmc-text.tga";
			pos = "20,50";
		}
		staticvar s_Text_FamilyName = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilyName.left + parent.s_Img_FamilyName.width + 10;
			top = parent.s_Img_FamilyName.top-3;
		}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzqm-text.tga";
			left = parent.s_Img_FamilyName.left;
			top = parent.s_Img_FamilyName.top + parent.s_Img_FamilyName.height + 15;
		}
		staticvar s_Text_FamilySlogan = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilySlogan.left + parent.s_Img_FamilySlogan.width + 10;
			top = parent.s_Img_FamilySlogan.top-3;
		}
		//家族族长
		staticvar s_Img_FamilyHeader = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzzz-text.tga";
			left = parent.s_Img_FamilySlogan.left;
			top = parent.s_Img_FamilySlogan.top + parent.s_Img_FamilySlogan.height + 15;
		}
		staticvar s_Text_FamilyHeader = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilyHeader.left + parent.s_Img_FamilyHeader.width + 10;
			top = parent.s_Img_FamilyHeader.top-3;
		}
		//家族成员
		staticvar s_Img_FamilyPeople = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzcy-text.tga";
			left = parent.s_Img_FamilyHeader.left;
			top = parent.s_Img_FamilyHeader.top + parent.s_Img_FamilyHeader.height + 15;
		}
		staticvar s_Text_FamilyPeople = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilyPeople.left + parent.s_Img_FamilyPeople.width + 10;
			top = parent.s_Img_FamilyPeople.top-3;
		}
		//男女人数
		staticvar s_Img_FamilyBoyAndGirlNum = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/nvrs-text.tga";
			left = parent.s_Img_FamilyPeople.left;
			top = parent.s_Img_FamilyPeople.top + parent.s_Img_FamilyPeople.height + 15;
		}
		staticvar s_Text_FamilyBoyAndGirlNum = new VListBG2_UI
		{
			size = "66%,20";
			left = parent.s_Img_FamilyBoyAndGirlNum.left + parent.s_Img_FamilyBoyAndGirlNum.width + 10;
			top = parent.s_Img_FamilyBoyAndGirlNum.top-3;
			
			var _manIcon = new img
			{
				pos = "80,3";
				size = "15,15";
				src = "$./../../SelfInfo/imgs"+window.g_Sex+"/boy.tga";
			}
			var _manNum = new BaseText
			{
				left = parent._manIcon.left+parent._manIcon.width+7;
				top = parent._manIcon.top;
			}
			var _girlIcon = new img
			{
				left = parent._manNum.left+parent._manNum.width+20;
				top = parent._manIcon.top;
				size = "15,15";
				src = "$./../../SelfInfo/imgs"+window.g_Sex+"/girl.tga";
			}
			var _girlNum = new BaseText
			{
				left = parent._girlIcon.left+parent._girlIcon.width+7;
				top = parent._girlIcon.top;
			}

			void SetData(data1,data2)
			{
				_manNum.SetData(data1);
				_girlNum.SetData(data2);
			}
		}
		//家族等级
		staticvar s_Img_FamilyLev = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzdj-text.tga";
			left = parent.s_Img_FamilyBoyAndGirlNum.left
			top = parent.s_Img_FamilyBoyAndGirlNum.top + parent.s_Img_FamilyBoyAndGirlNum.height + 15;;
		}
		staticvar s_Text_FamilyLev = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilyLev.left + parent.s_Img_FamilyLev.width + 10;
			top = parent.s_Img_FamilyLev.top-3;
		}
		//家族积分
		staticvar s_Img_FamilySorce = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzjf-text.tga";
			left = parent.s_Img_FamilyLev.left;
			top = parent.s_Img_FamilyLev.top + parent.s_Img_FamilyLev.height + 15;
		}
		staticvar s_Text_FamilySorce = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilySorce.left + parent.s_Img_FamilySorce.width + 10;
			top = parent.s_Img_FamilySorce.top-3;

			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}
//		//家族排名
//		staticvar s_Img_FamilyTopStar = new img
//		{
//			src = "$./../imgs"+window.g_Sex+"/Info/jzpm-text.tga";
//			left = parent.s_Img_FamilySorce.left;
//			top = parent.s_Img_FamilySorce.top + parent.s_Img_FamilySorce.height + 15;
//		}
//		staticvar s_Text_FamilyTopStar = new BKText
//		{
//			size = "66%,20";
//			left = parent.s_Img_FamilyTopStar.left + parent.s_Img_FamilyTopStar.width + 10;
//			top = parent.s_Img_FamilyTopStar.top-3;
//		}
		//创建日期
		staticvar s_Img_FamilyCreateDate = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/cjrq-text.tga";
			left = parent.s_Img_FamilySorce.left;
			top = parent.s_Img_FamilySorce.top + parent.s_Img_FamilySorce.height + 15;
		}
		staticvar s_Text_FamilyCreateDate = new BKText
		{
			size = "66%,20";
			left = parent.s_Img_FamilyCreateDate.left + parent.s_Img_FamilyCreateDate.width + 10;
			top = parent.s_Img_FamilyCreateDate.top-3;
		}
		//家族徽章
		staticvar s_Img_FamilyBadge = new img
		{
			src = "$./../imgs"+window.g_Sex+"/Info/jzhz-text.tga";
			left = parent.s_Img_FamilyCreateDate.left;
			top = parent.s_Img_FamilyCreateDate.top + parent.s_Img_FamilyCreateDate.height + 15;
		}
		staticvar s_BadgeDesignResult = new item
		{
			size = "50,50";//bgcolor = "#ff";
			left = parent.s_Img_FamilyBadge.left + parent.s_Img_FamilyBadge.width + 15;
			top = parent.s_Img_FamilyBadge.top +3;
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
			//[功能]显示徽章图
			//[参数]data1：外框标志，data2：徽章等级，data3：图片索引，data4：内框标志，data5：徽章等级，data6：图片索引
			//[返回值]无
			void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
			{
				s_Badge_Out.src = "$./../imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
				s_Badge_In.src = "$./../imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
			}
		}
		//取消
		staticvar s_Btn_Cancle = new VBTN_A_New
		{
			InitText("取消");
			valign(95,0);halign(90,0);
		}
	}
}