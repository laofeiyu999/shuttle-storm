//闪烁钮 
//陈晓聪 2009年4月13日

class VFlicker_UI img
{
	var m_state = window.FLICKER_NORMAL;
	var m_type = 0;//0 点不点都闪，1 点一下就变普通，2 点一下就变灰 
	var m_width;
	var m_height;
	var m_xNum = 1;
	var m_yNum = 2;
	var m_speed = 0;
	var m_src = "";
	
	void SetData(_src,_width,_height,_xNum,_yNum,_speed,_type)
	{
//		printf("VFlicker_UI::"+_src+","_width+","_height+","_xNum+","_yNum+","_speed+","type+"\n");
		m_type = _type;
		m_src = _src;
		m_width = _width;
		m_height = _height;
		m_xNum = _xNum;
		m_yNum = _yNum;
		m_speed = toint(_speed);
		src = "$./imgs"+window.g_Sex+"/"+m_src+"1.tga";
		clipani(m_width,m_height,m_xNum,m_yNum);
//		anispeed = 0;
		aniindex = 0;
	}
	void SetTimeStop(_time)
	{
		killtimer("Close_time");
		setTimer(_time,"SetFlickerStop","Close_time");
	}
	void SetTimeGrey(_time)
	{
		killtimer("Grey_time");
		setTimer(_time,"SetFlickerGrey","Grey_time");
	}
	void SetFlickerStop()
	{
		src = "$./imgs"+window.g_Sex+"/"+m_src+"1.tga";
		clipani(m_width,m_height,m_xNum,m_yNum);
//		anispeed = 0;
		aniindex = 0;
		m_state = window.FLICKER_NORMAL;
	}
	void SetFlickerStart()
	{
		show = true;
		src = "$./imgs"+window.g_Sex+"/"+m_src+"1.tga";
		clipani(m_width,m_height,m_xNum,m_yNum);
		anispeed = m_speed;
		m_state = window.FLICKER_FLICKER;
//		StartAni();
	}
	void SetFlickerGrey()
	{
//		clipani(m_width,m_height,1,1);
		anispeed = -1;
		aniindex = 0;
		src = "$./imgs"+window.g_Sex+"/"+m_src+"2.tga";
		m_state = window.FLICKER_GREY;
	}

	//设置按钮的状态
	void SetState(data)
	{
		m_state = data;
		//灰图与彩图的切换
		if (data == window.FLICKER_GREY)
		{
			cursor = window.CURSOR_ARROW;
			SetFlickerGrey();//alert("FLICKER_GREY");
			return;
		}
		if(data == window.FLICKER_FLICKER)
		{
			cursor = window.CURSOR_HAND;
			SetFlickerStart();//alert("FLICKER_FLICKER");
			return;
		}
		if(data == window.FLICKER_NORMAL)
		{
			cursor = window.CURSOR_HAND;
			SetFlickerStop();//alert("FLICKER_NORMAL");
			return;
		}
	}
	void SetShow(data)
	{
		show = data;
	}

	void InitText(data)
	{
		_text.del();
		staticvar _text = new text
		{
			size = "100%,100%";font="宋体,-1,12";txtborder = "#0";xspace = 2;
			color = "#efe8c4";xcenter = true;ycenter = true;
		}
		_text.src = data;
	}
};


class VFlicker_A_UI VFlicker_UI
{
	SetData("A",85,24,1,7,20,0);
};
class VFlicker_GameStart VFlicker_UI
{
	SetData("ksdh",112,104,1,5,10,0);
};
class VFlicker_GamePrepare VFlicker_UI
{
	SetData("zb",112,104,1,4,10,0);
};
class VFlicker_CancelPrepare VFlicker_UI
{
	SetData("qxzb",112,104,1,5,10,0);
};
