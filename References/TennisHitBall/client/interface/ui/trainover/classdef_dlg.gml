//训练结算提示框显示类


class VPlayOver_DLG_UI VUIBG_UI
{
	size = "0%,0%";size = "308,208";bgcolor = -1;alpha = -1;capturemouse = true;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	void Init()
	{
//		OpenDrag();
		SetTitalPos("25,0");
		InitBG("$./../GmlCtrls/VMessageBox/imgs"+window.g_Sex+"/tsxx.tga");
		InitBtnBG();
		
		new VPic9_BK2_UI{size = "100%,100%,-30,-102";pos = "15,36";}
		//说明文字
		//参数 data1:内容
		//接口:void SetData()
		staticvar s_TEXT_Explain = new BaseText
		{
			size = "100%,100%,-40,-102";autoenter = true;pos="20,36";
			//bgcolor ="#FF";alpha = 50;

			void SetData(data1)
			{
				if (data1.Count <= 36)
				{
					xcenter = true;ycenter = true;
					src = data1;
				}
				else
				{
					src = "    "+data1;xcenter = false;ycenter = true;
				}
			}
		}

		//按钮一
		//参数 data1:按钮名字
		//接口:void SetData()
		staticvar s_Btn_1 = new VBTN_A_New
		{
			pos="40,"+(parent.height-window.G_POP_BTN_POSY);
			void SetData(data1)
			{
				InitText(data1);
			}
		}

		//按钮二
		//参数 data1:按钮名字
		//接口:void SetData()
		staticvar s_Btn_2 = new VBTN_A_New
		{
			pos=""+(parent.width-120)+","+(parent.height-window.G_POP_BTN_POSY);
			void SetData(data1)
			{
				InitText(data1);
			}
		}
	}
};