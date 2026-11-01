//房间-邀请类定义
//yxf 2008年10月23日

import("$./ClassDef_All.gml");
importex("$./ClassDef_Friend.gml");
importex("$./../../../UI/Room/Invite/ClassDef.gml");

class VRoom_Invite_Logic item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	var m_TypeIndex = 0;	//类型 1全部，2好友
	//=============================与界面交互========================================
	void Init()
	{
		//全部：Radio
		staticvar s_R_All = new VMyRadio
		{
			Init("全部",1);pos = "300,100";
		}
		//好友：Radio
		staticvar s_R_Friend = new VMyRadio
		{
			Init("好友",1);pos = "300,200";
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);
		}
		//查找玩家：按钮
		staticvar s_Btn_Find = new VMyButton
		{
			Init("查找玩家");valign(80,0);halign(70,0);
		}
	}
	inclass("VRoom_Invite_UI");//界面显示类
	//==============================function=========================================
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_All.show = false;
		m_Class_Friend.show = false;
	}
	//全部，好友的切换
	//参数 type：类型 1全部，2好友
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		switch (type)
		{
			case 1:{m_Class_All.show = true;break;}
			case 2:{m_Class_Friend.show = true;m_Class_Friend.ChangeType(0);break;}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		set s_R_All//全部：Radio
		{
			groupname="VRoomInvite_Type_Group";
			startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Friend//好友：Radio
		{
			groupname="VRoomInvite_Type_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.parent.del();}
		}
//		set s_Btn_Help//帮助：按钮
//		{
//			void OnPressed(){window.CallBack_Help(window.POS_ROOM_INVITE,parent.m_TypeIndex);}
//		}
		set s_Btn_Find
		{
			void OnPressed()
			{
				window.find("UIController").LoadUI("UI_ROOM_FINDUSER"); 
			}	
		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		//全部玩家类
		staticvar m_Class_All = new VRoomInvite_All_Loigc{}

		//好友与黑名单类
		staticvar m_Class_Friend = new VRoomInvite_Friend_Loigc{}
	}
	//================================DBList=========================================
	void OnCreated()
	{	
		Init();
		NewSubObj();
		SetEvent();	
	}
};