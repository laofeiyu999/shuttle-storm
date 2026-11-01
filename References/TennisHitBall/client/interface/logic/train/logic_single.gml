//训练-单个说明弹出界面
//yxf 2008年12月26日

importex("$./ClassDef_SingleWnd.gml");

new item
{
	name = "TRAIN_POP_LOGIC";size = "100%,100%";capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}

	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"TRAIN_POP_LOGIC");//不激活
	}
	void OnDelete()
	{	
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"TRAIN_POP_LOGIC");//能激活
		//window.g_TrainID = -1;	//
	}
	void DI_ShortcutKey(data)
	{
		if (window.GetForceGuideState() == 1) 
		{
			printf("A# 变态-TRAIN_POP_LOGIC强制引导中。。。。");
			return;//强制引导中
		}
		switch (data)
		{
			case 3: //Esc
			{
				_Train.OnClick_Return();
				break;
			}
			case 4: //Enter
			{
				_Train.OnClick_Begin();
				break;
			}
		}
	}
	//==================================================================
	var _Train = new VTrainSingleWnd_Logic{}
}