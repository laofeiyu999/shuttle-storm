//
//提示条的类定义
//yxf	2008年10月20日
//

importex("$./../../../UI/GmlCtrls/VInfoBoard/ClassDef.gml");

class VMyInfoBoard item
{
	size = "400,100";bgcolor = "#FF";alpha = 50;halign(50,0);valign(30,0);
	name = "VMyInfoBoard_Logic";

	var m_Content = "";//需要显示的文字内容
	var m_Second = 0;	//单位-秒
	//=============================与界面交互==============================
	void Init()
	{
		//内容
		staticvar s_Text = new VMyText
		{
			size = "100%,100%";xcenter = true;ycenter = true;
			color = "#FFFFFF";
		}
	}
	inclass("VMyInfoBoard_UI");//界面显示类
	Init();
	//============================function===============================
	//外部-从数据库取的值
	//参数 data1:文字内容
	//参数 time：延长小时的时间 不填则为默认时间 -1即为永久显示
	//参数 cut：显示倒计时 1显示 0不显示
	void SetData(data1,time,cut)
	{
		m_Content = data1;
		if (cut == 1)//显示倒计时
		{
			//m_Second = toint(time)/1000;//单位-秒
			//s_Text.SetData(m_Content,"  最长等待:"+m_Second+"秒。","");
			s_Text.SetData(data1,"","");
		}
		else
		{
			s_Text.SetData(data1,"","");
			delaydel(time);
		}
	}
	//显示倒计时函数
	void CutTime()
	{
		if (m_Second >= 0)
		{
			printf("B# CutTime:"+m_Second);
			s_Text.SetData(m_Content,m_Second,"");
			m_Second -= 1;
			killtimer("CutTime_Name");
			timer(1000,"CutTime","CutTime_Name");
		}
	}
};