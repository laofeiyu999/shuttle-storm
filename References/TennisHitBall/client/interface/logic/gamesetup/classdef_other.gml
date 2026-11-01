//
//其他 设置类定义
//

importex("$./../../UI/GameSetUp/ClassDef_Other.gml");

class VGameSetUp_Other_Logic COtherSet
{
	size = "400,400";pos = "0,100";bgcolor = "#FF";//enableUpdate(1);
	var m_NkNameState = 0;	//玩家昵称初始状态值保存 1为显示，0为不显示
	var m_FamilyState = 0;	//家族名称初始状态值保存 1为显示，0为不显示
	//=============================与界面交互========================================
	void Init()
	{
		//复选框：允许邀请游戏
		staticvar s_CHK_Invite = new VMyCheckBox
		{
			pos = "100,0";Init("√邀请");
		}
		//复选框：好友上下线
		staticvar s_R_FriendTip =  new VMyCheckBox
		{
			pos = "100,50";Init("√好友上线");
		}
//		//复选框：显示游戏中的聊天泡泡
//		staticvar s_R_ChatPP =  new VMyCheckBox
//		{
//			pos = "100,100";Init("聊天泡");
//		}
		//复选框：玩家昵称
		staticvar s_R_NkName =  new VMyCheckBox
		{
			pos = "100,100";Init("玩家昵称");
		}
		//复选框：家族名称
		staticvar s_R_Family =  new VMyCheckBox
		{
			pos = "100,100";Init("家族名称");
		}
	}
	inclass("VGameSetUp_Other_UI");//界面显示类
	//==============================function=========================================
	//恢复默认
	void ResumeDefault()
	{
		s_CHK_Invite.Check();
		s_R_FriendTip.Check();
		//s_R_ChatPP.Check();
		s_R_NkName.Check();
		s_R_Family.Check();
	}

	void Cancel()
	{
		if(m_NkNameState==1)
		{
			window.SetRolemodel_UserNameShowState(true);
		}
		else
		{
			window.SetRolemodel_UserNameShowState(false);
		}
		if(m_FamilyState == 1)
		{
			window.SetRolemodel_FamilyNameShowState(true);
		}
		else
		{
			window.SetRolemodel_FamilyNameShowState(false);
		}
	}

	//设置响应事件
	void SetEvent()
	{
		set s_CHK_Invite
		{
			if (parent.GetOtherSet(window.OTHER_INVITE) == 1)
			{
				startstate = 1;
			}
			void OnCheck(){MouseCheck();parent.SetOtherSet(window.OTHER_INVITE,1);}
			void OnUnCheck(){MouseUnCheck();parent.SetOtherSet(window.OTHER_INVITE,0);}
		}
		set s_R_FriendTip
		{
			if (parent.GetOtherSet(window.OTHER_FRIEND) == 1)
			{
				startstate = 1;
			}
			void OnCheck(){MouseCheck();parent.SetOtherSet(window.OTHER_FRIEND,1);}
			void OnUnCheck(){MouseUnCheck();parent.SetOtherSet(window.OTHER_FRIEND,0);}
		}
//		set s_R_ChatPP
//		{
//			if (parent.GetOtherSet(window.OTHER_CHATPAO) == 1)
//			{
//				startstate = 1;
//			}
//			void OnCheck(){MouseCheck();parent.SetOtherSet(window.OTHER_CHATPAO,1);}
//			void OnUnCheck(){MouseUnCheck();parent.SetOtherSet(window.OTHER_CHATPAO,0);}
//		}
		set s_R_NkName
		{
			if (parent.GetOtherSet(window.OTHER_NKNAME) == 1)
			{
				startstate = 1;parent.m_NkNameState = 1;
			}
			void OnCheck()
			{
				MouseCheck();parent.SetOtherSet(window.OTHER_NKNAME,1);
				window.SetRolemodel_UserNameShowState(true);
			}
			void OnUnCheck()
			{
				MouseUnCheck();parent.SetOtherSet(window.OTHER_NKNAME,0);
				window.SetRolemodel_UserNameShowState(false);
			}
		}
		set s_R_Family
		{
			if (parent.GetOtherSet(window.OTHER_FAMILY) == 1)
			{
				startstate = 1;parent.m_FamilyState = 1;
			}
			void OnCheck()
			{
				MouseCheck();parent.SetOtherSet(window.OTHER_FAMILY,1);
				window.SetRolemodel_FamilyNameShowState(true);
			}
			void OnUnCheck()
			{
				MouseUnCheck();parent.SetOtherSet(window.OTHER_FAMILY,0);
				window.SetRolemodel_FamilyNameShowState(false);
			}
		}
	}
	//================================DBList=========================================

	Init();
	SetEvent();
};