//
//任务界面-Logic
//丁文选 2009-3-11
//
import("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "TASK_LOGIC";

	var _VTask_Logic = new VTask_Logic{}

	window.SetHallHtn_Open(window.G_HALLBTN_TASK);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_TASK);

	void OnCreated()
	{
		//zindex = "top";
		//window.find("gameui")._menu._info.OnOpen();
		//window.SetTaskUIOpened(1);//设置任务列表界面是否打开
		//window.GetSelf().tos("_UiOpen","VTask");
		//进入任务界面 引导
		window.LMH_Enter_Mission();
	}

	void OnDelete()
	{
		//window.find("gameui")._menu._info.OnClose();
		//window.SetTaskUIOpened(0);//设置任务列表界面是否打开:参数 true false
		//window.GetSelf().tos("_UiClose","VTask");
		window.SetHallHtn_Close(window.G_HALLBTN_TASK);
		//退出任务界面 引导
		window.LMH_Quit_Mission();
		window.SetUIPos(_LastPos);
	}
}
