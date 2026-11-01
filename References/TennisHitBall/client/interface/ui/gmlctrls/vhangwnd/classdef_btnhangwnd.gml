//
//按钮+radio+checkbox+......即所有能点击的悬停类定义
//

class VBtnHangWnd_UI item
{
	name = "VBtnHangWnd_UI";
	
	var m_Byte = 6;	//每个字符的宽度

	//鼠标悬停背景
	var _hangBK = new VPic9_HandWnd_UI
	{
		SetSize(300,37);
	}
	
	//提示的文字
	var _Text = new BaseText
	{
		pos(0,0);
		xcenter=true;ycenter=true;
		autoenter = true;
	}
	
	//调整位置和大小
	void AdjustSizePos()
	{
		var _tempSizeX = _Text.src.Count*m_Byte+20;
		size(_tempSizeX,36);
		_Text.size(_tempSizeX,36);
		_hangBK.SetSize(_tempSizeX,36);
		
		pos(window.mousex - _Text.src.Count*m_Byte/2,window.mousey-45);

		if(window.mousex+_Text.src.Count*m_Byte/2+16 > window.width)
		{
			left = window.width - _Text.src.Count*m_Byte-20;
			if(window.mousey-45 < 0)
			{
				top = window.mousey+32;
			}
		}else
		{
			if(window.mousey-45 < 0)
			{
				top = window.mousey+32;
			}
		}
		
		//不让超出屏幕 2010年9月21日 yxf
		if (left < 0) left = 2;
		if (top < 0) top = 2;
	}
	//外部接口
	//设置悬停ID-GameUI.mdb 表TipIinfo
	void SetID(id)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.TIPINFO,window.GAMEUI_TIPINFO_TIPINDEX,id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("error-VBtnHangWnd_UI:DBname:"+window.GAMEUI+",TBName:"+window.TIPINFO+",id:"+id);
			del();
		}

		_Text.src = window.g_Row.GetData(window.GAMEUI_TIPINFO_TIPTEXT);
		window.g_Row.Release();

		AdjustSizePos();
	}
	
	//外部接口
	//设置悬停内容
	void SetData(_src)
	{
		_Text.src = _src;

		AdjustSizePos();
	}

	//setFocus = "true";  //如果两个悬浮框叠加显示会抢焦点，导致死循环，为此注掉此段
	//void OnLostFocus()
	//{
		//if (updatecount>1)
		//{
			//del();
		//}
		//else setFocus = "true";
	//}
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