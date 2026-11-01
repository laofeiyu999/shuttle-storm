//家族信息
//夏洋洋 2010-3-4

class VFamilyInfo_UI item
{
	size = "91%,56%";//bgcolor = "#ff";
	pos = "30,97";
	void Init()
	{
		//家族名称
		staticvar s_Img_FamilyName = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzmc-text.tga";
			pos = "30,7";
		}
		staticvar s_Text_FamilyName = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyName.left + parent.s_Img_FamilyName.width + 15;
			top = parent.s_Img_FamilyName.top-3;
		}
		//家族等级
		staticvar s_Img_FamilyLev = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzdj-text.tga";
			left = parent.s_Text_FamilyName.left + parent.s_Text_FamilyName.width + 50;
			top = parent.s_Img_FamilyName.top;
		}
		staticvar s_Text_FamilyLev = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyLev.left + parent.s_Img_FamilyLev.width + 15;
			top = parent.s_Img_FamilyLev.top-3;
		}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzqm-text.tga";
			left = parent.s_Img_FamilyName.left;
			top = parent.s_Img_FamilyName.top + parent.s_Img_FamilyName.height + 20;
		}
		staticvar s_Text_FamilySlogan = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilySlogan.left + parent.s_Img_FamilySlogan.width + 15;
			top = parent.s_Img_FamilySlogan.top-3;
		}
		//家族积分
		staticvar s_Img_FamilySorce = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzjf-text.tga";
			left = parent.s_Text_FamilySlogan.left + parent.s_Text_FamilySlogan.width + 50;
			top = parent.s_Img_FamilySlogan.top;
		}
		staticvar s_Text_FamilySorce = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilySorce.left + parent.s_Img_FamilySorce.width + 15;
			top = parent.s_Img_FamilySorce.top-3;

			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}
		//家族族长
		staticvar s_Img_FamilyHeader = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzzz-text.tga";
			left = parent.s_Img_FamilySlogan.left;
			top = parent.s_Img_FamilySlogan.top + parent.s_Img_FamilySlogan.height + 20;
		}
		staticvar s_Text_FamilyHeader = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyHeader.left + parent.s_Img_FamilyHeader.width + 15;
			top = parent.s_Img_FamilyHeader.top-3;
		}
		//家族排名
//		staticvar s_Img_FamilyTopStar = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/Info/jzpm-text.tga";
//			left = parent.s_Text_FamilyHeader.left + parent.s_Text_FamilyHeader.width + 50;
//			top = parent.s_Img_FamilyHeader.top;
//		}
//		staticvar s_Text_FamilyTopStar = new BKText
//		{
//			size = "30%,20";
//			left = parent.s_Img_FamilyTopStar.left + parent.s_Img_FamilyTopStar.width + 15;
//			top = parent.s_Img_FamilyTopStar.top-3;
//		}
		//家族徽章
		staticvar s_Img_FamilyBadge = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzhz-text.tga";
			left = parent.s_Img_FamilyHeader.left;
			top = parent.s_Img_FamilyHeader.top + parent.s_Img_FamilyHeader.height + 20;
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
				src = "$./pop/imgs"+window.g_Sex+"/k01.tga";
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
				s_Badge_Out.src = "$./imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
				s_Badge_In.src = "$./imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
			}
		}
		//创建日期
		staticvar s_Img_FamilyCreateDate = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/cjrq-text.tga";
			left = parent.s_Img_FamilySorce.left;
			top = parent.s_Img_FamilySorce.top + parent.s_Img_FamilySorce.height + 20;
		}
		staticvar s_Text_FamilyCreateDate = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyCreateDate.left + parent.s_Img_FamilyCreateDate.width + 15;
			top = parent.s_Img_FamilyCreateDate.top-3;
		}
		//所属俱乐部
		staticvar s_Img_FamilyClub = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/ssjlb-text.tga";
			left = parent.s_Img_FamilyCreateDate.left;
			top = parent.s_Img_FamilyCreateDate.top + parent.s_Img_FamilyCreateDate.height + 20;
		}
		staticvar s_Text_FamilyClub = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyClub.left + parent.s_Img_FamilyClub.width + 5;
			top = parent.s_Img_FamilyClub.top-3;
		}
		//家族成员
		staticvar s_Img_FamilyPeople = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/jzcy-text.tga";
			left = parent.s_Img_FamilyBadge.left;
			top = parent.s_Img_FamilyBadge.top + parent.s_Img_FamilyBadge.height + 60;
		}
		staticvar s_Text_FamilyPeople = new BKText
		{
			size = "30%,20";
			left = parent.s_Img_FamilyPeople.left + parent.s_Img_FamilyPeople.width + 15;
			top = parent.s_Img_FamilyPeople.top-3;

			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}
		//男女人数
		staticvar s_Img_FamilyBoyAndGirlNum = new img
		{
			src = "$./imgs"+window.g_Sex+"/Info/nvrs-text.tga";
			left = parent.s_Img_FamilyPeople.left;
			top = parent.s_Img_FamilyPeople.top + parent.s_Img_FamilyPeople.height + 20;
		}
		staticvar s_Text_FamilyBoyAndGirlNum = new VListBG2_UI
		{
			size = "30%,20";
			left = parent.s_Img_FamilyBoyAndGirlNum.left + parent.s_Img_FamilyBoyAndGirlNum.width + 15;
			top = parent.s_Img_FamilyBoyAndGirlNum.top-3;
			var _manIcon = new img
			{
				pos = "50,3";
				size = "15,15";
				src = "$./../SelfInfo/imgs"+window.g_Sex+"/boy.tga";
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
				src = "$./../SelfInfo/imgs"+window.g_Sex+"/girl.tga";
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
	}
}