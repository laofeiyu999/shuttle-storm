/*
商城时间计数器
夏洋洋 2010-6-3
*/

class VShoppingTime_Logic item
{
	var m_ID = window.g_CArenaFunction.AddObj(this);
	name = "CArenaFunction_"+m_ID;

	//[功能]设置时间
	//[参数]time：总时间
	void SetData(time)
	{
		printf("xiayy:SetData:time:"+time+",m_ID:"+m_ID);
		window.g_ShopTimeNow = toint(time);
		if (window.g_ShopTimeNow <= 0)
		{
			return;
		}
		window.g_CArenaFunction.Begin(m_ID,time);
	}

	//程序调用
	void OnCountTime(sec,total)
	{	
		window.g_ShopTimeNow = toint(total)+toint(sec);
//		printf("xiayy:OnCountTime:total："+total+",sec:"+sec+",g_ShopTimeNow:"+window.g_ShopTimeNow);
	}

	void OnDelete()
	{
		//printf("xiayy:OnDelete");
		window.g_CArenaFunction.DelObj(m_ID);
	}
}