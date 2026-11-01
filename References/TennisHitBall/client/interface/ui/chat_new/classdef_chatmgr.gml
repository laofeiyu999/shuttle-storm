//陈晓聪 2009年3月31日

class ChatMgr_UI item
{
	size(620,283);halign(0,0);valign(100,-70);//bgcolor = "#FF";alpha = 40;
	var _showStateFlag = false;	//聊天框背景显示操作标志 true为可以操作，false为不可以操作
	
	//重载
	void InitBG()
	{
		//聊天框	夏洋洋添加于2009-12-16
		staticvar _ChatFrame = new VPic9_Chat_New_BK_UI
		{
			valign(100,-25);size="100%,100%,-300,-175";
		};
		staticvar s_FrameBK = new VPic9_BK2_UI
		{
			valign(100,-25);size="100%,100%,-300,-175";
		}
		
	}
	
	void SetShowStateFlag(_state)
	{
		_showStateFlag = _state;
	}
	void ShowBG()
	{
		if(_showStateFlag)
		{
			killtimer("HideBG_Timer");
			_ChatFrame.show = true;
			s_FrameBK.show = true;
			s_Btn_drag.show = true;
			SetHideBG();
		}
		
	}
	void SetHideBG()
	{
		timer(window.g_MgrFrameTimer,"HideBG","HideBG_Timer");
	}
	void HideBG()
	{
		if(_showStateFlag)
		{
			_ChatFrame.show = false;
			s_FrameBK.show = false;
			s_Btn_drag.show = false;
		}
		
	}
	//重载
	void Init()
	{
//		staticvar _btn_lock = new item{pos(121,parent.height-48);show = false;};
//		staticvar s_btn_Loudspeaker = new VBTN_Chat_Speaker_New
//		{
//			valign(100,-6);
//		}
//		staticvar _xiaolaba_num = new text
//		{
//			valign(100,-28);halign(100,-45);show = false;
//			size = "30,20";color="#FFFFFF";ycenter = true;
//			font = "宋体,-1,12";bold = true;
//			void SetData(data)
//			{
//				src = "X"+data;
//			}
//		};
//		staticvar _btn_save = new VBTN_Chat_save{pos(42,parent.height-48);show = false;};
		staticvar s_TypeSelect = new VMyUpMenu_UI
		{
			class MyText MyOption//用于对text的控制 需要时重载
			{
				xcenter = false;
			};
			valign(100,-6);SetWidth(75);
			SetData("小喇叭,动作喇叭,普通聊天,私聊,家族聊天");
			set window.find("POPLAYER")//用于点击别处 隐藏菜单
			{
				staticvar s_UpMenuChecker = new item
				{
					size = "100%,100%";
					void OnMouseDownL()
					{
						window.find("ChatMgr_Logic").s_TypeSelect.Lost();
					}
				}
			}
			void OnDelete()
			{
				window.find("POPLAYER").s_UpMenuChecker.del();
			}
		}
		staticvar s_Btn_drag = new img
		{
			src = "$./imgs"+window.g_Sex+"/sjtz.tga";
			pos(parent.width-313,151);
			drag = "self";cursor=window.CURSOR_SIZE;
			void OnDrag()
			{
				var _SizeY = window.height-window.mousey-(window.height-parent.top-parent.height)+122;
				var _SizeX = window.mousex-parent.left+303;
				if (_SizeX<620)
				{
					_SizeX = 620;
				}
				if (_SizeX>1088)
				{
					_SizeX = 1088;
				}
				if (_SizeY<283)
				{
					_SizeY = 283;
				}
				if (_SizeY>500)
				{
					_SizeY = 500;
				}
				parent._ChatFrame.size(_SizeX,_SizeY);
				parent.size(_SizeX,_SizeY);
				pos(parent.width-313,151);
				parent.OnDragFunc();
//				parent._btn_lock.pos(121,parent.height-48);
//				parent._btn_save.pos(42,parent.height-48);
				parent._send.s_actionBrowText.pos(76,parent.height-22);
				parent._send.s_privatePeopleText.pos(76,parent.height-22);
			}
		}
		
//		//激活窗口
//		new item
//		{
//			valign(100,-25);size="100%,100%,-300,-175";zindex = "top";//bgcolor = "#FFFF";alpha = 80;
//			void OnMouseDownL()
//			{
//				parent.parent.zindex = "top";
//			}
//		}
	}
	void InitSize(data)
	{
		switch (data)
		{
			case 1:{size = "933,283";}
			case 2:{size = "740,283";}
			case 3:
			{
				_ChatFrame.del();	//游戏中只显示拉丝的底图
				size = "690,283";
				_send._actionbrowbtn.SetState(window.BTN_STATE_GREY);

			}
			case 4:{size = "740,283";}
		}
		s_Btn_drag.pos(width-313,151);
	}
};