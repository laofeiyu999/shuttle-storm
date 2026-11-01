wndsize = "1024,700";
pos = "0,0"
//if ( window.userid % 2 == 0 )
//{
//	pos = "600,0"
//}

new text
{
	src = "清除";pos = "20,0";bkcolor = "#00ff00";valign = "50,0";
	void OnClick()
	{
		parent.info._index = 0;
		parent.info.src = "";
	}
}
var info = new text
{
	border = "#ff0000";
	size = "400,200";
	pos = "20,0";
	valign = "70,0";
	color = "#ffffff"
	font = "宋体,-1,12"

	var _max = 16;
	var _info = sysarray(_max);
	var _index = 0;

	void SetSrc()
	{
		var i = 0;
		var s = "";
		while ( i < _index )
		{
			if ( i >= _max ) break;
			s += _info[i];
			s += "\n"
			i += 1;
		}
		src = s;
	}

	void Add(v)
	{
		if ( _index >= _max )
		{
			var i = 0;
			while ( i < _max - 1 )
			{
				_info[i] = _info[i+1];
				i += 1;
			}
			_info[_max-1] = v;
		}
		else
		{
			_info[_index] = v;
		}
		_index += 1;
		SetSrc();
	}
}

void SetUIInfo(v)
{
	info.Add(v);
}