//活动总结算逻辑类定义
//2009-3-11

importex("$./../../UI/ActivityOver/ClassDef.gml");
importex("$./ClassDef_TopList.gml");

class VActivityOver_Logic item
{
	size="100%,100%";bgcolor="#000000";alpha=50;
	//====================与显示部分交互==========================
	void Init()
	{
		//说明文字
		staticvar s_Text = new VMyText{}

		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton{Init("关闭");}
	}
	inclass("VActivityOver_UI");
	//=======================================================
	Init();

	void OnClick_Close()
	{
		parent.del();
	}

	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed()
			{
				parent.OnClick_Close();
			}
		}
	}

	//最终排名
	var _TopList = new VActivityOver_TopList_Logic
	{
		//show = false;
		name = "VActivityOver_TopList_Logic_NAME";
		
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.ACTIVITYOVER,"Bind_VActivityOver_TopList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定

		var _SQL = "SELECT * FROM ActivityOver ORDER BY Sort ASC";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VActivityOver_TopList_Logic",window.M_G_SERVER,_SQL);
	}

	SetEvent();
};