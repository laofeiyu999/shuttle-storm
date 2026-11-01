//好友右键发送消息弹出框-显示类定义
//yxf 2008年11月9日

class VPop_SendMsg_UI VUIBG_UI
{
	size = "0%,0%";size = "348,466";bgcolor = -1;alpha = 50;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=========================与界面交互=========================
	void Init()
	{
		OpenDrag();
		SetTitalPos("25,0");
		InitBG("$./../imgs" + window.g_Sex + "/xx-bt-text.tga");
		InitBtnBG();
		InitClose();
		
//		new img
//		{
//			src = "$./../imgs"+window.g_Sex+"/fjr-text.tga";pos="65,46";
//		}
		// 收件人
		new VListBG2_UI
		{
			size = "315,20";pos="15,38";
		}
		
		//收件人
		staticvar s_TEXT_Receiver = new html
		{
			
			size = "145,20";
			pos = "3,31";
			var _body = new body{}
			void SetData(_nkname)
			{
				_body.delallchild();
				_body.appendHtml("<font color = #000000 size=12px>你正在与</font><font color=#ff0000 size=12px>"+_nkname+"</font><font color = #000000 size=12px>进行对话：</font>");
			}
//			ycenter = true;xcenter = true;
//			size = "145,20";pos="65,45";xcenter = true;
			//src = "侧认识的撒旦";

		}

		new VPic9_BK2_UI{size = "319, 192";pos = "14, 69";}

		//清楚记录：按钮
		staticvar s_Btn_Clear = new VBTN_58_New
		{
			InitText("清除内容");pos="29,264";
		}

		//表情：按钮
		staticvar s_Btn_Face = new VBTN_ChatBrow_New
		{
			pos="93,263";
		}
		
		new VPic9_BK2_UI{size = "319, 116";pos = "14, 285";}
	
		//输入框底
		new VPic9_MsgBK_UI
		{
			pos="17,288";size = "315,110";bgcolor = -1;
		}
		
		//输入框
		staticvar s_EDIT_YourWord = new BaseEdit
		{
			pos="18,289";size = "312,108";maxsize = 100;//bgcolor = "#FF";
			autoenter = true;ycenter = false;xcenter = false;
		}

		//发送：按钮
		staticvar s_Btn_Send = new VBTN_A_New
		{
			InitText("发送");pos(30,parent.height-window.G_POP_BTN_POSY);//pos="40,408";
		}
		//关闭：按钮
		staticvar s_Btn_CloseX = new VBTN_A_New
		{
			InitText("关闭");pos(parent.width-110,parent.height-window.G_POP_BTN_POSY);//pos="240,408";
		}
	}


	//换标题(在“消息”和“GM消息”之间切换)
	void SetGMMsgTitle()
	{
		InitBG("$./../imgs" + window.g_Sex + "/cmxx-text.tga");
	}
};