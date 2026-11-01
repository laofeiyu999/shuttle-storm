//家族个人赛
//夏洋洋 2010-3-4

class VFamilyCompete_Single_UI VUIBG_UI
{
	size = "308,358";bgcolor = -1;alpha = -1;
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/jzgrssm-bt-text.tga");
		InitBtnBG();
		InitClose();
		
		//提示信息
		staticvar s_Text_GameContent = new iframe
		{
			valign(23,0);halign(50,0);//bgcolor="#ff";
			size = "80%,200";
			xcenter = true;
			autoenter = true;
			scroll = window.SCROLL_NOTENNIS;
			var _html = new html
			{
				var _body = new body{}
			}

			void SetData(data)
			{
				_html._body.appendHtml("<font color=#000000 size=12px>"+data+"<br></font>")
			}
		}

		//提示时间
		staticvar s_Text_GameTip = new VListBG2_UI
		{
			valign(80,0);halign(50,0);
			size="85%,30";
			var m_tip = new BaseText
			{
				valign(50,0);
				halign(50,0);
				void SetData(data)
				{
					src = "开放时间：全天";//+data;
				}
			}
			void SetData(data)
			{
				m_tip.SetData(data);
			}
		}

		//开始比赛
		staticvar s_Btn_StartGame = new VBTN_A_New
		{
			InitText("开始比赛");
			valign(92,0);
			halign(50,0);
		}

		staticvar _VNet2DBRow = new VNet2DBRow
		{
			InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,toint(111));
			if(!IsReady())
			{
				del();
				return -1;
			}
			AddDBEvent("ServerStateChanged",6);
			var _state = GetData(window.M_G_SERVER_ARENARACE_ACTIVITY_STATE);
			if (toint(_state) == 3 || toint(_state) == 4)
			{
				parent.s_Btn_StartGame.SetState(window.BTN_STATE_LIGHT);
			}
			else
			{
				parent.s_Btn_StartGame.SetState(window.BTN_STATE_GREY);
			}

			void ServerStateChanged(index, state)
			{
				// 3和4是亮的,  其他都是灰色的
				if (toint(state) == 3|| toint(state) == 4)
					parent.s_Btn_StartGame.SetState(window.BTN_STATE_LIGHT);
				else
					parent.s_Btn_StartGame.SetState(window.BTN_STATE_GREY);
			}
		}
	}

}