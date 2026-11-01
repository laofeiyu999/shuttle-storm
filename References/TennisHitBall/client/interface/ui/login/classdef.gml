//登录界面的显示部分类定义
//@刘高辰
//08年8月22日

class VLogin_UI item
{
	size = "320,230";bgcolor = -1;
	valign(50,-5);halign(50,-5);

	void Init()
	{
		//透明背景
		new VUIBG_UI{pos = "10,10";size = "100%,100%,-10,-10";SetTitalPos("25,0");InitBG("$./imgs"+window.g_Sex+"/new/tital.tga");};

		new VPic9_BK2_UI{pos = "33,50";size = "100%,100%,-60,-100";}
		//账号
		new img{pos = "60,70";src = "$./imgs"+window.g_Sex+"/new/zh-text.tga";}
		//密码
		new img{pos = "60,120";src = "$./imgs" + window.g_Sex + "/new/mm-text.tga";}

		//输入框背景
		new VPic3_Login_EditBK_UI{size = "150,32";pos = "100,69";}
		new VPic3_Login_EditBK_UI{size = "150,32";pos = "100,119";}
		//帐号:edit
		staticvar s_Edit_UserName = new BaseEdit
		{
			size = "150,18";pos = "100,69";
			maxsize = 40;
			timer(10,"SetCuror");

			void SetCuror()
			{
				hot=1;
				setCursorIndex(src.Count);
			}
		}
		new img
		{
			size = "14,14";
			src = "$./imgs" + window.g_Sex + "/new/r.tga";
			pos = "100,72";
		}
		//密码:edit
		staticvar s_Edit_PassWord = new BaseEdit
		{
			size = "150,18";pos = "100,119";
			maxsize = 20;password = true;
		}
		new img
		{
			size = "14,14";
			src = "$./imgs" + window.g_Sex + "/new/s.tga";
			pos = "100,122";
		}
		//忘记密码
//		staticvar s_ForgetPW = new VLogin_UnderlineText_UI//带下划线的文字
//		{
//			pos = "200,147";src = "忘记密码";
//		}
		//记住密码CHECKBOX
		staticvar s_CHK_RememberPW = new VCK_CK_New
		{
			pos ="180,150";
		}
		new BaseText
		{
			pos = "200,150";size = "60,12";src = "记住账号";
		}
		//登陆：按钮
		staticvar s_Btn_Login = new VBTN_A_New
		{
			valign(100,-20);halign(50,5);InitText("登录");
		}
	}
};
class VLogin_UnderlineText_UI BaseText
{
	size = "60,16";ycenter = true;drawstarty=1;txtunderline=1; 
	void SetSrc(data)
	{
		src = data;size(src.Count*6,16);
	}
	void OnMouseOver()
	{
		color = "#FF0000";cursor = window.CURSOR_HAND;
	}
	void OnMouseOut()
	{
		color = "#0";cursor = window.CURSOR_ARROW;
	}
	void OnMouseDownL()
	{
		color = "#FF";
		MouseLDownFunc();
	}
	void OnLBDClick()
	{
		color = "#FF";
		MouseLDownFunc();
	}
	void OnMouseDownR()
	{
		color = "#FF";
		MouseRDownFun();
	}
	//在下面干事情
	//左键点
	void MouseLDownFunc()
	{
		
	}
	//右键点
	void MouseRDownFun()
	{
		
	}
};