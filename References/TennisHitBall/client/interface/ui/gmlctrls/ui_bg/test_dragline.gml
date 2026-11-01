import("$./ClassDef_DragLine.gml");
import("$./../../../Logic/init.gml");
size = "1024,768";
wndsize = "1024,768";
bgcolor = "#FFFFFF";
/*
	GetOffSet()这个函数必须重载
	如果	VDragLine_UI	类 new在window下就是return 0;
	如果在一层item（此item在window下并偏移pos非0,0）里就是 return parent.left;
	如果在两层item（此item在上一个item下并偏移pos非0,0）里就是 return parent.left+parent.parent.left;
	每多一层item就一个left的偏移如果pos没偏移可不写
*/
//有拖动钮的进度条
new VDragLine_UI
{
	pos = "100,120";
	void GetOffSet()
	{
		return 0;
	}
}