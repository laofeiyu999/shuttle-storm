import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");

bkcolor="#FFFFFF";
window.g_Sex=1;
size = "800,600";

staticvar s_CB_GameMusic = new VCombox_BgMusic_UI_Ex 
{
	SetDefaultSrc("水晶之恋");
	SetID("Game",3,3);
	SetPos(149,371);
	SetSize(145,80);
}

<END>
new VCombox_Friend_UI
{
	//接口函数 WhichSelect:
	//参数：jid 好友用
	//		sex 性别
	void WhichSelect(jid,sex)
	{
		printf("jid:"+jid+",sex:"+sex);
	}

	SetState(window.BTN_STATE_GREY);
}

void OnMouseDownL()
{
	alert("点着了");
}
<END>
new item
{
	size = "50,50";bgcolor = "#FF";
	void OnMouseDownL()
	{
		alert("OnMouseDownL");
		set window
		{
			var _FriendList = new VMall_Friend_List_Logic
			{
				//alert("new list");
				size(269,157);pos(60,26);//setFocus=true;
				name = "VMall_Friend_List_Logic_NAME";//show=false;

				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VMall_Friend_List_Logic");// 绑定数据表
				void OnDelete()
				{
					reMove();
				} 

				void OnMouseDownL()
				{
					parent.m_item.SetShow(false);
					//reMove();
				}

				void PageviewEnd() // 翻页结束后调用
				{
					//printf("商城-好友列表，PageviewEnd\n");
					//checkselect(10,10);
				}

				//移除绑定
				void reMove()
				{
					window.find("G_DBMANAGE").ReMoveRegDbTable(this);
				}
					//获得绑定
				void select()
				{
					window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VMall_Friend_List_Logic");// 绑定数据表
					var _SQL = "SELECT * FROM FriendDT";
//					var _SQL = "SELECT * FROM FriendDT WHERE Relation="+window.FRIEND_FRIEND+" AND delete=0 AND State>=1 AND State<=3";
					printf("_SQL:"+_SQL);
					window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_Friend_List_Logic",window.M_G_SERVER,_SQL);
				}
				select();
			}
		}
	}
}


new item
{
	size = "50,50";bgcolor = "#FFFF";pos = "0,400";
	void OnMouseDownL()
	{
		window._FriendList.del();
	}
}