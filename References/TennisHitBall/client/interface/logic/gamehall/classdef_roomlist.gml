//
//大厅房间列表DB List类定义
//

importex("$./../../UI/GameHall/ClassDef_RoomList.gml");

//一行显示类：房间号+房间类型+房间名+房间状态+有密码(小锁)+观战按钮
class VColumn_Hall_Room_Logic item
{
	size = "800,50";//bgcolor = "#FF00";
	var m_RoomID = 0;	//房间ID
	var m_type   = 0;	//房间类型
	//===========================与显示交互======================
	void Init()
	{
		//参数2 data : 房间号
		//房间类型
		staticvar s_ID = new VMyText{pos = "0,0";}
		//参数1 data1 ：房间类型 0未知 1竞技单 2竞技双
		//参数2 data2 ：挑战金额 >0 
		staticvar s_Type = new VMyText{pos = "0,20";}
		
		//房间名
		//参数 data1:
		staticvar s_Name = new VMyText{pos = "100,0";}
		
		//房间状态
		//参数 data1:0未知 1游戏中 2等待中（有密码显示密码，无显示1/2） 3结算中
		//参数 data2:当前人数
		//参数 data3:最大人数
		//参数 data4:有无密码(小锁)0没有 1有
		//参数 data5:男女比例 如1122 代表 "男男女女" 显示为 "女女男男"
		staticvar s_State = new VMyText{pos = "200,20";}
		
		//观战人数 1/6
		//参数 data1:当前人数
		//参数 data2:最大人数
		staticvar s_LookNum = new VMyText{pos = "100,20";}

		//观战：按钮
		//data1：0灰 1亮
		staticvar s_Btn_LookAt = new VMyButton
		{
			Init("观战");pos = "650,0";
		}
	}
	inclass("VColumn_Hall_Room_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void SetEvent()
	{
		set s_Btn_LookAt
		{
			void OnPressed()
			{
				if ( parent.m_type != window.ROOM_TYPE_LOVERDOUBLE)
				{
	//				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
	//				{
						var _param = ""+window.GetMyUID()+","+parent.m_RoomID;
						window.Too_JoinLookerOn(_param);
	//				}
				}
			}
		}
	}
	SetEvent();
	void OnLBDClick()
	{
		//加入房间是否需要密码:房间id
		window.Too_NeedPassword(m_RoomID);
	}
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		m_RoomID = szData;
		var _type = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKTYPE);//类型
		var _name = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKNAME);//名称
		var _state = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKSTA);//状态
		var _PassWord = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKPASS);//密码
		var _CurrNum = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKCURRNUM);//当前人数
		var _MaxNum = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_DESKMAXNUM);//最大人数
		var _canlook = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_CANLOOK);	//是否可以观战
		var _isGamestart = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_GAMESTARTLOOK);//游戏是否开始 0没有 1开始了
		var _showroomID = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_SHOWID);	//房间显示ID
		var _iwager = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_IWAGER);	
		var _team = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_SEXSORT);	//1122男男女女
		var _lookmax = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_LOOKERMAXNUM);	
		var _lookcurr = parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_LOOKERCURRNUM);	

		//s_Btn_LookAt.SetState(window.BTN_STATE_GREY);//观战按钮为灰的
		m_type =_type;
		s_Btn_LookAt.show = false;
		s_ID.SetData(_showroomID);
		s_Type.SetData(_type,_iwager);
		s_Name.SetData(_name,"","");
		s_top.SetData(1);
	
		var _IsHadPW = 0;//是否有密码 0没有 1有
		if (_PassWord != "" && _PassWord != ""){_IsHadPW = 1;}
		
		s_State.SetData(_state,_CurrNum,_MaxNum,_IsHadPW,_team);
		
		//在游戏中 且可以观战 且游戏确实已开始
		if (_state == 1 && _canlook==1 && toint(_isGamestart)==1)
		{
			s_Btn_LookAt.show = true;
			if (_type == window.ROOM_TYPE_LOVERDOUBLE)
				s_Btn_LookAt.SetState(window.BTN_STATE_GREY);//观战按钮是亮的
		}
		s_LookNum.SetData(_lookcurr,_lookmax);	//写死的

//		s_iWager.SetData(parent.fieldstr(iRow,window.M_G_SERVER_DESKDT_IWAGER));//赌注
	}
};

//
//总的类：List
//
class VHall_RoomList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="800,400";valign(60,0);halign(50,0);simpleshowmode = "1,12";
	//
	selecttype="1";colfilter="0";
	//alpha = 70;bgcolor = "#FF";
	
	inclass("VHall_RoomList_UI"); //界面显示类

	columclass="0,VColumn_Hall_Room_Logic"; //ID
};