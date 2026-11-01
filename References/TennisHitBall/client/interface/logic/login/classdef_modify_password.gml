//
//修改密码界面的逻辑部分类定义
//

importex("$./../../UI/Login/ClassDef_Modify_Password.gml");

class VModify_PW_Logic item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;capturemouse=true;
	valign(50,0);halign(50,0);
	var m_FocusPos = 0; //1用户名 2旧密码 3新密码1 4新密码2
	//=========================与界面交互=========================
	void Init()
	{
		//用户名:edit
		staticvar s_Edit_UserName = new edit
		{
			size = "220,26";pos = "110,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			timer(10,"hot=1");
		}
		//原始密码:edit
		staticvar s_Edit_PassWord_Old = new edit
		{
			size = "220,26";pos = "110,91";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			password = true;
		}
		//新密码1:edit
		staticvar s_Edit_PassWord_New1 = new edit
		{
			size = "220,26";pos = "110,150";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			password = true;
		}
		//新密码2:edit
		staticvar s_Edit_PassWord_New2 = new edit
		{
			size = "220,26";pos = "110,200";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			password = true;
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			valign(98,0);halign(20,0);
			Init("确定");
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			valign(98,0);halign(80,0);
			Init("取消");
		}
	}
	
	inclass("VModify_PW_UI");//界面显示类
	//============================function===============================
	//点击了确定
	void OnClick_BtnConfirm()
	{
		if (s_Edit_UserName.src == "")
		{
			window.find("UIController").LoadDLG(401);//用户名不能为空，请输入用户名！
			SetUserNameHot();
			return;
		}
		if (s_Edit_PassWord_Old.src == "")
		{
			window.find("UIController").LoadDLG(432);//旧密码不能为空
			SetPassWordOldHot();
			return;
		}
		if (s_Edit_PassWord_New1.src == "")
		{
			window.find("UIController").LoadDLG(433);//新密码不能为空!
			SetPassWordNew1Hot();
			return;
		}
		if (s_Edit_PassWord_New2.src == "")
		{
			window.find("UIController").LoadDLG(433);//新密码不能为空!
			SetPassWordNew2Hot();
			return;
		}
		if (s_Edit_PassWord_New1.src != s_Edit_PassWord_New2.src)
		{
			window.find("UIController").LoadDLG(434);//两次输入不一致,注意密码区分大小写！
			SetPassWordNew1Hot();
			s_Edit_PassWord_New1.src = "";
			s_Edit_PassWord_New2.src = "";
			return;
		}
		//参数:登陆用户名,登陆密码,修改后的密码
		var _Param = ""+s_Edit_UserName.src+","+s_Edit_PassWord_Old.src+","+s_Edit_PassWord_New1.src;
		window.Too_modify_password(_Param);
	}
	//1用户名 2旧密码 3新密码1 4新密码2
	//设置焦点-用户名
	void SetUserNameHot(){timer(10,"s_Edit_UserName.hot=1");m_FocusPos = 1;}
	//设置焦点-旧密码
	void SetPassWordOldHot(){timer(10,"s_Edit_PassWord_Old.hot=1");m_FocusPos = 2;}
	//设置焦点-新密码1
	void SetPassWordNew1Hot(){timer(10,"s_Edit_PassWord_New1.hot=1");m_FocusPos = 3;}
	//设置焦点-新密码2
	void SetPassWordNew2Hot(){timer(10,"s_Edit_PassWord_New2.hot=1");m_FocusPos = 4;}
	
	void ChangeHot()
	{
		switch (m_FocusPos)
		{
		case 0:{SetUserNameHot();break;}
		case 1:{SetPassWordOldHot();break;}
		case 2:{SetPassWordNew1Hot();break;}
		case 3:{SetPassWordNew2Hot();break;}
		case 4:{SetUserNameHot();break;}
		}
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Confirm//确定：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
				{
					parent.OnClick_BtnConfirm();
				}
			}
		}
		set s_Btn_Cancel//取消：按钮
		{
			void OnPressed(){parent.parent.del()();}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
		timer(100,"ChangeHot");
	}
};