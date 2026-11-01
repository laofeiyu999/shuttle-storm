//
//邮件界面的提示框类定义
//

//1、确定要删除该邮件吗？
//2、还有物品未接收，确定要删除该邮件吗？
//3、确定要删除选中邮件吗？
//4、还有物品未接收，确定要删除选中邮件吗？
//5、确定要删除全部邮件吗？
//6、还有物品未接收，确定要删除全部邮件吗？
class VMyMB_DelMail_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_DelMail_Logic";
	
	var m_Type = -1;
	//construct
	function VMyMB_DelMail_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		if (m_Type == window.MAIL_DEL_SINGLE)
		{
			window.find("MAIL_LOGIC")._VMail_Logic.OnConfirm_BtnDelSingle();
		}
		if (m_Type == window.MAIL_DEL_SELECT)
		{
			window.find("MAIL_LOGIC")._VMail_Logic.OnConfirm_BtnDelSelect();
		}
		if (m_Type == window.MAIL_DEL_ALL)
		{
			window.find("MAIL_LOGIC")._VMail_Logic.OnConfirm_DelAll();
		}
		del();
	}
	
	//不同的类型
	//type:{MAIL_DEL_SINGLE,MAIL_DEL_SELECT,MAIL_DEL_ALL}
	void SetType(type)
	{
		m_Type = type;
	}
};