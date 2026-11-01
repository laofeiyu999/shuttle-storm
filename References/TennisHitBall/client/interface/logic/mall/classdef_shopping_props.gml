//
//商城：购物-道具类定义
//yxf 2008年9月16日15:59
//

importex("$./../../UI/Mall/ClassDef_Shopping_Props.gml");

class VMall_Shopping_Props_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = window.GOODS_CLASS_Props*window.GOODS_CLASS_BASE;
	//=============================与界面交互========================================
	void Init()
	{
		//辅助道具:Radio
		staticvar s_R_Props1 = new VMyRadio
		{
			Init("辅助道具",1);pos = "0,60";
		}
		//聊天工具:Radio
		staticvar s_R_Props2 = new VMyRadio
		{
			Init("聊天工具",1);pos = "50,60";
		}
	}
	inclass("VMall_Shopping_Props_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
//		set s_R_Props1//辅助道具
//		{
//			groupname="VMall_Shopping_Props_Group";
//			startstate="1";
//			var m_ClassID = 501;
//			void OnCheck()
//			{
//				if (GetChecked()){return;}MouseCheck();
//				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
//			}
//			void OnUnCheck(){MouseUnCheck()}
//		}
//		set s_R_Props2//聊天工具
//		{
//			groupname="VMall_Shopping_Props_Group";
//			var m_ClassID = 500;
//			void OnCheck()
//			{
//				if (GetChecked()){return;}MouseCheck();
//				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
//			}
//			void OnUnCheck(){MouseUnCheck()}
//		}

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