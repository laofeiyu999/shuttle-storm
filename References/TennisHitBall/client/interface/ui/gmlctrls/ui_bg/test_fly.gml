import("$./ClassDef_Fly.gml");
import("$./../../../Logic/init.gml");
import("$./../../../Const.gml");
window.g_Sex = 1;
size = "1024,768";
wndsize = "1024,768";
bgcolor = "#FFFF00";
/*
	GetOffSet()这个函数必须重载
	如果	VDragLine_UI	类 new在window下就是return 0;
	如果在一层item（此item在window下并偏移pos非0,0）里就是 return parent.left;
	如果在两层item（此item在上一个item下并偏移pos非0,0）里就是 return parent.left+parent.parent.left;
	每多一层item就一个left的偏移如果pos没偏移可不写
*/
//有拖动钮的进度条
var _interface = new item{size = window.HALL_WND_SIZE;pos =window.HALL_WND_POS;}//bgcolor = "#ff";alpha = 90;
var _btn = new item{size = "50,50";pos ="500,"+(window.height-50);};//bgcolor = "#ff";alpha = 90;
var _btn2 = new item{size = "50,50";pos ="800,"+(window.height-50);};//bgcolor = "#ff";alpha = 90;

new item{name = "TEST";size = "100%,100%";}
void OnOpenFunc(p1,p2)
{
	set window.find("TEST")
	{
		new VFly_UI
		{
			void TimerEnd(){show = false;}
			SetBig(p1,p2);
		}
	}
}
void OnCloseFunc(p1,p2)
{
	set window.find("TEST")
	{
		new VFly_UI
		{
			void TimerEnd(){show = false;}
			SetSmall(p1,p2);
		}
	}
}
void OnMouseDownL()
{
	OnOpenFunc(_interface,_btn);
	OnCloseFunc(_interface,_btn2);
}

<END>
var _f = new VFly_UI{void TimerEnd(){show = false;}}
var _f2 = new VFly_UI{void TimerEnd(){show = false;}}

void OnMouseDownL()
{
	_f.SetBig(_interface,_btn);
	_f2.SetSmall(_interface,_btn2);
}