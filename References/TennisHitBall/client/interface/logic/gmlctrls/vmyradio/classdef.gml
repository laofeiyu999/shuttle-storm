//
//单选框的类定义
//yxf	2008年8月12日
//

class VMyRadio VN2Radio
{
	size="80,30";bgcolor = "#CCCCCC";border = 1;cursor = window.CURSOR_HAND;
	MTEXT.show = false;
	//单选框的名字
	var _RADIOTEXT = new text
	{
		size = "100%,100%";xcenter = true;ycenter = true;autoenter = true;
		src = "单选框";font = "宋体,-1,20";
	}
	
	//设置 单选框的文字
	//_text:文字内容
	//type:0横向的 1纵向的
	void Init(_text,type)
	{
		_RADIOTEXT.src = _text;
		if (type == 1)
		{
			size="30,80";
		}
	}

	//选中后的效果
	void MouseCheck()
	{
		bgcolor = "#00FF00";_CHECKTEXT.color = "#FF0000";
	}
	//未选中后的效果
	void MouseUnCheck()
	{
		bgcolor = "#CCCCCC";_CHECKTEXT.color = "#999999";
	}
};