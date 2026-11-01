import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");
import("$./ClassDef.gml");
bkcolor = "#CCCCCC";
size = "1024,768";
wndsize = "1024,768";

new item
{
	size = "50,50";
	bgcolor = "#ff";

	void OnMouseDownL()
	{
		parent._tamp.SetState(window.BTN_STATE_LIGHT);
//		parent._tamp.SetImgSrc(1);
//		parent._tamp.SetImgSrc(3);
	}

	void OnMouseDownR()
	{
		parent._tamp.SetState(window.BTN_STATE_GREY);
	}
}

var _tamp = new VRadio_FamilySet
{
	pos = "100,100";
	var _click = 0;
	void OnMouseDownL()
	{
		_click = 1;
		SetImgSrc(3);
	}
	void OnMouseOver()
	{
		SetImgSrc(2);
	}
	void OnMouseOut()
	{
		if(_click)
		{
			SetImgSrc(3);
		}
	}
}

<END>
window.g_Sex = 1;
new item
{
	size= "300,300";bgcolor= "#123456";
	void OnMouseDownL()
	{
		_radio.SetState(window.BTN_STATE_LIGHT);
	}
	void OnMouseDownR()
	{
		_radio.SetState(window.BTN_STATE_GREY);
	}
	var _radio = new VRadio_FamilyHall
	{
		pos = "100,100";
		SetState(window.BTN_STATE_GREY);
	}
}


//new VRadio_Single_New_UI
//{
//	pos(100,50);
//	groupname="VChat_Type_Group1";
//	startstate="1";
//	void OnCheck()
//	{
//		if (GetChecked()){return;}
//		MouseCheck();
//	}
//	void OnUnCheck()
//	{
//		MouseUnCheck();
//	}
//}
//new VRadio_Single_New_UI
//{
//	pos(150,50);
//	groupname="VChat_Type_Group1";
//	startstate="0";
//	void OnCheck()
//	{
//		if (GetChecked()){return;}
//		MouseCheck();
//	}
//	void OnUnCheck()
//	{
//		MouseUnCheck();
//	}
//}

//*/
<END>
new VRadio_BK_UI
{
	pos(100,100);SetHangID(10);
	InitText("服  装");
	groupname="VChat_Type_Group";
	startstate="1";
	void OnCheck()
	{
		if (GetChecked()){return;}
		MouseCheck();
	}
	void OnUnCheck()
	{
		MouseUnCheck();
	}

	SetState(window.BTN_STATE_GREY);
}

var _flick = new VRadio_BK_UI
{
	InitText("手  套");
	groupname="VChat_Type_Group";pos(167,100);
//	SetState(window.BTN_STATE_GREY);
//	SetState(window.BTN_STATE_LIGHT);
	void OnCheck()
	{
		if (GetChecked()){return;}
		MouseCheck();
//		alert("VRadio_Tour_UI:OnCheck");
	}
	void OnUnCheck()
	{
		MouseUnCheck();
//		alert("VRadio_Tour_UI:OnUnCheck");
	}

//	void OnPressed()
//	{
//		alert("VRadio_Tour_UI:OnPressed");
//	}
//
//	void OnClick()
//	{
//		if (GetState() == window.BTN_STATE_GREY){return;}
//		alert("VRadio_Tour_UI:OnClick");
//	}
//
//	void OnMouseDownL()
//	{
//		if (GetState() == window.BTN_STATE_GREY){return;}
//		alert("VRadio_Tour_UI:OnMouseDownL");
//	}

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

<END>
new item
{
	size = "50,50";pos(50,50);bgcolor = "#FF";
	var _state = 1;
	void OnClick()
	{
		parent._XX.SetState(_state);
		if (_state == 1)
		{
			_state = 2;
		}
		else
		{
			_state = 1;
		}
	}
}
<END>
//new VRadio_All_UI
//{
//	groupname="VChat_Type_Group";
//	startstate="1";
//	void OnCheck()
//	{
//		if (GetChecked()){return;}
//		MouseCheck();
//	}
//	void OnUnCheck(){MouseUnCheck();}
//}
//
//new VRadio_Friend_UI
//{
//	pos(0,83);
//	groupname="VChat_Type_Group";
//	void OnCheck()
//	{
//		if (GetChecked()){return;}
//		MouseCheck();
//	}
//	void OnUnCheck(){MouseUnCheck();}
//}
//new VRadio_BlackList_UI
//{
//	pos(0,166);
//	groupname="VChat_Type_Group";
//	void OnCheck()
//	{
//		if (GetChecked()){return;}
//		MouseCheck();
//	}
//	void OnUnCheck(){MouseUnCheck();}
//}
<END>
new VRadio_Point_UI
{
	pos = "50,0";
	groupname="VChat_Type_Group_XX";
	startstate="1";
	void OnCheck()
	{
		if (GetChecked()){return;}
		MouseCheck();
	}
	void OnUnCheck(){MouseUnCheck();}
}

new VRadio_Point_UI
{
	pos = "100,0";
	groupname="VChat_Type_Group_XX";
	void OnCheck()
	{
		if (GetChecked()){return;}
		MouseCheck();
	}
	void OnUnCheck(){MouseUnCheck();}
}

new VRadio_All_UI
{
	SetSize(33,79);
	Init("Social/C-total",1,2,false);
}
<END>
new VRadio_FightGame_UI
{
	pos = "100,100";
}