//个人信息 Logic+UI
// yxf 2009年10月21日

importex("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "SELFINFO_LOGIC";enableUpdate(1);//capturemouse = true;
	var _LastPos = window.GetUIPos();	//记住上次的位置
	window.SetUIPos(window.POS_SELFINFO);
	
	//查询玩家的人气值
	window.F_getflower(window.g_SelfInfo_UID);

	//new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"SELFINFO_LOGIC");//不激活

		window.LMH1_Hall_Bottom_SelfInfo();	//引导事件
		window.SetSelfInfoOpenState(true);

		zindex = "top";
	}
	void OnDelete()
	{	
		window.find("gameinput").DelShortcutUser(this);
		//window.SetChatEnterFlag(window.CHAT_ENTER_YES,"SELFINFO_LOGIC");//能激活

		window.SetUIPos(_LastPos);	//将上次的位置设置回去
		window.ClearSelfInfoData();			//清空要查看的个人信息数据-关闭个人信息界面前必须调用
		window.SetSelfInfoOpenState(false);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
		}
	}
	//==================================================================
	var _VSelfInfo_Logic = new VSelfInfo_Logic{}

	//更新的是不同的人
	void UpDateSeleInfoData()
	{
		//查询玩家的人气值
		window.F_getflower(window.g_SelfInfo_UID);

		_VSelfInfo_Logic.m_Class_BaseInfo.ReadDataFromDB();
		_VSelfInfo_Logic.m_Class_Record.ReadDataFromDB();
//		_VSelfInfo_Logic.m_Class_Equipment.ReadDataFromDB();
		_VSelfInfo_Logic.s_R_BaseInfo.UnCheck();
		_VSelfInfo_Logic.s_R_Record.UnCheck();
		_VSelfInfo_Logic.s_R_BaseInfo.Check();
	}
	
	//更新的是自己
	void UpDateSeleInfoData_Me()
	{
		_VSelfInfo_Logic.m_Class_BaseInfo.ReadDataFromDB();
		_VSelfInfo_Logic.m_Class_Record.ReadDataFromDB();
//		_VSelfInfo_Logic.m_Class_Equipment.ReadDataFromDB();
	}

	//[功能]得到了献花的数量-反馈
	//[参数]uid:玩家ID
	//		value:献花的值
	void SetFlowerValue(uid,value)
	{
		if (toint(uid) == window.g_SelfInfo_UID)
		{
			_VSelfInfo_Logic.m_Class_BaseInfo.s_RQ.SetData(value);
		}
	}
}