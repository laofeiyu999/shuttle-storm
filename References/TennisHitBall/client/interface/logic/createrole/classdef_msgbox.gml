//创建角色界面的提示框
//yxf 2008年10月21日

import("$./../../UI/CreateRole/ClassDef_MsgBox.gml");

//确定要创建角色吗？
class VMB_CreateRole_Logic VMyMessageBox_2_Logic
{
	name = "VMB_CreateRole_Logic";
	
	//为了防止在输入框里敲回车无奈而加 - 2009年12月12日 yxf
	var m_IsFirst = true;

	//construct
	function VMB_CreateRole_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	//type:1回车快捷键 0点击按钮
	void OnConfirm(type)
	{
		if (type == 1 && m_IsFirst)
		{
			m_IsFirst = false;
			return;
		}
		window.find("CREATE_ROLE_LOGIC")._VCreateRole_Logic.OnConfirm_CreateRole();
		del();
	}	

	set _Box
	{
		HideAllObj();
		inclass("VMB_CreateRole_UI");//界面显示类
		Init();
		SetEvent();
	}
	
	//创建角色用
	void OnCreated_EX()	
	{
		//window.find("CREATE_ROLE_LOGIC")._VCreateRole_Logic.m_CannotHot = true;
	}
	//创建角色用
	void OnDelete_EX()	
	{
		//只是为了能再使用创建角色的快捷键
		window.find("CREATE_ROLE_LOGIC")._VCreateRole_Logic.m_CannotHot = false;
	}
};