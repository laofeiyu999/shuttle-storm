//
//活动场>我的活动>排行-游戏中显示
//

importex("$./../../UI/Arena/ClassDef_MyActivity_top.gml");
importex("$./ClassDef_Top_DBList.gml");

class VArena_MyActivity_Top_Logic item
{
	size = "98%,90%";pos(0,40);bgcolor = "#00FF00";alpha = 50;
	name = "VArena_MyActivity_Top_Logic_Name";
	var m_isInGame=0;
	var m_iRaceID = -1;
	var m_laterPlayFlash = 1;	//延迟播放动画
	var m_topListRegName = "";	//排名数据的绑定名
	//=============================与界面交互========================================
	void Init()
	{
		//我的排名
		//[参数]param1：排名
		//[参数]param2: 昵称
		//[参数]param3: 积分
		staticvar s_MyIndex = new VMyText
		{
			src = "排名 昵称 积分";pos="438,305";
		}
	}
	inclass("VArena_MyActivity_Top_UI");//界面显示类
	//==============================function=========================================
	Init();
	//================================DBList=========================================
	//排名
	var _TopList = new VArena_TopList_Logic
	{
		//pos = "5,77";//size="99%,100%";
		name = "VArena_TopList_Logic_NAME";//bgcolor= "#ff";
		
		//window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.ARENADATA,"Bind_VArena_TopList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定

		void SetRegDbTable(_name)
		{
			parent.m_topListRegName = "Bind_VArena_TopList_Logic_"+_name;
			window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.ARENADATA,parent.m_topListRegName);// 绑定数据表
			parent.MySelect();
		}
		
		//parent.MySelect();
		
	}

	void SetRegDbTable(_name)
	{
		_TopList.SetRegDbTable(_name);
	}
	
	void MySelect()
	{
		var _SQL = "SELECT * FROM ArenaData WHERE State=1 AND RaceID>0 AND Sort>0 ORDER BY Sort ASC";
		//var _SQL = "SELECT * FROM ArenaData";
		printf("B# 活动排行:_SQL:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable(m_topListRegName,window.M_G_SERVER,_SQL);//alert(m_topListRegName);
		
	}

	//翻牌动画
	void TopFlash()
	{
		m_laterPlayFlash = 1;
		sleep(6000);
		s_MyIndex.FlashMyTopBG();
	}
	void TopFlash2()
	{
		m_laterPlayFlash = 1;
		sleep(6000);
		s_MyIndex.FlashMyTopBG2();
	}
	void CheckMySize()
	{
		if(window.m_ListShowNameNum==2) //这种活动排行榜的图片宽度和位置
		{
			s_MyIndex.SetSize2();
			s_MyIndex.m_Bg.SetSize2();
			//s_MyIndex.m_index.SetPos2();
			s_MyIndex.m_data.SetPos2();
			_line.setpos();
			if(m_isInGame)
				_TopList.SetSize4();
			else
				_TopList.SetSize2();
			_TopList.SetPos2();
		}
		else
		{
			s_MyIndex.SetSize1();
			s_MyIndex.m_Bg.SetSize1();
			//s_MyIndex.m_index.SetPos1();
			s_MyIndex.m_data.SetPos1();
			_line.setpos();
			if(m_isInGame)
				_TopList.SetSize3();
			else
				_TopList.SetSize1();
			_TopList.SetPos1();
		}
	}
	CheckMySize();
	//设置我的排名
	void SetMyIndex(index)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,window.GetMyRaceID());
		if(toint(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE))==2){window.m_ListShowNameNum=2;}
		else{window.m_ListShowNameNum = 1;}

		var _myUID=0;
		if(window.GetMyLeaderState()){_myUID=window.GetMyUID();}
		else{_myUID=window.GetMyCurPartnerId();}
		MySelect();
		s_MyIndex.SetData(index,"",window.GetArenaTopDataByUID(_myUID));
		if(window.m_ListShowNameNum==2){TopFlash2();}
		else{TopFlash();}

		CheckMySize();
		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENADATA,window.M_G_SERVER_ARENADATA_USERID,window.GetMyUID());
		if(_VNet2DBRow.IsReady())
		{
			var _nameStr = _VNet2DBRow.GetData(window.M_G_SERVER_ARENADATA_NKNAME);
			var _num = window.GetSplitCount(_nameStr,":");
			//alert("SetMyIndex   _nameStr="+_nameStr);
			if(_num==2)
			{
				var _nameArr = window.SplitStr2(_nameStr,":");
				s_MyIndex.m_name1.SetData(_nameArr[0]);
				s_MyIndex.m_name2.SetData(_nameArr[1]);
				//alert("SetMyIndex   _nameStr="+_nameStr+",_nameArr[0]="+_nameArr[0]+",_nameArr[1]="+_nameArr[1]);
			}
			else
			{
				s_MyIndex.m_name1.SetData(_nameStr);
				s_MyIndex.m_name2.SetData("");
			}
		}
		_VNet2DBRow.del();
	}
};