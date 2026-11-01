bgcolor = "#ff"

var curTime = 0;
var _Min = 0;
var _Sec = 0;
var _Persec = 0;
var goon = 1;

void UpdateUITimer()
{
	curTime = curTime + 30;
	_Min = curTime / 60000;
	_Sec = curTime / 1000 - _Min * 60;
	_Persec = curTime - (_Sec) * 1000 - (_Min) * 60000;
	videoTime.min.src = _Min;
	videoTime.sec.src = _Sec;
	videoTime.persec.src = _Persec;
	if (goon == 1)
	{
		timer( 30, "UpdateUITimer");
	}
	if (goon == 0)
	{
		return;
	}
}

class TimerText text
{
	size = "60, 30";
	bgcolor = "#ff00";
};



class UITimer item
{
	size = "300, 60";

	var min = new TimerText
	{
		pos = "0, 0";
		src = "0";
	};

	var sec = new TimerText
	{
		pos = "80, 0"
		src = "0";
	};

	var persec = new TimerText
	{
		pos = "160, 0"
		src = "0";
	};
};

<END>
var videoTime = new UITimer
{
	pos="20,60"
};

