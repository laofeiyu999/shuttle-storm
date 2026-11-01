//
//游戏设置的类定义
//

importex("$./ClassDef_Key.gml");
importex("$./ClassDef_Key_All.gml");
importex("$./ClassDef_Display.gml");
importex("$./ClassDef_Sound.gml");
importex("$./ClassDef_Other.gml");
import("$./ClassDef_ShotcutChat.gml");
importex("$./../../UI/GameSetUp/ClassDef.gml");

//总的类：包含了 按键，显示，声音
class VGameSetUp_Logic item
{
	size = "400,500";bgcolor = "#123456";alpha = 30;
	valign(50,0);halign(50,0);
	var m_Type = 0;//0按键，1显示，2声音 3其他
	var m_hallid = 0;//记录大厅声音ID
	var m_hallname = "";//记录大厅声音名称
	var m_MusicOn = 0 ;//记录勾选音乐静音状态
	var m_SoundOn = 0 ;//记录勾选音效静音状态
	var m_soundcheck = 0;//是否点击了声音标签
	var m_SoundVolume = 0;//记录声音滑块位置
	var m_MusicVolume = 0;//记录音效滑块位置
	var m_gameid  = 0; //记录游戏中音乐状态
//	//=========================程序模块============================
//	var m_KeyType = 0;	//按键的类型 0默认一 1默认二 2自定义
//	//按键类
//	var _CKeySet = new CKeySet
//	{
//		//参数:键序号，类型（键盘，手柄）
//		void MSG_GetAction(key,type)
//		{alert(type);
//			//printf("B# 按键："+key+"type:"+type);
//			var _Keyrow = parent.s_Class_Key._KeyList.curselectrow();
//			printf("B# MSG_GetAction()键盘键设置：_Keyrow："+_Keyrow);
//			if(_Keyrow >= 0)
//			{
//				var _actionID = parent.s_Class_Key._KeyList.fieldstr(_Keyrow,window.GAMEUI_KEYSET_ID); //ID
//				if (0 == type)
//				{
//					SetAction(_actionID, key, type);
//				}
//			}
//		}
//		//参数:键序号，类型（默认1，默认2，自定义）
//		void MSG_SafeClose( key, type)
//		{
//			if( key > -1) //有键未设置
//			{
////				var _Text = "";//需要提示的文字
//				//参数 key 标志那个按键键未设置==数据库的索引
//				var _keyName = window.GetKeyNameByRow(key);
//				if (_keyName == 0 || _keyName == -1)
//				{
//					window.find("UIController").LoadDLG(201);//按键设置不完整！
//				}
//				else
//				{
//					window.find("UIController").LoadDLG(202);//按键[%0]未设置！
//					window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+_keyName);
////					_Text = "按键[ "+_keyName+" ]未设置！";
//				}
////				window.LoadInfoBoard(20,0,_Text);//有按键未设置！
//				return;
//			}
//			parent.parent.del();
//		}
//		void OnCreated()
//		{
//			parent.m_KeyType = GetUseKeyType();
//			parent.s_Class_Key.SetEvent();
//		}
//	}
	//=========================与界面交互===========================
	void Init()
	{
		//按键：Radio
		staticvar s_R_Key = new VMyRadio
		{
			Init("按键");pos = "1,20";size = "50,30";
		}
		//显示：Radio
		staticvar s_R_Display = new VMyRadio
		{
			Init("显示");size = "50,30";pos="57,22";
		}
		//声音：Radio
		staticvar s_R_Sound = new VMyRadio
		{
			Init("声音");size = "50,30";pos="117,22";
		}
		//其它：Radio
		staticvar s_R_Other = new VMyRadio
		{
			Init("其它");size = "50,30";pos="176,23";
		}
		//恢复默认：按钮
		staticvar s_Btn_Default = new VMyButton
		{
			pos="61,452";Init("默认");
		}

		//保存：按钮
		staticvar s_Btn_Save = new VMyButton
		{
			pos="177,452";Init("保存");
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			pos="298,454";Init("取消");
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");size = "30,30";halign(100,0);
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("？");size = "30,30";halign(90,0);
		}
	}
	inclass("VGameSetUp_UI");//界面显示类
	//==============================function=========================================
	//初始化显示：所有都隐藏
	void InitShow()
	{
		s_Class_Key.show = false;
		s_Class_DisPlay.show = false;
		s_Class_Sound.show = false;
		s_Class_Other.show = false;
		s_Class_ShotcutChat.show = false;
	}
	//按键，显示，声音的切换
	//参数 type：类型 0按键，1显示，2声音 3其他 4快捷聊天
	void ChangeType(type)
	{
		m_Type = type;
		InitShow();
		switch (m_Type)
		{
			case 0:{s_Class_Key.show = true;s_Class_Sound.SetHide();break;}
			case 1:{s_Class_DisPlay.show = true;s_Class_Sound.SetHide();break;}
			case 2:{s_Class_Sound.show = true;break;}
			case 3:{s_Class_Other.show = true;s_Class_Sound.SetHide();break;}
			case 4:{s_Class_ShotcutChat.show = true;s_Class_Sound.SetHide();break;}
		}
	}

