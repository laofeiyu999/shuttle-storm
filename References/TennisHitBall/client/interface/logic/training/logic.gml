//
//训练中界面-UI+Logic
//yxf 2008年12月28日
//

import("$./ClassDef.gml");
new item
{
	name = "TRAINING_LOGIC";size = "100%,100%";
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_TRAINING);
	//==========================快捷键==================================
	//设定可以拖动
	new VGame_BtnLayer_Top_Logic{}
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
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
				window.find("GAMELAYER").find("NAME_GCMap").OnClick_Esc();
				break;
			}
			case 8://Space
			{
				if (window.g_TrainID == window.ID_FORCETRAIN)//强制训练
				{
					_VTraining.s_Btn_NextVideo.OnPressed();
				}
				else
				{
					_VTraining.s_Btn_SkipVideo.OnPressed();
				}
				break;
			}
		}
	}
	//===================================================================
	//自己的UserDt类实例
	var m_User1 = new VUserDT_Logic
	{
		Init(window.GetMyUID());
	}
	var _VTraining = new VTraining_Logic{}
}
