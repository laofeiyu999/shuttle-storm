//随机任务提示
//夏洋洋 2010-3-31

class VRandTaskTip_UI VUIBG_UI
{
	size(237,150);bkcolor=-1;alpha=0;//pos(parent.width,parent.height-256);
	valign(100,-5);halign(100,0);
	show = false;
	
	void Init()
	{
		OpenDrag();
		InitBG("");
		InitClose();

		staticvar m_Bk_RandTaskTip = new VPic9_BK2_UI
		{
			size(parent.width-30,parent.height-50);pos = "14,33";
		}

		staticvar m_Text_RandTaskTip = new BaseText
		{
			size(parent.width-30,parent.height-50);
			xcenter = true;ycenter = true;
			left = parent.m_Bk_RandTaskTip.left;
			top = parent.m_Bk_RandTaskTip.top;
			autoenter = true;
		}
	}

	void SetRandTaskTip(_data)
	{
		m_Text_RandTaskTip.src = ""+_data;
		timer(1502000,"show=false");
	}

}