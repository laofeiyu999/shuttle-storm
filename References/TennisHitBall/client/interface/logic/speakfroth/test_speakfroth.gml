import("$./../init.gml");
import("$./../../Const.gml");
import("$./ClassDef_SpeakFroth.gml");
size = "800,600";
wndsize = "800,600";
//size = "1024,768";
//wndsize = "1024,768";
bgcolor = "#FF";alpha = 80;
window.g_Sex = 1;

class VSpeakFroth_test VSpeakFroth_UI
{
	//_type 2:三角在左边 1:三角在下边
	void SetData(_src,_type)
	{
		killtimer("SpeakFroth_Timer");
		zindex="top";
		InitText(_src);
		InitType(_type);
		show = true;
		setTimer(5000,"HideSelf","SpeakFroth_Timer");
	}
	void HideSelf()
	{
		show = false;
		m_loopState = 0;
	}
};

var _type1 = new VSpeakFroth_test
{
//	bgcolor = "#FF0000";
	SetPos1(100,100);
	SetData("法师的法",2);
}

var _type2 = new VSpeakFroth_test
{
//	bgcolor = "#FF0000";
	SetData("法法法法",1);
	//这个不用重载 这个函数只用于测试代码
	void OnUpdate()
	{
		if(m_loopState==1){SetPos1(window.mousex-width/2,window.mousey-height);}
		sleep(200);
	}
}



new text
{
	pos = "0,100";size = "20,20";bgcolor = "#FF00";src = "左";
	void OnMouseDownL(){parent._type1.SetData("法师的法",2);}
	void OnMouseDownR(){parent._type2.SetData("法师的法",1);}
}
new text
{
	pos = "0,150";size = "20,20";bgcolor = "#FF00";src = "右";
	void OnMouseDownL(){parent._type1.SetData("法师的法师大法师暗室逢灯法师暗室",2);}
	void OnMouseDownR(){parent._type2.SetData("法师的法师大法师暗室逢灯法师暗室",1);}
}
new text
{
	pos = "0,200";size = "20,20";bgcolor = "#FF00";src = "都";
	void OnMouseDownL(){parent._type1.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字",2);}
	void OnMouseDownR(){parent._type2.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字",1);}
}
new text
{
	pos = "0,250";size = "20,20";bgcolor = "#FF00";src = "能";
	void OnMouseDownL(){parent._type1.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字 多多",2);}
	void OnMouseDownR(){parent._type2.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字 多多",1);}
}
new text
{
	pos = "0,300";size = "20,20";bgcolor = "#FF00";src = "点";
	void OnMouseDownL(){parent._type1.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字；法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字",2);}
	void OnMouseDownR(){parent._type2.SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字：法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字",1);}
}