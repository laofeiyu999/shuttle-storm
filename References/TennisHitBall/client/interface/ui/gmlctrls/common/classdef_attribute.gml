/*
//用途：商城+背包+个人信息-属性的显示类
//yxf 2008年12月18日
大小：
	|___个人信息
	|___背包+商城
颜色:
	|___个人信息+背包:白色
	|___商城:3种颜色
*/

//属性的子类：包含文字和数值
class VAttribute_Sub item
{
	size = "124,25";//bgcolor = "#FF";
	var m_Value = 0;//属性值
	//文字
	var _text = new text
	{
		font = "宋体,-1,16";pos = "10,0";color = "#FFFFFF";
	}
	//数字
	var _num = new text
	{
		font = "宋体,-1,16";pos = "55,0";color = "#FFFFFF";
	}
	
	//设置文字
	void Init(param)
	{
		_text.src = param;
	}

	//设置鼠标悬停框的ID
	//id:	悬停的ID
	void SetHangID(id)
	{
		//悬停
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangID(id);
	}

	//外部接口：设置数据
	//参数data1:""
	//参数data2:总数值 
	//参数data3:类型 0初始 1装备 2试穿 3初始+试穿
	void SetData(data1,data2,data3)
	{
		if (toint(data3) < 2)
		{
			m_Value = data2;
			_num.color = "#FFFFFF";
			_num.src = m_Value;
		}
		else
		{
			if (toint(m_Value) == toint(data2)){_num.color = "#FFFFFF";}
			if (toint(m_Value) > toint(data2)){_num.color = "#FF0000";}//属性为-
			if (toint(m_Value) < toint(data2)){_num.color = "#00FF00";}//属性为+
			_num.src = data2;
		}
	}
};

//属性的显示类
class VRoleAttribute_UI item
{
	size = "135,154";bgcolor = -1;alpha = 0;
	
	void Init()
	{
		staticvar _bk = new img
		{
			src = "$./../../PublicImage/imgs"+window.g_Sex+"/Attribute.tga";
		}

		//力量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TStrength = new VAttribute_Sub
		{
			pos = "4,4";Init("力量:");
			SetHangID(33);
		}
		
		//技术
		//参数 data2: 原始值
		 
		staticvar s_TSkill = new VAttribute_Sub
		{
			pos = "4,29";Init("技巧:");
			SetHangID(34);
		}
		
		//前场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TForceHand = new VAttribute_Sub
		{
			pos = "4,53";Init("前场:");
			SetHangID(35);
		}
		
		//后场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TBackHand = new VAttribute_Sub
		{
			pos = "4,78";Init("后场:");
			SetHangID(36);
		}
		
		//发球
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TServe = new VAttribute_Sub
		{
			pos = "4,103";Init("发球:");
			SetHangID(37);
		}

		//能量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TEnergy = new VAttribute_Sub
		{
			pos = "4,129";Init("能量:");
			SetHangID(38);
		}

		//体力
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_Thew = new VAttribute_Sub
		{
			pos = "4,129";Init("体力:");
			SetHangID(38);
		}

		//最后来修改大小和位置
		if(window.IsUIPos(window.POS_SELFINFO))
		{
			size = "300,80";
			_bk.del();
			s_TStrength.pos = "5,5";
			s_TSkill.pos = "170,5";
			s_TForceHand.pos = "5,30";
			s_TBackHand.pos = "170,30";
			s_TServe.pos = "5,55";
			s_TEnergy.pos = "170,55";
		}
	}
};