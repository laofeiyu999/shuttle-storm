//写邮件
//


class VWriteMail_UI VUIBG_UI
{
	size = "0%,0%";size = "350,460";bgcolor = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/xyj-bt-text.tga");
		InitClose();
		
		new VPic9_BK2_UI{size = "322, 410"pos = "12, 35";}

		// 标题背景图
		new img
		{
			src = "$./imgs"+window.g_Sex+"/sjr-text.tga";
			pos="60,50";
		}
		// 收件人
		new VPic9_EditBK_UI
		{
			size = "145,20";
			pos="132,85";
		}
		// 标题
		new img
		{
			src = "$./imgs"+window.g_Sex+"/bt-text.tga";
			pos="60,85";
		}

		//留言底
		new VPic9_MsgBK_UI
		{
			pos="18,125";size = "310,265";bgcolor = -1;
		}

		//标题:edit
		staticvar s_Edit_Title = new BaseEdit
		{
			size = "145,20";pos="132,85";
			maxsize = 16;ycenter = true;xcenter = true;
		}
		//内容:edit
		staticvar s_Edit_Msg = new BaseEdit
		{
			size = "304,263";pos = "20,130";//bgcolor = "#FF";
			maxsize = 500;autoenter = true;canenter = true;ycenter = false;xcenter = false;
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			InitText("确定");pos="38,408";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos="238,408";
		}
		
		new item
		{
			size = "100%,100%";
			void OnClick()
			{
				parent.s_CB_FriendList.SetMyHide(false);
			}
		}
		//好友列表
		staticvar s_CB_FriendList = new VCombox_Friend_UI_Ex
		{
		}
	}
};