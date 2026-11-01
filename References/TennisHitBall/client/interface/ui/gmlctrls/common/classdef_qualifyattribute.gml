
//升级时的属性变化的效果显示
class VQualifyAttributeEx item
{
	size = "150,20";
	var _space = 10;
	//文字
	var _text = new img
	{
		size = "40,20";show = true;
		//xcenter = true;ycenter = true;
		pos = "3,3";
	}

	//初始值
	var _num = new VN2NumShow
	{
		size = "12,20";
		//xcenter = true;ycenter = true;
		src = "$./imgs"+window.g_Sex+"/lz.tga";
		show = false;
		void SetData(num)
		{
			if(toint(num)>0)
			{
				var _tempNum = toint(num);
				var _tempCount = tostring(_tempNum).Count;
				_tempCount = toint(_tempCount);
				var _numSizeX = _tempCount*12;
				size(_numSizeX,20);
				setNum(_tempNum);
				show = true;
			}
			else
			{
				show = false;
			}
		}
	}
	//加号
	var _addIcon = new img
	{
		size = "12,20";
		show = false;
		src = "$./imgs"+window.g_Sex+"/lv+.tga";
		xcenter = true;ycenter = true;

	}
	//增加的数值
	var _addNum = new VN2NumShow
	{
		size = "12,20";
		src = "$./imgs"+window.g_Sex+"/lvz.tga";
		show = false;
		xcenter = true;ycenter = true;
		void SetData(num)
		{
			if(toint(num)>0)
			{
				var _tempNum = toint(num);
				var _tempCount = tostring(_tempNum).Count;
				_tempCount = toint(_tempCount);
				var _numSizeX = _tempCount*12;
				size(_numSizeX,20);
				setNum(_tempNum);
				parent._addIcon.show = true;
				show = true;
			}
			else
			{
				show = false;
			}
		}
	}

	//设置文字
	void Init(param)
	{
		_text.src = param;
	}

	//外部接口：设置数据
	//参数data1:初始值
	//参数data2:总属性
	void SetDataEx(data1,data2)
	{
		data1 = data1.__Long__;
		data2 = data2.__Long__;

		_num.SetData(data1);
		var _diff = data2 - data1;
		if (_diff >= 0)
		{
			_addNum.SetData(_diff);

			size(_text.width+4*_space+_num.width+_addIcon.width+_addNum.width+,20);
			_num.pos(_text.left+_text.width+_space,3);
			_addIcon.pos(_num.left+_num.width+_space,3);
			_addNum.pos(_addIcon.left+_addIcon.width+_space,3);
			_num.show = true;
			//_addIcon.show = true;
			//_addNum.show = true;
			
		}
	}
};

//属性的显示类
class VQualifyAttributeEx_UI item
{
	size = "270,160";halign(30,0);valign(30,0);//bgcolor = -1;alpha = 0;
	
	void Init()
	{

		staticvar s_Bk = new img
		{
			size = "100%,70%";
			src = "$./imgs"+window.g_Sex+"/sj-d.tga";
			pos = "0,0";
			alpha = 30;
		}
		//力量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TStrength = new VQualifyAttributeEx
		{
			pos = "4,0";Init("$./imgs"+window.g_Sex+"/ll-text.tga");
		}
		
		//技术
		//参数 data2: 原始值
		 
		staticvar s_TSkill = new VQualifyAttributeEx
		{
			pos = "4,20";Init("$./imgs"+window.g_Sex+"/jq-text.tga");
		}
		
		//前场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TForceHand = new VQualifyAttributeEx
		{
			pos = "4,40";Init("$./imgs"+window.g_Sex+"/qc-text.tga");
			SetHangID(5);
		}
		
		//后场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TBackHand = new VQualifyAttributeEx
		{
			pos = "4,60";Init("$./imgs"+window.g_Sex+"/hc-text.tga");
			SetHangID(6);
		}
		
		//发球
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TServe = new VQualifyAttributeEx
		{
			pos = "4,80";Init("$./imgs"+window.g_Sex+"/fq-text.tga");
			SetHangID(7);
		}

		//能量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TEnergy = new VQualifyAttributeEx
		{
			pos = "4,100";Init("$./imgs"+window.g_Sex+"/nl-text.tga");
			SetHangID(8);
		}

		//体力
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_Thew = new VQualifyAttributeEx
		{
			pos = "4,120";Init("$./imgs"+window.g_Sex+"/tl-text.tga");
			SetHangID(34);
		}

		
	}
};