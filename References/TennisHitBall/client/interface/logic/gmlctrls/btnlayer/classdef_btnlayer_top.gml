//
//按钮层-上 类定义
//

//基础类
class VBtnLayer_Top_Logic item
{
	size = "100%,8%";
	bgcolor = window.G_BGCOLOR;
	alpha = window.G_ALPHA;
	if(window.g_CDisplaySet.GetFullScreen() == 1)
	{
		drag = "none";
	}
	else
	{
		drag = "window";
	}
	name = "clickmedragwindow";
	//cursor = window.CURSOR_HAND;
};

//=================================================================================================
//登录
class VLogin_BtnLayer_Top_Logic VBtnLayer_Top_Logic
{
	//=========================与界面交互===========================
	void Init()
	{
		//修改密码：按钮(暂时不要了)
//		staticvar s_Btn_ModifyPW = new VMyButton
//		{
//			pos(600,0);Init("修改密码");
//		}
		//注册帐号:按钮
		staticvar s_Btn_Register = new VMyButton
		{
			pos(700,0);Init("注册帐号");
		}
		//充值:按钮
		staticvar s_Btn_Payment = new VMyButton
		{
			pos(800,0);Init("充值");
		}
		//退出：按钮
		staticvar s_Btn_Exit = new VMyButton
		{
			pos(900,0);Init("退出");
		}
	}
	inclass("VLogin_BtnLayer_Top_UI");//界面显示类
	//=================================================================================
	//设置响应事件
	void SetEvent()
	{
//		set s_Btn_ModifyPW
//		{
//			void OnPressed(){window.OnClick_ModifyPW();}
//		}
		set s_Btn_Register
		{
			void OnPressed(){window.OnClick_Register();}
		}
		set s_Btn_Payment
		{
			void OnPressed(){window.OnClick_Payment();}
		}
		set s_Btn_Exit
		{
			void OnPressed(){window.OnClick_BTN_ExitGame();}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};

//================================================================================================
//频道+创建角色+大厅+房间：通用
class VBtnLayer_Top_Common_Logic VBtnLayer_Top_Logic
{
	var m_Pos = -1;	//频道 创建角色 大厅 房间
	//=========================与界面交互===========================
	void Init()
	{
		//界面位置
		//参数 data1: "登录"
		staticvar s_Pos = new VMyText
		{
			pos(100,0);
			void SetData(data)
			{
				switch (data)
				{
				case 2:src = "频道选择";break;
				case 3:src = "创建角色";break;
				case 10:src = "游戏大厅";break;
				case 80:src = "房间";break;
				}
			}
		}

		//频道类型+频道名+房间号
		//参数 data1: "新手区 > 旺仔 >"
		//	   data2: 1 (房间号)
		//	   data3: 房间名
		staticvar s_SVName = new VMyText
		{
			pos = "200,0";
			void SetData(data1,data2,data3)
			{
				if (parent.m_Pos == window.POS_ROOM)
				{
					var _roomID = toint(data2);
					if (_roomID > 10 && _roomID < 100)
					{
						_roomID = "0"+data2;
					}
					if (_roomID < 10)
					{
						_roomID = "00"+data2;
					}

					src = ""+data1+" > 房间"+_roomID+" "+data3;
				}
				else
				{
					src = ""+data1;
				}
			}
		}
		
		//充值:按钮
		staticvar s_Btn_Payment = new VMyButton
		{
			pos(600,0);Init("充值");
		}
		//设置：按钮
		staticvar s_Btn_GameSetUp = new VMyButton
		{
			pos(700,0);Init("设置");
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(800,0);Init("帮助");
		}
		//返回：按钮
		staticvar s_Btn_Return = new VMyButton
		{
			pos(900,0);Init("返回");
		}
	}
	inclass("VBtnLayer_Top_Common_UI");//界面显示类
	//==============================function=========================================
	//点击了返回
	void OnClick_BtnReturn()
	{
		if (m_Pos == window.POS_CHANNELCHOOSE)
		{
			window.find("UIController").LoadDLG(110);//你确定要返回登录吗？
			return;
		}
		if (m_Pos == window.POS_CREATEROLE)
		{
			window.OtherToChannelChoose();
			return;
		}
		if (m_Pos == window.POS_GAMEHALL)
		{
			window.OnClick_BTN_ReturnChannel();
			return;
		}
		if (m_Pos == window.POS_ROOM)
		{
			window.RoomToHall();
			return;
		}
	}	
	//=========================================================================
	//[外部接口]设置位置
	void SetPos(_pos)
	{
		m_Pos = _pos;
		s_Pos.SetData(m_Pos,"");
	}
	//[外部接口]设置频道名
	void SetSvName(_sv,roomid,roomname)
	{
		s_SVName.SetData(_sv,roomid,roomname);
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Payment
		{
			void OnPressed(){window.OnClick_Payment();}
		}
		set s_Btn_GameSetUp
		{
			void OnPressed(){window.OnClick_BtnGameSetUp();}
		}
		set s_Btn_Help
		{
			void OnPressed(){if (GetState() == window.BTN_STATE_LIGHT){window.OnClick_BTN_Help();}}
			SetState(window.BTN_STATE_GREY);
		}
		set s_Btn_Return
		{
			void OnPressed(){parent.OnClick_BtnReturn();}
		}
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		SetEvent();
		OnMyCreated();	//返给实例用
	}
};

//游戏中
class VGame_BtnLayer_Top_Logic VBtnLayer_Top_Logic
{
	bgcolor = "#FF";
	inclass("VGame_BtnLayer_Top_UI");//界面显示类
};