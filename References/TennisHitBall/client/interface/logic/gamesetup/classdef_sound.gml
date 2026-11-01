//
//声音 设置类定义
//

importex("$./ClassDef_BgMusicList.gml");
importex("$./../../UI/GameSetUp/ClassDef_Sound.gml");

/*程序接口
	int GetMusicVolume();	//取背景音乐的音量  0-100
	int GetSoundVolume();	//取音效的音量
	int GetMusicOn();		//取背景音乐的开关状态
	int GetSoundOn();		//取音效的开关状态

	void SetMusicVolume(int iMusicVolume);	//设置背景音乐的音量
	void SetSoundVolume(int iSoundVolume);	//设置音效的音量
	void SetMusicOn(int iMusicOn);			//设置背景音乐的开关状态 0关 1开
	void SetSoundOn(int iSoundOn);			//设置音效的开关状态

	//保存设置
	SaveSoundSet();
	//取消设置
	CancelSet();

	int GetMusicDefaultVolume();
	int GetSoundDefaultVolume();

	void SetBgMusic(int _type,int value);
	int GetBgMusic(int _type);
	int GetBgMusicDefault(int _type);
*/
class VGameSetUp_Sound_Logic CSoundSet
{
	size = "400,400";pos = "0,100";bgcolor = "#FF";enableUpdate(1);
	//=============================与界面交互========================================
	void Init()
	{
		//复选框：背景音乐
		staticvar s_CHK_Music = new VMyCheckBox
		{
			pos = "100,50";Init("√音乐");
		}
		//音乐大小
		staticvar s_Music_Volume = new edit
		{
			size = "100,30";pos = "100,90";bgcolor = "#FFFFFF";xcenter = true;
			maxsize = 3;onlynumber = "true";
			font = "宋体,-1,22";xcenter = "true";ycenter = "true";
			src = 50;
			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}
			void OnKeyChar()
			{
				
			}
		}
		//复选框：背景音效
		staticvar s_CHK_Sound = new VMyCheckBox
		{
			pos = "100,200";Init("√音效");
		}
		//音效大小
		staticvar s_Sound_Volume = new edit
		{
			size = "100,30";pos = "100,240";bgcolor = "#FFFFFF";xcenter = true;
			maxsize = 3;onlynumber = "true";
			font = "宋体,-1,22";xcenter = "true";ycenter = "true";
			src = 50;
			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}
			void OnKeyChar()
			{
				
			}
		}

		//登录音乐
		staticvar s_CB_LoginMusic = new VMyComboBox 
		{
			m_sizeX = 98;pos="262,17";
		}
		//大厅音乐
		staticvar s_CB_HallMusic = new VMyComboBox 
		{
			m_sizeX = 98;pos="264,98";
		}
		//游戏音乐
		staticvar s_CB_GameMusic = new VMyComboBox 
		{
			m_sizeX = 98;pos="260,217";
		}
	}
	inclass("VGameSetUp_Sound_UI");//界面显示类
	//==============================function=========================================
	//设置声音大小
	void SetSound(param)
	{
		window.g_CSoundSet.SetSoundVolume(param);
	}
	void SetMusic(param)
	{
		window.g_CSoundSet.SetMusicVolume(param);
	}

	//恢复默认
	void ResumeDefault()
	{
		s_CHK_Music.UnCheck();
		s_CHK_Sound.UnCheck();
		
		var _defaultmusic = window.g_CSoundSet.GetMusicDefaultVolume();
		var _defaultsound = window.g_CSoundSet.GetSoundDefaultVolume();
		
		s_Music_Volume.SetData(_defaultmusic,100);
		s_Sound_Volume.SetData(_defaultsound,100);
		
		SetSound(_defaultsound);
		SetMusic(_defaultmusic);

		var _login = window.g_CSoundSet.GetBgMusicDefault(window.eBgMusic_Login);
		var _hall = window.g_CSoundSet.GetBgMusicDefault(window.eBgMusic_Hall);
		var _game = window.g_CSoundSet.GetBgMusicDefault(window.eBgMusic_Game);
		
		s_CB_LoginMusic.SetDefaultSrc(""+window.GetMusicNameByID(_login));
		s_CB_HallMusic.SetDefaultSrc(""+window.GetMusicNameByID(_hall));
		s_CB_GameMusic.SetDefaultSrc(""+window.GetMusicNameByID(_game));

		window.g_CSoundSet.SetBgMusic(window.eBgMusic_Login,_login);
		window.g_CSoundSet.SetBgMusic(window.eBgMusic_Hall,_hall);
		window.g_CSoundSet.SetBgMusic(window.eBgMusic_Game,_game);
		window.PlayMusic(_hall);		//add by chenjihui
	}

	//设置响应事件
	void SetEvent()
	{
		set s_CB_LoginMusic
		{
			//接口函数 WhichSelect:
			void WhichSelect(index)
			{
				window.g_CSoundSet.SetBgMusic(window.eBgMusic_Login,index);
			}
			//隐藏其他两个-此法不好，没想到更好的
			void ShowGroupHide()
			{
				window.find("ComBoxList_Hall").SetMyHide(false);
				window.find("ComBoxList_Game").SetMyHide(false);
			}
			SetID("Login",window.g_BG_MUSIC_LOGIN,window.g_BG_MUSIC_LOGIN);
			SetPos(149,313);
			SetSize(145,80);
		}
		set s_CB_HallMusic
		{
			var _hallid = 0;
			//接口函数 WhichSelect:
			void WhichSelect(index)
			{
				window.g_CSoundSet.SetBgMusic(window.eBgMusic_Hall,index);
				_hallid = window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall);
				window.PlayMusic(_hallid);
			}
			//隐藏其他两个-此法不好，没想到更好的
			void ShowGroupHide()
			{
				window.find("ComBoxList_Login").SetMyHide(false);
				window.find("ComBoxList_Game").SetMyHide(false);
			}
			SetID("Hall",window.g_BG_MUSIC_HALL,window.g_BG_MUSIC_HALL);
			SetPos(149,342);
			SetSize(145,80);
		}
		set s_CB_GameMusic
		{
			//接口函数 WhichSelect:
			void WhichSelect(index)
			{
				window.g_CSoundSet.SetBgMusic(window.eBgMusic_Game,index);
			}
			//隐藏其他两个-此法不好，没想到更好的
			void ShowGroupHide()
			{
				window.find("ComBoxList_Hall").SetMyHide(false);
				window.find("ComBoxList_Game").SetMyHide(false);
			}
			SetID("Game",window.g_BG_MUSIC_GAME,window.g_BG_MUSIC_GAME);
			SetPos(149,371);
			SetSize(145,80);
		}
		set s_Music_Volume
		{
			//可重载
			void OnDataChange()
			{
				parent.SetMusic(GetMyData());
			}
			SetData(window.g_CSoundSet.GetMusicVolume(),100);
			parent.parent.m_MusicVolume = window.g_CSoundSet.GetMusicVolume();
		}
		set s_Sound_Volume
		{
			//可重载
			void OnDataChange()
			{
				parent.SetSound(GetMyData());
			}
			SetData(window.g_CSoundSet.GetSoundVolume(),100);
			parent.parent.m_SoundVolume = window.g_CSoundSet.GetSoundVolume();
		}
		set s_CHK_Music//复选框：背景音乐
		{
			parent.parent.m_MusicOn=1;
			if (window.g_CSoundSet.GetMusicOn() == 0)
			{
				startstate = 1;parent.parent.m_MusicOn=0;
			}
			void OnCheck(){MouseCheck();window.g_CSoundSet.SetMusicOn(0);}
			void OnUnCheck(){MouseUnCheck();window.g_CSoundSet.SetMusicOn(1);}
		}
		set s_CHK_Sound//复选框：背景音效
		{
			parent.parent.m_SoundOn=1;
			if (window.g_CSoundSet.GetSoundOn() == 0)
			{
				startstate = 1;parent.parent.m_SoundOn=0;
			}
			void OnCheck(){MouseCheck();window.g_CSoundSet.SetSoundOn(0);}
			void OnUnCheck(){MouseUnCheck();window.g_CSoundSet.SetSoundOn(1);}
		}
	}
	//================================DBList=========================================

	void SetHide()
	{
		window.find("ComBoxList_Login").SetMyHide(false);
		window.find("ComBoxList_Hall").SetMyHide(false);
		window.find("ComBoxList_Game").SetMyHide(false);
	}

	void OnCreated()
	{
		Init();
		SetEvent();

		var _login = window.g_CSoundSet.GetBgMusic(window.eBgMusic_Login);
		var _hall = window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall);
		var _game = window.g_CSoundSet.GetBgMusic(window.eBgMusic_Game);
		
		parent.m_hallid = _hall;
		parent.m_gameid = _game;
		parent.m_hallname = ""+window.GetMusicNameByID(_hall);
		s_CB_LoginMusic.SetDefaultSrc(""+window.GetMusicNameByID(_login));
		s_CB_HallMusic.SetDefaultSrc(""+window.GetMusicNameByID(_hall));
		s_CB_GameMusic.SetDefaultSrc(""+window.GetMusicNameByID(_game));

		SetHide();
	}
};