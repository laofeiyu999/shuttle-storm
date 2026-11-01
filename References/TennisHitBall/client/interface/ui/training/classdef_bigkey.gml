//
//游戏中大按键提示
//yxf 2009年6月17日

class VTipBigKey item
{
	size = "100%,100%";name = "VTipBigKey_Name";

	var _Please_1_1 = new img
	{
		src = "$./imgs/please.tga";show = false;
	}
	var _Please_2_1 = new img
	{
		src = "$./imgs/please2.tga";show = false;
	}
	var _Please_2_2 = new img
	{
		src = "$./imgs/please1.tga";show = false;
	}
	var _key_J = new img
	{
		show = false;
		src = "$./imgs"+window.g_Sex+"/Big J.tga";
		clipani(98,98,1,2);anispeed = 4;
	}
	var _key_L = new img
	{
		show = false;
		src = "$./imgs"+window.g_Sex+"/Big L.tga";
		clipani(98,98,1,2);anispeed = 0;
		aniindex = 1;
	}
	
	//[功能]显示成啥样
	//[参数]_isShow:true/false
	//		_num:1/2	
	void SetData(_isShow,_num)
	{
		if (_isShow)
		{
			if (toint(_num) == 1)
			{
				_key_J.show = _isShow;
				_key_L.show = false;
				_Please_2_1.show = false;
				_Please_2_2.show = false;
				_Please_1_1.show = _isShow;
				_key_J.timer(3000,"show=false");
				_Please_1_1.timer(3000,"show=false");

				_Please_1_1.valign(50,0);
				_Please_1_1.halign(40,0);
				_key_J.valign(50,0);
				_key_J.halign(62,0);
			}
			else
			{
				_key_J.show = _isShow;
				_key_L.show = _isShow;
				_Please_1_1.show = false;
				_Please_2_1.show = _isShow;
				_Please_2_2.show = _isShow;
				_key_J.timer(5000,"show=false");
				_key_L.timer(5000,"show=false");
				_Please_2_1.timer(5000,"show=false");
				_Please_2_2.timer(5000,"show=false");

				_Please_2_1.valign(50,0);
				_Please_2_1.halign(25,0);
				_Please_2_2.valign(50,0);
				_Please_2_2.halign(65,0);
				_key_J.valign(50,0);
				_key_J.halign(80,0);
				_key_L.valign(50,0);
				_key_L.halign(45,0);
			}
		}
		else
		{
			_key_J.show = _isShow;
			_key_L.show = _isShow;
			_Please_1_1.show = _isShow;
			_Please_2_1.show = _isShow;
			_Please_2_2.show = _isShow;
		}
	}
};