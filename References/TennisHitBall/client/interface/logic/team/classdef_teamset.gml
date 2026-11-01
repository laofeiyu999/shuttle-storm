//活动设置
//yxf 2009年10月20日

importex("$./../../UI/Team/ClassDef_TeamSet.gml");
importex("$./ClassDef_TeamSet_DBList.gml");

class VTeamSet_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	valign(50,0);halign(50,0);
	var m_Type = 1;	//1精确查找 2范围查找
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

		//队伍名称:edit
		staticvar s_Edit_TeamName = new edit
		{
			size = "180,26";pos = "120,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
		}

		//精确查找：Radio
		staticvar s_R_ExacFind = new VMyRadio
		{
			Init("精确查找",0);pos = "35,50";size = "150,30";
		}
		// 范围查找：Radio
		staticvar s_R_RangeFind = new VMyRadio
		{
			Init("范围查找",0);pos = "200,50";size = "150,30";
		}

		//精确查找名字:edit
		staticvar s_Edit_NkName = new edit
		{
			size = "180,26";pos = "120,91";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 10;ycenter = true;xcenter = true;
			password = true;
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			Init("确定");pos="23,429";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");pos="226,435";
		}
	}
	inclass("VTeamSet_UI");//界面显示类
	//==============================function=========================================
	//点击了确定
	void OnClick_Confirm()
	{
		var _nkname = "";
		if (m_Type == 1)
		{
			_nkname = s_Edit_NkName.src;
			if (_nkname == "")
			{
				window.find("UIController").LoadDLG(404);//昵称不能为空，请输入昵称！
				s_Edit_NkName.timer(10,"hot=1");
				return;
			}
		}
		else
		{
			var _Row = _teamList.curselectrow();
			_nkname = _teamList.fieldstr(_Row,window.GAMEUI_JIVETPINVITELIST_NKNAME);

			if (_nkname == "" || _nkname == 0)
			{
				window.find("UIController").LoadDLG(405);//请选择一个玩家，也可以使用精确查找！
				return;
			}
		}
		
		if (_nkname.Count < 4 || _nkname.Count > 12)
		{
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			s_Edit_NkName.timer(10,"hot=1");
			return;
		}
		var _res = window.JudgeAnyNameLicit(_nkname,"昵称");
		if (_res < 0)
		{
			s_Edit_NkName.timer(10,"hot=1");
			return;
		}

		var _teamname = s_Edit_TeamName.src;
		if (_teamname == "")
		{
			_teamname = ""+window.GetMyName()+"的队伍";
		}
		else
		{
			var _res = window.JudgeAnyNameLicit(_teamname,"队伍名称");
			if (_res < 0)
			{
				s_Edit_TeamName.timer(10,"hot=1");
				return;
			}
		}

		//邀请组队(直接服务器)
		//参数：id,gname,addnk,raceid,svid
		window.F_askadd(window.GetMyUID(),_teamname,_nkname,window.g_ArenaSelectRaceID,window.GetMySvID());
		//parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
//		set s_Btn_Help
//		{
//			void OnPressed(){window.CallBack_Help(window.POS_TEAMSET);}
//		}

		set s_R_ExacFind
		{
			groupname="VTeamSet_Group";startstate="1";
			void OnCheck()
			{
				MouseCheck();parent.m_Type = 1;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_RangeFind
		{
			groupname="VTeamSet_Group";
			void OnCheck()
			{
				MouseCheck();parent.m_Type = 2;
			}
			void OnUnCheck(){MouseUnCheck();}
		}

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
	
	//数据同步完后调用
	void SelectList()
	{
		var _SQL = "SELECT * FROM jiveTpInviteList WHERE delete="+window.TEMPTEAM_DELETE_FREE;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTeamSet_List_Logic",window.GAMEUI,_SQL);
	}

	var _teamList = new VTeamSet_List_Logic
	{
		//SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		name = "VTeamSet_List_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVETPINVITELIST,"Bind_VTeamSet_List_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
	
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 社交-全部玩家列表，PageviewEnd\n");
			//checkselect(10,10);
		}
	}

	SetEvent();
};