//申请信息
//夏洋洋 2010-3-9

importex("$./../../UI/Family/ClassDef_FamilyApplyInfo_Content.gml");

//一行内容
class VColumn_ApplyInfo_Logic item
{
	var m_rowUID = 0;	//行ID
	//==================================
	void Init()
	{
		//申请信息
		staticvar m_Text_ApplyInfo = new BaseText
		{}
	}
	inclass("VColumn_ApplyInfo_UI");
	Init();
	//===========================================
	void OnSelect(){OnMySelect();parent.parent.SaveSelectFamily(m_rowUID);parent.parent.SelectBtnState(true);};
	void OnUnSelect(){OnMyUnSelect();parent.parent.SelectBtnState(false);};
	void OnDataExchange(iRow,szData)
	{
		m_Text_ApplyInfo.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAAPPLY_USERNICK),"");
		m_rowUID = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAAPPLY_UID);
	}

	void OnMouseDownR()
	{
		set window.find("TOPLAYER")
		{
			new VMyMouseR_FamilyApplyList
			{
				var _list = window.find("VApplyInfoList_Logic_NAME");
				var _RoleRow = _list.curselectrow();
				var _userID = toint(_list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIAAPPLY_UID));
				var _userName = _list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIAAPPLY_USERNICK);

				void On_LookInfo()
				{
					var _RoleID = window.GetRIDByUID(_userID);
					window.SetSelfInfoData(_userID,_userName,_RoleID);
				}
			}
		}
	}
}
//总的类
class VApplyInfoList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	selecttype="1";colfilter="0";//simpleshowmode="1,3";
	alpha = 70;bgcolor = "#FF0000";
	scroll = window.SCROLL_NOYES;
	inclass("VApplyInfoList_UI");
	columclass="0,VColumn_ApplyInfo_Logic"; //识别id
}