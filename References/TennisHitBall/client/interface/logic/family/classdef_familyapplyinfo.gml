//申请信息
//夏洋洋 2010-3-4

importex("$./../../UI/Family/ClassDef_FamilyApplyInfo.gml");
importex("$./ClassDef_FamilyApplyInfo_Content.gml");

class VFamilyApplyInfo_Logic item
{
	var m_selectRowUID = 0;	//选择的行
	//==================================
	void Init()
	{
		//同意
		staticvar s_Btn_Agree = new VBTN_A_New
		{}
		//拒绝
		staticvar s_Btn_Refuse = new VBTN_A_New
		{}
		//清空信息
		staticvar s_Btn_Clear = new VBTN_A_New
		{}
	}
	inclass("VFamilyApplyInfo_UI");
	//================================================
	void SetEvent()
	{
		set s_Btn_Agree
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY)
					window.F_Family_Doapply(parent.m_selectRowUID,window.FAMILY_APPLYAGREE);
			}
			this.SetState(window.BTN_STATE_GREY);
		}
		set s_Btn_Refuse
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY)
					window.F_Family_Doapply(parent.m_selectRowUID,window.FAMILY_APPLYNOTAGREE);
			}
			this.SetState(window.BTN_STATE_GREY);
		}
		set s_Btn_Clear
		{
			void OnPressed()
			{
				window.F_Family_Clearallapply();
			}
		}
	}
	//=======================DBList========================
	var s_ApplyInfoListContent = new VApplyInfoList_Logic
	{
		SetSize("100%,80%");//bgcolor = "#ff";
		SetPos("0,3");
		name = "VApplyInfoList_Logic_NAME";
		
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVECONSORTIAAPPLY,"Bind_VApplyInfoList_Logic");// 绑定数据表
		var _SQL = "SELECT * FROM "+window.JIVECONSORTIAAPPLY+" WHERE "+window.GAMEUI_JIVECONSORTIAAPPLY_STATE_STR+">0 AND "+window.GAMEUI_JIVECONSORTIAAPPLY_TID_STR+"="+window.GetFamilyIDByName()+" ORDER BY "+window.GAMEUI_JIVECONSORTIAAPPLY_ID_STR+" DESC";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VApplyInfoList_Logic",window.GAMEUI,_SQL);
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void FlashContent()
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAAPPLY+" WHERE "+window.GAMEUI_JIVECONSORTIAAPPLY_STATE_STR+">0 AND "+window.GAMEUI_JIVECONSORTIAAPPLY_TID_STR+"="+window.GetFamilyIDByName()+" ORDER BY "+window.GAMEUI_JIVECONSORTIAAPPLY_ID_STR+" DESC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VApplyInfoList_Logic",window.GAMEUI,_SQL);
		}
	}
	//=========================================================
	//[功能]删除单行申请信息
	//[参数]无
	//[返回值]无
	void DelApplyInfo()
	{
		var _row = new VNet2DBRow{};
		_row.InitByString(window.GAMEUI,window.JIVECONSORTIAAPPLY,window.GAMEUI_JIVECONSORTIAAPPLY_UID,m_selectRowUID);
		_row.SetInt(window.GAMEUI_JIVECONSORTIAAPPLY_STATE,0);
		_row.UpdateEnd();
		_row.del();
		s_ApplyInfoListContent.FlashContent();
	}
	//[功能]删除所有申请信息
	//[参数]无
	//[返回值]无
	void DelAllApplyInfo()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _row = new VNet2DBRow{};
			void GetData(userid)
			{
				_row.InitByString( window.GAMEUI,window.JIVECONSORTIAAPPLY,window.GAMEUI_JIVECONSORTIAAPPLY_UID,userid);
				if ( _row.IsReady() )
				{
					_row.SetInt(window.GAMEUI_JIVECONSORTIAAPPLY_STATE,0);
				}
				_row.del();
			}
		};
		var sql = "SELECT * FROM "+window.JIVECONSORTIAAPPLY;
		_VNet2DBTable.Select( window.GAMEUI,sql);
		_VNet2DBTable.ReadData("GetData",""+window.GAMEUI_JIVECONSORTIAAPPLY_UID);
		_VNet2DBTable.del();
		s_ApplyInfoListContent.FlashContent();
	}

	//[功能]记录当前选择的申请信息
	//[参数]_selectRowID：选择的申请信息
	//[返回值]无
	void SaveSelectFamily(_selectRowUID)
	{
		m_selectRowUID = _selectRowUID;
	}
	//选中状态
	void SelectBtnState(_state)
	{
		if(_state)
		{
			s_Btn_Agree.SetState(window.BTN_STATE_LIGHT);
			s_Btn_Refuse.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			s_Btn_Agree.SetState(window.BTN_STATE_GREY);
			s_Btn_Refuse.SetState(window.BTN_STATE_GREY);
		}
	}
	Init();
	SetEvent();
}