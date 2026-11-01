/
//录像退出提示框类定义
//
//观战-游戏中
class VMB_QuitVideo_Logic VMyMessageBox_2_Logic
{
	name = "VMB_QuitVideo_Logic";
	
	//construct
	function VMB_QuitVideo_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.VideoToHall();
		del();
	}
};

//观战-游戏结束时	夏洋洋添加于2010-1-28
class VMB_QuitVideoGameOver_Logic VMyMessageBox_1_Logic
{
	name = "VMB_QuitVideoGameOver_Logic";
	window.find("VMB_QuitVideo_Logic").del();
	
	//construct
	function VMB_QuitVideoGameOver_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	var m_timer = new BaseText
	{
		size = "100,20";xcenter = true;ycenter=true;//bgcolor = "#ff";
		valign(52,0);halign(50,0);
		
		void StartTimer()
		{
			var _sec = window.g_GameVedioAutoOver;
			while(_sec>0)
			{
				src = "倒计时:"+toint(_sec/1000)+"s";
				_sec -= 1000;
				sleep(1000);
			}
			parent.OnConfirm();
		}

		void OnCreated()
		{
			setTimer(3,"StartTimer","QuitVideoGameOver_Timer");
		}
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		killtimer("QuitVideoGameOver_Timer");
		window.VideoToHall();
		del();
	}
};