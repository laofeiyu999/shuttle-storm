//在此设置一些公共脚本变量，以便程序访问

set window
{
	if ( ""+GAMEREPLAYIP=="0")
	{
		//setVar("_POSTGAMETOSERVERIP","61.55.135.168");
		setVar("GAMEREPLAYIP","192.168.0.131");
	}
	var _VIEWGAMENAME="no";
	var _CANGAMESAVE=true;//允许游戏录像
}
