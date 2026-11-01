//帮助系统的类定义
//yxf 2009年5月13日
//

importex("$./../../UI/Help/ClassDef.gml");

class VHelp_Logic item
{
	size = "500,250";bgcolor = "#FF";alpha = 50;
	group = 1;
	var m_CurrHelpID = 0;	//当前的帮助ID
	var m_ParentID = 0;		//父ID
	//=============================与界面交互========================================
	void Init()
	{	
		//教练形象
		//data: 1一只手 2两只手
		staticvar s_Sprite = new VMyText
		{
			void SetData(_src){src = _src;}
		}
		
		//返回按钮
		//data:1显示 0不显示
		staticvar s_Btn_Back = new VMyButton
		{
			Init("返回");halign(85,0);size = "50,30";
		}
		//关闭按钮
		//data:1显示 0不显示
		staticvar s_Btn_Close = new VMyButton
		{
			Init("关闭");halign(100,0);size = "50,30";
		}

		//条目列表显示区
		staticvar s_List = new iframe
		{
			size = "500,200";bgcolor = "#FFFF";valign(100,0);
			scroll = window.SCROLL_NOTENNIS;
			var _html = new html
			{
				var _body = new body{}
			}
		}
	}
	inclass("VHelp_UI");//界面显示类
	//==============================function=========================================
	Init();
	//点击了返回按钮
	void OnClick_BtnBack()
	{
		UpdataList(m_ParentID);
	}
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}

	//事件
	void SetEvent()
	{
		set s_Btn_Back
		{
			show = false;
			void OnPressed(){parent.OnClick_BtnBack();}
			void SetData(data)
			{
				show = false;
				if (data == 1) show = true;
			}
		}
		set s_Btn_Close
		{
			show = false;
			void OnPressed(){parent.OnClick_BtnClose();}
			void SetData(data)
			{
				show = false;
				if (data == 1) show = true;
			}
		}
	}

	SetEvent();
	
	var m_Index = 0;
	//往list添加数据(选项)
	void AddList(helpid,_list,content)
	{
		if (parent.m_Param != "")
		{
			content = window.ReplaceStr(content,parent.m_Param);
		}
		content =  window.TransHtmlform(content);

		m_Index += 1;
		s_List._html._body.appendHtml("<VHelp_ListText size=12px Init("+helpid+")>"+_list+"<br></VHelp_ListText>");
		if (content != "")
		{
			s_List._html._body.appendHtml("<font color=#000000 size=12px>"+content+"<br></font>");
		}
//		timer(100,"ReSet");
	}
//	void ReSet()
//	{
//		s_List._html._body.starttypeset();
//	}
	//往list添加标题
	void AddTitle(_title)
	{
		if (_title == "") return;
		_title = window.TransHtmlform(_title);
		s_List._html._body.appendHtml("<font color=#000000 size=12px>"+_title+"<br></font>");
	}

	void UpdataList(id)
	{
		if (id <= 0 ) return;
		m_Index = 0;
		s_List._html._body.delallchild();
		parent.ReadDB(id);
	}
};

//帮助的一组
class VHelp_ListText font
{
	cursor = window.CURSOR_HAND;
	var m_HelpID = 0;//帮助ID
	void Init(hid)
	{
		m_HelpID = hid;
	}
	color = "#D360EC";//浅紫色#D360EC 原先的青色#00EAFF
	void OnMouseOver(){color = "#7008EF";}//深紫色#7008EF 原先的黄色#F6FF00
	void OnMouseOut(){color = "#D360EC";}

	void OnClick()
	{
		window.CallBack_Help(m_HelpID);
		group.UpdataList(m_HelpID);	
	}
};