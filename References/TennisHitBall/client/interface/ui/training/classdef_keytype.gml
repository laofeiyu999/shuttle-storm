//按键排版类
class VKey_Type_UI item
{
	void SetMyType(keydata1)
	{
		if (keydata1=="↑"){keydata1 = "up";}
		if (keydata1=="←"){keydata1 = "left";}
		if (keydata1=="→"){keydata1 = "right";}
		if (keydata1=="↓"){keydata1 = "bottom";}
		_tempdata = keydata1;
		//按键剪裁
		staticvar _temp = new img
		{
			src = "$./imgs"+window.g_Sex+"/"+keydata1+".tga";
			clipani(47,42,1,2);size(width,42);
			parent.size(width,42);
			if (keydata1 == ".>")
			{
				src = "$./imgs"+window.g_Sex+"/Juhao.tga";
				clipani(47,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "NumPad *")
			{
				src = "$./imgs"+window.g_Sex+"/NumPad Star.tga";
				clipani(47,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "\\")
			{
				src = "$./imgs"+window.g_Sex+"/R Slash.tga";
				clipani(47,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "/")
			{
				src = "$./imgs"+window.g_Sex+"/Slash.tga";
				clipani(47,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "Space")
			{
				src = "$./imgs"+window.g_Sex+"/Space.tga";
				clipani(90,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "L Alt" || keydata1 == "L Ctrl" || keydata1 == "L Shift"
				|| keydata1 == "L WinKey" || keydata1 == "R Alt" || keydata1 == "R Ctrl"
				|| keydata1 == "R Shift" || keydata1 == "R WinKey")
			{
				src = "$./imgs"+window.g_Sex+"/"+keydata1+".tga";
				clipani(70,42,1,2);size(width,42);
				parent.size(width,42);
			}
			if (keydata1 == "Backspace" || keydata1 == "Capital" || keydata1 == "Delete"
				|| keydata1 == "End" || keydata1 == "Home" || keydata1 == "Insert"
				|| keydata1 == "Num Lock" || keydata1 == "Page Down" || keydata1 == "Page Up"
				|| keydata1 == "Pause" || keydata1 == "Print" || keydata1 == "Scroll"
				|| keydata1 == "Tab")
			{
				src = "$./imgs"+window.g_Sex+"/"+keydata1+".tga";
				clipani(60,42,1,2);size(width,42);
				parent.size(width,42);
			}
			anispeed = -1;
		}
	}
	var _tempdata = "";
	//设置动画速度
	void SetMySpeed(keyparam)
	{
		if(keyparam == 1)
		{
			_temp.show=true;
			_temp2.del();
			_temp.anispeed = 3;
		}
		if(keyparam == 2)
		{
			_temp.show=false;
			_temp2.del();
			staticvar _temp2 = new img
			{
				src = "$./imgs"+window.g_Sex+"/"+parent._tempdata+".tga";
				clipani(width,42,1,2);aniindex=1;size(width,42);
				parent.size(width,42);
			}
		}
		if(keyparam == 3)
		{
			_temp.show=true;
			_temp2.del();
			_temp.anispeed=-1;
			_temp.aniindex = 0;
		}
	}
};