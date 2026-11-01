/*
//用途：商城+背包+个人信息-属性的显示类
//yxf 2009年10月28日
大小：
	|___个人信息
	|___背包+商城
颜色:
	|___个人信息+背包:白色
	|___商城:3种颜色
*/

//属性的子类：包含文字和数值
class VAttributeEx_Sub item
{
	size = "114,20";//bgcolor = "#FF";
	var m_Value = 0;//属性值
	//文字
	var _text = new BaseText
	{
		pos = "0,0";color = "#FFFFFF";txtborder = "#002D56";
	}
	//原始数字
	var _num = new BaseText
	{
		pos = "37,0";color = "#FFFFFF";//src = "100";
		txtborder = "#002D56";
	}
	//附加
	var _addnum = new BaseText
	{
		pos(parent._num.left + parent._num.width + 3 ,0);color = "#FFFFFF";//color = "#B223BB";//src = "+ 000";
		txtborder = "#002D56";
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

	//设置鼠标悬停框的内容
	//id:	悬停的ID
	//time: 悬停出来的时间 不传则默认
	void SetHangSrc(_src)
	{
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangSrc(_src);
	}

	//外部接口：设置数据
	//参数data1:初始值
	//参数data2:总属性
	void SetDataEx(data1,data2)
	{
		data1 = data1.__Long__;
		data2 = data2.__Long__;

		_num.src = ""+data1;
		_addnum.src = "";
		var _diff = data2 - data1;
		if (_diff > 0)
		{
			_addnum.src = "+ " + _diff;
			_addnum.pos(_num.left + _num.width + 3 ,0);
		}
	}
};

//属性的显示类
class VRoleAttributeEx_UI item
{
	size = "114,140";halign(100,0);valign(55,5);bgcolor = -1;alpha = 0;	
	void Init()
	{
		//力量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TStrength = new VAttributeEx_Sub
		{
			pos = "0,0";Init("力量:");			
			SetHangSrc(data);
		}
		
		//技巧
		//参数 data2: 原始值
		 
		staticvar s_TSkill = new VAttributeEx_Sub
		{
			pos = "0,20";Init("技巧:");
			SetHangSrc(data);
		}
		
		//前场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TForceHand = new VAttributeEx_Sub
		{
			pos = "0,40";Init("前场:");
			SetHangSrc(data);
		}
		
		//后场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TBackHand = new VAttributeEx_Sub
		{
			pos = "0,60";Init("后场:");
			SetHangSrc(data);
		}
		
		//发球
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TServe = new VAttributeEx_Sub
		{
			pos = "0,80";Init("发球:");
			SetHangSrc(data);
		}

		//能量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TEnergy = new VAttributeEx_Sub
		{
			pos = "0,100";Init("能量:");
			SetHangID(8);
		}

		//体力
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_Thew = new VAttributeEx_Sub
		{
			pos = "0,120";Init("体力:");
			SetHangID(34);
		}
	}
};