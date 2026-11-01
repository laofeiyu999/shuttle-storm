
class VTrainSingleWnd_UI VUIBG_UI
{
	size = "350, 300";bgcolor = -1;alpha = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/xl-bt-text.tga");
		InitClose();
		InitBtnBG();

		// 上背景
		new VPic9_BK2_UI{pos = "15, 35";size = ""+(parent.width-30)+", 135";}
		// 下背景
		new VPic9_BK2_UI{pos = "15, 190";size = ""+(parent.width-30)+", 45";}
		
		new VPic9_MsgBK_UI{pos = "20, 60";size = "310, 105";}// 上黑底
		// 训练说明
		new img{pos = "18, 40";src = "$./imgs" + window.g_Sex + "/xlsm-text.tga";}
		// 训练奖励
		new img{pos = "18, 172";src = "$./imgs" + window.g_Sex + "/xljl-text.tga";}
//		// 奖励物品
//		new img{pos = "28, 195";src = "$./imgs" + window.g_Sex + "/jlwp-text.tga";}
		// 奖励金币
		new img{pos = "28, 205";src = "$./imgs" + window.g_Sex + "/jljb-text.tga";}
		// 奖励经验
		new img{pos = "170,205";src = "$./imgs" + window.g_Sex + "/jljy-text.tga";}

		//训练类型
		//参数2 data2:对应数据库的图标名
		staticvar s_Type = new img
		{
			size(95,33);pos(337,135);
			void SetData(data1,data2)
			{
				src = "$./imgs"+window.g_Sex+"/"+data2+"1.tga";
			}
		}
		//训练类型说明
		//参数2 data2:说明
		staticvar s_Explain = new BaseText
		{
			size(290,85);pos = "30, 70";autoenter=true;
			void SetData(data1,data2)
			{
				src="  "+data2;
			}
		}
		
//		staticvar s_NUllBG_1 = new VGoodsIcon_GreyBG_UI{pos="39,215";}
//		staticvar s_NUllBG_2 = new VGoodsIcon_GreyBG_UI{pos="196,215";}

//		//奖励-物品
//		//参数1 data2:格式："物品ID1,数量,有效期;物品ID2,数量,有效期"
//		staticvar s_AwardGoods = new VContentIframe_UI{pos = "30, 215";size = ""+(parent.width-50)+", 140";}//bgcolor = "#FF";alpha = 70;
		//奖励金币
		//参数2 data2:金币数
		staticvar s_Award_Gold = new BaseText
		{
			size(100,15);pos = "100, 205";
			ycenter = true;//xcenter = true;bold=true;
//			if(window.g_Sex==2)
//			{
//				color = "#be0766";
//			}
//			else
//			{
//				color = "#002579s";
//			}
			
			void SetData(data1,data2){src=data2;}
		}
		//奖励经验
		//参数2 data2:
		staticvar s_Award_Exp = new BaseText
		{
			size(100,15);pos = "250, 205";
			ycenter = true;//xcenter = true;//bold=true;
			if(window.g_Sex==2)
			{
				color = "#be0766";
			}
			else
			{
				color = "#002579s";
			}
			void SetData(data1,data2){src=data2;}
		}
		//开始训练按钮
		staticvar s_Btn_BeginTrain = new VBTN_A_New{pos(30,parent.height-window.G_POP_BTN_POSY);InitText("训练");}		
		//返回按钮
		staticvar s_Btn_Return = new VBTN_A_New{pos(parent.width-110,parent.height-window.G_POP_BTN_POSY);InitText("取消");}
	}

	//设置结算奖励画面(完成一次后不给物品奖励)
	void SetSingleWnd()
	{
//		_bk.src="$./imgs"+window.g_Sex+"/d_4.tga";
//		s_Award_Icon.show=false;
//		s_Award_Name.show=false;
//		s_Award_Period.show=false;
//		_ItemBK.show=false;
//		s_Award_Gold.pos(381,456);
//		s_Award_Exp.pos(504,456);
	}
};