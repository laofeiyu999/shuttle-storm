//任务的帮助系统的类定义
//yxf 2009年12月14日
//

importex("$./../../UI/Help/ClassDef_TaskHelp.gml");

class VTaskHelp_Logic item
{
	size = "100%,100%";capturemouse = true;bgcolor = "#000000";alpha = 50;
	name = "VTaskHelp_Logic";

	new VGame_BtnLayer_Top_Logic{}

	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VTaskHelp_Logic");//不激活
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VTaskHelp_Logic");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				OnMyHide();
				break;
			}
		}
	}
	
	var m_CurrID	= -1;		//当前的ID
	var m_PreID		= -1;		//上一个的ID
	var m_NextID	= -1;		//下一个的ID
	var m_VNet2DBRow = new VNet2DBRow{}
	
	//=============================与界面交互=======================================
	void Init()
	{	
		//图片
		staticvar s_Img = new VMyText
		{
			valign(50,0);halign(50,0);bgcolor = "#FFFFFF";
		}

		//按钮：上一页
		staticvar s_Btn_PreNode = new VMyButton
		{
			Init("上一页");
		}

		//按钮：下一页
		staticvar s_Btn_NextNode = new VMyButton
		{
			Init("下一页");
		}
		
		//按钮：关闭
		staticvar s_Btn_Close = new VMyButton
		{
			Init("下一页");
		}
	}
	inclass("VTaskHelp_UI");//界面显示类
	//==============================function=========================================
	Init();
		
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_PreNode
		{
			void OnPressed()
			{
				if (parent.m_PreID < 0) return;
				parent.SetDate(parent.m_PreID);
			}
		}
		set s_Btn_NextNode
		{
			void OnPressed()
			{
				if (parent.m_NextID < 0) return;
				parent.SetDate(parent.m_NextID);
			}
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.OnMyHide();}
		}
	}
	
	SetEvent();

	//[功能]开始显示图片
	//[参数]id:帮助的ID
	void SetDate(id)
	{
		m_VNet2DBRow.InitByInt(window.GAMEUI,window.TASKSCRIPT,window.GAMEUI_TASKSCRIPT_ID,id);
		if (!m_VNet2DBRow.IsReady())
		{
			m_VNet2DBRow.Release();
			printf("B# error-VTaskHelp_Logic:DBname:"+window.TASKSCRIPT+",TBName:"+window.UIHELP+",id:"+id);
			return;
		}
		m_CurrID = id;

		m_PreID = m_VNet2DBRow.GetData(window.GAMEUI_TASKSCRIPT_PRENODE);
		m_NextID = m_VNet2DBRow.GetData(window.GAMEUI_TASKSCRIPT_NEXTNODE);
		
		var _str = m_VNet2DBRow.GetData(window.GAMEUI_TASKSCRIPT_IMGSRC);
		m_VNet2DBRow.Release();
		
		s_Img.SetData(_str,m_CurrID);
	}
};
