//
//模型的数据和钱
//yxf 2009年10月29日
//

//详细信息(按钮)
class VModel_UserInfo_UI item
{
	size = "277,80";halign(88,0);valign(66,0);bgcolor = -1;//pos="225,620";

	void Init()
	{
		//详细信息
		staticvar s_Btn_Info = new VBTN_58_New
		{
			InitText("详细信息");//pos="150,58";
		}
		size(s_Btn_Info.width,s_Btn_Info.height);
	}
};

//昵称+等级+称号+职业方向
class VModelInfo_UI item
{
	size = "114,140";halign(100,0);valign(30,0);bgcolor = -1;
	
	var m_bIsCreateRole = false;
	void Init()
	{
		//昵称
		staticvar s_NkName = new VipText2
		{
			color = "#FFFFFF";txtborder = "#002D56";
			m_Init = "昵称：";
		}

		//家族
		staticvar s_Family = new BaseText
		{
			pos = "0,20";//color = "#FFFFFF";txtborder = "#002D56";
			var _familyName = "";
			void SetData(data)
			{
				if(data == -1)
				{
					src = "";
					show = false;
					_familyName = "";
				}
				else
				{
					src = "<"+data+">";
					_familyName = data;
					SetFamilyColor();
					show = true;
				}
				parent.ResetPos();
			}

			void SetFamilyColor()
			{
				//var _uid = window.GetFamilyIDByFamilyName();
				var _lv = window.GetFamilyLev();
				SetFamilyColorByLv(_lv);
			}

			void SetFamilyColorByLv(_lv)
			{
				color = "#"+window.GetFamilyNameColor(_lv,window.FAMILY_COLORTYPE_COLOR);
				txtborder = "#"+window.GetFamilyNameColor(_lv,window.FAMILY_COLORTYPE_BORDERCOLOR);
			}
		}
		//等级
		staticvar s_Lv = new BaseText
		{
			pos = "0,40";color = "#FFFFFF";txtborder = "#002D56";
			void SetData(data)
			{
				src = "等级："+data;
				parent.ResetPos();
			}
		}

		//称号
		staticvar s_Qualify = new BaseText
		{
			pos = "0,60";color = "#FFFFFF";txtborder = "#002D56";
			void SetData(data)
			{
				src = "称号："+window.GetChannelType(data)+"选手";
				parent.ResetPos();
			}
		}

		//技术类型
		staticvar s_Technic = new BaseText
		{
			pos = "0,80";color = "#FFFFFF";txtborder = "#002D56";
			void SetData(data)
			{
				src = "技术类型："+window.GetTechnicByType(data);
				parent.ResetPos();
			}
		}
		//情侣
		staticvar s_Lover = new BaseText
		{
			pos = "0,100";color = "#FFFFFF";txtborder = "#002D56";
			void SetData(data)
			{
				if (data == "" || data == 0)
					src = "";
				else
					src = "情侣："+data;

				parent.ResetPos();
			}
		}
		//搭档
		staticvar s_Partner = new BaseText
		{
			pos = "0,120";color = "#FFFFFF";txtborder = "#002D56";
			void SetData(data)
			{
				if (data == "" || data == 0)
					src = "";
				else
					src = "搭档："+data;

				parent.ResetPos();
			}
		}
	}
	
	//[功能]调整位置
	void ResetPos()
	{
		if (m_bIsCreateRole) return;

		if (s_Family.src == "")
			s_Family.pos(0,0);
		else
			s_Family.pos(0,20);
		s_Lv.pos(0,s_Family.top+20);
		s_Qualify.pos(0,s_Lv.top+20);
		s_Technic.pos(0,s_Qualify.top+20);
		if (s_Lover.src == "")
			s_Lover.pos(0,s_Technic.top);
		else
			s_Lover.pos(0,s_Technic.top+20);

		s_Partner.pos(0,s_Lover.top+20);
	}

	void SetCreateRole()
	{
		m_bIsCreateRole = true;
		size = "117,60";halign(100,0);valign(35,0);//pos="734,200";
		s_Family.del();
		s_Lv.src = "等级：1";
		s_Lv.pos = "0,20";
		s_NkName.src = "昵称：请输入昵称吧";
		s_Technic.pos = "0,40";
		s_Qualify.del();
	}
};

//金币+点券+奖券
class VModelMoney_UI item
{
	size = "275,80";
	//pos="200,90";
	halign(100,-50);top = 90;
	bgcolor = -1;

	void Init()
	{
		new VPic9_AddMoney_UI{size = "100%,100%";}
		
		new img
		{
			pos = "19,13";src = "$./../PublicImage/new/imgs"+window.g_Sex+"/hall_money/jb.tga";
		}
		//金币
		staticvar s_Gold = new BKText{size = "129,16";pos = "55,11";ycenter = true;}

		new img
		{
			pos = "19,51";src = "$./../PublicImage/new/imgs"+window.g_Sex+"/hall_money/dq.tga";
		}
		//点券
		staticvar s_Ticket = new BKText{size = "129,16";pos = "55,51";ycenter = true;}

		new img
		{
			pos = "19,31";src = "$./../PublicImage/new/imgs"+window.g_Sex+"/hall_money/jq.tga";
		}
		//代金券
		staticvar s_Token = new BKText{size = "129,16";pos = "55,31";ycenter = true;}

		//充值
		staticvar s_Btn_Payment = new VBTN_Mall_addmoney_New
		{
			pos = "190,27";//InitText("充   值");
		}
	}
};