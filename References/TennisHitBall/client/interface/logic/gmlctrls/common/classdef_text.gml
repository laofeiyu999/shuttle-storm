//
//公共的文字类定义
//yxf	2008年8月12日
//

//脚本的文字-目前用于逻辑
class VMyText text
{
	font = "宋体,-1,20";
	//外部接口
	//设置值-默认取data1 + data2
	void SetData(data1,data2,data3)
	{
		src = ""+data1+data2;
		if (data3 != "")
		{
			src += "-"+data3
		}
	}
};

//鼠标右键选项的文字类
class VMyText_R text
{
	font = "宋体,-1,20";color = "#000000";
	
	var m_State = 1;//状态 0不能点 1能点

	void OnMouseOver()
	{
		if (m_State == 1){color = "#FFFFFF";}
	}

	void OnMouseOut()
	{
		if (m_State == 1){color = "#000000";}
	}
	
	//设置状态
	//参数 state：0不能点 1能点
	void SetState(state)
	{
		m_State = state;
		color = "#6B6463";
	}

	//得到状态
	void GetState(){return m_State;}
};

//为了选择之后的颜色所加
class VMyEdit edit
{
	choicebkcolor="#FFFFFF"; //选择后背景颜色
	choicecolor=-1;			//选中后文字颜色取反
};

//训练中的按键
class VKeyText VMyText
{
	//设置按键的动画
	//参数1 ：1开始动画 2停止动画-按下状态 3停止动画-抬起状态 
	void SetAni(param)
	{
		switch (param)
		{
			case 1:{color = "#FF0000";}
			case 2:{color = "#00FF00";}
			case 2:{color = "#0000FF";}
		}
	}
};

class VMyEditPos editpos
{
	size = "50,10";bgcolor = "#FF00";alpha = 50;
};

//脚本的文字-带下划线
class VMyText2 text
{
	font = "宋体,-1,16";txtunderline = 1;
	
	cursor = window.CURSOR_HAND;
	void OnMouseOver()
	{
		color = "#FFFFFF";
	}
	void OnMouseOut()
	{
		color = "#000000";
	}
};


//特殊字:颜色1 蓝色#134BFF 原先的紫色#FF00F0
//功能:标示游戏中各种玩家行为
class VHelp_Text1 font
{
	color = "#134BFF";
};

//特殊字:颜色2 红色值#FD0012 原先的绿色#24FF00
//功能:标示游戏中各种需要注意的界面元素
class VHelp_Text2 font
{
	color = "#FD0012";
};