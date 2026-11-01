//我的家族界面
//夏洋洋 2010-3-2

class VMyFamily_UI item
{
	pos = "0,0";
	size="100%,100%";//bgcolor = "#ff";

	void Init()
	{
	//=================拥有家族的显示部分======================
		staticvar s_HaveFamilyContent = new item
		{
			size="100%,100%";show=false;

			//退出家族
			staticvar s_Btn_OutFamily = new VBTN_A_New
			{
				InitText("退出家族");
				halign(95,0);valign(7,0);
			}
			//标签背景
			staticvar s_Bk_FamilyLabel = new VPic3_FamilyLabelBK_UI
			{
				pos = "27,70";
				size = "90%,23";
			}
			//家族大厅
			staticvar s_R_FamilyHall = new VRadio_FamilyHall{pos="30,70";}
			new MallRadioLine{pos = "110,75";};
			//家族信息
			staticvar s_R_FamilyInfo = new VRadio_FamilyInfo{pos="120,70";}
			new MallRadioLine{pos = "200,75";};
			//家族设置
			staticvar s_R_FamilySet = new VRadio_FamilySet{pos="210,70"};
			new MallRadioLine{pos = "290,75";};
			//申请信息
			staticvar s_R_FamilyApplyInfo = new VRadio_FamilyApplyInfo{pos = "300,70";};
			
			//比赛部分 底图
			staticvar s_Bg_FamilyCompete = new VPic9_FamilyCompeteBG_UI
			{
				size = "93%,90";
				valign(94,0);
				left = parent.s_R_FamilyHall.left - 7;
			}
			//家族比赛 字
			staticvar s_Img_FamilyCompete = new img
			{
				src = "$./imgs"+window.g_Sex+"/jzbs-text.tga";
				valign(94,0);
				left = parent.s_R_FamilyHall.left;
			}
			//家族个人赛
			staticvar s_Btn_Family_Single = new VBTN_Family_Family_Single
			{
				left = parent.s_Img_FamilyCompete.left + parent.s_Img_FamilyCompete.width + 4;
				top = parent.s_Img_FamilyCompete.top;
			}
			//家族双人赛
			staticvar s_Btn_Family_Double = new VBTN_Family_Family_other
			{
				left = parent.s_Btn_Family_Single.left + parent.s_Btn_Family_Single.width + 4;
				top = parent.s_Btn_Family_Single.top;
			}
			//家族对抗赛
			staticvar s_Btn_FamilyToFamily = new VBTN_Family_Family_other
			{
				left = parent.s_Btn_Family_Double.left + parent.s_Btn_Family_Double.width + 4;
				top = parent.s_Btn_Family_Double.top;
			}
			//俱乐部联赛
			staticvar s_Btn_Family_LeagueMatch = new VBTN_Family_Family_other
			{
				left = parent.s_Btn_FamilyToFamily.left + parent.s_Btn_FamilyToFamily.width + 4;
				top = parent.s_Btn_FamilyToFamily.top;
			}
			//未知联赛
			staticvar s_Btn_Family_UnknownMatch = new VBTN_Family_Family_other
			{
				left = parent.s_Btn_Family_LeagueMatch.left + parent.s_Btn_Family_LeagueMatch.width + 4;
				top = parent.s_Btn_Family_LeagueMatch.top;
			}

		}
	//=================没有家族的显示部分======================
		staticvar s_NoFamilyContent = new item
		{
			//界面上的三个背景块
			size = "100%,100%";show=false;
			staticvar s_NoFamilyContent_BG = new VPic9_FamilyCreateBK_UI
			{	
					bgcolor = "fff0";
					size = "587,145";
					pos = "30,90";
			}
			staticvar s_NoFamilyContent_BG_L = new VPic9_FamilyCreateBK_UI
			{	
					bgcolor = "fff0";
					size = "285,185";
					pos = "30,250";
			}
			staticvar s_NoFamilyContent_BG_R = new VPic9_FamilyCreateBK_UI
			{	
					bgcolor = "fff0";
					size = "285,185";
					pos = "332,250";
			}
			
			//提示信息
			staticvar s_Text_NoFamilyTipUp = new BaseText
			{
				size = "80%,20%";
				color = "#FF0000";
				font = "宋体,-1,12";
				autoenter = true;
				valign(30,0);halign(38,0);
				SetData("您尚未加入家族！！赶快升到6级体验家族吧。");
			};
			staticvar s_Text_NoFamilyTipMinddle = new BaseText
			{
				size = "80%,20%";
				color = "#0";
				font = "宋体,-1,12";
				autoenter = true;
				valign(36,0);halign(38,0);
				SetData("您加入一个家族后可以更容易的结交志趣相投的好友。

您可以和家族成员一起拼搏，参加个人赛，为家族争光。

您还可以参与家族任务，得到家族奖励。");
			};
			staticvar s_Text_NoFamilyTipDown_CreateFamily = new BaseText
			{
				size = "80%,20%";
				color = "#0";
				font = "宋体,-1,12";
				autoenter = true;
				valign(73,0);halign(50,0);
				SetData("如果您希望拥有一个属于自己的家族，

请点击创建家族按钮。");
			};
			staticvar s_Text_NoFamilyTipDown_AddFamily = new BaseText
			{
				size = "80%,20%";
				color = "#0";
				font = "宋体,-1,12";
				autoenter = true;
				valign(73,0);halign(280,0);
				SetData("如果希望加入一个家族，请点击加入家族，

右键点击您想加入的家族，选择申请加入。");
			};
			//红字部分
			staticvar s_Text_NoFamilyTipDown_CreateFamily_Limit = new BaseText
			{
				size = "80%,20%";
				color = "#FF0000";
				font = "宋体,-1,12";
				autoenter = true;
				valign(89,0);halign(65,0);
				SetData("要求：等级10级，金币100000");
			};
			staticvar s_Text_NoFamilyTipDown_AddFamily_Limit = new BaseText
			{
				size = "80%,20%";
				color = "#FF0000";
				font = "宋体,-1,12";
				autoenter = true;
				valign(89,0);halign(330,0);
				SetData("要求：等级6级");
			};
			//创建家族 按钮
			staticvar s_Button_CreateFamily = new VBTN_A_New
			{
				InitText("创建家族");
				valign(80,0);halign(22,0);
			}
			//加入家族按钮
			staticvar s_Button_AddFamily = new VBTN_A_New
			{
				InitText("加入家族");
				valign(80,0);halign(76,0);
			}
		}
	}
}