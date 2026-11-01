
//
//网球比赛-创建房间：类定义
//
import("$./../Room/RoomSet/ClassDef_MapList.gml");
importex("$./../../UI/CreateRoom/ClassDef_Tennis.gml");

class VHall_CreateRoom_Tennis_Logic item
{
	size = "400,450";bgcolor = "#FFFFFF";alpha = 50;valign(50,0);halign(50,0);
	var m_Name = "";						//房间名
	var m_PW = "";							//密码
	var m_Type = window.ROOM_TYPE_SINGLE;	//1普通单 2普通双 3挑战金单 4挑战金双 5撮合单 6撮合双
	var m_Look = 1;					//是否允许观战 0不允许 1允许
	var m_GameMapID = 1;			//游戏地图ID
	var m_GameNum = 2;				//游戏局制 1,2,3 (1，3，5)
	var m_Money = 0;				//赌注金额
	var m_tempMoneyFromEdit = 0; //保存挑战金编辑框的临时数据
	var m_MoneyType = 1;			//赌注货币类型 1,金币;2,点券;3,Pk点
	var m_FocusPos = 0;				//1房间名 2密码 3赌注
	var m_OpenType = 0;				//打开方式 1创建房间 2房间设置

	var m_ArrType = window.SplitStr2(window.ROOM_TYPE_STR,",");	//普通
	var m_ArrType_2 = window.SplitStr2(window.ROOM_TYPE2_STR,","); //挑战金
	var m_ArrType_3 = window.SplitStr2(window.ROOM_LOVERTYPE_STR,","); //情侣模式 
	//=========================与界面交互===========================
	void Init()
	{
		//复选框：禁止观战
		staticvar s_CHK_CannotLook = new VMyCheckBox
		{
			size = "30,30";pos = "210,130";Init("√");
		}
		staticvar s_CHK_CanLook = new BaseText
		{
			pos="255,230";
			src="允许观战";
		};
		//房间名称:edit
		staticvar s_Edit_RoomName = new edit
		{
			size = "180,26";pos = "120,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
		}
		//密码:edit
		staticvar s_Edit_PassWord = new edit
		{
			size = "180,26";pos = "120,91";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 10;ycenter = true;xcenter = true;
			//password = true;
			src = "密码";
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

		//确定：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			valign(98,0);halign(20,0);Init("确定");
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			valign(98,0);halign(80,0);Init("取消");
		}
		//游戏模式单选：普通
		staticvar s_R_GameModeNormal = new VMyRadio
		{
		}
		//游戏模式单选：挑战金
		staticvar s_R_GameModeWager = new VMyRadio
		{
		}
		//游戏模式下拉列表：普通
		staticvar s_CB_GameModeNormal = new VMyComboBox 
		{
			m_sizeX = 98;pos="37,130";
		}
		//游戏模式下拉列表：挑战金
		staticvar s_CB_GameModeWager = new VMyComboBox 
		{
			m_sizeX = 98;pos="37,130";
		}
		//游戏局制
		staticvar s_CB_GameNum = new VMyComboBox 
		{
			m_sizeX = 98;pos="269,129";
		}
		
		//挑战金:edit
		staticvar s_Edit_SetStake = new edit
		{
			size = "180,26";pos = "120,16";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
			src = "挑战金";
		}

		//挑战金类型
		staticvar s_CB_SetStake = new VMyComboBox 
		{
			m_sizeX = 98;pos="13,52";
		}

		//翻页：选地图
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(75,0);halign(50,0);Init();
		}
	}
	inclass("VHall_CreateRoom_Tennis_UI");//界面显示类

	void InitDB()
	{
		var _RoomID = window.GetMyRoomID();
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,_RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("error-RoomSet-GetRoomData():"+window.M_G_SERVER+",TBName:"+window.DESKDT+",_RoomID:"+_RoomID);
			return;
		}
	}
	InitDB();

	//==============================function=========================================
	//点击了确定
	void OnClick_BtnConfirm()
	{
		m_Name = s_Edit_RoomName.src;
		if (m_Name.Count < 1 || m_Name.Count > 12)
		{
			window.find("UIController").LoadDLG(351);//房间名称长度应在1-12字符之间！
			SetRoomNameHot();
			return;
		}
		var _res = window.JudgeAnyNameLicit(m_Name,"房间名称");
		if (_res < 0)
		{
			SetNkNameHot();
			return;
		}
		
		if (m_OpenType == 2)
		{
			OnClick_BtnConfirm2();
			return;
		}
		
		/*以下是创建房间*/
		var _iWager = toint(s_Edit_SetStake.src);
		//判断押注
		if (m_Type == window.ROOM_TYPE_SINGLE_WAGER || m_Type == window.ROOM_TYPE_DOUBLE_WAGER || m_Type == window.ROOM_TYPE_LOVERDOUBLE_WAGER)
		{
			if (_iWager == 0 || _iWager == "")
			{
				window.find("UIController").LoadDLG(161);//押注金额不能为0或空！
				SetStakeHot();
				return;
			}
			printf("B# 创建房间赌注:money:"+window.GetValueByMoneyType(m_MoneyType)+",_iWager:"+_iWager);
			if (toint(window.GetValueByMoneyType(m_MoneyType)) < toint(_iWager))
			{
				window.find("UIController").LoadDLG(158);//余额不足，无法创建房间！
				SetStakeHot();
				return;
			}
			
			//m_Type[1,4] 情侣为10
			if (m_Type != window.ROOM_TYPE_LOVERDOUBLE && m_Type != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
			{
				if (m_Type %2 == 0)
					m_Type = window.ROOM_TYPE_DOUBLE;
				else
					m_Type = window.ROOM_TYPE_SINGLE;
			}
			else
				m_Type = window.ROOM_TYPE_LOVERDOUBLE;
			
		}
		else //new
		{
			s_Edit_SetStake.src = "";
			_iWager = toint(s_Edit_SetStake.src);
		}

		var _row = _MapList.curselectrow();	
		m_GameMapID = _MapList.fieldstr(_row,window.TENNIS_GAME_MAPINFO_MAPID); //MapID

		m_GameMapID = window.tennisGameStatic.GetRandomMapID(m_GameMapID);
		if (s_Edit_PassWord.src != "")
		{
			m_PW = s_Edit_PassWord.src;
		}
		else
		{
			m_PW = "";
		}
		
		//发出创建房间消息：用户id 房间id(-1) 房间名称 房间密码 游戏类型 游戏地图ID 局数(1,2,3) 是否允许观战,赌注,货币类型
		var _Param = ""+window.GetMyUID()+",-1,"+m_Name+","+m_PW+","+m_Type+","+m_GameMapID+","+m_GameNum+","+m_Look+","+_iWager+","+m_MoneyType;
		window.Too_CreateRoom(_Param);
		parent.del();
	}

	//点击了确定-房间设置
	void OnClick_BtnConfirm2()
	{
//		alert("m_Type "+m_Type);
		var _iWager = toint(s_Edit_SetStake.src);
//		alert("OnClick_BtnConfirm2 m_Type = "+m_Type);
//		alert("s_Edit_SetStake.isUse = "+s_Edit_SetStake.isUse);
		//判断押注
		if (m_Type == window.ROOM_TYPE_SINGLE_WAGER || m_Type == window.ROOM_TYPE_DOUBLE_WAGER || m_Type == window.ROOM_TYPE_LOVERDOUBLE_WAGER)
		{
			if (_iWager == 0 || _iWager == "")
			{
				window.find("UIController").LoadDLG(161);//押注金额不能为0或空！
				SetStakeHot();
				return;
			}
			printf("B# 房间设置-赌注:money:"+window.GetValueByMoneyType(m_MoneyType)+",_iWager:"+_iWager+",差:"+(toint(_iWager)-m_Money));
			if (toint(window.GetValueByMoneyType(m_MoneyType)) < toint(_iWager)-m_Money)
			{
				window.find("UIController").LoadDLG(163);//余额不足，不能修改！
				SetStakeHot();
				return;
			}

			//m_Type[1,4] 情侣为10
			if (m_Type != window.ROOM_TYPE_LOVERDOUBLE && m_Type != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
			{
				if (m_Type %2 == 0)
					m_Type = window.ROOM_TYPE_DOUBLE;
				else
					m_Type = window.ROOM_TYPE_SINGLE;
			}
			else
				m_Type = window.ROOM_TYPE_LOVERDOUBLE;
		}
		else //new
		{
			
			s_Edit_SetStake.src = "";
			_iWager = toint(s_Edit_SetStake.src);
//			alert("_iWager = "+_iWager);
		}

		if (s_Edit_PassWord.src != "")
		{
			m_PW = s_Edit_PassWord.src;
		}
		else
		{
			m_PW = "";
		}
		
		//发出房间设置消息:用户ID 房间类型 局数 房间名称 房间密码 是否允许观战,赌注,货币类型
		var _Param = ""+window.GetMyUID()+","+m_Type+","+m_GameNum+","+m_Name+","+m_PW+","+m_Look+","+_iWager+","+m_MoneyType;
		window.Too_RoomSet(_Param);
		//双变单，修改金额判断

		var _row = _MapList.curselectrow();	
		var _MapID = _MapList.fieldstr(_row,window.TENNIS_GAME_MAPINFO_MAPID); //MapID
		if (_MapID != 0)
		{
			_MapID = window.tennisGameStatic.GetRandomMapID(_MapID);
			var _Param = ""+window.GetMyUID()+","+_MapID;
			//发出选择地图的消息：玩家ID，地图ID
			window.Too_SelectMap(_Param);
		}

		//点击确认房间设置，向服务器发送消息
		var _Param1 = ""+window.GetMyUID()+","+window.CLIENT_11_ROOMSETTING+","+window.CLIENT_11_ROOMSETTING_STR+",2";
		window.Tos_AddEvent(_Param1);
		parent.del();
	}


	//设置焦点-房间名
	void SetRoomNameHot()
	{
		timer(10,"s_Edit_RoomName.hot=1");m_FocusPos = 1;
	}
	//设置焦点-密码
	void SetPassWordHot()
	{
		timer(10,"s_Edit_PassWord.hot=1");m_FocusPos = 2;
	}
	//设置焦点-赌注
	void SetStakeHot()
	{
		timer(10,"s_Edit_SetStake.hot=1");m_FocusPos = 3;
	}
	//1房间名 2密码 3赌注
	void ChangeHot()
	{
		switch (m_FocusPos)
		{
		case 0:{SetRoomNameHot();break;}
		case 1:{SetPassWordHot();break;}
		case 2:
		{
			if (s_Edit_SetStake.isUse)
			{
				SetStakeHot();
			}
			else
			{
				SetRoomNameHot();
			}
			break;
		}
		case 3:{SetRoomNameHot();break;}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Edit_RoomName//房间名称:edit
		{
			timer(10,"hot=1");
			selectall=true; 
			void OnEnter(){parent.OnClick_BtnConfirm();}
		}
		set s_Edit_PassWord//密码:edit
		{
			void OnEnter(){parent.OnClick_BtnConfirm();}
		}
		set s_CHK_CannotLook//复选框：禁止观战
		{

			void OnCheck(){MouseCheck();parent.m_Look = 1;}
			void OnUnCheck(){MouseUnCheck();parent.m_Look = 0;}
		}
		set s_R_GameModeNormal //游戏模式单选：普通
		{
//			alert("Init");

			groupname="VHall_CreateRoom_Tennis_Group";


			void OnCheck()  
			{
				if (GetChecked()){return;}
				MouseCheck();

				//屏蔽挑战金
				parent.s_CB_GameModeNormal.SetState(window.BTN_STATE_LIGHT);
				parent.s_CB_GameModeWager.SetState(window.BTN_STATE_GREY);
				parent.s_CB_GameModeLover.SetState(window.BTN_STATE_GREY);

				parent.s_CB_SetStake.SetState(window.BTN_STATE_GREY);
				parent.s_TZJBK.SetState(window.BTN_STATE_GREY);
				parent.s_Edit_SetStakeCap.show = true;
				parent.s_Edit_SetStake.isUse = false;
//				parent.s_Edit_SetStake.src = "";
				if(parent.s_Edit_SetStake.src != "")
				{
					parent.m_tempMoneyFromEdit = parent.s_Edit_SetStake.src;
					parent.s_Edit_SetStake.src = "";
				}
				
				//当玩家从挑战金模式点击普通单选按钮，玩家还没有点击下拉列表的时候，绑定初始状态
				 if(parent.m_Type!=window.ROOM_TYPE_DOUBLE)//如果选择了第二项则不变
				 {
					parent.m_Type = window.ROOM_TYPE_SINGLE;
				 }
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_GameModeWager //游戏模式单选：挑战金
		{
			groupname="VHall_CreateRoom_Tennis_Group";
			
//			parent.m_Type = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKTYPE);//8字段
			
			void OnCheck()
			{

				if (GetChecked()){return;}
				MouseCheck();

				//激活挑战金
				parent.s_CB_GameModeNormal.SetState(window.BTN_STATE_GREY);
				parent.s_CB_GameModeWager.SetState(window.BTN_STATE_LIGHT);
				parent.s_CB_GameModeLover.SetState(window.BTN_STATE_GREY);

				parent.s_CB_SetStake.SetState(window.BTN_STATE_LIGHT);
				parent.s_TZJBK.SetState(window.BTN_STATE_LIGHT);
				parent.s_Edit_SetStakeCap.show = false;
				parent.s_Edit_SetStake.isUse = true;

				
//				alert();
				//当玩家从挑战金模式点击普通单选按钮，玩家还没有点击下拉列表的时候，绑定初始状态
				if(parent.m_Type!=window.ROOM_TYPE_DOUBLE_WAGER && parent.m_Type!=window.ROOM_TYPE_LOVERDOUBLE_WAGER)//如果选择了第二项则不变
				 {
					parent.m_Type = window.ROOM_TYPE_SINGLE_WAGER;
				 }
				 if (parent.m_Type==window.ROOM_TYPE_LOVERDOUBLE_WAGER )          //情侣模式不能观战
				 {
					 parent.s_CHK_CannotLook.show= false;
					 parent.s_CHK_CanLook.show= false;
				 }
				 else 
				 {
					 parent.s_CHK_CannotLook.show= true;
					 parent.s_CHK_CanLook.show= true;
				 }
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_GameModeLover
		{
			groupname="VHall_CreateRoom_Tennis_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();

				//激活挑战金
				parent.s_CB_GameModeNormal.SetState(window.BTN_STATE_GREY);
				parent.s_CB_GameModeWager.SetState(window.BTN_STATE_GREY);
				parent.s_CB_GameModeLover.SetState(window.BTN_STATE_GREY);

				parent.s_CB_SetStake.SetState(window.BTN_STATE_GREY);
				parent.s_TZJBK.SetState(window.BTN_STATE_GREY);
				parent.s_Edit_SetStakeCap.show = true;
				parent.s_Edit_SetStake.isUse = false;

				if(parent.s_Edit_SetStake.src != "")
				{
					parent.m_tempMoneyFromEdit = parent.s_Edit_SetStake.src;
					parent.s_Edit_SetStake.src = "";
				}
				
				//当玩家从挑战金模式点击普通单选按钮，玩家还没有点击下拉列表的时候，绑定初始状态
//				 if(parent.m_Type!=window.ROOM_TYPE_DOUBLE && parent.m_Type!=window.ROOM_TYPE_SINGLE)//如果选择了第二项则不变
//				 {
					parent.m_Type = window.ROOM_TYPE_LOVERDOUBLE;
//				 }
				 parent.s_CHK_CannotLook.show= false;
				 parent.s_CHK_CanLook.show= false;
			}
			void OnUnCheck(){MouseUnCheck();}
			//MouseUnCheck();  //为版本去掉情侣模式比赛
		}
		set s_CB_GameModeNormal  //游戏模式：普通
		{

			//处理选中事件
			void WhichSelect(index)
			{

				parent.m_Type = toint(index)+1;

				parent.s_CB_SetStake.SetState(window.BTN_STATE_GREY);
				parent.s_TZJBK.SetState(window.BTN_STATE_GREY);
				parent.s_Edit_SetStakeCap.show = true;
				parent.s_Edit_SetStake.isUse = false;

			}
			
			SetID(toint(window.POS_CREATEROOM)+1);
			SetPos(155+20,124-18);
			SetWidthAndType(148-20,0);
			SetData(""+window.ROOM_TYPE_STR);
		}

		set s_CB_GameModeWager  //游戏模式：挑战金
		{
			//处理选中事件
			void WhichSelect(index)
			{
				if (toint(index) == 2)
					parent.m_Type = window.ROOM_TYPE_LOVERDOUBLE_WAGER;
				else
					parent.m_Type = toint(index)+3;

				parent.s_CB_SetStake.SetState(window.BTN_STATE_LIGHT);
				parent.s_TZJBK.SetState(window.BTN_STATE_LIGHT);
				parent.s_Edit_SetStakeCap.show = false;
				parent.s_Edit_SetStake.isUse = true;

					if(parent.m_Money>0)
					{
						parent.s_Edit_SetStake.src = parent.m_Money;
					}

				 if (toint(index) == 2 )          //情侣模式不能观战
				 {
					 parent.s_CHK_CannotLook.show= false;
					 parent.s_CHK_CanLook.show= false;
				 }
				 else 
				 {
					 parent.s_CHK_CannotLook.show= true;
					 parent.s_CHK_CanLook.show= true;
				 }

			}
			SetID(toint(window.POS_CREATEROOM)+4);
			SetPos(155+20,124-18+29+25);
			SetWidthAndType(148-20,0);
			SetData(""+window.ROOM_TYPE2_STR);
		}

		set s_CB_GameModeLover  //游戏模式：情侣
		{
			//SetState(window.BTN_STATE_GREY);//为版本关闭情侣比赛模式
			//处理选中事件
			void WhichSelect(index)
			{

				parent.m_Type = toint(index)+1;

				parent.s_CB_SetStake.SetState(window.BTN_STATE_GREY);
				parent.s_TZJBK.SetState(window.BTN_STATE_GREY);
				parent.s_Edit_SetStakeCap.show = true;
				parent.s_Edit_SetStake.isUse = false;
				parent.s_CHK_CannotLook.show= false;
			    parent.s_CHK_CanLook.show= false;
			}
			
			SetID(toint(window.POS_CREATEROOM)+10);
			SetPos(155+20,124-18+25);
			SetWidthAndType(148-20,0);
			SetData(""+window.ROOM_LOVERTYPE_STR);
		}

		set s_CB_GameNum
		{
			void WhichSelect(index)
			{
				parent.m_GameNum = toint(index)+1;
			}
			
			SetID(toint(window.POS_CREATEROOM)+2);
			SetPos(155,195+5+25);
			SetWidthAndType(148,0);
			SetData("一局制,三局制,五局制");
		}

		set s_CB_SetStake
		{
			void WhichSelect(index)
			{
				parent.m_MoneyType = toint(index)+1;
			}
			
			SetID(toint(window.POS_CREATEROOM)+3);
			SetPos(246,161+10+25);
			SetWidthAndType(57,0);
			SetData("金币");
		}
		set s_Edit_SetStake
		{
			var isUse = false;
		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_Confirm//确定：按钮
		{
			void OnPressed(){parent.OnClick_BtnConfirm();}
		}
		set s_Btn_Cancel//取消：按钮
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_Help//帮助：按钮
		{
			void OnPressed()
			{
				if (parent.m_OpenType == 1)
				{
					window.CallBack_Help(window.POS_CREATEROOM);
				}
				else
				{
					window.CallBack_Help(window.POS_ROOM_ROOMSET);
				}
			}
		}
		set s_PageCtrl//翻页：选地图
		{
			targetname="VCreateRoom_MapList_Logic_NAME";
			countperpage = 2;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateRoom_MapList_Logic");// 获得已绑定的数据表
		}
	}
	//================================DBList=========================================
	Init();
	var _MapList = new VRoomSet_MapList_Logic
	{
		name = "VCreateRoom_MapList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.MAPINFO,"Bind_VCreateRoom_MapList_Logic");// 绑定数据表

		var _selectParam = "SELECT * FROM MapInfo WHERE MapType=2";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateRoom_MapList_Logic",window.TENNIS_GAME,_selectParam);
		
		void OnDelete()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);//移除绑定
		}
	}
	SetEvent();

	//取得房间的数据
	void GetRoomData()
	{
		var _RoomID = window.GetMyRoomID();
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,_RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("error-RoomSet-GetRoomData():"+window.M_G_SERVER+",TBName:"+window.DESKDT+",_RoomID:"+_RoomID);
			return;
		}
		m_Name = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKNAME);//1字段
		s_Edit_RoomName.src = m_Name;

		m_PW = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKPASS);//2字段
		if (m_PW == ""){m_PW = "";}
		s_Edit_PassWord.src = m_PW;
		
		m_MoneyType = window.g_Row.GetData(window.M_G_SERVER_DESKDT_IWAGERTYPE);//36字段
		
		s_CB_SetStake.SetDefaultSrc(window.GetPriceNameByType(m_MoneyType));

		m_Money = window.g_Row.GetData(window.M_G_SERVER_DESKDT_IWAGER);//35字段
		m_Type = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKTYPE);//8字段

//		alert("m_Money = "+m_Money);
		if (m_Money > 0)
		{
			m_Type += 2;
			s_Edit_SetStake.src = m_Money;

		}
		else
		{
			m_Money = 0;
		}
//		alert("m_Type = "+m_Type);
//		s_CB_SetStake.SetState(window.BTN_STATE_GREY);
//		s_TZJBK.SetState(window.BTN_STATE_GREY);
//		s_Edit_SetStakeCap.show = true;
//		s_Edit_SetStake.isUse = false;

//		alert("In GetRoomData m_Type = "+m_Type);
		switch (m_Type)
		{
			//普通
			case 1:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[0]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[0]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
//				s_CB_SetStake.SetState(window.BTN_STATE_GREY);
//				s_TZJBK.SetState(window.BTN_STATE_GREY);
//				s_Edit_SetStakeCap.show = true;
//				s_Edit_SetStake.isUse = false;
				s_R_GameModeNormal.startstate=1;
				s_R_GameModeWager.startstate=0;
				break;
			case 2:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[1]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[0]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
//				s_CB_SetStake.SetState(window.BTN_STATE_GREY);
//				s_TZJBK.SetState(window.BTN_STATE_GREY);
//				s_Edit_SetStakeCap.show = true;
//				s_Edit_SetStake.isUse = false;
				s_R_GameModeNormal.startstate=1;
				s_R_GameModeWager.startstate=0;
				break;
			//挑战金
			case 3:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[0]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[0]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
				s_CB_SetStake.SetState(window.BTN_STATE_LGHT);
				s_TZJBK.SetState(window.BTN_STATE_LIGHT);
				s_Edit_SetStakeCap.show = false;
				s_Edit_SetStake.isUse = true;
				s_R_GameModeNormal.startstate=0;
				s_R_GameModeWager.startstate=1;
				SetStakeHot();
			break;
			case 4:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[0]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[1]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
				s_CB_SetStake.SetState(window.BTN_STATE_LGHT);
				s_TZJBK.SetState(window.BTN_STATE_LIGHT);
				s_Edit_SetStakeCap.show = false;
				s_Edit_SetStake.isUse = true;
				s_R_GameModeNormal.startstate=0;
				s_R_GameModeWager.startstate=1;
				break;
//			case 5:
//				s_CB_GameMode.SetDefaultSrc(""+m_ArrType[4]);
//				s_CB_GameMode_2.SetDefaultSrc(""+m_ArrType[4]);
//				break;
//			case 6:
//				s_CB_GameMode.SetDefaultSrc(""+m_ArrType[5]);
//				s_CB_GameMode_2.SetDefaultSrc(""+m_ArrType[5]);
//				break;
			case 10:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[0]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[0]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
//				s_CB_SetStake.SetState(window.BTN_STATE_GREY);
//				s_TZJBK.SetState(window.BTN_STATE_GREY);
//				s_Edit_SetStakeCap.show = false;
//				s_Edit_SetStake.isUse = true;
				s_R_GameModeNormal.startstate=0;
				s_R_GameModeWager.startstate=0;
				s_R_GameModeLover.startstate=1;
				break;
			case 12:
				s_CB_GameModeNormal.SetDefaultSrc(""+m_ArrType[0]);
				s_CB_GameModeWager.SetDefaultSrc(""+m_ArrType_2[2]);
				s_CB_GameModeLover.SetDefaultSrc(""+m_ArrType_3[0]);
				s_CB_SetStake.SetState(window.BTN_STATE_LGHT);
				s_TZJBK.SetState(window.BTN_STATE_LIGHT);
				s_Edit_SetStakeCap.show = false;
				s_Edit_SetStake.isUse = true;
				s_R_GameModeNormal.startstate=0;
				s_R_GameModeWager.startstate=1;
				s_R_GameModeLover.startstate=0;
				break;
		}

		m_Look = window.g_Row.GetData(window.M_G_SERVER_DESKDT_CANLOOK);//12字段
		if (toint(m_Look) != 0)
		{
			
			s_CHK_CannotLook.startstate = 1;
		}

		m_GameNum = window.g_Row.GetData(window.M_G_SERVER_DESKDT_SCORENUM);//9字段
		switch (m_GameNum)
		{
			case 1:s_CB_GameNum.SetDefaultSrc("一局制");break;
			case 2:s_CB_GameNum.SetDefaultSrc("三局制");break;
			case 3:s_CB_GameNum.SetDefaultSrc("五局制");break;
		}

		window.g_Row.Release();

//		alert("s_Edit_SetStake.src ="+s_Edit_SetStake.src);
	}
	
	//设计打开方式 
	//1创建房间 2房间设置
	void SetOpenType(_type)
	{
		ChangeTitle(_type); //Use for UI
		m_OpenType = _type;
		if (_type == 1)
		{
			//s_CB_GameModeWager.GreyIndex(2);//为版本去掉 情侣挑战金
			_MapList.checkselect(10,10);
			s_R_GameModeNormal.startstate=1;
			s_CB_GameModeNormal.SetDefaultSrc("普通单打");
			s_CB_GameModeWager.SetDefaultSrc("挑战金单打");
			s_CB_GameModeLover.SetDefaultSrc("情侣模式");
			s_CB_GameModeWager.SetState(window.BTN_STATE_GREY);
			s_CB_SetStake.SetDefaultSrc("金币");
			s_CB_GameNum.SetDefaultSrc("三局制");
			m_Name = "来一起打网球";
			s_Edit_RoomName.src = m_Name;
			s_CB_SetStake.SetState(window.BTN_STATE_GREY);
			s_TZJBK.SetState(window.BTN_STATE_GREY);
			s_CHK_CannotLook.startstate = 1;
			return;
		}
		if (_type == 2)
		{
			GetRoomData();
			//s_CB_GameModeWager.GreyIndex(2);//为版本去掉 情侣挑战金
			SetTitle();
			return;
		}
	}
};