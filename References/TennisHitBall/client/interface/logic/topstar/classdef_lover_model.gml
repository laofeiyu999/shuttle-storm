//排行榜显示情侣模型

importex("$./../../UI/TopStar/ClassDef_Lover_Model.gml");

class VTS_LoverModel_Logic item
{
	name = "VTS_LoverModel_Logic";
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);
		}
	}
	inclass("VTS_LoverModel_Wnd");//界面显示类
	//========================================================================
	
	//点击了关闭
	void OnClick_BtnClose()
	{
		del();
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
//		set s_Btn_Help//帮助：按钮
//		{
//			show = false;
//			void OnPressed(){window.CallBack_Help(window.POS_SELFINFO,parent.m_TypeIndex);}
//		}
	}
	
	Init();
	SetEvent();
	void SetModel(Model1,Model2)
	{
		s_LovModel.SetData(Model1,Model2);
	}
};