//按钮悬停控件
//吴楠 2008年12月28日

importex("$./ClassDef_BtnHangWnd.gml");

class VBTN_HOVER item
{
	size = "100%,100%";bgcolor = -1;alpha = 70;
	var m_HangWndID = -1;		//悬停框的ID-有悬停的必须设置	
	var m_IsOpen = false;		//是否打开了
	var m_Time = 100;			//悬停出来的时间
	
	var m_Src = "";

	//设置鼠标悬停框的ID
	//id:	悬停的ID
	//time: 悬停出来的时间 不传则默认
	void SetHangID(id,time)
	{
		m_HangWndID = id; 
		if (time > 0)
		{
			m_Time = time;
		}
	}
	
	//设置鼠标悬停框的内容
	//id:	悬停的ID
	//time: 悬停出来的时间 不传则默认
	void SetHangSrc(_src)
	{
		m_Src = _src;
	}

	//延迟悬停
	void CallByMouseMsg()
	{
		m_IsOpen = true;
		set window.find("TOPLAYER")
		{
			new VBtnHangWnd_UI
			{
				pos(window.mousex,window.mousey);
			}
		}
		if (m_Src != "")
		{
			window.find("TOPLAYER").find("VBtnHangWnd_UI").SetData(m_Src);
		}
		else
		{
			window.find("TOPLAYER").find("VBtnHangWnd_UI").SetID(m_HangWndID);
		}
	}
	//鼠标悬停-New
	void OnMouseOver()
	{
		if(m_HangWndID <= 0 && m_Src == "")return;
		timer(m_Time,"CallByMouseMsg","CallByMouseMsg_Name");
	}
	//鼠标悬停-Del
	void OnMouseOut()
	{
		killtimer("CallByMouseMsg_Name").del();
		if (m_IsOpen)
		{
			window.find("TOPLAYER").find("VBtnHangWnd_UI").del();
			m_IsOpen = false;
		}
	}

	void OnDelete()
	{
		killtimer("CallByMouseMsg_Name").del();
		if (m_IsOpen)
		{
			window.find("TOPLAYER").find("VBtnHangWnd_UI").del();
			m_IsOpen = false;
		}
	}
};