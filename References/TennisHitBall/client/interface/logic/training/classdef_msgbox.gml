//
//训练界面的提示框类定义
//

//训练失败
class VMB_TrainFail_Logic VMyMessageBox_2_Logic
{
	name = "VMB_TrainFail_Logic";
	
	//construct
	function VMB_TrainFail_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("GAMELAYER").find("NAME_GCMap").OnClick_RetryTrain();
		del();
	}	
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		window.TrainingToHall();	//训练中到大厅
		del();
	}
	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//重复训练：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("重复训练");valign(96,0);halign(15,0);
			}
			//返回比赛大厅：按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("返回比赛大厅");valign(96,0);halign(95,0);
			}
		}
		HideAllObj();
		inclass("VMB_TrainFail_UI");//界面显示类
		Init();
		SetEvent();
	}
};