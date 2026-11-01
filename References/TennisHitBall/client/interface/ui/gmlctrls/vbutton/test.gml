
import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");
//import("ClassDef.gml");
bkcolor = "#CCCCCC";
size = "1024,768";
wndsize = "1024,768";
var g_Sex = 1;
//new VBTN_Hall_Menu_New{SetPos(10,10);}

new VBTN_A_New
{
	pos = "0,50";
	InitText("隐藏界面");
	void Flash(param)
	{
		if (param==true)
		{
			staticvar m_img = new VFlicker_A_UI{pos = "0,8";SetState(window.FLICKER_FLICKER);}
		}
		else
		{
			m_img.del();
		}
	}
}

var _flick = new VBTN_A_New
{
	pos = "0,100";
	InitText("测试闪烁");
}

new text
{
	src = "闪烁";

	void OnClick()
	{
		parent._flick.SetFlicker(true);
	}
}
new text
{
	src = "不闪烁";pos = "0,30";

	void OnClick()
	{
		parent._flick.SetFlicker(false);
	}
}

new VBTN_GameStart_New
{
	SetPos("300,300");
}
<END>
//按钮飘动效果
//严禁删掉此段代码
new VBTN_A_New
{
	pos = "50,50";InitText("进攻");

	var m_pos_y = top;

	void loop()
	{
		var _num = window.GetSplitCount(GetMoveArr(),",");
		if(_num<=0){return;};
		var _array = window.SplitStr2(GetMoveArr(),",",_num);
		var _index = 0;
		m_isLoop = true;
		while(m_loopSign==1)
		{
			_index+=1;
			if(_index>_num-1){_index=0;}
//			var _y = _array[_index];
			xx(toint(_array[_index]));
//			alert("_index="+_index+",_y="+_y);
			sleep(GetSleepTime());
		}
	}
	void LogicMouseOverFunc()
	{
		m_loopSign = 1;
		if(m_isLoop == true){return;}
		loop();
	}
	void LogicMouseOutFunc()
	{
		m_loopSign = 0;
		m_isLoop = false;
		pos(left,m_pos_y);
	}
	var m_isLoop = false;
	var m_loopSign = 1;
//	void xx(_y)
//	{
//		pos(left,top+_y);
//	}
//	void GetMoveArr()
//	{
//		return "-2,-2,-2,2,2,2";
//	}
	void xx(data)
	{
		m_TopImg.rotate = data;
		MIMG.rotate = data;
	}
	void GetMoveArr()
	{
		return "10,0,-10,0";
//		return "30,60,90,120,150,0";
	}
	void GetSleepTime()
	{
		return 100;
	}
}

new VBTN_Mall_addmoney_New
{
	pos = "0,100";
}
<END>

new VBTN_A_New
{
	pos = "50,50";InitText("进攻");
	void xx(data)
	{
		m_TopImg.rotate = data;
		MIMG.rotate = data;
	}
	
	void cc()
	{
		var _array = sysarray(4);
		_array[0]=10;
		_array[1]=0;
		_array[2]=-10;
		_array[3]=0;
		var _c = 1;
		var _index = 0;
		while(_c==1)
		{
			_index+=1;
			if(_index>3){_index=0;}
			xx(_array[_index]);
			sleep(100);
		}
	}
}
