//
//同一房间玩家类 
//对应m_g_server.mdb 的userdt表
//功能：取出房间里玩游戏的人员按组分好 1(自己）和3一组   2和4一组
//作者：yxf2008年11月7日
//

class VRoomUserDT_Logic item
{
	//================================成员变量===============================================
	var m_UID1 = window.GetMyUID();	//第一个玩家-其实应该是自己
	var m_UID2 = 0;	//第二个玩家-对方第一个玩家
	var m_UID3 = 0;	//第三个玩家-自己的队友（双打）
	var m_UID4 = 0;	//第四个玩家
	var m_Team = window.GetTeamByUID();	//自己的队伍类型-为了找队友
	//=================================成员函数================================================
	
	//在同一个房间的人
	var _UserTable = new VNet2DBTable
	{
		var _index = 1;//人数 -最多4个（双打）
		//UID,队伍（1，2）
		void GetAllUser(uid,team)
		{
			if (window.g_DEBUG){printf("B# _UserTable:uid:"+uid+",team:"+team);}	
			if (team == parent.m_Team && uid != parent.m_UID1)
			{
				parent.m_UID3 = uid;
			}
			if (team != parent.m_Team)
			{
				if (_index == 1)
				{
					parent.m_UID2 = uid;
				}
				else
				{
					parent.m_UID4 = uid;
				}
				_index += 1;
			}
		}
	}

	_UserTable.Select(window.M_G_SERVER, "select * from "+ window.USERDT +" where "+ window.M_G_SERVER_USERDT_DID_STR +"=" +window.GetMyRoomID()+" AND "+window.M_G_SERVER_USERDT_RID_STR+">0");
	_UserTable.ReadData("GetAllUser","" + window.M_G_SERVER_USERDT_UID + "," + window.M_G_SERVER_USERDT_TEAM);
};