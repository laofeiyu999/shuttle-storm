//
//邮件的 DBlist - 显示
//


//一行显示类：发件人+主题+日期+是否有礼品
class VColumn_MailList_UI item
{
	size = "360,28";cursor = window.CURSOR_HAND;
	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果

		//复选框：选择
		staticvar s_CHK_Choose = new VCK_CK_New
		{
			pos = "5, 6";
		}

		//已读和未读标志
		staticvar s_ReadState = new img
		{
			pos(25,6);
			src = "$./imgs1/wk.tga";
		}

		//发件人
		//参数1 name:
		staticvar s_Sender = new BaseText
		{
			pos = "56,0";xcenter = true;ycenter = true;size = "80,28";//bgcolor = "#FF";

			void SetData( p1,_isSystem,state)
			{
				src = p1;
				if (_isSystem)
					color = "#FF0000";
				else
					color = "#000000";

				OnMySetState(state);
			}

			void OnMySetState(state)
			{
				if (state == window.MAIL_READED)
				{
					bold = false;
					parent.s_ReadState.src = "$./imgs1/kg.tga";
				}
				else
				{
					bold = true;
					parent.s_ReadState.src = "$./imgs1/wk.tga";
				}
					
			}
		}

		//主题
		//参数1 data1:
		staticvar s_Title = new BaseText
		{
			pos = "140,0";size = "105, 28";xcenter = true;ycenter = true;//bgcolor = "#FF";
			
			void SetData( p1,_isSystem,_itementryid,state)
			{
				if (p1.TrimLeft(" ") == "")
				{
					if (_isSystem)
					{
						src = "系统邮件";
						if (_itementryid.__Long__ > 0){src = "系统赠送";}
					}
					else
					{
						src = "无主题";
					}
				}
				else
					src = p1;

				if (_isSystem)
					color = "#FF0000";
				else
					color = "#000000";

				OnMySetState(state);
			}

			void OnMySetState(state)
			{
				if (state == window.MAIL_READED)
					bold = false;
				else
					bold = true;
			}
		}

		//日期
		//参数1 data1:
		staticvar s_Date = new BaseText
		{
			pos = "255,0";size = "66,28";xcenter = true;ycenter = true;//bgcolor = "#FF";
			void SetData( p1,_isSystem,state)
			{
				src = p1;
				if (_isSystem)
					color = "#FF0000";
				else
					color = "#000000";

				OnMySetState(state);
			}

			void OnMySetState(state)
			{
				if (state == window.MAIL_READED)
					bold = false;
				else
					bold = true;
			}		
		}

		//是否有礼品
		//参数1 data1:
		staticvar s_Goods = new img
		{
			pos = "326,0";valign(50,0);
			void SetData( p1)
			{
				if( toint(p1) > 0)
				{
					src = "$./imgs" + window.g_Sex + "/lph.tga";
					show = true;
				}
				else
				{
					show = false;
				}
			}			
		}
	}

	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_IMG.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;_SelectState = false;
	}
};

//
//总的类：List
//
class VMailList_UI VN2ListCtrl
{
	size="360,308";
	pos(18,70);
	bgcolor = -1;
};