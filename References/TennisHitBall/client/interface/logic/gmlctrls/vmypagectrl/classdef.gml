//
//翻页控件的类定义
//yxf	2008年8月13日
//
import("$./../VMyButton/ClassDef.gml");

//目前有两种样式
//中间有数字  和 中间没有数字
class VMyPageCtrl VN2PageCtrl
{
	size = "200,30";
	defaultview = 1;			//设置分页控件的默认长相(很难看)
	border = 0;
	bgcolor = "#111111";
	alpha = 70;
	
	//设置显示状态(不显示中间数字)：默认是显示中间数字的 
	void Init()
	{
		set MTEXT{show = false;}
		size = "280,30";
		bgcolor = "-1";
	}
	set LTBTN
	{		
		//左箭头：按钮
		var _Btn = new VMyButton
		{
			size = "30,30";valign(50,0);capturemouse = false;
			Init("<");
		}
		void OnClick()
		{
			parent.OnClickL();
		}
	}
	set RBBTN					//向左向右翻页按钮
	{
		//右箭头：按钮
		var _Btn = new VMyButton
		{
			size = "30,30";valign(50,0);halign(100,0);capturemouse = false;
			Init(">");
		}
		void OnClick()
		{
			parent.OnClickR();
		}
	}

	void OnPageExchange(nCurPage, nAllPage)		//当页数改变时,当前页和所有页都会告诉脚本
	{
		LTBTN._Btn.SetState(2);
		RBBTN._Btn.SetState(2);
		if (nCurPage <= 1)
		{
			LTBTN._Btn.SetState(1);
		}
		if (nCurPage == nAllPage)
		{
			RBBTN._Btn.SetState(1);
		}
		GetCurNum(nCurPage);//给好友使用的-yxf 2008年10月23日9:51
	}
};