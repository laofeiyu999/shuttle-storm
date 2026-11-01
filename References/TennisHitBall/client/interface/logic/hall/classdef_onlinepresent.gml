//
//在线礼品
//yxf 2009年10月13日
importex("$./../../UI/Hall/ClassDef_OnLinePresent.gml");

class VHall_OnLinePresent_Logic item
{
	size = "192,58";pos = "600,50";bgcolor = "#FF00";alpha = 50;
	var m_presentID = 0;
	name = "VHall_OnLinePresent_Logic_Name";
	//=========================与界面交互===========================
	void Init()
	{
		//在线礼品
		staticvar s_OnLinePresent = new item
		{
			size = "192,58";
			//礼品按钮
			var _btn = new VMyButton{}
			var _time = new VMyText{}
		}
	}
	inclass("VHall_OnLinePresent_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		//在线礼品
		set s_OnLinePresent._btn
		{
			parent.MySetState(window.BTN_STATE_GREY);
			parent._time.show = false;
			parent.show = false;
			void OnClick()
			{
				//printf("点击了获取礼品的按钮，用户：" + window.GetMyUID() + ",礼品：" + parent.parent.m_presentID + "\n");
				window.Tos_InLinePresent(""+window.GetMyUID()+","+parent.parent.m_presentID);
				parent.MySetState(window.BTN_STATE_GREY);	
			}

			void OnCreated()
			{
				window.Tos_InLinePresent(""+window.GetMyUID()+",0");
			}
		}
	}
	
	//礼品ID(0表示没有可以领取的礼品),这个礼品可以领取的时间,
	void SetOLPresentData(iID,iTm)
	{
		printf("B# _InLinePresent:在线礼品:SetOLPresentData()iID:"+iID+"，iTm："+iTm);
		iID = toint(iID);
		if ( iID == 0 )
		{
			s_OnLinePresent.show = false;
			return;
		}
		s_OnLinePresent.MySetState(window.BTN_STATE_GREY);
		s_OnLinePresent.show = true;
		m_presentID = iID;
		s_OnLinePresent._btn.SetState(window.BTN_STATE_GREY);
		s_OnLinePresent._time.show = false;

		s_OnLinePresent._time.SetData(iTm);
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};
