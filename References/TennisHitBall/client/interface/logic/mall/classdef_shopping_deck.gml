//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//

importex("$./../../UI/Mall/ClassDef_Shopping_Deck.gml");

class VMall_Shopping_Deck_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//项链:Radio
		staticvar s_R_Deck1 = new VMyRadio
		{
			Init("项链",1);pos = "0,60";
		}
		//眼镜:Radio
		staticvar s_R_Deck2 = new VMyRadio
		{
			Init("眼镜",1);pos = "50,60";
		}
		//背饰:Radio
		staticvar s_R_Deck3 = new VMyRadio
		{
			Init("背饰",1);pos = "100,60";
		}
	}
	inclass("VMall_Shopping_Deck_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_R_Deck1//项链
		{
			groupname="VMall_Shopping_Deck_Group";
			startstate="1";
			var m_ClassID = 301;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Deck2//眼镜
		{
			groupname="VMall_Shopping_Deck_Group";
			var m_ClassID = 302;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Deck3//背饰
		{
			groupname="VMall_Shopping_Deck_Group";
			var m_ClassID = 303;
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
		s_R_Deck1.OnUnCheck();
	}

	//add by chenjihui
	//param:300手链，301项链，302眼镜，303背饰
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 300:
//			s_R_Deck.OnCheck();
			break;
		case 301:
			s_R_Deck1.OnCheck();
			break;
		case 302:
			s_R_Deck2.OnCheck();
			break;
		case 303:
			s_R_Deck3.OnCheck();
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