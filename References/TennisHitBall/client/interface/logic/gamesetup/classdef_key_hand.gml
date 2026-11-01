//
//按键 设置类定义
//

importex("$./ClassDef_KeyList.gml");
importex("$./../../UI/GameSetUp/ClassDef_Key_Hand.gml");

class VGameSetUp_Key_Hand_Logic item
{
	size = "100%,100%";enableUpdate(1);
	//=============================与界面交互========================================
	void Init()
	{
		//默认1：Radio
		staticvar s_R_Default1 = new VMyRadio
		{
			Init("默认1",0);pos = "35,10";
		}
		//自定义：Radio
		staticvar s_R_DIY = new VMyRadio
		{
			Init("自定义",0);pos = "245,10";
		}
	}
	inclass("VGameSetUp_Key_Hand_UI");//界面显示类
	//==============================function=========================================
	//点击了“默认1”，“自定义”等选项
	//参数 type: 3默认1 4自定义
	void OnCheckRadio(type)
	{
		parent._CKeySet.SetUseKeyType(type);
	}

	//恢复默认
	void ResumeDefault()
	{
		s_R_Default1.UnCheck();
		s_R_DIY.UnCheck();
		s_R_Default1.Check();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_R_Default1//默认1：Radio
		{
			groupname="VGameSetUp_KeyType_Hand_Group";
			if (parent.parent.m_HandKeyType == 3)
			{
				startstate="1";
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.OnCheckRadio(3);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_DIY//自定义：Radio
		{
			groupname="VGameSetUp_KeyType_Hand_Group";
			if (parent.parent.m_HandKeyType == 4)
			{
				startstate="1";
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.OnCheckRadio(4);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	//================================DBList=========================================

	Init();
	
	var _KeyList = new VGameSetUp_KeyList_Logic
	{
		name = "VGameSetUp_KeyList_Hand_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.KEYSET,"Bind_VGameSetUp_KeyList_Hand_Logic");// 绑定数据表

		var _selectParam = "SELECT * FROM "+window.KEYSET+" WHERE ID<8";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VGameSetUp_KeyList_Hand_Logic",window.GAMEUI,_selectParam);
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定
	}
};