//
//在线礼品 - 显示
//yxf 2009年10月13日
importex("$./../../UI/Hall/ClassDef_OnLinePresent.gml");

class VHall_OnLinePresent_UI item
{
	size = "241,40";
	//valign(9,0);
	halign(100,-44);top = 63;
	bgcolor = -1;alpha = 0;
	//=========================与界面交互===========================
	void Init()
	{
		//在线礼品
		staticvar s_OnLinePresent = new item//CArenaFunction
		{
			var m_ID = window.g_CArenaFunction.AddObj(this);
			name = "CArenaFunction_"+m_ID;

			var m_Time = 0;
			size = "100%,100%";
			//礼品按钮
			var _btn = new img
			{
				cursor = window.CURSOR_HAND;
				src = "$./imgs/olp.tga";
				valign(50,0);halign(100,0);
				clipani(108,40,1,2);anispeed = 4;
			}
			//var _grey = new img{src = "$./imgs/olp_grey.tga";valign(50,0);}
			var _time = new item
			{
				size = "241,40";//pos = "46,0";//zindex = "top";
				new img{size = "100%,30"src = "$./imgs/lipin_bk.tga";}	
				new img{src = "$./imgs/hdjldjs-texy.tga";pos = "3,3";}
				var _num_hour = new VN2NumShow
				{
					halign(55,0);valign(45,0);
					void NEWNUM(){new img;}
					void NUMSET(objname,index,num)//设置数字对象的显示
					{
						set find(objname)
						{
							src = "$./../PublicImage/num/online_p.tga";
							clipani(10,16,1,10);
							aniindex=num;
							left=index*14;
						}
					}
				}
				new img{src = "$./../PublicImage/num/online_mao.tga";pos = "150,10";}
				var _num_min = new VN2NumShow
				{
					halign(74,0);valign(45,0);
					void NEWNUM(){new img;}
					void NUMSET(objname,index,num)//设置数字对象的显示
					{
						set find(objname)
						{
							src = "$./../PublicImage/num/online_p.tga";
							clipani(10,16,1,10);
							aniindex=num;
							left=index*14;
						}
					}
				}
				new img{src = "$./../PublicImage/num/online_mao.tga";pos = "189,10";}
				var _num_sec = new VN2NumShow
				{
					halign(93,0);valign(45,0);
					void NEWNUM(){new img;}
					void NUMSET(objname,index,num)//设置数字对象的显示
					{
						set find(objname)
						{
							src = "$./../PublicImage/num/online_p.tga";
							clipani(10,16,1,10);
							aniindex=num;
							left=index*14;
						}
					}
				}
				//外部接口
				void SetData(time)
				{
					printf("B# _InLinePresent:在线礼品倒计时:_time.SetData():time:"+time);

					if ( time == 0)
					{
						parent.CanGetPresent();
						return;
					}

					show = true;
					_num_hour.setNum(0,0,2);
					_num_min.setNum(0,0,2);
					_num_sec.setNum(0,0,2);

					parent.m_Time = toint(time);
					window.g_CArenaFunction.Begin(parent.m_ID);
				}
			}// end of time
			
			//程序调用
			void MySetState(state)
			{
				printf("B# _InLinePresent:在线礼品倒计时;MySetState():"+state);
				if (window.BTN_STATE_GREY == state)
				{
					_btn.show = false;//_grey.show = true;
				}
				else
				{
					_btn.show = true;//_grey.show = false;
				}
			}

			//程序调用
			void OnCountTime(sec)
			{	
				var _temp = toint(m_Time) - toint(sec);
				//printf("B# _InLinePresent:在线礼品倒计时;OnCountTime():sec:"+sec+",m_Time:"+m_Time+",_temp:"+_temp);
			
				if ( _temp <= 0)
				{
					CanGetPresent();
				}

				_time._num_hour.setNum(_temp/3600,0,2);
				_temp %= 3600;
				_time._num_min.setNum(_temp/60,0,2);
				_temp %= 60;
				_time._num_sec.setNum(_temp,0,2);
			}
			
			//可以领礼品了
			void CanGetPresent()
			{
				printf("B# _InLinePresent:在线礼品倒计时;CanGetPresent():");

				window.g_CArenaFunction.Stop(m_ID);
				_time.show = false;
				MySetState(window.BTN_STATE_LIGHT);
				m_Time = 0;
			}

			void OnDelete()
			{
				window.g_CArenaFunction.DelObj(m_ID);
			}
		}// end online 
	}
};
