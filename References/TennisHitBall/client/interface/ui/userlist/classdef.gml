//玩家列表 类定义
//

// 简化设置代码的图片
class VUserList_Img img
{
	void SetParam(pic, x, y)
	{
		src = "$./imgs" + window.g_Sex + "/" + pic;
		left = x;
		top = y;	
	}
	
	void GetCtrX()
	{ return left - 2 + width / 2; }
}

	
class VUserList_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs" + window.g_Sex + "/DlgTitle.tga");
		InitBtnBG();
		InitClose();
		InitHelp();

		// 内部白色背景。
		staticvar s_InternalBk = new VPic9_BK2_UI
		{
			left = 15;
			width = parent.width - 2 * left;
			height = 378;
			top = 50;
		}
		
		// 翻页
		staticvar s_PageCtrl = new VPageCtrl_UserList_UI
		{
			valign(100,-75);halign(50,0);
			_leftNum.bold = false;
			_rightNum.bold = false;
			_temptext.bold = false;
		}
	
		// 玩家列表框标题
		staticvar s_LstTitle = new VPic3_GreyTop_UI
		{
			left = 49;
			top = 80;
			width = parent.width - 2 * left;
			height = 32;
			var m_MarginTxt = 7;
			var m_MarginAngle = 14;
			
			// 昵称
			staticvar s_LtTxtNick = new VUserList_Img
			{ SetParam("LtTxtNick.tga", 66, parent.m_MarginTxt); }
			
			// 等级
			staticvar s_LtTxtLvl = new VUserList_Img
			{ SetParam("LtTxtLvl.tga", 165, parent.m_MarginTxt+1); }
			
			// 性别
			staticvar s_LtTxtGender = new VUserList_Img
			{ SetParam("LtTxtGender.tga", 263, parent.m_MarginTxt); }
			
			// 技术方向
			staticvar s_LtTxtTech = new VUserList_Img
			{ SetParam("jslx-text-bs.tga", 358, parent.m_MarginTxt); }
			
			// 位置
			staticvar s_LtTxtLocation = new VUserList_Img
			{ SetParam("LtTxtLocation.tga", 463, parent.m_MarginTxt); }
			
		}
	}
};