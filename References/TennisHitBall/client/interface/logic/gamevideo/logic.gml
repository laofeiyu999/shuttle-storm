importex("$./ClassDef_GameVideo.gml");
importex("$./ClassDef_PlayBox.gml");
import("$./ClassDef_MsgBox.gml");
import("$./../../../effect/effect.gml");
import("$./../../../game/user.gml");
import("$./../Room/ClassDef_UserModelName.gml");

new item
{
	size="100%,100%";name = "GAMEVIDEO_LOGIC";enableUpdate(1);//capturemouse=true;
	new VGame_BtnLayer_Top_Logic{}
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_VIDEOING);

	var _IfCanUseEsc = false;	//等界面显示出来后才可以使用esc
	var _RePlaySrc = "";//录像的路径

	var m_RoomType = 0;
	var m_RID1 = 0;
	var m_NkName1 = "";
	var m_RID2 = 0;
	var m_NkName2 = "";
	var m_RID3 = 0;
	var m_NkName3 = "";
	var m_RID4 = 0;
	var m_NkName4 = "";
	var m_GameNum = 0;

	window.g_AllPlayersNum = 0;
	window.g_AllPlayersUID[0] = 0;
	window.g_AllPlayersUID[1] = 0;
	window.g_AllPlayersUID[2] = 0;
	window.g_AllPlayersUID[3] = 0;

	window.find("gameinput").AddExclusiveShortcutUser(this);
	//==========================快捷键===============================
	void OnCreated()
	{
		window.g_probablyPos = window.POS_PROBABLY_LOOKAT;
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);

		var _index = 1;
		while(_index<=m_indexMax)
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.g_AllPlayersUID[_index-1]).del();
			_index += 1;
		}
		window.g_probablyPos = window.POS_PROBABLY_HALL;

		window.g_AllPlayersNum = 0;
		window.g_AllPlayersUID[0] = 0;
		window.g_AllPlayersUID[1] = 0;
		window.g_AllPlayersUID[2] = 0;
		window.g_AllPlayersUID[3] = 0;
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				if (window.g_IsLookOrReplay == window.VIDEO_TYPE_DEFAULT)	//录像
				{
					window.find("UIController").LoadDLG(106);//确定要退出观看吗？
				}
				if (window.g_IsLookOrReplay == window.VIDEO_TYPE_LOOKAT)	//观战
				{
					window.find("UIController").LoadDLG(106);//确定要退出观看吗？
				}
				break;
			}
			case 8://Space
			{
				SwitchCamera();
				break;
			}
		}
	}
	//==============================================================
	//特效
	new SG_fmodel
	{
		SetFilePath("$./../../../effect/effect/");
		SetSoundPath("$./../../../effect/sound/");
		del();
	}

	//延时new-防止得到的是老版本的录像
	void SetVideo()
	{
		set window.find("GAMELAYER")
		{
			new scene
			{
				name = "GAMEVIDEO_SCENE";
				camera.pos = "0, 1, -3";
				camera.dir = "0, -0.15, 1";
				group = 1;
				
				new CReplayCamera
				{
					name = "ReplayCamera";
				}

				new GameReplayLoad
				{
					name="GAMEREPLAYLOAD";
					size="100%,100%";

					//录像播放结束
					void OnReplayEnd()
					{
						printf("B# [观战]录像播放结束 脚本");
						if(window.g_IsLookOrReplay == window.VIDEO_TYPE_DEFAULT)//录像
						{
							replayto(1);
							setPlay(0);
							window.find("GAMEVIDEO_LOGIC")._videoPlayBox.s_PauseVideo.show=false;
							window.find("GAMEVIDEO_LOGIC")._videoPlayBox.s_PlayVideo.show=true;
							window.find("GAMEVIDEO_LOGIC")._videoPlayBox.s_PlayState.SetData("已停止");
							//return;
						}
						if(window.g_IsLookOrReplay == window.VIDEO_TYPE_LOOKAT)//观战
						{
							window.find("UIController").LoadDLG(101);//比赛已结束，谢谢观赏！现在要返回大厅吗？

							var _path = ""+window.getbinpath()+"../gamereplay/观战录像.VRG";
							var _res = _SaveLookVideo(_path);
							printf("B# [观战]录像保存"+_res);
							if (_res == 1)
							{
								//window.SaveVideo(2,0);
							}
						}
					}
					
//					void OnCreated()
//					{
//						find("nkname_item").parent.src = "测试"+window.find("GAMEVIDEO_LOGIC")._arr[2];
//					}
				}//GameReplayLoad
			}
		}
		SetPlaySrc();
		if (window.g_IsLookOrReplay == window.VIDEO_TYPE_LOOKAT)
		{
			window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("GAMEREPLAYLOAD").setAutoToEnd(true);//观战自动结束
		}
		_videoPlayBox.SetPlan();
		
		//设置昵称
		//window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("nkname_item").parent.src = ""+_arr[2];
		//window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("GAMEREPLAYLOAD").nkname.src = ""+_arr[2];
	}
	//录像控制界面
	var _videoPlayBox = new VGameVideo_PlayBox_Logic
	{
		//pos(710,639);
		halign(100,-314+width);valign(100,-200+height);
		if (window.g_IsLookOrReplay == window.VIDEO_TYPE_DEFAULT)	//录像
		{
			timer(2000,"PlayBoxShow");
		}
	}

	//设置播放录像的路径
	void SetPlaySrc()
	{
		window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("GAMEREPLAYLOAD").src=_RePlaySrc;
		window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("GAMEREPLAYLOAD").setPlay(1);
	}

	//外部接口:SetData
	//参数 data:录像的路径-
	//先把路径保存下来
	void SetData(data)
	{
		printf("B# [观战]录像-SetData："+data);
		_RePlaySrc=data;
		timer(1000,"SetVideo");
	}
	
	var _arr = "";
	var _isFirst = true;
	//录像中的界面初始化
	void InitVideo(param)
	{
		_arr = window.SplitStr2(param,",");
		printf("B# [观战]录像InitVideo-param:"+param);
		printf("B# [观战]录像-InitVideo():_RoomType:"+_arr[0]+",RID1:"+_arr[1]+",NkName1:"+_arr[2]
			+",RID2:"+_arr[3]+",NkName2:"+_arr[4]+",RID3:"+_arr[5]+",NkName3:"+_arr[6]
			+",RID4:"+_arr[7]+",NkName4:"+_arr[8]+"GameNum:"+_arr[9]+",MusicID:"+_arr[10]);

		m_RoomType = _arr[0];
		m_RID1 = _arr[1];
		m_NkName1 = _arr[2];
		m_RID2 = _arr[3];
		m_NkName2 = _arr[4];
		m_RID3 = _arr[5];
		m_NkName3 = _arr[6];
		m_RID4 = _arr[7];
		m_NkName4 = _arr[8];
		m_GameNum = _arr[9];

		//录像上界面
		if(_isFirst)
		{
			staticvar _videoPlay = new VGameVideoPlay_Logic{}
			_isFirst=false;
		}
		//_videoPlay.InitDBBinding();

		window.PlayMusic(toint(_arr[10]));	//根据当时房主设置的背景音乐播

		//
		m_arrUID[0] = GetUID(toint(m_RID1));
		m_arrUID[1] = GetUID(toint(m_RID2));
		m_arrUID[2] = GetUID(toint(m_RID3));
		m_arrUID[3] = GetUID(toint(m_RID4));

		if (toint(m_RID3) > 0)
		{
			m_indexMax = 4;
		}

		var _index = 1;
		window.g_Room_tempUserName = "";
		window.g_AllPlayersNum = m_indexMax;
		while(_index<=m_indexMax)
		{
			window.g_Room_userNum = m_arrUID[_index-1];
			window.g_AllPlayersUID[_index-1] = window.g_Room_userNum;
			window.g_Room_tempUserName = _arr[2*_index];
			set window.find("GAMELAYER")
			{
				window.find("VRoleModel_Info_Logic_Name_"+window.g_Room_userNum).del();
				new VRoleModel_Info_Logic
				{
					SetName(window.g_Room_userNum);
					SetUserName(window.g_Room_tempUserName);
					SetShowState(true);//printf("xiayy:g_Room_tempUserName:"+window.g_Room_tempUserName+",g_Room_userNum:"+window.g_Room_userNum);
				}
			}
			_index += 1;
		}
		//window.SetRolemodelInfoShowState(true);

		SwitchCamera();
	}

	var m_arrUID = sysarray(4);
	var m_index = 0;
	var m_indexMax = 2;

	//RID取UID
	void GetUID(rid)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_ROLEID,rid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error[观战]-GetUID:DBname:"+window.M_G_CLINET+",TBName:"+window.GAMESHOW);
			return;
		}
		var _uid = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USERID);
		_VNet2DBRow.del();	
		return _uid;
	}

	//切换摄像机
	void SwitchCamera()
	{
		printf("SwitchCamera():m_index:"+m_index+",UID:"+m_arrUID[m_index]);
		window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("ReplayCamera").SetReplayTargetID( m_arrUID[m_index]);	

		m_index += 1;
		if (m_index >= m_indexMax)
		{
			m_index = 0;
		}
	}

}