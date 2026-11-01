size="800,600";
wndsize="800,600";
bgcolor="#ffff";


new img3d{};

var _a = new item
{
	size="100,100";bkcolor="#ff";
	var _b = new iframe
	{
		bgcolor="#aaaaaa";
		size="100%,100%,-55,-49";
		scroll = "no;yes";
		leftscrollbar=true;
		src = "$./lrchat.htm";
		BODY.appendHtml("<font class=CHAT_CHANNEL_SYSTEM>[当前]:你说:sdssss<a>s</a>ssssssdfsdfdsfkgsdfl; g oerjiorojkjdkjgkjdjkfgjjkdsfkjgkjsdklgfljss</font>");
		BODY.appendHtml("<font class=CHAT_CHANNEL_SYSTEM color=#ffff>[当前]:你说:sdssss<a>s</a>ssssssdfsdfdsfkgsdfl; g oerjiorojkjdkjgkjdjkfgjjkdsfkjgkjsdklgfljss</font>");
		BODY.appendHtml("<font class=CHAT_CHANNEL_SYSTEM>[当前]:你说:sdssss<a>s</a>ssssssdfsdfdsfkgsdfl; g oerjiorojkjdkjgkjdjkfgjjkdsfkjgkjsdklgfljss</font>");
		BODY.appendString("xxxxxxxxxxx");
	}
}

new item
{
	var _init = 300;
	pos="300,0";size="100,100";bgcolor="#ff";
	void OnMouseDownL()
	{
		//_init -= 1;
		//var str = "200,"+_init;
		//printf(str+"\n");
		window._a.size = "196,300";
		window._a._b.size="100%,100%,-55,-49";
	}
	void OnMouseDownR()
	{
		//_init -= 1;
		//var str = "200,"+_init;
		//printf(str+"\n");
		window._a.size = "500,300";
		window._a._b.size="100%,100%,-55,-49";
	}
}

