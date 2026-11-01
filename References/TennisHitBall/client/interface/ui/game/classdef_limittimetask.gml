//时限任务的时间条
//夏洋洋 2010-3-18

class VGame_LimitTimeTaskFlag_UI item
{
	size = "241,40";//pos = "46,0";//zindex = "top";
	var m_Time = 0;		//秒数
	var m_ID = window.g_CArenaFunction.AddObj(this);
	name = "CArenaFunction_"+m_ID;

	void Init()
	{
		
		new img{size = "100%,30"src = "$./imgs/lipin_bk.tga";}	
		new img{src = "$./imgs/xsbs-text.tga";pos = "3,3";}
		staticvar _num_hour = new VN2NumShow
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
		staticvar _num_min = new VN2NumShow
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
		staticvar _num_sec = new VN2NumShow
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
	}
	
	//外部接口
	void SetData(time)
	{
		if ( time == 0)
		{
			return;
		}

		show = true;
		_num_hour.setNum(0,0,2);
		_num_min.setNum(0,0,2);
		_num_sec.setNum(0,0,2);

		m_Time = toint(time);
		window.g_CArenaFunction.Begin(m_ID,m_Time);
	}

	void OnCountTime(sec,total)
	{
		var _temp = toint(total) - toint(sec);
		var _returnsec = _temp;
		CallBack_SetSrc(_str,_returnsec);
	}
	void OnDelete()
	{
		window.g_CArenaFunction.DelObj(m_ID);
	}

	
	void CallBack_SetSrc(_str,_temp)
	{
		if ( _temp <= 0)
		{
			window.g_CArenaFunction.Stop(m_ID);
			return;
		}

		_num_hour.setNum(0,0,2);
		_num_min.setNum(_temp/60,0,2);
		_temp %= 60;
		_num_sec.setNum(_temp,0,2);
	}
}