	//点击了默认
	void OnClick_BtnDefault()
	{
		s_Class_Key.ResumeDefault();
		s_Class_DisPlay.ResumeDefault();
		s_Class_Sound.ResumeDefault();
		s_Class_Other.ResumeDefault();
		s_Class_ShotcutChat.ResumeShotcutChat();
		window.find("NAME_GCMap").KeyBoardEnable(1);//当玩家修改按键设置时，人物不跟着走动；

		/*
		switch (m_Type)
		{
			case 0:
			{
				_CKeySet.ResumeDefault();
				s_Class_Key.ResumeDefault();
				break;
			}
			case 1:
			{
				s_Class_DisPlay.ResumeDefault();
				break;
			}
			case 2:{s_Class_Sound.ResumeDefault();break;}
			case 3:{s_Class_Other.ResumeDefault();break;}
		}
		*/
	}

	//点击了保存
	void OnClick_BtnSave()
	{
		s_Class_ShotcutChat.SaveShotcutSet();
		s_Class_DisPlay.Save();
		window.g_CSoundSet.SaveSoundSet();
		s_Class_Other.SaveOtherSet();
		s_Class_Key.SaveKeySet();
		window.find("VSenceBugle_Mgr_Logic_Name").ReSetPos();
		window.find("NAME_GCMap").KeyBoardEnable(1);//当玩家修改按键设置时，人物不跟着走动；
	}
	//点击了取消
	void OnClick_BtnCancel()
	{
		if (m_soundcheck == 1)
		{
			window.g_CSoundSet.SetMusicOn(m_MusicOn);
			window.g_CSoundSet.SetSoundOn(m_SoundOn);
			window.g_CSoundSet.SetSoundVolume(m_SoundVolume);
			window.g_CSoundSet.SetMusicVolume(m_MusicVolume);
			window.g_CSoundSet.SetBgMusic(window.eBgMusic_Game,m_gameid);
			if (s_Class_Sound.s_CHK_Music.GetChecked() == 0)
			{	
				window.g_CSoundSet.SetBgMusic(window.eBgMusic_Hall,m_hallid);
				window.PlayMusic(m_hallid);//还原声音 
			}
		}
		
		s_Class_ShotcutChat.Cancel();
		s_Class_DisPlay.Cancel();
		window.g_CSoundSet.CancelSet();
		s_Class_Other.Cancel();
		parent.del();
		window.find("NAME_GCMap").KeyBoardEnable(1);//当玩家修改按键设置时，人物不跟着走动；
	}
	//设置响应事件
	void SetEvent()
	{
		set s_R_Key//按键：Radio
		{
			groupname="VGameSetUp_Logic_Group";
			startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(0);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Display//显示：Radio
		{
			groupname="VGameSetUp_Logic_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Sound//声音：Radio
		{
			groupname="VGameSetUp_Logic_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
				parent.m_soundcheck = 1;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Other
		{
			groupname="VGameSetUp_Logic_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(3);
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_R_ShotcutChat
		{
			groupname="VGameSetUp_Logic_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(4);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_Btn_Default
		{
			void OnPressed(){parent.OnClick_BtnDefault();}
		}
		set s_Btn_Save//保存：按钮
		{
			void OnPressed(){parent.OnClick_BtnSave();}
		}
		set s_Btn_Cancel//取消：按钮
		{
			void OnPressed(){parent.OnClick_BtnCancel();}
		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.OnClick_BtnCancel();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_GAMESETUP);}
		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		//按键类
		staticvar s_Class_Key = new VGameSetUp_Key_All_Logic{}

		//显示类
		staticvar s_Class_DisPlay = new VGameSetUp_DisPlay_Logic{}

		//声音类
		staticvar s_Class_Sound = new VGameSetUp_Sound_Logic{}

		//其他类
		staticvar s_Class_Other = new VGameSetUp_Other_Logic{}

		//快捷聊天
		staticvar s_Class_ShotcutChat = new VGameSetUp_ShotcutChat_Logic{}
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
};