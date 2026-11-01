import("$./../../Init.gml");
import("$./../Const.gml");
import("$./ClassDef.gml");
size = "1024,768";
wndsize = "1024,768";
bgcolor = "#FFFFFF";
window.autouiscale=true;
drag = "window";
//new item
//{
//	size = "100%,100%";pos = "0,0";bgcolor = "#000000";
//	new text
//	{
//		font = "宋体,-1,40";src = "右键-全部";valign(50,0);halign(50,0);
//	}
//	void OnMouseDownR()
//	{
//		set window
//		{
//			new VMouseRAll
//			{	
//				void OnClick_Menu0(data){alert(data);}
//
////				SetState(1,0);
////				DelBub(0);
//			}
//		}
//	}
//};
//
//<END>
new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#FF00";
	new text
	{
		font = "宋体,-1,40";src = "右键-全部";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMouseRAll
			{	
				void OnClick_Menu0(data){alert(data);}

//				SetState(1,0);
//				DelBub(0);
			}
		}
	}
};
new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#CCddFF";valign(12,0);
	new text
	{
		font = "宋体,-1,40";src = "人物-全部";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMyMouseRPerson
			{
//				SetState(m_Index_Invite,0);
//				DelBub(m_Index_LookInfo);

				void On_Private(data){alert(data);}
				void On_Invite(data){alert(data);}
				void On_SendMsg(data){alert(data);}
				void On_LookInfo(data){alert(data);}
				void On_AddFriend(data){alert(data);},
				void On_DelFriend(data){alert(data);}
				void On_GotoRoom(data){alert(data);}
				void On_AddBlacklist(data){alert(data);}
				void On_DelBlacklist(data){alert(data);}
				void On_CopyName(data){alert(data);}
				void On_PresentFlower(data){alert(data);}
			}
		}
	}
};

new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#F0F00F";valign(24,0);
	new text
	{
		font = "宋体,-1,40";src = "物品-全部";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMyMouseRGoods
			{
				SetState(2,0);
//				DelBub(0);
//				DelBub(1);
//				DelBub(2);
//				DelBub(3);
//				DelBub(4);
//				DelBub(5);
//				DelBub(6);
//				DelBub(7);
				void On_Equip(data){alert(data);}
				void On_TakeOff(data){alert(data);}
				void On_Play(data){alert(data);}
				void On_Del(data){alert(data);}
				void On_Use(data){alert(data);},
				void On_Bind(data){alert(data);}
				void On_Open(data){alert(data);}
				void On_Doff(data){alert(data);}

				ReSetBubSrc(m_Index_Equip,"使用");
			}
		}
	}
};

new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#BaaBB";valign(36,0);
	new text
	{
		font = "宋体,-1,40";src = "活动-全部";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMyMouseRActivity
			{
				void On_GiveUp(data){alert(data);}
				void On_GiveUpAll(data){alert(data);}
			}
		}
	}
};

new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#123456";valign(48,0);
	new text
	{
		font = "宋体,-1,40";src = "家族";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMyMouseR_FamilyPeopleList_Header
			{
				DelBub(m_Index_BeAssistant);
				DelBub(m_Index_RemoveAssistant);
				DelBub(m_Index_TransferPotence);

				DelBub(m_Index_LetOutFamily);
				DelBub(m_Index_ShieldTalk);
				DelBub(m_Index_CancleShield);

				//DelBub(m_Index_CancleShield);
			}
		}
	}
}