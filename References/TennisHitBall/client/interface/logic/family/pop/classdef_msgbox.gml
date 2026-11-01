//家族弹出信息框
//夏洋洋 2010-3-3

//提示信息框
class VMB_FamilyPopUpTipInfo_Logic VMyMessageBox_1_Logic
{
	name = "VMB_FamilyPopUpTipInfo_Logic";
	function VMB_FamilyPopUpTipInfo_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//等级不足无法创建家族
class VMB_CreateFamily_NotEnoughLel_Logic VMyMessageBox_1_Logic
{
	name = "VMB_CreateFamily_NotEnoughLel_Logic";
	function VMB_CreateFamily_NotEnoughLel_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
		window.find("CREATEFAMILY_LOGIC").del();
	}
}

//家族名称不能为空
class VMB_CreateFamily_FamilyNameNull_Logic VMyMessageBox_1_Logic
{
	name = "VMB_CreateFamily_FamilyNameNull_Logic";
	function VMB_CreateFamily_FamilyNameNull_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//家族名称已存在或包含不可用字符
class VMB_CreateFamily_FamilyNameErr_Logic VMyMessageBox_1_Logic
{
	name = "VMB_CreateFamily_FamilyNameErr_Logic";
	function VMB_CreateFamily_FamilyNameErr_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//您需要退出当前家族再进行创建/申请
class VMB_CreateFamily_HaveFamily_Logic VMyMessageBox_1_Logic
{
	name = "VMB_CreateFamily_HaveFamily_Logic";
	function VMB_CreateFamily_HaveFamily_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}

//家族名称已存在或包含不可用字符
class VMB_CreateFamily_NotEnoughMoney_Logic VMyMessageBox_1_Logic
{
	name = "VMB_CreateFamily_NotEnoughMoney_Logic";
	function VMB_CreateFamily_NotEnoughMoney_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}

//满足创建家族所有条件
class VMB_CreateFamily_Ok_Logic VMyMessageBox_2_Logic
{
	name = "VMB_CreateFamily_Ok_Logic";
	
	//construct
	function VMB_CreateFamily_Ok_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
		del();
		window.find("CREATEFAMILY_LOGIC").del();
	}
}

//邀请加入家族
class VMB_ApplyForFamily_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ApplyForFamily_Logic";

	//construct
	function VMB_ApplyForFamily_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Askadd(GetSrc());
		del();
	}

	//得到输入框的内容
	void GetSrc()
	{
		return _Box.s_Edit.src;
	}
	set _Box
	{
		void Init()
		{
			//昵称输入框
			staticvar s_Edit = new BaseEdit
			{}
		}
		inclass("VMB_ApplyForFamily_UI");//界面显示类
		Init();
	}
}
//=======================申请信息==============================
//等级不足无法申请加入家族
class VMB_ApplyFamily_NotEnoughLel_Logic VMyMessageBox_1_Logic
{
	name = "VMB_ApplyFamily_NotEnoughLel_Logic";
	function VMB_ApplyFamily_NotEnoughLel_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//发出申请
class VMB_PostApplyInfo_Logic VMyMessageBox_1_Logic
{
	name = "VMB_PostApplyInfo_Logic";
	function VMB_PostApplyInfo_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//================退出家族提示======================
//您是本家族的族长，不能退出，您可以把族长权限转让给他人再进行退出操作
class VMB_HeaderLeaveFamily_Logic VMyMessageBox_1_Logic
{
	name = "VMB_HeaderLeaveFamily_Logic";
	function VMB_HeaderLeaveFamily_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
}
//您是本家族的管理员，确定要退出吗
class VMB_AssistantLeaveFamily_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AssistantLeaveFamily_Logic";
	
	//construct
	function VMB_AssistantLeaveFamily_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Leave();
		del();
	}
}
//您确定要退出本家族吗
class VMB_PeopleLeaveFamily_Logic VMyMessageBox_2_Logic
{
	name = "VMB_PeopleLeaveFamily_Logic";
	
	//construct
	function VMB_PeopleLeaveFamily_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Leave();
		del();
	}
}
//====================解散家族提示======================
//您的退出将会使家族解散，您确定要退出吗
class VMB_DismissFamily_Logic VMyMessageBox_2_Logic
{
	name = "VMB_DismissFamily_Logic";
	
	//construct
	function VMB_DismissFamily_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Dismiss();
		del();
	}
}
//======================收到邀请提示============================
class VMB_GetFamilyInvite_Logic VMyMessageBox_2_Logic
{
	name = "VMB_GetFamilyInvite_Logic";

	//construct
	function VMB_GetFamilyInvite_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Recinvite(window.FamilyInviterID,window.FamilyInviteID,window.FAMILY_INVITE_AGREE);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		window.F_Family_Recinvite(window.FamilyInviterID,window.FamilyInviteID,window.FAMILY_INVITE_NOTAGREE);
		del();
	}

	SetBtn_ConfirmName("同意");
	SetBtn_CancelName("拒绝");
}
//========================申请加入提示=================================
class VMB_ApplyFamily_OK_Logic VMyMessageBox_1_Logic
{
	name = "VMB_ApplyFamily_OK_Logic";
	
	//construct
	function VMB_ApplyFamily_OK_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}
}
class VMB_ApplyFamily_Refuse_Logic VMyMessageBox_1_Logic
{
	name = "VMB_ApplyFamily_Refuse_Logic";
	
	//construct
	function VMB_ApplyFamily_Refuse_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}
}
//============================家族设置提示===============================
class VMB_FamilySet_OK_Logic VMyMessageBox_1_Logic
{
	name = "VMB_FamilySet_OK_Logic";
	
	//construct
	function VMB_FamilySet_OK_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}
}
//========================请离家族提示==========================
class VMB_KickFamily_Logic VMyMessageBox_1_Logic
{
	name = "VMB_KickFamily_Logic";
	
	//construct
	function VMB_KickFamily_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}
}
//================右键一些操作的弹出框=====================
//任命/撤销家族执行官
class VMB_FamilyAssisant_Logic VMyMessageBox_2_Logic
{
	name = "VMB_FamilyAssisant_Logic";

	//construct
	function VMB_FamilyAssisant_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Modifypopedom(window.FamilyBeAssistantName,window.FamilyBeAssistantFlag);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
}
//请离成员
class VMB_Family_Kick_Logic VMyMessageBox_2_Logic
{
	name = "VMB_Family_Kick_Logic";

	//construct
	function VMB_Family_Kick_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Kick(window.FamilyKickUID);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
}
//转让权限
class VMB_Family_Transfert_Logic VMyMessageBox_2_Logic
{
	name = "VMB_Family_Transfert_Logic";

	//construct
	function VMB_Family_Transfert_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.F_Family_Transfer(window.FamilyTransferName);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
}

//家族活动报名时防沉迷的提示框
class VMyMB_FamiArenaFCM_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_FamiArenaFCM_Logic";
	//construct
	function VMyMB_FamiArenaFCM_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("UIController").LoadUI("UI_FAMILYCOMPETE_SINGLE");
		del();
	}
	void OnCancel()
	{
		del();
	}

};
