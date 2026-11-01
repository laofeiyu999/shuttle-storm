//录像名字悬停

class VVideoHangWnd_UI item
{
	name = "VVideoHangWnd_UI";

	//鼠标悬停背景
	var _hangBK = new VHANGWND_BK_UI
	{
		SetSize(300,37);
	}
	
	//提示的文字
	var _Text = new text
	{
		color = "#ffffff";pos(1,0);
		xcenter=true;ycenter=true;
		autoenter = true;
	}

	var _temp="";
	//悬停设置
	void SetData(data)
	{
		_Text.src=data;

		if(data.Count*8+19<=700)
		{
			size(data.Count*8+19,38);
			_Text.size(data.Count*8+19,38);
			_hangBK.SetSize(data.Count*8+19,37);
			
			while(1)
			{
				pos(window.mousex,window.mousey+40);
				if(window.mousex+data.Count*8+15 > window.width && window.mousey+70 > window.height)
				{
					pos(window.mousex-data.Count*8-22,window.mousey-36);
				}
				else if(window.mousex+data.Count*8+15 > window.width)
				{
					pos(window.mousex-data.Count*8-22,window.mousey);
				}
				else if(window.mousey+70 > window.height)
				{
					pos(window.mousex,window.mousey-36);
				}
				sleep(500);
			}
			
		}
		else
		{
			if((((data.Count*8+19)/550+1)*16+18)<=380)
			{
				size(550,((data.Count*8+19)/550+1)*16+18);
				_Text.size(530,((data.Count*8+19)/550+1)*16+18);
				_Text.pos(9,0);
				_Text.xcenter=false;
				_hangBK.SetSize(550,((data.Count*8+19)/550+1)*16+18);//
				
				while(1)
				{
					pos(window.mousex,window.mousey+40);
					if(window.mousex+550 > window.width && window.mousey+(((data.Count*8+19)/550+1)*16+18) > window.height)
					{
						pos(window.mousex-550,window.mousey-(((data.Count*8+19)/550+1)*16+18));
					}
					else if(window.mousex+550 > window.width)
					{
						pos(window.mousex-550,window.mousey);
					}
					else if(window.mousey+(((data.Count*8+19)/550+1)*16+18) > window.height)
					{
						pos(window.mousex,window.mousey-(((data.Count*8+19)/550+1)*16));
					}
					sleep(500);
				}
			}
			else
			{
				size(550,380);
				_Text.size(530,372);
				_Text.pos(9,5);
				_Text.xcenter=false;
				_hangBK.SetSize(550,380);

				while(1)
				{
					pos(window.mousex,window.mousey+40);
					if(window.mousex+550 > window.width && window.mousey+380 > window.height)
					{
						pos(window.mousex-550,window.mousey-380);
					}
					else if(window.mousex+550 > window.width)
					{
						pos(window.mousex-550,window.mousey);
					}
					else if(window.mousey+380 > window.height)
					{
						pos(window.mousex,window.mousey-380);
					}
					sleep(500);
				}
			}
		}
	}
	setFocus = "true";
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			del();
		}
		else setFocus = "true";
	}
	//====================快捷键============================	
	window.find("gameinput").AddExclusiveShortcutUser(this);
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();break;
			}
		}
	}
	//===========================================================
};

class VVideo_Hover item
{
	size = "100%,100%";bgcolor = -1;alpha = 70;
	var m_HangWndData = "";		//悬停框的ID-有悬停的必须设置	
	var m_IsOpen = false;		//是否打开了
	var m_Time = 100;			//悬停出来的时间
	//设置鼠标悬停框的ID
	//id:	悬停的ID
	//time: 悬停出来的时间 不传则默认
	void SetHangData(data,time)
	{
		m_HangWndData = data; 
		if (time > 0)
		{
			m_Time = time;
		}
	}
	//延迟悬停
	void CallByMouseMsg()
	{
		m_IsOpen = true;
		set window.find("TOPLAYER")
		{
			new VVideoHangWnd_UI
			{
				pos(window.mousex,window.mousey);
			}
		}
		window.find("TOPLAYER").find("VVideoHangWnd_UI").SetData(m_HangWndData);
	}
	//鼠标悬停-New
	void OnMouseOver()
	{
		if(m_HangWndData == "")return;
		timer(m_Time,"CallByMouseMsg","CallByMouseMsg_Name");
	}
	//鼠标悬停-Del
	void OnMouseOut()
	{
		killtimer("CallByMouseMsg_Name").del();
		if (m_IsOpen)
		{
			window.find("TOPLAYER").find("VVideoHangWnd_UI").del();
		}
	}
};