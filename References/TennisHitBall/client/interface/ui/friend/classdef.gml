//好友类定义
//

// 简化设置代码的图片
class VFriend_Img img
{
	void SetParam(pic, x, y)
	{
		src = "$./imgs" + window.g_Sex + "/" + pic;
		left = x;
		top = y;	
	}
	
	void GetCtrX()
	{ 
		return left - 2 + width / 2; 
	}
}


// 简化设置代码的按钮
class VFriend_Btn VBTN_A_New
{
	void SetParam(caption, x, y)
	{
		InitText(caption);		
		left = x; 
		top = y;
		_text.bold = true;	
	}
}


class VFriend_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;
	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs" + window.g_Sex + "/sj-b-text.tga");	
		InitBtnBG();
		InitClose();
		InitHelp();

		// 内部白色背景。
		staticvar s_InternalBk = new VPic9_BK2_UI
		{
			left = 15;
			width = parent.width - 2 * left;
			height = 366;
			top = 58;
		}
		//好友：Radio
		staticvar s_R_Friend = new VRadio_BK_UI
		{
			InitText("好友");
			pos = "20,40";
		}
		
		//黑名单:Radio
		staticvar s_R_Blacklist = new VRadio_BK_UI
		{
			InitText("黑名单");
			left = parent.s_R_Friend.left + parent.s_R_Friend.width + 1;
			top = parent.s_R_Friend.top;
		}
		
		
		
		// 翻页
		staticvar s_PageCtrl = new VPageCtrl_Base_UI
		{
			SetSize(105,19);
			left = (parent.width - width) / 2;
			top = parent.s_InternalBk.top + parent.s_InternalBk.height - 35;
			
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
			staticvar s_LtTxtNick = new VFriend_Img
			{ SetParam("LtTxtNick.tga", 66, parent.m_MarginTxt); }
			
			// 等级
			staticvar s_LtTxtLvl = new VFriend_Img
			{ SetParam("LtTxtLvl.tga", 165, parent.m_MarginTxt+1); }
			
			// 性别
			staticvar s_LtTxtGender = new VFriend_Img
			{ SetParam("LtTxtGender.tga", 263, parent.m_MarginTxt); }
			
			// 技术方向
			staticvar s_LtTxtTech = new VFriend_Img
			{ SetParam("jslx-text-bs.tga", 358, parent.m_MarginTxt); }
			
			// 位置
			staticvar s_LtTxtLocation = new VFriend_Img
			{ SetParam("LtTxtLocation.tga", 463, parent.m_MarginTxt); }
			
			
//			// 指示三角箭头
//			var angle_top = height - m_MarginAngle;
//			staticvar s_LtAngleNick = new VFriend_Img
//			{
//				SetParam("LstTitleTriangle.tga", parent.s_LtTxtNick.GetCtrX(), parent.angle_top);
//			}
//			
//			staticvar s_LtAngleLvl = new VFriend_Img
//			{
//				SetParam("LstTitleTriangle.tga", parent.s_LtTxtLvl.GetCtrX(), parent.angle_top);
//			}
//			
//			staticvar s_LtAngleGender = new VFriend_Img
//			{
//				SetParam("LstTitleTriangle.tga", parent.s_LtTxtGender.GetCtrX(), parent.angle_top);
//			}
//			
//			staticvar s_LtAngleTech = new VFriend_Img
//			{
//				SetParam("LstTitleTriangle.tga", parent.s_LtTxtTech.GetCtrX(), parent.angle_top);
//			}
//			
//			staticvar s_LtAngleLocation = new VFriend_Img
//			{
//				SetParam("LstTitleTriangle.tga", parent.s_LtTxtLocation.GetCtrX(), parent.angle_top);
//			}
		}		
		
		//前往房间：按钮
		staticvar s_Btn_GoRoom = new VFriend_Btn
		{
			SetParam("前往房间",parent.width-190,parent.height-47);
		}
		
		//添加好友：按钮
		staticvar s_Btn_AddFriend = new VFriend_Btn
		{
			SetParam("添加好友",parent.width-110,parent.height-47);
		}
		
		//添加黑名单：按钮
		staticvar s_Btn_AddBlackList = new VFriend_Btn
		{
			SetParam("添加黑名单", parent.s_Btn_AddFriend.left, parent.s_Btn_GoRoom.top);
		}
		//删除好友：按钮
		staticvar s_Btn_DelFriend = new VFriend_Btn
		{
			SetParam("删除好友", parent.s_Btn_AddFriend.left, parent.s_Btn_GoRoom.top);
		}
		//删除黑名单：按钮
		staticvar s_Btn_DelBlackList = new VFriend_Btn
		{
			SetParam("删除黑名单", parent.s_Btn_DelFriend.left, parent.s_Btn_GoRoom.top);
		}
	}
};