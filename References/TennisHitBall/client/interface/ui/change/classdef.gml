//兑换的显示类定义
//yangxf 2009年5月26日
//

class VChange_UI item
{
	size = "406,401";pos = "40,200";bgcolor = -1;alpha = 0;
	//=============================与界面交互========================================
	void Init()
	{	
		new img
		{
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_title.tga";
			size = "406,56";
		}
		new VEnter_Game_BK_UI
		{
			size(406,350);
			valign(100,0);
			halign(50,0);
		}
		new img
		{
			size = "342,180";pos="32,129";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/BK_S.tga";
		}
		new img
		{
			pos="44,145";
			src = "$./imgs"+window.g_Sex+"/text.tga";
		}
		new img
		{
			pos="114,143";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_inputbk.tga";
		}
		new img
		{
			pos="114,173";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_inputbk.tga";
		}
		new img
		{
			pos="114,205";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_inputbk.tga";
		}
		new img
		{
			pos="114,237";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_inputbk.tga";
		}
		new img
		{
			pos="114,270";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/change_inputbk.tga";
		}
		//物品名字
		staticvar s_Name = new text
		{
			font = "黑体,-1,20";color = "#000000";
			bold = true;pos="17,80";
			void SetData(_src)
			{
				src = _src;
			}
			//SetData("恭喜你获得T恤一件！");
		}
		new text
		{
			font = "黑体,-1,16";color = "#FFFFFF";pos="17,102";
			src = "请在下面输入您的联系方式我们将把物品邮寄给您。";
		}
		//输入框:姓名
		staticvar s_EDIT_Name = new VMyEdit
		{
			pos="115,146";size = "216,27";maxsize = 12;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			font = "宋体,-1,20";//canenter = true;
		}
		//输入框:电话
		staticvar s_EDIT_Phone = new VMyEdit
		{
			pos="115,176";size = "216,27";maxsize = 12;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			font = "宋体,-1,20";//bgcolor = "#FF";canenter = true;
			onlynumber = true;
			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}
		}
		//输入框:联系地址
		staticvar s_EDIT_Address = new VMyEdit
		{
			pos="115,208";size = "216,27";maxsize = 120;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			font = "宋体,-1,20";//bgcolor = "#FF";canenter = true;
		}

		//输入框:邮政编码
		staticvar s_EDIT_mailcode = new VMyEdit
		{
			pos="115,240";size = "216,27";maxsize = 6;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			font = "宋体,-1,20";
			onlynumber = true;
			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}
		}
		//输入框:邮箱
		staticvar s_EDIT_email = new VMyEdit
		{
			pos="115,274";size = "216,27";maxsize = 30;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			font = "宋体,-1,20";//bgcolor = "#FF";canenter = true;
		}

		//确认并提交：按钮
		staticvar s_Btn_ConfirmPutin = new VBTN_ChangePutIn
		{
			pos="44,325";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_Esc
		{
			pos="240,325";
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VBTN_CloseWindow
		{
			valign(4,0);
			halign(95,0);			
		}
	}
};