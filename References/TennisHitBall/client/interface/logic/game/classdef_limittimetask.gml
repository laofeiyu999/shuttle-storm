//时限任务的时间条
//夏洋洋 2010-3-18

importex("$./../../UI/Game/ClassDef_LimitTimeTask.gml");

class VGame_LimitTimeTaskFlag_Logic item
{
	void Init()
	{
		staticvar _num_hour = new VN2NumShow
		{}
		staticvar _num_min = new VN2NumShow
		{}
		staticvar _num_sec = new VN2NumShow
		{}
	}
	inclass("VGame_LimitTimeTaskFlag_UI");
	Init();
}