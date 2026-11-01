import("$./../../../Logic/Init.gml");
bkcolor="#123456";
var EDIT_Input = new html
{
	size="200,30";bkcolor="#dddddd";maxsize=100;autoenter=true;pos(300,300);
	void OnKeyChar()
	{
		chatBrow();
		
	}
	//聊天表情
	void chatBrow()
	{
		var _temp = src.Mid(src.Find("/yy"),3);
		switch(_temp)
		{
			case "/yy":
			{
				new F_yy{pos(parent.getCursorIndex(),0);}
				break;
			}
		}
	}
}