//
//模型的数据和钱
//yxf 2009年10月29日
//
	
importex("$./../../UI/RoleModel/ClassDef.gml");

//详细信息(按钮)
class VModel_UserInfo_Logic item
{
	size = "300,100";pos="217,635";bgcolor = "#ff";

	void Init()
	{
		//详细信息
		staticvar s_Btn_Info = new VMyButton{pos = "0,80";}
	}

	inclass("VModel_UserInfo_UI");

	Init();
	
	void SetEvent()
	{
		set s_Btn_Info
		{
			void OnPressed(){window.OnClick_BTN_SelfInfo();}
		}
	}
	SetEvent();
};

//昵称+等级+称号+职业方向
class VModelInfo_Logic item
{
	size = "300,100";pos="217,635";bgcolor = "#FF";

	void Init()
	{
		//昵称
		staticvar s_NkName = new VMyText{}

		//家族
		staticvar s_Family = new VMyText{}
		
		//等级
		staticvar s_Lv = new VMyText{pos = "0,20";}

		//称号
		staticvar s_Qualify = new VMyText{pos = "0,40";}

		//技术类型
		staticvar s_Technic = new VMyText{pos = "0,60";}
	}

	inclass("VModelInfo_UI");

	Init();
};

//金币+点券+奖券
class VModelMoney_logic item
{
	size = "300,100";pos="217,100";bgcolor = "#FF";

	void Init()
	{
		//金币
		staticvar s_Gold = new VMyText{}

		//点券
		staticvar s_Ticket = new VMyText{pos = "0,20";}

		//代金券
		staticvar s_Token = new VMyText{pos = "0,40";}

		//充值
		staticvar s_Btn_Payment = new VMyButton{pos = "0,80";}
	}

	inclass("VModelMoney_UI");

	Init();

	void SetEvent()
	{
		set s_Btn_Payment
		{
			void OnPressed(){window.OnClick_Payment();}
		}
	}
	SetEvent();
};