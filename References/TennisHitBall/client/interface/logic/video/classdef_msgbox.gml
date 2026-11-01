//录像界面的提示框
//yxf 2009年10月18日

//录像删除的提示
class VMyMB_DeleteVideo_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_DeleteVideo_Logic";
	
	//construct
	function VMyMB_DeleteVideo_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("VIDEO_LOGIC")._VVideo_Logic.OnConfirm_BtnDel();
		del();
	}	
};