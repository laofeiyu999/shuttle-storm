//
//频道界面的提示框类定义
//

//返回登录提示
class VMyMB_BackToLogin_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_BackToLogin_Logic";
	
	//construct
	function VMyMB_BackToLogin_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.ChannelChooseToLogin();
		del();
	}
};