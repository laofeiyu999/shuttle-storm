//悬停框---用于手动设置
//夏洋洋 2010-3-30

importex("$./../VPopWnd/ClassDef.gml");
importex("$./../UI_BG/ClassDef_BaseClass.gml");

class VHangWnd_UI VPic9_HandWnd_UI
{
	size = "300,37";
	var m_ByteWidth = 8;	//每个字符的宽度
	var m_ByteHeight = 20;	//每个字符的高度

	var m_content = new BaseText
	{
		size = "90%,90%";
		valign(50,0);halign(50,0);
		xcenter=true;ycenter=true;
		autoenter = true;
	}

	void SetData(_data)
	{
		m_content.src = _data;
		AutoSetSize();
	}

	void AutoSetSize()
	{
		var _rows = m_content.src.Count*m_ByteWidth/m_content.width+2;
		height = _rows*m_ByteHeight;
		m_content.size = "90%,90%";
	}
}
