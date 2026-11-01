//
//创建角色界面-UI+Logic
//yxf 2008年8月25日10:36
//

importex("$./ClassDef.gml");
import("$./ClassDef_MsgBox.gml");

new item
{
	name = "CREATE_ROLE_LOGIC";size = "100%,100%";capturemouse = true;//enableUpdate(1);
	show = false;
	//==========================快捷键==================================
	window.find("gameinput").AddShortcutUser(this);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_CREATEROLE);
	void OnCreated()
	{
		timer(1000,"ShowCreateRole");//为了解决界面很卡的样子
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				window.OtherToChannelChoose();
				break;
			}
			case 4: //Enter
			{
				_VCreateRole_Logic.SetNkNameHot();
				break;
			}
		}
	}
	//====================================================================
	void ShowCreateRole()
	{
		window.find("UIController").LoadUI("UI_CREATE_ROLE_BG");
		window.find("UIController").LoadUI("UI_CREATE_ROLE_BTN");
		window.find("LOADING_LOGIC").del();//删除loading界面
		show = true;
		
		window.LMH1_CreateRoleShowModel();//引导事件
	}
	void PopMsgBox()
	{
		window.find("UIController").LoadDLG(17);//现在根据自己的喜欢创建角色吧！
	}
	
	
	var _Model = new VModelMgr_Logic
	{
		InitModel(window.MODEL_INIT_CREATEROLE);
	}

	var _Att_1 = new VRoleAttributeEx_Logic
	{
		Init();
	}
	var _Att_2 = new VRoleAttributeEx_Logic
	{
		show = false;
		Init();
	}

	var _Info = new VModelInfo_Logic
	{
		SetCreateRole();
	}
	var _VCreateRole_Logic = new VCreateRole_Logic{}
}