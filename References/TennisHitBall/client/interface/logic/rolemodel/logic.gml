//角色模型
//yxf 2009年10月28日

new item
{
	size = "100%,100%";name = "ROLEMODEL_LOGIC";//capturemouse = true;
	window.SetRoleModelOpenState(true);
	//==========================快捷键==================================
	void OnCreated()
	{
		
	}
	void OnDelete()
	{	
		window.SetRoleModelOpenState(false);
	}

	//==================================================================
	var _VModelMgr_Logic = new VModelMgr_Logic
	{
		InitModel(window.MODEL_INIT_HALL);
		SwitchSex(window.GetMySex());
	}

	//[功能]刷新情侣
	//[参数]type:1:邀请成为情侣 2:使用金币的取消情侣 3:强制取消情侣 4：数据同步完成
	//		szNick:被邀请的用户昵称,由对方返回的消息时有
	void UpDate_Lover(type,szNick)
	{
		_VModelMgr_Logic.ReadLoverData(szNick);
	}

	//[功能]刷新搭档
	//[参数]type:1:邀请成为情侣 2:使用金币的取消情侣 3:强制取消情侣 4：数据同步完成
	//		szNick:被邀请的用户昵称,由对方返回的消息时有
	void UpDate_Partner(type,szNick)
	{
		_VModelMgr_Logic.ReadCurrPartnerData(szNick);
	}
}