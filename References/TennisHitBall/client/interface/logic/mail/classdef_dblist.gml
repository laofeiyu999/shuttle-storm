//
//邮件的 DBlist
//

importex("$./../../UI/Mail/ClassDef_DBList.gml");

//一行显示类：发件人+主题+日期+是否有礼品
class VColumn_MailList_Logic item
{
	size = "500,30";
	var m_GID = 0;//赠送iD
	var _SelectState = false; //标示选中与否
	var m_IsLastChecked = -1;
	var m_State = -1;	//0初始-未读 1已读 2删除
	var m_SetReadFinish = false;	//是否设置过已读
	//===========================与显示交互======================
	void Init()
	{
		//复选框：选择
		staticvar s_CHK_Choose = new VMyCheckBox{size = "30,30";Init("√");}
		
		//发件人
		//参数1 name:
		staticvar s_Sender = new VMyText{pos = "30,0";}

		//主题
		//参数1 data1:
		staticvar s_Title = new VMyText{pos = "130,0";}

		//日期
		//参数1 data1:
		staticvar s_Date = new VMyText{pos = "220,0";}

		//是否有礼品
		//参数1 data1:
		staticvar s_Goods = new VMyText{pos = "420,0";}
	}
	inclass("VColumn_MailList_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================

	//设置响应事件
	void SetEvent()
	{
		set s_CHK_Choose
		{
			void OnCheck(){MouseCheck();window.SelectMail(parent.m_GID,window.MAIL_SELECT);}
			void OnUnCheck(){MouseUnCheck();window.SelectMail(parent.m_GID,window.MAIL_UNSELECT);}
		}
	}
	SetEvent();

	void OnSelect()
	{
		OnMySelect();
		parent.parent.SetDataBySelect();
	}
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.InitData();
	}
	void OnClick()
	{
		if (m_State == window.MAIL_INIT)
		{
			m_SetReadFinish = true;

			window.g_MailReadGIDStr += ""+m_GID+",";
			s_Sender.OnMySetState(window.MAIL_READED);
			s_Title.OnMySetState(window.MAIL_READED);
			s_Date.OnMySetState(window.MAIL_READED);

			window.SetMailRead_UI(m_GID,window.MAIL_READED);
		}
	}
	void OnDataExchange(iRow,szData)
	{
		s_Sender.OnMySetState(window.MAIL_INIT);
		s_Title.OnMySetState(window.MAIL_INIT);
		s_Date.OnMySetState(window.MAIL_INIT);

		m_GID = szData;
		m_State = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_STATE);
		var _senduser = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_SENDUSER);
		var _isread = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_ISREAD);
		printf("mail:OnDataExchange:_senduser:"+_senduser+",_isread:"+_isread+",m_State:"+m_State);
		if (m_State == window.MAIL_READED)
		{
			_isread = window.MAIL_READED;
		}

		var _isSystem = true;
		var _sendUserID = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_SENDUSERID);
		if (toint(_sendUserID) > 0)
		{
			_isSystem = false;
		}
		var _itementryid = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_ITEMENTRYID);
		if (_SelectState && _itementryid <= 0) //接收完了
		{
			parent.parent.SetDataBySelect();
		}
		s_Sender.SetData(parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_SENDUSER),_isSystem,_isread);
		s_Title.SetData(parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_TITLE),_isSystem,_itementryid,_isread);
		s_Date.SetData(parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_CREATEDATE),_isSystem,_isread);
		s_Goods.SetData(_itementryid,"");
		
		var _IsChoose = parent.fieldstr(iRow,window.M_G_GOODS_ITEMPRESENT_ISCHECK);
		if (_IsChoose != m_IsLastChecked)
		{
			m_IsLastChecked = _IsChoose;
			if (_IsChoose.__Long__ == 1)
			{
				s_CHK_Choose.Check();
			}
			else
			{
				s_CHK_Choose.UnCheck();
			}
		}

		if (window.GetSelectSize(window.MAIL_SELECT) > 0)
		{
			parent.parent.s_Btn_Del.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			parent.parent.s_Btn_Del.SetState(window.BTN_STATE_GREY);
		}
	}
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseRMail
			{
				var _list = window.find("VMailList_Logic_NAME");
				var _Row = _list.curselectrow();
				var _sendUserID = _list.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_SENDUSERID);
				
				if (toint(_sendUserID) <= 0)
				{
					SetState(m_Index_WriteBack,0);
				}

				//点击了回复
				void On_WriteBack(data)
				{
					window.find("MAIL_LOGIC")._VMail_Logic.OnClick_WriteBack();
				}		
				//点击了删除
				void On_Del(data)
				{
					window.find("MAIL_LOGIC")._VMail_Logic.OnClick_BtnDelSingle();
				}
				//点击了全部删除
				void On_DelAll(data)
				{
					window.find("MAIL_LOGIC")._VMail_Logic.OnClick_DelAll();
				}
			}
		}
	}
};

//
//总的类：List
//
class VMailList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="500,400";pos(0,10);
	//
	selecttype="1";colfilter="0";
	simpleshowmode="1,11";	//优化bug 0012895: 当邮件数量较多时，点击右键按钮，客户端会卡住一段时间。 
	alpha = 70;bgcolor = "#FF";
	
	inclass("VMailList_UI"); //界面显示类

	columclass="0,VColumn_MailList_Logic"; //识别id

	//[功能]为了选中某一个子对象
	void SelectSubObjBy()
	{
		checkselect(10,10);
	}
};