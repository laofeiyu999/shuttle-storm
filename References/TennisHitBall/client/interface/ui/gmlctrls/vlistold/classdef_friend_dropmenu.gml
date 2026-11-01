//赠送索要好友list选择
//2009-2-6
//吴楠

class VDROPMENU_Friend_UI item
{
	size="300,200";
	//setFocus=true;
	name = "VDROP_FRIEND";

	//默认文本背景
	var m_DefaultText_BK = new item
	{
		bgcolor = "#cdcfce";size = "100%,18";
	}

	//三角按钮
	var m_btn = new VBTN_DropSmall_New
	{
		halign(100,0);
		void OnPressed()
		{
			if(parent.m_item._show_chg)
			{
				parent.m_item.SetShow(false);
				parent._FriendList.reMove();
			}
			else
			{
				parent.m_item.SetShow(true);
				parent._FriendList.select();
			}
		}
	}
		
	//下拉框背景
	var m_item = new VMenuBG_UI
	{
		size="280,167";pos(0,19);
		show = false;capturemouse=true;
		var _show_chg = false;//记录显示状态
		void SetShow(param)
		{
			_show_chg = param;
			show=param;
			parent._FriendList.show=param;//隐藏list
		}
//		var _Drop_bk = new img
//		{
//			size="280,167";
//			src = "$./../../Mall/imgs"+window.g_Sex+"/Gift_Fri_bk.tga":
//		}
	}
	void SetSize(_width,_height)
	{
		_FriendList.scriptprcallsub("SetWidth");
		_FriendList.size(_width,_height-19);
		m_item.size(_width,_height-19);
		m_DefaultText_BK.size = "100%,18";
	}
	//================list==========================================
	var _FriendList = GetList();
	void SetList()
	{
		set _FriendList
		{
			show=false;
			void OnDelete()
			{
				window.find("G_DBMANAGE").ReMoveRegDbTable(this);
			} //移除绑定
			void OnMouseDownL()
			{
				parent.m_item.SetShow(false);
				reMove();
			}
			//移除绑定
			void reMove()
			{
				window.find("G_DBMANAGE").ReMoveRegDbTable(this);
			}
		}
	}
	SetList();
	//================list==========================================

	//移除绑定
	void OnDelete()
	{
		_FriendList.del();
		m_item.del();
	}
	
	//重载这个函数去选自己的list
	void GetList()
	{
		var _list = new VMall_Friend_List_Logic
		{
			name = "VMall_Friend_List_Logic_NAME";
			//获得绑定
			void select()
			{
				reMove();
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VMall_Friend_List_Logic");// 绑定数据表

				var _SQL = "SELECT * FROM FriendDT WHERE Relation="+window.FRIEND_FRIEND+" AND delete=0 AND State=1 OR Relation="+window.FRIEND_FRIEND+" AND delete=0 AND State=2 OR Relation="+window.FRIEND_FRIEND+" AND delete=0 AND State=3";
				//var _SQL = "SELECT * FROM FriendDT WHERE Relation=0 AND delete=0";
				window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_Friend_List_Logic",window.M_G_SERVER,_SQL);
			}
		}
		return _list;
	}
	//接口函数 WhichSelect:
	//参数：jid 好友用
	//		sex 性别
	void WhichSelect(jid,sex)
	{
		
	}
};