//
//创建角色界面-按钮层
//yxf 2009年10月13日
//

new item
{
	name = "CREATEROLE_BTNLAYER_LOGIC";
	size = "100%,100%";
	
	new VBtnLayer_Top_Common_Logic
	{
		//返给实例用
		void OnMyCreated()
		{
			SetPos(window.POS_CREATEROLE);
			SetSvName(""+window.GetChannelType()+" > "+window.MYDATA.GetChannel(),"","");
		}
	}
}
