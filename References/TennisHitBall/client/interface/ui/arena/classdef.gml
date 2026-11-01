//
//活动场类定义
//

class VArena_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;//bgcolor="#FF";alpha=50;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/hdc-text.tga");
		InitClose();
		InitHelp();

		//活动列表
		staticvar s_R_List = new VRadio_BK_UI
		{
			pos = "20,44";InitText("活动列表");
		}
		//当前活动
		staticvar s_R_My = new VRadio_BK_UI
		{
			pos = "81,44";InitText("当前活动");
		}
	}
};