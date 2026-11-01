import("$./../../Init.gml");
import("$./ClassDef.gml");

new fmodel{}
size = "800,600";
wndsize = "800,600";
bgcolor = "#FFFFFF";

var _OK = new VMyButton
{
	Init("BTN确定");
	void OnClick()
	{
		//alert(1);
	}
	void OnPressed()
	{
		//alert(_BTNTEXT.src);
	}

	Flash(true);
}

new item
{
	size = "50,50";pos = "150,60";bgcolor = "#FF";
	var _temp = 1;
	void OnClick()
	{
		if (_temp == 1)
		{
			_temp = 2;
		}
		else
		{
			_temp = 1;
		}
		parent._OK.SetState(_temp);
	}
}
new VMyButton
{
	pos = "200,200";Init("BTN取消");
	void OnClick()
	{
		//alert(_BTNTEXT.src);
	}
}