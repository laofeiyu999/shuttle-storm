//
//房间：按钮层：包含上边(位置名+频道名+个人信息+背包+设置+返回大厅)
//yxf 2009年10月13日
//

new item
{
	name = "ROOM_BTNLAYER_LOGIC";
	size = "100%,100%";
	
	var m_Channel = ""+window.GetChannelType()+" > "+window.MYDATA.GetChannel();	//新手赛>频道名称
	var m_RoomID = window.GetMyRoomID();	//房间ID
	var m_RoomName = window.GetRoomNameByRoomID(m_RoomID);//房间名

	var _VRoom_BtnLayer_Top_Logic = new VBtnLayer_Top_Common_Logic
	{
		//返给实例用
		void OnMyCreated()
		{
			//消息管理器
			new VHall_MsgMgr_Logic{}

			SetPos(window.POS_ROOM);
			SetSvName(parent.m_Channel,window.RoomIDToShowID(parent.m_RoomID),parent.m_RoomName);
		}
	}

	//房间的数据
	var _VNet2DBRow = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_SERVER,window.DESKDT,0,window.GetMyRoomID(),1);
			AddDBEvent("OnDeskDataChange",0,1);
		}		
		//索引，0房间ID,1房间名
		void OnDeskDataChange(index,deskid,deskname)
		{
			if (window.g_DEBUG)
			{
				printf("B# 房间-Top:index:"+index+",deskid:"+deskid+",deskname:"+deskname);
			}
			switch (index)
			{
				case 1:
				{
					parent.m_RoomName = deskname;
					parent._VRoom_BtnLayer_Top_Logic.SetSvName(parent.m_Channel,window.RoomIDToShowID(parent.m_RoomID),parent.m_RoomName);
					break;
				}
			}
		}
	}

	void OnCreated()
	{
		_VNet2DBRow.InitDB();
	}
}