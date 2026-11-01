//鼠标到一定时间就隐藏
class HideCursor_UI item
{
	size="100%,100%";
	var _CurmouseX = 0;
	var _CurmouseY = 0;
	var _LastmouseX = 0;
	var _LastmouseY = 0;
	var m_Show = 0;

	void CursorHide()
	{
		while (1)
		{
			if(m_Show==2)
			{
				sleep(30);
			}
			else
			{
				sleep(1000);
			}
			_CurmouseX = window.mousex;
			_CurmouseY = window.mousey;
			
			var i = _CurmouseX - _LastmouseX;
			var j = _CurmouseY - _LastmouseY;

			if (i == 0 && j == 0)
			{
				window.cursor="hide";
				m_Show=2;
			}
			if (i != 0 || j != 0)
			{
				_LastmouseX = _CurmouseX;
				_LastmouseY = _CurmouseY;
				window.cursor=window.CURSOR_ARROW;
				m_Show=1;
			}
		}
	}
	CursorHide();

	void OnDelete()
	{
		window.cursor=window.CURSOR_ARROW;
	}
}