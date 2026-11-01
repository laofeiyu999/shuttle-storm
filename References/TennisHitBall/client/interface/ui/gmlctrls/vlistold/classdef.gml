//LIST控件
//刘高辰
//08年9月1日

import("$./../VPopWnd/ClassDef.gml")

//LIST选项:
class VLISTCHANGE_UI item
{
	size = "100%,25";show = false;
	void Init(param){_change.src = param;}
	var _BK = new img
	{
		valign(50,0);halign(50,0);
		size = "100%,22,-10,0";
		src = "$./imgs"+window.g_Sex+"/ListChange.tga";
		show = false;
	}
	var _change = new text
	{
		size = "100%,20,-10,0";
		xcenter = true;ycenter = true;
	}
	void OnMouseOver(){_BK.show = true;}
	void OnMouseOut(){_BK.show = false;	}
};

//整合LIST类
class VLIST_UI item
{
	var _b_sizeX = o;
	var _b_sizeY = o;
	
	//选择条框
	var _bk = new img
	{
		src="$./imgs"+window.g_Sex+"/bk.tga";
	}

	//下拉框
	var _listbase = new VLISTBASE_UI
	{
		size = "100%,100%,0,-25";pos = "0,16";
		cursor = window.CURSOR_HAND;capturemouse = true;
		show = false;
	}

	void SetBaseListSize(_sizeX,_sizeY)
	{
		_b_sizeX = _sizeX;
		_b_sizeY = _sizeY;
		_listbase.SetSize(_sizeX,_sizeY);
	}

//	setFocus = "true";
//	void OnLostFocus()
//	{
//		if (updatecount>1)
//		{
//			alert(2);
//			_listbase.show = false;
//			HideAllChild();
//		}
//		else setFocus = "true";
//	}
	var _listcheck = new VLISTCHECK_UI//三角
	{
		halign (100,0);valign(1,0);//startstate = "1";
		void OnClick(){parent.Click();parent.MouseClick();}
	}
	void Click()
	{
		_listbase.show = "xor";
	}
	//void MouseClick(){}
	//void HideAllChild(){}
};