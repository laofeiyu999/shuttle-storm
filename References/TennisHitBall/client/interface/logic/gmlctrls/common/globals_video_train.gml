//全局变量 + 函数>>观战+录像 + 训练

set window
{
	//[功能]生成一个录像的名字
	//[参数]type:1游戏打完录像 2观战后录像
	//		win:胜利或失败 0为默认 1表示输 2表示赢(type=1有效)
	void MakeVideoName(type,win)
	{
		var _temp = "";
		switch (type)
		{
			case 1:
			{
				_temp = ""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/"+window.GetMyName()+"-"+window.MYDATA.GetChannel()+"-";
				if (win == 2)
					_NameTemp += "胜";
				else
					_NameTemp += "负";
				break;	
			}
			case 2:
			{
				_temp = ""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/[观战]-"+window.MYDATA.GetChannel();
				break;
			}
			default:break;
		}
		printf("B# MakeVideoName:type:"+type+",win:"+win+",_temp:"+_temp);
		return _temp;
	}

	//[功能]保存一个录像
	//[参数]type:1游戏打完录像 2观战后录像
	//		win:胜利或失败 0为默认 1表示输 2表示赢(type=1有效)
	void SaveVideo(type,win)
	{
		printf("B# SaveVideo:type:"+type+",win:"+win);

		//以下是保存录像
		var _SrcFilePath = ""+window.getbinpath()+"..\\gamereplay\\"+window.GetMyName()+"\\";
		var _SrcFileName = "";
		switch (type)
		{
			case 1:_SrcFileName = ""+window.getbinpath()+"../gamereplay/测试录像.VRG";break;
			case 2:_SrcFileName = ""+window.getbinpath()+"../gamereplay/观战录像.VRG";break;
			default:break;
		}
		var _NewName = MakeVideoName(type,win)+".vrg";

		var ret = g_CGameVideo.CopyFile(_SrcFilePath,_SrcFileName,_NewName);
		var _times = 0;
		while (ret < 0)
		{
			_times += 1;
			if (_times > 100)
			{
				printf("B# SaveVideo 失败:"+_NewName);
				if (type == 1 )
				{
					window.find("UIController").LoadDLG(370);//保存录像失败
				}
				return;
			}
			_NewName = MakeVideoName(type,win)+"("+_times+").vrg";
			ret = g_CGameVideo.CopyFile(_SrcFilePath,_SrcFileName,_NewName);
		}
		
		//保存录像成功，向服务器发送消息
		//参数：用户ID,任务ID,任务描述
		var _Param = ""+window.GetMyUID()+","+window.CLIENT_7_SAVE_VIDEO+","+window.CLIENT_7_SAVE_VIDEO_STR+",1";
		window.Tos_AddEvent(_Param);
		printf("B# SaveVideo 成功："+ret+",times:"+_times);
		if (type == 1 )
		{
			window.find("UIController").LoadDLG(369);//保存录像成功
		}
	}

	//训练==============================================================================

	//根据训练ID取得训练的图标名
	//参数 trainID：训练ID
	//返回 错误值 -1
	void GetTrainIcon(trainID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,trainID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTrainIcon:"+window.TENNIS_GAME+",TBName:"+window.TRAIN);
			return window.DB_ERR;
		}
		
		var _icon = window.g_Row.GetData(window.TENNIS_GAME_TRAIN_ICON);//11字段
		window.g_Row.Release();
		return _icon;
	}
	//根据训练ID取得训练的类型
	//参数 trainID：训练ID
	//返回 错误值 -1
	void GetTrianTypeByID(trainID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,trainID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTrianTypeByID:"+window.TENNIS_GAME+",TBName:"+window.TRAIN);
			return window.DB_ERR;
		}
		
		var _type = window.g_Row.GetData(window.TENNIS_GAME_TRAIN_TYPE);//2字段
		window.g_Row.Release();
		return _type;
	}

	//根据训练ID取得训练的名字
	//参数 trainID：训练ID
	//返回 错误值 -1
	void GetTrianNameByID(trainID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,trainID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTrianNameByID:"+window.TENNIS_GAME+",TBName:"+window.TRAIN+",trainID:"+trainID);
			return window.DB_ERR;
		}
		
		var _name = window.g_Row.GetData(window.TENNIS_GAME_TRAIN_NAME);
		window.g_Row.Release();
		return _name;
	}

	//[功能]取某个阶段训练未完成的最小ID
	//[参数]_type:阶段类型 即服务器类型
	//[返回值]全部完成0 否者为最小ID 参数错误-1
	void GetMinTrainIDByType(type)
	{
		var _CTrianLogic = new CTrianLogic{}
		var _MinID = _CTrianLogic.GetMinID(type);
		printf("B# [去训练]GetMinTrainIDByType:type:"+type+",_MinID:"+_MinID);
		return _MinID;
	}

	//根据训练ID取得训练的AIID
	//参数 trainID：训练ID
	//返回 错误值 -1 正确AiID
	void GetTrainAIID(trainID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,trainID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTrainAIID:"+window.TENNIS_GAME+",TBName:"+window.TRAIN+",trainID:"+trainID);
			return window.DB_ERR;
		}
		
		var _aiid = window.g_Row.GetData(window.TENNIS_GAME_TRAIN_AIID);
		window.g_Row.Release();
		return _aiid;
	}

	//根据AIID取得训练的ID
	//参数 AIID：AIID
	//返回 错误值 -1 正确trainID
	void GeAIIDByTrainID(aiid)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_AIID,aiid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GeAIIDByTrainID:"+window.TENNIS_GAME+",TBName:"+window.TRAIN+",aiid:"+aiid);
			return window.DB_ERR;
		}
		
		var _id = window.g_Row.GetData(window.TENNIS_GAME_TRAIN_ID);
		window.g_Row.Release();
		return _id;
	}
}