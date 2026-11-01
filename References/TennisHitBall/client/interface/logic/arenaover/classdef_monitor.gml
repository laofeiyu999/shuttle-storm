//
//竞技游戏结束的监听，主要用与没有游戏界面的结束
//yxf 2009年3月12日

class Varena_Monitor item
{
	var _VNet2DBRow = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,window.GetMyRID(),1);
			AddDBEvent("OnMyDataChange",1,15,28);
		}
		//索引，改变的索引,一局的输赢
		//15 RefreshIndex:改变的索引 1.帅气的动作 2.局分 3.比赛前的数据 4:游戏开始 5:游戏结束
		//28 EndWinOrLost 一场比赛的输赢 0为默认 1表示输 2表示赢 在RefreshIndex==5后有效
		void OnMyDataChange(index,UserID,RefreshIndex,EndWinOrLost)
		{
			if (window.g_DEBUG)
			{
				printf("B# 竞技监视:index:"+index+",UserID:"+UserID+",RefreshIndex:"+RefreshIndex+",EndWinOrLost:"+EndWinOrLost);
			}
			switch (index)
			{
				case 15:
				{
					if (RefreshIndex == 5)//5:游戏结束
					{
						var _RoomUser = new VRoomUserDT_Logic{}
						printf("B# Varena_Monitor-比赛结束了-监测的,EndWinOrLost:"+EndWinOrLost+",g_ArenaJoinRoom:"+window.g_ArenaJoinRoom+",GetRoomType:"+window.GetRoomType()+",m_UID2:"+_RoomUser.m_UID2+",m_UID3:"+m_UID3);
						if (window.g_ArenaJoinRoom)//竞技
						{
							window.find("LOADING_LOGIC").del();
							window.find("UIController").LoadUI("UI_ARENAOVER");
							window.find("ARENAOVER_LOGIC").SetData(window.GetMyRaceID(),window.GetRoomType(),window.GetMyUID(),_RoomUser.m_UID2,_RoomUser.m_UID3,_RoomUser.m_UID4,EndWinOrLost);
						}
						break;
					}
				}
			}
		}
	}
	_VNet2DBRow.InitDB();
};