//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//

importex("$./../../UI/Mall/ClassDef_Shopping_Dress.gml");

class VMall_Shopping_Dress_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//上装：Radio
		staticvar s_R_Clothing = new VMyRadio
		{
			Init("上装",1);pos = "0,60";
		}
		//裙/裤：Radio
		staticvar s_R_Trousers = new VMyRadio
		{
			Init("裙/裤",1);pos = "50,60";
		}
		//手套:Radio
		staticvar s_R_Glove = new VMyRadio
		{
			Init("手套",1);pos = "100,60";
		}
		//袜子:Radio
		staticvar s_R_Stocking = new VMyRadio
		{
			Init("袜子",1);pos = "150,60";
		}
		//鞋:Radio
		staticvar s_R_Shoe = new VMyRadio
		{
			Init("鞋",1);pos = "200,60";
		}
	}
	inclass("VMall_Shopping_Dress_UI");//界面显示类
	//==============================function=========================================
	Init();
	//设置响应事件
	void SetEvent()
	{
		set s_R_Clothing//上装:Radio
		{
			groupname="VMall_Shopping_Dress_Group";
			startstate="1";
			var m_ClassID = 100;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Trousers//裤子:Radio
		{
			groupname="VMall_Shopping_Dress_Group";
			var m_ClassID = 101;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Glove//手套:Radio
		{
			groupname="VMall_Shopping_Dress_Group";
			var m_ClassID = 102;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Stocking//袜子:Radio
		{
			groupname="VMall_Shopping_Dress_Group";
			var m_ClassID = 103;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Shoe//鞋:Radio
		{
			groupname="VMall_Shopping_Dress_Group";
			var m_ClassID = 104;
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
		s_R_Clothing.OnUnCheck();
	}

	//add by chenjihui
	//param:100上装，101裤子，102手套，103袜子，104鞋
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 100:
			s_R_Clothing.OnCheck();
			break;
		case 101:
			s_R_Trousers.OnCheck();
			break;
		case 102:
			s_R_Glove.OnCheck();
			break;
		case 103:
			s_R_Stocking.OnCheck();
			break;
		case 104:
			s_R_Shoe.OnCheck();
			break;
		}
	}
	SetEvent();

	void NewSubObj(){}
	void ChangeType(){parent.RefrestSelect();}
	void GetClassID(){return m_CurrClassID;}

	void OnCreated()
	{
		NewSubObj();
	}
};