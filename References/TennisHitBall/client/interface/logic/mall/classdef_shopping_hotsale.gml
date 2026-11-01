import ("$./../../UI/Mall/ClassDef_Shopping_HotSale.gml");

class VMall_Shopping_HotSale_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0; // 当前的二级子目录被选中的索引

	void Init()
	{
		//全部:Radio
		staticvar s_R_All = new VMyRadio
		{
			Init("全部",1);pos = "0,60";
		}
		//服饰:Radio
		staticvar s_R_Dress = new VMyRadio
		{
			Init("服饰",1);pos = "50,60";
		}
		//美容:Radio
		staticvar s_R_Face = new VMyRadio
		{
			Init("美容",1);pos = "100,60";
		}
		//道具:Radio
		staticvar s_R_Item = new VMyRadio
		{
			Init("道具",1);pos = "150,60";
		}
	}// Init()结束
	inclass("VMall_Shopping_HotSale_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_R_All	// 全部
		{
			groupname="VMall_Shopping_HotSale_Group";
			startstate="1";
			var _ClassID = 901;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = _ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Dress	// 服饰
		{
			groupname="VMall_Shopping_HotSale_Group";
			var _ClassID = 902;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = _ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Face	// 美容
		{
			groupname="VMall_Shopping_HotSale_Group";
			var _ClassID = 903;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = _ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Item	// 道具
		{
			groupname="VMall_Shopping_HotSale_Group";
			var _ClassID = 904;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = _ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
	}// SetEvent()结束

	//清空选中状态
	void ClearCheck()
	{
		s_R_All.OnUnCheck();
	}
	
	//add by chenjihui
	//param:901全部，902服饰，903美容，904道具
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 901:
			s_R_All.OnCheck();
			break;
		case 902:
			s_R_Dress.OnCheck();
			break;
		case 903:
			s_R_Face.OnCheck();
			break;
		case 904:
			s_R_Item.OnCheck();
			break;
		}
	}
	
	void NewSubObj(){}
	void ChangeType(){parent.RefrestSelect();}
	void GetClassID(){return m_CurrClassID; }

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
}// class VMall_Shopping_HotSale_Logic 结束
