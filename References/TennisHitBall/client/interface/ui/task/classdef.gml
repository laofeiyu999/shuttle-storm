//任务界面
//陈晓聪 2009年1月7日
//import("$./../UI_BG/ClassDef.gml");
class VTask_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;
	//size = "815,477";bgcolor = -1;alpha = -1;
	//valign(50,0);halign(50,0);
	//InitBG("$./imgs/Tital_TaskTital.tga","",1);
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/rw-bt-text.tga");	
		InitClose();
		InitHelp();

		// 内部白色背景。
		staticvar s_InternalBk = new VPic9_BK2_UI
		{
			left = 15;
			width = parent.width - 2 * left;
			top = 62;
			height = parent.height-top-20;
		}
		//普通任务：Radio
		staticvar s_R_NormalTask = new VRadio_BK_UI
		{
			InitText("个人任务");
			pos = "20,44";
		}
		
		//家族任务:Radio
		staticvar s_R_DailyTask = new VRadio_BK_UI
		{
			InitText("家族任务");
			left = parent.s_R_NormalTask.left + parent.s_R_NormalTask.width + 1;
			top = parent.s_R_NormalTask.top;
		}
		//密友任务
		staticvar s_R_BuddyTask = new VRadio_BK_UI
		{
			InitText("密友任务");
			left = parent.s_R_DailyTask.left + parent.s_R_DailyTask.width + 1;
			top = parent.s_R_DailyTask.top;
		}
		//情侣任务
		staticvar s_R_LoverTask = new VRadio_BK_UI
		{
			InitText("情侣任务");
			left = parent.s_R_BuddyTask.left + parent.s_R_BuddyTask.width + 1;
			top = parent.s_R_BuddyTask.top;
		}		
	}

	void TaskPosState(_taskstate)
	{
		s_R_DailyTask.show = false;
		s_R_BuddyTask.show = false;
		s_R_LoverTask.show = false;
		if(_taskstate == 1)
		{	
			s_R_DailyTask.show = true;
			s_R_DailyTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_DailyTask.top = s_R_NormalTask.top;
			s_R_BuddyTask.show = false;
			s_R_LoverTask.show = false;
		}
		if(_taskstate == 2)
		{	
			s_R_DailyTask.show = false;
			s_R_BuddyTask.show = true;
			s_R_BuddyTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_BuddyTask.top = s_R_NormalTask.top;
			s_R_LoverTask.show = false;
		}
		if(_taskstate == 3)
		{	
			s_R_DailyTask.show = false;
			s_R_BuddyTask.show = false;
			s_R_LoverTask.show = true;
			s_R_LoverTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_LoverTask.top = s_R_NormalTask.top;
		}
		if(_taskstate == 4)
		{	
			s_R_DailyTask.show = true;
			s_R_BuddyTask.show = true;
			s_R_LoverTask.show = false;
			s_R_DailyTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_DailyTask.top = s_R_NormalTask.top;
			s_R_BuddyTask.left = s_R_DailyTask.left + s_R_DailyTask.width + 1;
			s_R_BuddyTask.top = s_R_DailyTask.top;
		}
		if(_taskstate == 5)
		{	
			s_R_DailyTask.show = true;
			s_R_BuddyTask.show = false;
			s_R_LoverTask.show = true;
			s_R_DailyTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_DailyTask.top = s_R_NormalTask.top;
			s_R_LoverTask.left = s_R_DailyTask.left + s_R_DailyTask.width + 1;
			s_R_LoverTask.top = s_R_DailyTask.top;
		}
		if(_taskstate == 6)
		{	
			s_R_DailyTask.show = false;
			s_R_BuddyTask.show = true;
			s_R_LoverTask.show = true;
			s_R_BuddyTask.left = s_R_NormalTask.left +s_R_NormalTask.width + 1;
			s_R_BuddyTask.top = s_R_NormalTask.top;
			s_R_LoverTask.left = s_R_BuddyTask.left + s_R_BuddyTask.width + 1;
			s_R_LoverTask.top = s_R_BuddyTask.top;
		}
		if(_taskstate == 7)
		{	
			s_R_DailyTask.show = true;
			s_R_BuddyTask.show = true;
			s_R_LoverTask.show = true;
			s_R_DailyTask.left = s_R_NormalTask.left + s_R_NormalTask.width + 1;
			s_R_DailyTask.top = s_R_NormalTask.top;
			s_R_BuddyTask.left = s_R_DailyTask.left + s_R_DailyTask.width + 1;
			s_R_BuddyTask.top = s_R_DailyTask.top;
			s_R_LoverTask.left = s_R_BuddyTask.left + s_R_BuddyTask.width + 1;
			s_R_LoverTask.top = s_R_BuddyTask.top;
		}
	}
};
