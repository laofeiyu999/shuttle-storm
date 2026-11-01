//
//商城界面的类定义(包括:购物+技能镶嵌+充值)
//

importex("$./../../UI/Mall/ClassDef_Control.gml");

class VMall_Control_Logic item
{
	name = "VMall_Control";
	size = "150,200";alpha = 20;bkcolor="#00ff00";halign(90,0);valign(40,0);
	var m_Zone = 1;	//// 0普通区, 1精品区, 2休闲区

	//=============================与界面交互========================================
	void Init()
	{
		//前往休闲区
		staticvar s_Btn_GoComfortShopping = new item
		{}
		//前往精品区
		staticvar s_Btn_GoNiceShopping = new item
		{}
		//男：Radio
		staticvar s_R_Man = new VMyRadio
		{
			Init("男");valign(00,0);
		}
		//女：Radio
		staticvar s_R_Woman = new VMyRadio
		{
			Init("女");valign(20,0);
		}

		//上一件:按钮
		staticvar s_Btn_Up = new VMyButton
		{
			Init("上一件");valign(40,0);
		}
		//下一件:按钮
		staticvar s_Btn_Down = new VMyButton
		{
			Init("下一件");valign(60,0);
		}
		//形象还原:按钮
		staticvar s_Btn_AvaRestore = new VMyButton
		{
			Init("形象还原");valign(80,0);
		}
		//保存自己形象到购物车:按钮
		staticvar s_Btn_SendToBuyCar = new VMyButton
		{
			Init("保存自己形象到购物车");valign(100,0);
		}
	}

	inclass("VMall_Control_UI");//界面显示类
	//==============================function=========================================
	Init();

	// 接口: 选取(0普通区, 1精品区, 2休闲区)
	void SetZone(zone)
	{
		m_Zone = zone;
		if(zone == 1)
		{
			s_Btn_GoComfortShopping.show = true;
			s_Btn_GoNiceShopping.show = false;
		}
		else
		{
			s_Btn_GoComfortShopping.show = false;
			s_Btn_GoNiceShopping.show = true;
		}
	}

	//点击了上一件
	void UpCloth()
	{
		parent.parent.UpCloth();
	}
	//点击了下一件
	void DownCloth()
	{
		parent.parent.DownCloth();
	}
	//点击了形象还原
	void AvaRestore()
	{
		parent.parent.AvaRestore();
	}
	//点击了把当前形象发送到购物车
	void SendToBuyCar()
	{
		parent.parent.SendToBuyCar();
	}

	void SetShoppingContent(_type)
	{
		parent.SetShoppingContent(_type);
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_GoComfortShopping
		{
			void OnPressed()
			{
				parent.SetShoppingContent(2);
			}
		}
		set s_Btn_GoNiceShopping
		{
			void OnPressed()
			{
				parent.SetShoppingContent(1);
			}
		}
		set s_R_Man//男：Radio
		{
			groupname="VMall_Sex_Group";
			if (window.GetMySex() == 1){startstate="1";}
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.parent.m_Class_Shopping.m_Select_Sex = 1;
//				alert(window.find("VMall_Shopping_Logic").m_SearchState);
				if (window.find("VMall_Shopping_Logic").m_SearchState == false)
				{
					parent.parent.m_Class_Shopping.RefrestSelect();
				}
				else 
				{
					window.find("VMall_Shopping_Logic").SearchRefrestSelect(window.find("VMall_Logic").s_Edit_SearchContent.GetSrc());
				}
				parent.parent.parent.RefreshModel(1);
				if(window.GetMySex() == parent.parent.m_Class_Shopping.m_Select_Sex)
				{
					window.find("CHAT_LOGIC")._chatMgr._send._actionbrowbtn.SetState(window.BTN_STATE_LIGHT);
				}
				else
				{
					window.find("CHAT_LOGIC")._chatMgr._send._actionbrowbtn.SetState(window.BTN_STATE_GREY);
				}
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Woman//女：Radio
		{
			groupname="VMall_Sex_Group";
			if (window.GetMySex() == 2){startstate="1";}
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.parent.m_Class_Shopping.m_Select_Sex = 2;
//				alert(window.find("VMall_Shopping_Logic").m_SearchState);
				if (window.find("VMall_Shopping_Logic").m_SearchState == false)
				{
					parent.parent.m_Class_Shopping.RefrestSelect();
				}
				else
				{
					window.find("VMall_Shopping_Logic").SearchRefrestSelect(window.find("VMall_Logic").s_Edit_SearchContent.GetSrc());
				}
					parent.parent.parent.RefreshModel(2);
				if(window.GetMySex() == parent.parent.m_Class_Shopping.m_Select_Sex)
				{
					window.find("CHAT_LOGIC")._chatMgr._send._actionbrowbtn.SetState(window.BTN_STATE_LIGHT);
				}
				else
				{
					window.find("CHAT_LOGIC")._chatMgr._send._actionbrowbtn.SetState(window.BTN_STATE_GREY);
				}
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		//上一件:按钮
		set s_Btn_Up{void OnPressed(){parent.UpCloth();}}
		//下一件:按钮
		set s_Btn_Down{void OnPressed(){parent.DownCloth();}}
		//形象还原:按钮
		set s_Btn_AvaRestore{void OnPressed(){parent.AvaRestore();}}
		//保存自己形象到购物车
		set s_Btn_SendToBuyCar{void OnPressed(){parent.SendToBuyCar();}}
	}

	void OnCreated()
	{
		SetEvent();
	}

	void OnDelete()
	{
		window.find("CHAT_LOGIC")._chatMgr._send._actionbrowbtn.SetState(window.BTN_STATE_LIGHT);
	}
};