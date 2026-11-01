
import("$./../../UI/task/ClassDef_Task_Msg.gml");

class VTaskMsgShow_Logic item
{
	name = "TaskMsgShow_Logic";
	size = "400,60";
	inclass("VTaskMsgShow_UI");
	Init();
};

//放弃普通任务提示框	夏洋洋添加于2009-12-22
class VMB_NormalTaskAbandonMsg_Logic VMyMessageBox_2_Logic
{
	name = "VMB_NormalTaskAbandonMsg_Logic";
	function VMB_NormalTaskAbandonMsg_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("VTask_Normal_Logic").AbandonTask();
		
		del();
	}
};
//放弃日常任务提示框	夏洋洋添加于2009-12-22
class VMB_EverydayTaskAbandonMsg_Logic VMyMessageBox_2_Logic
{
	name = "VMB_EverydayTaskAbandonMsg_Logic";
	function VMB_EverydayTaskAbandonMsg_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("VTask_Everyday_Logic").AbandonTask();
		del();
	}
};
//放弃密友任务提示框	武文博 2010.9.27
class VMB_BuddyTaskAbandonMsg_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BuddyTaskAbandonMsg_Logic";
	function VMB_BuddyTaskAbandonMsg_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("VTask_Buddy_Logic").AbandonTask();
		del();
	}
};
//放弃情侣任务提示框	武文博 2010.9.27
class VMB_LoverTaskAbandonMsg_Logic VMyMessageBox_2_Logic
{
	name = "VMB_LoverTaskAbandonMsg_Logic";
	function VMB_LoverTaskAbandonMsg_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("VTask_Lover_Logic").AbandonTask();
		del();
	}
};
