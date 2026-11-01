//按键设置界面
//夏洋洋 2010-3-20

importex("$./../../UI/GameSetUp/ClassDef_Key_All.gml");
importex("$./ClassDef_Key.gml");
importex("$./ClassDef_Key_Hand.gml");

class VGameSetUp_Key_All_Logic item
{
	var m_Type = 0;	//1为键盘，2为手柄
	//===============================
	void Init()
	{
		staticvar m_R_KeyBoard = new VRadio_Single_New_UI
		{}
		staticvar m_Img_KeyBoard = new img 
		{}
		staticvar m_R_Hand = new VRadio_Single_New_UI
		{}
		staticvar m_Img_Hand = new img 
		{}
	}
	inclass("VGameSetUp_Key_All_UI");
	//==================================
	//=========================程序模块============================
	var m_KeyType = 0;	//键盘按键的类型 0默认一 1默认二 2自定义
	var m_HandKeyType = 3;	//手柄按键类型 3默认 4自定义
	//按键类
	var _CKeySet = new CKeySet
	{
		//参数:键序号，类型（键盘，手柄）
		void MSG_GetAction(key,type)
		{
			printf("B# 按键："+key+"type:"+type);
			var _Keyrow = 0;
			if(type == 0)
			{
				_Keyrow = parent.s_Key_Board._KeyList.curselectrow();
				window.find("NAME_GCMap").KeyBoardEnable(0);//当玩家修改按键设置时，人物不跟着走动；
			}
			else
			{
				_Keyrow = parent.s_Key_Hand._KeyList.curselectrow();
			}
			printf("B# MSG_GetAction()键盘键设置：_Keyrow："+_Keyrow);
			if(_Keyrow >= 0)
			{
				var _actionID = 0;
				if(type == 0)
				{
					_actionID = parent.s_Key_Board._KeyList.fieldstr(_Keyrow,window.GAMEUI_KEYSET_ID); //ID
				}
				else
				{
					_actionID = parent.s_Key_Hand._KeyList.fieldstr(_Keyrow,window.GAMEUI_KEYSET_ID); //ID
				}
				if (0 == type || 1 == type)
				{
					SetAction(_actionID, key, type);
				}
			}
		}
		//参数:键序号，类型（默认1，默认2，自定义）
		void MSG_SafeClose( key, type)
		{
			if( key > -1) //有键未设置
			{
//				var _Text = "";//需要提示的文字
				//参数 key 标志那个按键键未设置==数据库的索引
				var _keyName = window.GetKeyNameByRow(key);
				if (_keyName == 0 || _keyName == -1)
				{
					window.find("UIController").LoadDLG(201);//按键设置不完整！
				}
				else
				{
					window.find("UIController").LoadDLG(202);//按键[%0]未设置！
					window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+_keyName);
//					_Text = "按键[ "+_keyName+" ]未设置！";
				}
//				window.LoadInfoBoard(20,0,_Text);//有按键未设置！
				return;
			}
			parent.parent.parent.del();
		}
		void OnCreated()
		{
			parent.m_KeyType = GetUseKeyType();
			parent.m_HandKeyType = GetHandKeyType();
			if(toint(parent.m_HandKeyType) == 0)
			{
				parent.m_HandKeyType = 3;
			}
			parent.s_Key_Board.SetEvent();
			parent.s_Key_Hand.SetEvent();
		}
	}

	void NewObject()
	{
		//键盘
		staticvar s_Key_Board = new VGameSetUp_Key_Logic{}
		//手柄
		staticvar s_Key_Hand = new VGameSetUp_Key_Hand_Logic{}
	}

	void SetEvent()
	{
		set m_R_KeyBoard
		{
			groupname = "VGameSetUp_Key_All";
			startstate = 1;
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();parent.m_Type = 1;
				parent.ChangePage(1);
			}
			void OnUnCheck(){MouseUnCheck();}

		}
		set m_R_Hand
		{
			groupname = "VGameSetUp_Key_All";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();parent.m_Type = 2;
				parent.ChangePage(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}

	}
	//==============================================
	void ChangePage(_type)
	{
		switch(_type)
		{
			case 1:
			{
				_CKeySet.SetUseKeyType(m_KeyType);
				s_Key_Board.show = true;
				s_Key_Hand.show = false;
				break;
			}
			case 2:
			{
				_CKeySet.SetUseKeyType(m_HandKeyType);
				s_Key_Board.show = false;
				s_Key_Hand.show = true;
				break;
			}
		}
	}

	//恢复默认
	void ResumeDefault()
	{
		_CKeySet.ResumeDefault();
		if(m_Type == 1)
		{
			s_Key_Hand.ResumeDefault();
			s_Key_Board.ResumeDefault();
		}
		if(m_Type == 2)
		{
			s_Key_Board.ResumeDefault();
			s_Key_Hand.ResumeDefault();
		}
	}

	//保存
	void SaveKeySet()
	{
		_CKeySet.SaveKeySet();
	}
	//================================================
	Init();
	NewObject();
	SetEvent();
}