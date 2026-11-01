//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//

importex("$./../../UI/Mall/ClassDef_Shopping_Face.gml");

class VMall_Shopping_Face_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//发型:Radio
		staticvar s_R_Hair = new VMyRadio
		{
			Init("发型",1);pos = "0,60";
		}
		//容貌:Radio
		staticvar s_R_Face = new VMyRadio
		{
			Init("容貌",1);pos = "50,60";
		}
	}
	inclass("VMall_Shopping_Face_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_R_Hair//发型
		{
			groupname="VMall_Shopping_Face_Group";
			startstate="1";
			var m_ClassID = 200;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Face//容貌
		{
			groupname="VMall_Shopping_Face_Group";
			var m_ClassID = 201;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
	}

	//清空选中状态
	void ClearCheck()
	{
		s_R_Hair.OnUnCheck();
	}

	//add by chenjihui
	//param:200发型，201容貌
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 200:
			s_R_Hair.OnCheck();
			break;
		case 201:
			s_R_Face.OnCheck();
			break;
		}
	}
	void NewSubObj(){}
	void ChangeType(){parent.RefrestSelect();}
	void GetClassID(){return m_CurrClassID;}

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
};