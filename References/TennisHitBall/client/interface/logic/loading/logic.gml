//
//Loading界面(到游戏)-UI+Logic
//yxf 2009年3月9日
//

import("$./ClassDef.gml");

new item
{
	name = "LOADING_LOGIC";size = "100%,100%";capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}

	var _VLoading_Logic = new VLoadingToGame_Logic{}
	
	var _canesc = false; //是否可以按esc
	window.g_RoomHangInfoYesOrNo = false;	//2010年9月21日 yxf
	//==========================快捷键==================================
	void OnCreated()
	{
		printf("LOADING_LOGIC-OnCreated():g_LoadingType:"+window.g_LoadingType);
		window.find("gameinput").AddExclusiveShortcutUser(this);

		timer(2000,"_canesc=true","LoadingTimer1");
		timer(60000,"WrongOutLoading","LoadingTimer2");
	}
	void OnDelete()
	{
		printf("LOADING_LOGIC-OnDelete();");
		window.g_RoomHangInfoYesOrNo = true;	//2010年9月21日 yxf
		window.find("gameinput").DelShortcutUser(this);
		window.g_LoadingType = window.LOAD_TYPE_DEFAULT;
	}

	void OutLoading()
	{
		killtimer("LoadingTimer1");
		killtimer("LoadingTimer2");
		switch(window.g_LoadingType)
		{
			case 1:
			{
				window.HallToChannelChoose();
				break;
			}
			case 2:
			{
				window.RoomToHall();
				break;
			}
			case 9:
			{
				window.RoomToFamily();
				break;
			}
			case 5:
			{
				window.VideoToHall();
				del();
				break;
			}
			case 8:
			{
				window.FreeTrainToHall();
				del();
				break;
			}
		}
	}

	void WrongOutLoading()
	{
		killtimer("LoadingTimer1");
		killtimer("LoadingTimer2");
		switch(window.g_LoadingType)
		{
			case 1:
			{
				window.HallToChannelChoose();
				window.find("UIController").LoadDLG(19);
				break;
			}
			case 2:
			{
				window.RoomToHall();
				window.find("UIController").LoadDLG(19);
				break;
			}
			case 9:
			{
				window.RoomToFamily();
				window.find("UIController").LoadDLG(19);
				break;
			}
			case 5:
			{
				window.VideoToHall();
				del();
				window.find("UIController").LoadDLG(19);
				break;
			}
			case 8:
			{
				window.FreeTrainToHall();
				del();
				window.find("UIController").LoadDLG(19);
				break;
			}
		}
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				if (!_canesc) break;
				OutLoading();break;
			}
		}
	}
	//====================================================================
}