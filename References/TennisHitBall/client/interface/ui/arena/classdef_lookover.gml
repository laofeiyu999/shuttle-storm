//活动场 > 查看窗口
//

class VArena_LookOver_UI VUIBG_UI
{
	size = "352,460";bgcolor=-1;alpha=-1;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/hdsmjjl-bt-text.tga");
		InitClose();
		InitBtnBG();
//		InitHelp();

		// 上方框
		new VPic9_BK2_UI{pos="15,36";size=""+(parent.width-30)+",305";};
		// 下方框
		new VPic9_BK2_UI{pos="15,345";size=""+(parent.width-30)+",50";};

		// 报名费
		new img{pos="37,365";src="$./imgs"+window.g_Sex+"/bmfy-text.tga";};
		//活动说明与奖励
		//param1:说明
		//param:物品奖励(格式:"物品ID1,数量,有效期;物品ID2,数量,有效期")
		staticvar s_Desc_Award = new VContentIframe_UI{pos = "25,46";size = ""+(parent.width-40)+",285";}

		//报名费用
		//param1:数值(100等) 免费时 值为0
		//param2:钱的类型文字(金币，点券，免费)
		staticvar s_Fare = new BKText
		{
			pos="127,362";
			size="175,20";
			xcenter = true;ycenter=true;
			
			void SetData(data1,data2)
			{
				if(toint(data1)==0){src = data2;}
				else{src = ""+data1+data2;}
			}
		}

		//报名：按钮
		staticvar s_Btn_Apply = new VBTN_A_New
		{
			InitText("报名");pos(30,parent.height-window.G_POP_BTN_POSY);
		}
		//返回：按钮
		staticvar s_Btn_Return = new VBTN_A_New
		{
			InitText("返回");pos(parent.width-110,parent.height-window.G_POP_BTN_POSY);
		}
	}
};