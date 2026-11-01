//
//随机游戏
//

class VRandGameTip_UI VUIBG_UI
{
	size = "0%,0%";size = "308,208";bgcolor = -1;alpha = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=============================与界面交互========================================
	void Init()
	{
		OpenDrag();
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/ksks-bt-text.tga");
		InitBtnBG();
		InitClose();
		
		//修正BUG 0012049: 【撮合提示.导出版】撮合提示框没有任何提示信息，只有倒计时。 
		new VPic9_BK2_UI{pos = "15,34";size = ""+(parent.width-30)+",110";}
		//提示内容
		staticvar s_Content = new VContentIframe_UI
		{
			pos = "15,34";size = ""+(parent.width-30)+",110";
			//new VPic9_BK2_UI{size = "100%,100%";}
		}

		//缴纳金额提示
//		staticvar s_RandGameMoneyTip = new BaseText
//		{
//			ycenter=true;xcenter = false;bold = true;pos="115,120";halign(50,0);
//			src = "您确定要缴纳1000金币报名参赛吗？";
//		}

		//持续等待时间
		//[参数]param1:(单位：秒)
		staticvar s_timer = new BaseText
		{
			ycenter=true;xcenter = false;
			bold = true;pos="95,120";//halign(30,0);
			show = false;
			src = "正在匹配对手，请稍后";
			//font = "宋体,-1,16";
			
			var _time = new VArenaCountTime_Logic
			{
				//[功能]返回需要显示的字符串(实例可覆盖)
				//[参数]_str:显示的字符串 "00:12:34" 或 "--"
				//		_sec:秒数
				void CallBack_SetSrc(_str,_sec)
				{
					//printf("B# m_ArenaFallowTime-VArenaCountTime_Logic-CallBack_SetSrc():"+_str);
					_sec = toint(_sec);//printf("xiayy:_sec:"+_sec+",g_RandRaceID:"+window.g_RandRaceID );
//					if(_sec <=0 && window.g_RandRaceID == 102)
//					{
//						parent.parent.OnClick_Cancel();
//					}
//					if (_sec <=10)
//					{
//						parent.src = "等待倒计时:小于10秒";
//						return;
//					}
//					if (_sec <=20)
//					{
//						parent.src = "等待倒计时:小于20秒";
//						return;
//					}
//					if (_sec <=30)
//					{
//						parent.src = "等待倒计时:小于30秒";
//						return;
//					}
//					parent.src = "等待倒计时:"+_sec+"秒";
					var _rest = toint(_sec)%4;
					if(_rest == 0)
					{
						parent.parent.s_s_timer_process.src = "...";
						return;
					}
					if(_rest == 1)
					{
						parent.parent.s_s_timer_process.src = "..";
						return;
					}
					if(_rest == 2)
					{
						parent.parent.s_s_timer_process.src = ".";
						return;
					}
					if(_rest == 3)
					{
						parent.parent.s_s_timer_process.src = "";
						return;
					}
				}
			}

			void StartTimer()
			{
				show = true;
				parent.s_s_timer_process.show = true;
				parent.s_RandGameMoneyTip.show = false;
				_time.SetData(window.RANDOM_WAITTIME);
			}
		}

		staticvar s_s_timer_process = new BaseText
		{
			//ycenter=true;xcenter = false;
			bold = true;
			top = parent.s_timer.top;
			left = parent.s_timer.left + parent.s_timer.width;
			show = false;
		}

		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消等待");pos=""+(parent.width-190)+","+(parent.height-window.G_POP_BTN_POSY);
			show = false;
		}
		//确定：按钮
		staticvar s_Btn_Ok = new VBTN_A_New
		{
			InitText("确定");pos="35,"+(parent.height-window.G_POP_BTN_POSY);
		}
		//取消：按钮
		staticvar s_Btn_Cancel2 = new VBTN_A_New
		{
			InitText("取消");pos=""+(parent.width-120)+","+(parent.height-window.G_POP_BTN_POSY);
		}
	}
};