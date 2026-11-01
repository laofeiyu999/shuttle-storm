//活动场 > 查看窗口
//yxf 2009年10月17日

importex("$./../../UI/Arena/ClassDef_LookOver.gml");

class VArena_LookOver_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	valign(50,0);halign(50,0);
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

		//活动说明与奖励
		//param1:说明
		//param:物品奖励(格式:"物品ID1,数量,有效期;物品ID2,数量,有效期")
		staticvar s_Desc_Award = new VMyText
		{
			src = "活动说明";size = "95%,60%";bgcolor = "#FF00";pos = "0,50";
			autoenter = true;
		}
		
		//报名费用
		//param1:数值(100等) 免费时 值为0
		//param2:钱的类型文字(金币，点券，免费)
		staticvar s_Fare = new VMyText
		{
			src = "报名费用";pos="14,362";
		}

		//报名：按钮
		staticvar s_Btn_Apply = new VMyButton
		{
			Init("报名");pos="23,429";
		}
		//返回：按钮
		staticvar s_Btn_Return = new VMyButton
		{
			Init("返回");pos="226,435";
		}
	}
	inclass("VArena_LookOver_UI");//界面显示类
	//==============================function=========================================
	//点击了我要报名
	void OnClick_Apply()
	{
		window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.OnConfirm_Apply();
		parent.del();
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
//			void OnPressed(){window.CallBack_Help(window.POS_ARENA_LOOKOVER);}
//		}

		set s_Btn_Apply
		{
			name = "BtnName_Arena_LookOver_Apply";
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT)
				{
					if (window.g_FCM == 1)
					{
						window.find("UIController").LoadDLG(819);
						parent.parent.del();
					}
					else
						parent.OnClick_Apply();
				}
			}
		}
		set s_Btn_Return
		{
			void OnPressed(){parent.parent.del();}
		}
	}
	//从数据库中取相关数据 
	void GetDataFromDB(raceID)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VArena_LookOver_Logic:GetDataFromDB()DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceID:"+raceID);
			return;
		}
		
		var _desc = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_DES1);
		var _award = "";
		if (window.GetMySex() == window.USER_SEX_MAN)
		{
			_award = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_VMANGOODS1);
		}
		else
		{
			_award = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_VWOMANGOODS1);
		}
		s_Desc_Award.SetData(_desc,_award);
		
		var _uiracetype = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_UIRACETYPE);
		var _racemoney = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RACEMONEY);
		s_Fare.SetData(_racemoney,_uiracetype);
		_VNet2DBRow.del();
	}
	//================================DBList=========================================
	Init();
	SetEvent();

	void OnCreated()
	{
		s_Btn_Apply.SetState(window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.s_Btn_Apply.GetState());
	}
};