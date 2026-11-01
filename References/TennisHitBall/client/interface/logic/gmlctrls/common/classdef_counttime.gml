//
//倒计时的类（目前只做活动休整和结算剩余倒计时）
//yxf	2009年12月12日
//

class VArenaCountTime_Logic item
{
	var m_ID = window.g_CArenaFunction.AddObj(this);
	name = "CArenaFunction_"+m_ID;
	
	var m_Time = 0;
	var m_Timeing = false;	//倒计时中不再接受时间
	
	//[功能]返回需要显示的字符串(实例可覆盖)
	//[参数]_str:显示的字符串 "00:12:34" 或 "--"
	void CallBack_SetSrc(_str)
	{
		//printf("B# VArenaCountTime_Logic-CallBack_SetSrc():"+_str);
	}

	//[功能]停止计时
	//[参数]time：总时间
	void StopRunTime()
	{
		CallBack_SetSrc("00:00:00",0);

		window.g_CArenaFunction.Stop(m_ID);
		m_Timeing = false;
		
		//[功能]结束时回调
		CallBack_OnStop();
	}

	//[功能]停止计时(没有回调的)
	//[参数]time：总时间
	void StopRunTime_Ex()
	{
		CallBack_SetSrc("00:00:00",0);

		window.g_CArenaFunction.Stop(m_ID);
		m_Timeing = false;
	}

	//[功能]设置时间
	//[参数]time：总时间
	void SetData(time)
	{
		//printf("B# VArenaCountTime_Logic-SetData():"+time);

		m_Time = toint(time);

		if (m_Time <= 0)
		{
			CallBack_SetSrc("00:00:00",0);
			return;
		}

		if (m_Timeing == true)
		{
			//return;
		}

		m_Timeing = true;

		window.g_CArenaFunction.Begin(m_ID,time);
	}

	//程序调用
	void OnCountTime(sec,total)
	{	
		var _temp = toint(total) - toint(sec);
		var _returnsec = _temp;
		//printf("B# VArenaCountTime_Logic-OnCountTime():sec:"+sec+",total:"+total+",_temp:"+_temp);
		
		if ( _temp < 0)
		{
			
			StopRunTime();
			m_Time = 0;
			return;
		}

		var _hour = _temp/3600;
		_temp %= 3600;
		var _min = _temp/60;
		_temp %= 60;
		var _sec = _temp;
		if (toint(_min) < 10){_min = "0"+_min;}
		if (toint(_sec) < 10){_sec = "0"+_sec;}

		var _str = ""+_hour+":"+_min+":"+_sec;
		if (toint(_hour) == 0)
		{
			_str = "00:"+_min+":"+_sec;
			if (toint(_min) == 0)
			{
				_str = "00:00:"+_sec;
			}
		}

		CallBack_SetSrc(_str,_returnsec);
	}

	void OnDelete()
	{
		window.g_CArenaFunction.DelObj(m_ID);
	}
}