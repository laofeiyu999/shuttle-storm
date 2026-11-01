//家族列表中的内容
//夏洋洋 2010-3-7

importex("$./../../UI/Family/ClassDef_FamilyList_Content.gml");

//一行内容	家族名称+族长+等级+人数+家族签名
class VFamilyList_Content_Logic item
{
	var m_rowID = 0;	//行ID
	//==================================
	void Init()
	{
		//家族名称
		staticvar m_Text_FamilyName = new BaseText
		{}
		//族长
		staticvar m_Text_HeaderName = new BaseText
		{}
		//等级
		staticvar m_Text_FamilyLev = new BaseText
		{}
		//人数
		staticvar m_Text_FamilyPeopleNum = new BaseText
		{}
		//家族签名
		staticvar m_Text_FamilySlogan = new BaseText
		{}
	}
	inclass("VFamilyList_Content_UI");
	Init();
	//===========================================
	void OnSelect(){OnMySelect();parent.parent.SaveSelectFamily(m_rowID);parent.parent.SetBtnState(true);};
	void OnUnSelect(){OnMyUnSelect();parent.parent.SetBtnState(false);};
	void OnDataExchange(iRow,szData)
	{
		m_Text_FamilyName.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_NAME));
		m_Text_HeaderName.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK));
		var _curLev = toint(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRLV));
		m_Text_FamilyLev.SetData(_curLev);
		var _curNum = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRNUM);
		var _maxNum = window.GetFamilyMaxPeopleNum(_curLev);
		m_Text_FamilyPeopleNum.SetData(_curNum,_maxNum);
		m_Text_FamilySlogan.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_SLOGAN));
		m_rowID = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_ID);
	}
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_FamilyTopStar
			{
				var _list = window.find("VFamilyList_Content_All_Logic_NAME");
				var _RoleRow = _list.curselectrow();
				var _selectRowID = _list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIAINISYN_ID);
				
				//申请加入
				void On_Apply()
				{
					window.F_Family_Apply(_selectRowID);
				}
				//查看信息
				void On_Lookup()
				{
					window.find("UIController").LoadUI("UI_LOOKUPFAMILYINFO");
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyInfo(_selectRowID);
				}
			}
		}
	}
}
//总的类
class VFamilyList_Content_All_Logic VN2ListCtrl
{
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	selecttype="1";colfilter="0";//simpleshowmode="1,3";
	alpha = 70;bgcolor = "#FF0000";
//	scroll = window.SCROLL_NOYES;
	inclass("VFamilyList_Content_All_UI");
	columclass="0,VFamilyList_Content_Logic"; //识别id
}