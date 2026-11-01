//随机任务提示
//夏洋洋 2010-3-31

importex("$./../../UI/Task/ClassDef_RandTaskTip.gml");

class VRandTaskTip_Logic item
{
	name = "VRandTaskTip_Logic_Name";
	void Init()
	{
		staticvar m_Bk_RandTaskTip = new VPic9_BK2_UI
		{}

		staticvar m_Text_RandTaskTip = new BaseText
		{}
	}
	inclass("VRandTaskTip_UI");
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.del();}
		}
	}
	//================================================
	//window.find("gameinput").AddExclusiveShortcutUser(this);	//添加快捷键用户
	void OnDelete()
	{
		//window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
		}
	}
	Init();
	SetEvent();
	//===================================================
 	//监视随机任务
	var _VNet2DBTable = new VNet2DBTable
	{
		Init(window.GAME,window.TASK);
		var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKID_STR+">=173 AND "+window.GAME_TASK_TASKID_STR+"<200";
		Select(window.GAME,_SQL);

		void OnAddData(_taskID,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,_randomTaskID,_randomTaskName,_randomTaskDes,_randomTaskTarget)
		{
			if(_taskID>=173 && _taskID<200)
			{
				parent.SetRandTaskTip(_randomTaskDes);
				parent.show = true;
			}
		}
	}

}