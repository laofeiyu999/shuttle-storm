//
//大厅：按钮层：包含上边(位置名+频道名+个人信息+背包+设置+频道选择)
//				 下边(聊天框+商城+社区+大奖赛+训练+网球比赛)
//yxf 2009年10月13日
//

importex("$./ClassDef_BtnLayer_Bottom.gml");

new item
{
	name = "HALL_BTNLAYER_LOGIC";
	size = "100%,100%";
	
	var _TOP = new VBtnLayer_Top_Common_Logic
	{
		//返给实例用
		void OnMyCreated()
		{
			//消息管理器
			new VHall_MsgMgr_Logic{}

			SetPos(window.POS_GAMEHALL);
			SetSvName(""+window.GetChannelType()+" > "+window.MYDATA.GetChannel(),"","");
		}
	}

	var _BOTTOM = new VHall_BtnLayer_Bottom_Logic{}

	//商城+社区+训练：显示”返回大厅“
	//网球比赛,显示“频道选择”
	//参数：界面的位置
	void ChangeReturnType(_pos)
	{
		_TOP.s_Btn_ChooseChannel.show = false;
		_TOP.s_Btn_BackToHall.show = false;
		if (_pos == 20)//网球比赛
		{
			_TOP.s_Btn_ChooseChannel.show = true;
		}
		else
		{
			_TOP.s_Btn_BackToHall.show = true;
		}
	}
}
