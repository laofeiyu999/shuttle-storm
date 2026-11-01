importex("$./../../../UI/Family/pop/ClassDef_InviteToFamily.gml");

class VInviteToFamily_Logic item
{
	//size = "100%,100%";bgcolor = -1;alpha = 0;
	name = "VInviteToFamily_Logic";
	window.find("gameinput").AddExclusiveShortcutUser(this);//添加快捷键独占用户
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VInviteToFamily_Logic");//不激活聊天
	//================================与显示交互=============================
	void Init()
	{
		staticvar s_Edit = new BaseEdit
		{}
		staticvar s_Btn_Ok = new VBTN_A_New
		{}
		staticvar s_Btn_Cancle = new VBTN_A_New
		{}
		staticvar s_Btn_Close = new VBTN_Close_New
		{}
	}
	inclass("VInviteToFamily_UI");
	
	void SetEvent()
	{
		set s_Btn_Ok
		{
			void OnPressed()
			{
				var _name = parent.GetSrc();
				window.F_Family_Askadd(_name);
				parent.parent.del();
			}
			
		}
		set s_Btn_Cancle
		{
			void OnPressed()
			{
				parent.parent.del();
			}
		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed()
			{
				parent.parent.del();
			}
		}
	}

	void GetSrc()
	{
		return s_Edit.src;
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				parent.del();
				break;
			}
			case 4: //Enter
			{
				var _name = GetSrc();
				window.F_Family_Askadd(_name);
				parent.del();
				break;
			}
		}
	}

	void OnDelete()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VInviteToFamily_Logic");//能激活聊天
		window.find("gameinput").DelShortcutUser(this);
	}

	Init();
	SetEvent();
};