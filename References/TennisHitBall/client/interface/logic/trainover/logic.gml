//
//训练结算界面-UI+Logic
//yxf 2008年8月12日
//

importex("$./ClassDef.gml");

new item
{
	name = "TRAINOVER_LOGIC";size = "100%,100%";enableUpdate(1);
	new VGame_BtnLayer_Top_Logic{}

	//var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_TRAINOVER);
	window.find("gameinput").AddExclusiveShortcutUser(this);
	
	void OnCreated()
	{
		printf("B# [训练结算]window.GetUIGameState():"+window.GetUIGameState());

		//自由训练+撮合 && 自由训练
		if (window.GetUIGameState() == window.USER_UISTATE_AI_FREETRAIN)
		{
			printf("B# [训练结算]自由训练+撮合 && 自由训练");

			window.timer(window._Time_TrainOver,"FreeTrainToHall");
			return;
		}
		else
		{
			window.timer(window._Time_NormalTrainOver,"TrainingToHall","Timer_NormalTrainOver");
		}
	}

	void OnDelete()
	{	
		//window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				
			}
		}
	}
	var _User1 = new VUserDT_Logic
	{
		Init(window.GetMyUID());
	}
	new VTrainOver_Logic{}
}