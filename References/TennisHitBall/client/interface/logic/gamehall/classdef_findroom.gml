//查找房间
//yxf 2009年10月20日

importex("$./../../UI/GameHall/ClassDef_FindRoom.gml");

class VFindRoom_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	var m_Type = 0;	//0房间名 1玩家昵称
	//=============================与界面交互========================================
	void Init()
	{
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

		//类型
		staticvar s_CB_Type = new VMyComboBox 
		{
			m_sizeX = 98;halign(10,0);valign(10,0);
		}
		
		//输入:edit
		staticvar s_Edit_Input = new edit
		{
			size = "180,26";pos = "120,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
		}

		//加入房间：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			Init("加入房间");pos="23,429";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");pos="226,435";
		}
	}
	inclass("VFindRoom_UI");//界面显示类
	//==============================function=========================================
	//点击了加入房间
	void OnClick_Confirm()
	{
		if (m_Type == 0)//房间名
		{
			if (s_Edit_Input.src == "")
			{
				window.find("UIController").LoadDLG(238);//房间号不能为空！
				return;
			}

			//加入房间是否需要密码:房间id
			var _roomid = window.ShowIDToRoomID(toint(s_Edit_Input.src));
			if (window.GetRoomType(_roomid) <= 0)
			{
				window.find("UIController").LoadDLG(242);//没有找到房间！
				return;
			}
			window.Too_NeedPassword(_roomid);
		}
		else
		{
			if (s_Edit_Input.src == "")
			{
				window.find("UIController").LoadDLG(237);//昵称不能为空！
				return;
			}

//			var _uid = window.GetUIDByName(s_Edit_Input.src);
//			if (_uid < 0)
//			{
//				window.find("UIController").LoadDLG(241);//没有找到用户！
//				return;
//			}
//
//			var _state = window.GetStateByUID(_uid);
//			if (_state != window.USER_GAMESTATE_ROOM)
//			{
//				window.find("UIController").LoadDLG(236);//你查找的玩家此时此刻不在房间中！
//				return;
//			}

			//获得用户的房间号 
			window.Too_GetUserDid(s_Edit_Input.src);
		}
		parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_CB_Type
		{
			//接口函数 WhichSelect:
			//参数：
			void WhichSelect(index)
			{
				parent.m_Type = index;
				parent.s_Edit_Input.src = "";
				if (parent.m_Type == 0)
				{
					parent.s_Edit_Input.SetOnlyNum(true);
					parent.s_Edit_Input.maxsize = 4;
				}
				else
				{
					parent.s_Edit_Input.SetOnlyNum(false);
					parent.s_Edit_Input.maxsize = 12;
				}
			}
			void GetOffSetX(){return parent.parent.left + parent.left;}
			void GetOffSetY(){return parent.parent.top + parent.top;}
			SetID(toint(window.POS_FINDROOM));
			SetPos(100,55);
			SetWidthAndType(146,0);
			SetData("房间号,玩家昵称");
			SetDefaultSrc("房间号");
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
//		set s_Btn_Help
//		{
//			void OnPressed(){window.CallBack_Help(window.POS_WRITEMAIL);}
//		}

		set s_Btn_Confirm
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_Confirm();}
			}
		}
		set s_Btn_Cancel
		{
			void OnPressed(){parent.parent.del();}
		}
	}
	
	//================================DBList=========================================
	Init();
	SetEvent();

	void OnCreated()
	{
		s_Edit_Input.timer(10,"hot=1");
	}
};