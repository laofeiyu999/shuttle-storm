//
// 任务界面的逻辑部分类定义
//
importex("$./../../UI/Task/ClassDef.gml");
importex("$./ClassDef_Task_Normal.gml");
importex("$./ClassDef_Task_Everyday.gml");
importex("$./ClassDef_Task_Lover.gml");
importex("$./ClassDef_Task_Buddy.gml");
class VTask_Logic item
{
//	bkcolor="#FFFFFF";
//	size = "325,470";
//	valign(50,0);
//	halign(50,0);

	//=========================与界面交互=========================
	void Init()
	{
		bkcolor="#FFFFFF";
		size = "325,470";
		valign(50,0);
		halign(50,0);
		// X关闭
		staticvar s_B_Close = new VMyButton
		{
			pos = "283,10";
			Init("X关闭");
		}

		// X帮助
		staticvar s_B_Help = new VMyButton
		{
			pos = "253,10";
			Init("X帮助");
		}

		// 单选 前
		staticvar s_R_NormalTask=new VMyRadio
		{
			pos = "16,51";
			Init("个人任务",0);
		}
		// 单选 后
		staticvar s_R_DailyTask=new VMyRadio
		{
			pos = "126,51";
			Init("日常任务",0);
		}
//		// 下面关闭
//		staticvar s_btn_WndClose = new VMyButton
//		{
//			pos = "217,306";
//			Init("下面关闭");
//		}
	}

	// 设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){window.find("TASK_LOGIC").del();}
		}
		set s_Btn_Help
		{
			void OnPressed()
			{
				window.CallBack_Help(window.POS_TASK);
			}
		}
		set s_R_NormalTask	//单选 前
		{
			groupname="_Radio_Group_Name";
			startstate=1;
			void OnCheck()
			{
				//alert("01");
				parent._VTask_Normal_Logic.show=true;
				parent._VTask_Everyday_Logic.show=false;
				parent._VTask_Lover_Logic.show=false;
				parent._VTask_Buddy_Logic.show=false;

				//window._Task_Logic=parent._VTask_Normal_Logic;

				MouseCheck();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_DailyTask		//单选 后
		{
			groupname="_Radio_Group_Name";
			void OnCheck()
			{
				//alert("02");
				parent._VTask_Normal_Logic.show=false;
				parent._VTask_Everyday_Logic.show=true;
				parent._VTask_Lover_Logic.show=false;
				parent._VTask_Buddy_Logic.show=false;
				parent._VTask_Everyday_Logic._Task_EverydayTask_DBList_Logic.checkselect(10,10);
				//window._Task_Logic=parent._VTask_Everyday_Logic;

				MouseCheck();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_LoverTask		//单选 后
		{
			groupname="_Radio_Group_Name";
			void OnCheck()
			{
				//alert("02");
				parent._VTask_Normal_Logic.show=false;
				parent._VTask_Everyday_Logic.show=false;
				parent._VTask_Lover_Logic.show=true;
				parent._VTask_Buddy_Logic.show=false;
				parent._VTask_Lover_Logic._Task_LoverTask_DBList_Logic.checkselect(10,10);
				//window._Task_Logic=parent._VTask_Everyday_Logic;

				MouseCheck();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_BuddyTask	//单选 后
		{
			groupname="_Radio_Group_Name";
			void OnCheck()
			{
				//alert("02");
				parent._VTask_Normal_Logic.show=false;
				parent._VTask_Everyday_Logic.show=false;
				parent._VTask_Lover_Logic.show=false;
				parent._VTask_Buddy_Logic.show=true;
				parent._VTask_Buddy_Logic._Task_BuddyTask_DBList_Logic.checkselect(10,10);
				//window._Task_Logic=parent._VTask_Everyday_Logic;

				MouseCheck();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
//		set s_btn_WndClose		// 下面关闭
//		{
//			void OnPressed()
//			{
//				window.CloseTask();
//				parent.parent.del();
//			}
//		}
	}

	inclass("VTask_UI");	// 界面显示类
	Init();

	var _VTask_Normal_Logic=new VTask_Normal_Logic{}
	var _VTask_Everyday_Logic=new VTask_Everyday_Logic{}
	var _VTask_Lover_Logic   = new VTask_Lover_Logic{}
	var _VTask_Buddy_Logic  = new  VTask_Buddy_Logic{}

	//[功能]用于显示或隐藏家族/密友/情侣任务内容
	//[参数]_data：true为显示；false：为隐藏
	//[返回值]无
	void ShowAnyTask()
	{
		var _haveFamilyState = window.haveFamilyState();
//		var _haveBuddyState  = window.GetCurrBuddy();
		var _haveBuddyState  = 0;
		var _haveLoverState  = window.GetCurrLoverKeyID();
//		alert("haveLoverState="+_haveLoverState);
//		alert("_haveBuddyState="+_haveBuddyState+",_haveLoverState="+_haveLoverState+",_haveFamilyState="+_haveFamilyState);
		if(_haveFamilyState == true && _haveBuddyState == 0 && _haveLoverState == 0 )
		{return 1;}
		if(_haveFamilyState == false && _haveBuddyState == 1 && _haveLoverState == 0 )
		{return 2;}
		if(_haveFamilyState == false && _haveBuddyState == 0 && _haveLoverState != 0 )
		{return 3;}
		if(_haveFamilyState == true && _haveBuddyState == 1 && _haveLoverState == 0 )
		{return 4;}
		if(_haveFamilyState == true && _haveBuddyState == 0 && _haveLoverState != 0 )
		{return 5;}
		if(_haveFamilyState == false && _haveBuddyState == 1 && _haveLoverState != 0 )
		{return 6;}
		if(_haveFamilyState == true && _haveBuddyState == 1 && _haveLoverState != 0 )
		{return 7;}		
	}
	void RefreshTaskshow()
	{
		var _showwhichtask = ShowAnyTask();
		TaskPosState(_showwhichtask);
	}
		
	void OnCreated()
	{
		SetEvent();
		//window.find("selfcharacter").parent.tos("GetEverydayTask","");
		RefreshTaskshow();
		window.Tos_GetEverydayTask();
	}
	void OnDelete()
	{
	}

	/*void AllTaskFollow()
	{
		//alert("AllTaskFollow");

		_VTask_Normal_Logic._VTask_NormalTask_DBList_Logic.scriptprcallsub("AllTaskFollow");
		_VTask_Everyday_Logic._Task_EverydayTask_DBList_Logic.scriptprcallsub("AllTaskFollow");
	}
	void CancelAllTaskFollow()
	{
		//alert("CancelAllTaskFollow");
		_VTask_Normal_Logic._VTask_NormalTask_DBList_Logic.scriptprcallsub("CancelAllTaskFollow");
		_VTask_Everyday_Logic._Task_EverydayTask_DBList_Logic.scriptprcallsub("CancelAllTaskFollow");
	}*/
};
