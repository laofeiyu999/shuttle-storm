import("$./ClassDef.gml");
import("$./../../../Logic/Init.gml");
bgcolor = "#FFFFFF";
new fmodel();

staticvar s_LB_ItemPeriod = new VLIST_UI
{
	size = "115,80";pos = "108,34";
	var _temp = new text
	{
		pos = "0,4";size = "117,20";xcenter = true;src = "1天有效";
	}
	var _onechoose = new VLISTCHANGE_UI
	{
		var _day = 0;
		pos = "0,26";
		show = false;
		Init("15天有效");
		
		void OnMouseDownL()
		{
			parent.m_ClickChild = true;
			if(_day == 0)
			{
				_day = 1;
				parent._temp.src = "15天有效";
//				parent._listbase.show = false;
//				parent._twochoose.show = false;
//				show = false;
				parent._twochoose._day = 0;
				parent._twochoose.Init("30天有效");
				Init("7天有效");
				parent.WhichSelect(2);
			}
			if(_day == 1)
			{
				_day = 0;
				parent._temp.src = "7天有效";
//				parent._listbase.show = false;
//				parent._twochoose.show = false;
//				show = false;
				parent._twochoose._day = 0;
				parent._twochoose.Init("30天有效");
				Init("15天有效");
				parent.WhichSelect(1);
			}
		}
	}
	var _twochoose = new VLISTCHANGE_UI
	{
		var _day = 0;
		pos = "0,52";
		show = false;
		Init("30天有效");
		
		void OnMouseDownL()
		{
			parent.m_ClickChild = true;
			if(_day == 0)
			{
				_day = 1;
				parent._temp.src = "30天有效";
//				parent._listbase.show = false;
//				parent._onechoose.show = false;
//				show = false;
				parent._onechoose._day = 1;
				parent._onechoose.Init("7天有效");
				Init("15天有效");
				parent.WhichSelect(3);
			}
			if(_day == 1)
			{
				_day = 0;
				parent._temp.src = "15天有效";
//				parent._listbase.show = false;
//				parent._onechoose.show = false;
//				show = false;
				parent._onechoose._day = 1;
				parent._onechoose.Init("7天有效");
				Init("30天有效");
				parent.WhichSelect(2);
			}
		}
	}
	void MouseClick()
	{
		_onechoose.show = "xor";
		_twochoose.show = "xor";
	}
	void HideAllChild()
	{
		_onechoose.show = false;
		_twochoose.show = false;
	}
}