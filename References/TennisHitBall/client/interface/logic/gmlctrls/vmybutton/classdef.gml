//
//按钮的类定义
//yxf	2008年8月12日
//

class VMyButton item
{
	size = "95,35";bgcolor = "#777777";border = 1;capturemouse = true;cursor = window.CURSOR_HAND;
	
	//按钮的名字
	var _BTNTEXT = new text
	{
		size = "100%,100%";xcenter = true;ycenter = true;
		src = "按钮";font = "宋体,-1,20";
	}
	
	//设置 按钮上面的文字
	void Init(param)
	{
		_BTNTEXT.src = param;
	}
	
	void OnMouseOver()
	{
		bgcolor = "#FF";_BTNTEXT.color = "#FF0000";
	}

	void OnMouseOut()
	{
		bgcolor = "#777777";_BTNTEXT.color = "#000000";
	}

	void OnMouseDownL()
	{
		bgcolor = "#FF00";_BTNTEXT.color = "#FF";
		OnPressed();
		LogicMouseDownL();
	}
	
	void OnMouseUpL()
	{
		LogicMouseUpL();
	}
	void OnMouseUpL_Lost()
	{
		LogicMouseUpL_Lost();
	}
	var _Grey = new item
	{
		size = "100%,100%";bgcolor = "#CCCCCC";alpha = 30;
		show = false;capturemouse = true;
	}
	
	var _light = new item
	{
		size = "100%,100%";bgcolor = "#FFFFFF";alpha = 50;
		show = false;
	}
	var m_iState = 2;
	//改变状态：房间中的按钮变灰
	//参数 state：0未知 1等待状态(灰) 2准备状态(亮) 
	void SetState(state)
	{
		m_iState = state;
		if (state == window.BTN_STATE_LIGHT)
		{
			_Grey.show = false;
		}
		else
		{
			_Grey.show = true;
		}
	}

	//得到状态
	void GetState(){return m_iState;}

	//[功能]让一个按钮闪
	//[参数]param:true false
	void Flash(param)
	{
		_light.show = param;
	}
};