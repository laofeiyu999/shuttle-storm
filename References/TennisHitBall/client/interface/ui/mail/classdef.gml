//
//邮件界面的显示类定义
//

class VMail_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;
	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/yx-bt-text.tga");
		InitClose();
		InitHelp();
		
		new VPic9_BK2_UI{size = "617, 445"pos = "14, 32";}

		//留言底
		new VPic9_MsgBK_UI
		{
			pos="385,45";size = "237,195";
			bgcolor = -1;
		}

		//物品底
		new VPic9_MsgBK_UI
		{
			pos="385,245";size = "237,170";
			bgcolor = -1;
		}

		//按钮底
		new VPic3_ButtonBK_UI
		{
			pos="385,421";size = "237,60";
			//bgcolor = "#FF";
		}

		new VPic3_GreyTop_UI
		{
			size = "365, 32";//bgcolor = "#FF";
			pos = "16, 45";

			// 礼品
			new img
			{
				src = "$./imgs" + window.g_Sex + "/lp-text.tga";
				pos="321,8";

			}
			// 全部
			new img
			{
				src = "$./imgs" + window.g_Sex + "/qb-text.tga";
				pos="25,8";
			}
			// 日期
			new img
			{
				src = "$./imgs" + window.g_Sex + "/rq-text.tga";
				pos="275,8";
			}
			// 发件人
			new img
			{
				src = "$./imgs" + window.g_Sex + "/fjr-text.tga";
				pos="80,8";
			}
			// 主题
			new img
			{
				src = "$./imgs" + window.g_Sex + "/zt-text.tga";
				pos="182,8";
			}
		}

		//复选框：全部选择
		staticvar s_CHK_AllChoose = new VCK_CK_New
		{
			pos = "23, 50"
		}

		//翻页：邮件
		staticvar s_PageCtrl = new VPageCtrl_Base_UI
		{
			pos = "150, 400"
		}

		//添加好友：按钮
		staticvar s_Btn_Add_Friend = new VBTN_A_New
		{
			InitText("加为好友");
			pos = "130, 440";
		}
		//删除：按钮
		staticvar s_Btn_Del = new VBTN_A_New
		{
			InitText("删除");
			pos = "215, 440"
		}
		//写邮件：按钮
		staticvar s_Btn_WriteMail = new VBTN_A_New
		{
			InitText("写邮件");
			pos = "300, 440"
		}
		//接收：按钮
		staticvar s_Btn_Receive = new VBTN_A_New
		{
			InitText("接收");pos = "530, 360"
		}

		//留言内容
		//参数 data1:
		staticvar s_Message = new item
		{
			pos="385,45";size = "237,190";scroll = window.SCROLL_NOTENNIS; 
			//bgcolor = "#FF";
			var _text = new BaseText{pos = "10,10";size = "227,175";autoheight = true;autoenter = true;}

			void SetData( p1)
			{
				_text.src = p1;
			}
		}


		//图标
		//参数 data1: 物品的识别ID
		//参数 data2: 物品的赠送ID
		staticvar s_GID = new VGoodsIconNew_Logic//VIconMgr_Logic
		{
			show = false;
			pos="397,260";//bgcolor = "#FF";
			SetHasHangWnd(false);// 去掉悬停框.
		}

		//物品描述
		//参数 sendName：谁送你的
		//参数 ItemName：什么东西
		//参数 time：多少天后消失
		staticvar s_Desc = new BaseText
		{
			pos="510,260";size = "100, 95";autoenter = true;//bgcolor = "#FF";

			void SetData( p1, p2, p3)
			{
				//printf("B# s_Desc:p1:"+p1+",p2:"+p2+",p3:"+p3);
				src = "[" + p1 + "]送您[" + p2 + "]物品，请及时查收，未接收物品将于[" + p3 + "]天后消失。"; 
			}
		}
		//回复：按钮
		staticvar s_Btn_WriteBack = new VBTN_A_New
		{
			InitText("回复");
			pos="450,440";
		}
		//删除单个：按钮
		staticvar s_Btn_DelSingle= new VBTN_A_New
		{
			InitText("删除");
			pos="534,440";
		}
	}
};