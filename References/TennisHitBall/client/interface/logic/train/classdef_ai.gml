//自由训练类定义

importex("$./../../../designerscript/AI/AImapClass.gml");

//这段非yxf添加，详情咨询hfz
class VFreeTrain_Logic item
{
//	name = "VFreeTrain_Logic_Name";

	// modify by hanshuo   10.29.2009 把这类单独整成个类, 方便后面的功能继承
	
	var _GCMap = new AIGCMap
	{	

	}//end GCMap

//	_GCMap.InitAIGame(1);

	//用来实现镜头切换的东西-yxf
	var _ImgSaver = new StaticImage
	{
		size="100%,100%";
		Fov("0.55");		// 8.26 韩硕,修正截图与屏幕不符的问题
	};
	var _Img3D = new img3d
	{
		src = parent._ImgSaver.UITexture;
		capturemouse=true;
		visible = false;
		size="100%,100%";
		zindex = "top";
		
		//显示与否
		void SetVisible(param)
		{
			visible = param;
			if (param)
			{
				printf("B# 显示镜头切换效果！");
				setParamTimer("alpha",0,100,window._Time_SaveScreen,0,"ShowEnd");
			}
		}
		
		//显示结束后，通知何方志帅或者不帅的动作播完了2008年8月27日19:37
		void ShowEnd()
		{
			visible = false;
			//printf("B# 切屏特效显示结束后，通知何方志帅或者不帅的动作播完了\n");
			//window.find("GameInterface").ShowOver_HAction();//帅或者普通动作结束了
		}
	}

	// 参数: 我是否胜利了 1: 胜利  0: 败北
	void DestroyMap(isWin)
	{
		printf("B# [训练结算]DestroyMap():isWin:"+isWin+",window.GetUIGameState():"+window.GetUIGameState());
		//是自由训练
		if (window.GetUIGameState() == window.USER_UISTATE_AI_FREETRAIN)
		{
			//发出完成训练的消息-参数：训练ID
			window.Tos_AchieveTrain(""+window.g_TrainID+","+isWin+",0");

			printf("B# [训练结算]-是自由训练");
			//window.find("GAME_LOGIC").del();
			window.find("UIController").LoadUI("UI_TRAINOVER");
			return;
		}
		else( toint(window.g_TrainID) > 0 )
		{
			printf("B# [训练结算]-是撮合");
			//发出完成训练的消息-参数：训练ID
			window.Tos_AchieveTrain(""+window.g_TrainID+","+isWin+",1");
			window.g_TrainID = -1;
		}
	}


	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				//单撮AI ESC不起作用
				if(window.GetUIGameState() == window.USER_UISTATE_AI_RAND)
				{
					break;
				}
				//是自由训练
				if (window.GetUIGameState() == window.USER_UISTATE_AI_FREETRAIN)
				{
					//发出完成训练的消息-参数：训练ID
					window.Tos_AchieveTrain(""+window.g_TrainID+",0,0");

					window.FreeTrainToHall();
					break;
				}
				if( toint(window.g_TrainID) > 0 )
				{
					printf("B# [训练结算]-是撮合");
					//发出完成训练的消息-参数：训练ID
					window.Tos_AchieveTrain(""+window.g_TrainID+",0,1");
					window.g_TrainID = -1;

					window.FreeTrainToHall();
					break;
				}
			}
		}
	}
};
