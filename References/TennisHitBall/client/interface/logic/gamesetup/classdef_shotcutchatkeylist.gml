//游戏设置中，快捷聊天LIST类定义

import ("$./../../UI/GameSetUp/ClassDef_ShotcutChatlist.gml");

//一行显示类：行动+按键
class VColumn_Action_ShotcutChatKey_Logic item
{
	size = "300,30";//bgcolor = "#FF00";

	var m_Index = 0;
	var m_content = "";
	var m_type = 0;	//快捷聊天类型	0为默认，1为自定义
	var m_select = false;	//当前是否选中状态

	//=========================与显示交互==================、、
	void Init()
	{
		//行动
		//参数 data1: 行动名称
		staticvar  s_Action = new VMyText
		{
			pos = "20,0";
		}
		//按键值
		//参数 data1：按键
		staticvar s_ShotcutChatValue = new VMyText
		{
			pos = "150,0";
		}
	}
	inclass ("VColumn_Action_ShotcutChat_UI");//界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}
	//===========================================================
	void OnSelect(){OnMySelect();m_select = true;};
	void OnUnSelect()
	{
		OnMyUnSelect();
		if(m_type == 1)
		{
			if(m_select)
			{
				ModifyShotcutContent();
			}
			s_edit_ShotcutContent.del();
		}
		m_select = false;
		
	};
	void OnMouseDownL()//OnLBDClick()
	{
		if(m_type == 1 && !m_select)
		{
			m_select = true;
			staticvar s_edit_ShotcutContent = new edit
			{
				font = "宋体,-1,12";
				size = "120,17";
				pos = "135,6";
				ycenter = true;
				maxsize = 60;
				src = parent.s_ShotcutChatValue.src;
				timer(10,"hot=1");
				selectall=true; 
				setNoAddChr("",true);
				var _lastConten = "";

				void OnKeyCharErr()
				{
					alert("不支持的字符");
				}

				void OnKeyChar()
				{
					var _result = window.JudgeAnyNameLicit(src,"快捷聊天");
					if(_result != 1)
					{
						src = ""+_lastConten;
					}
					else
					{
						_lastConten = src;
					}
				}

				void GetData()
				{
					return src;
				}
			}
			s_ShotcutChatValue.SetData("");
		}
		
	}

	void ModifyShotcutContent()
	{
		var _content = s_edit_ShotcutContent.GetData();
//		var _result = window.JudgeAnyNameLicit(_content,"快捷聊天");
//		if(_content != "" && _result == 1)
		if(_content != "")
		{
			window.g_CShotcutChat.SetShotcutContent(m_Index,_content);
		}
		else
		{
			s_ShotcutChatValue.SetData(m_content);
		}
		//s_edit_ShotcutContent.del();
	}
	
	void OnDataExchange(iRow,szData)
	{
		m_Index = toint(parent.fieldstr(iRow,window.GAMEUI_SHOTCUTCHATCONTENT_SHOTCUT_KEY));
		var _index = m_Index-9;
		if(_index == 10)
		{
			_index = 0;
		}
		var _type = parent.parent.m_shotcutType;
		m_type = _type;
		var _content = "";
		if(_type == 0)
		{
			_content = parent.fieldstr(iRow,window.GAMEUI_SHOTCUTCHATCONTENT_DES);
		}
		else
		{
			_content = parent.fieldstr(iRow,window.GAMEUI_SHOTCUTCHATCONTENT_CUSTOMDES);
		}
		m_content = _content;
		s_Action.SetData(_index);
		s_ShotcutChatValue.SetData(_content);
	}
}

//
//总的类：List
//
class VGameSetUp_ShotcutChatKeyList_Logic VN2ListCtrl
{
	//需要显示时改变
	size = "300,360";valign(90,0);halign(60,0);
	scroll = window.SCROLL_NOYES;
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF";
	inclass("VGameSetUp_ShotcutChatList_UI");//界面显示类
	columclass="0,VColumn_Action_ShotcutChatKey_Logic"; //ID
}