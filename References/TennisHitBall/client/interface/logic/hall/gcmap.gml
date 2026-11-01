//大厅的GCMap 

var _GCMap=new GCMap
{
	name="HALLGCMap";
	group=1;
	
	if (window.g_HallIoType == 0)
	{
		//io
		staticvar _HallIO = new VHall_Socket_Logic{}
	}
	if (window.g_HallIoType == 1)
	{
		//io
		staticvar _HallIO = new VHall_Socket_Domain_Logic{}
	}
	

	void RoomInit(roomdeskcount)
	{
		//明星榜-发消息：界面调用(这里废弃的原因是太晚了2009年6月3日)
		//参数 index：排名方式(0-11),长度-要几条记录（小于0表示所有数据）
		//window.Too_GetSortData(3,-1);
	}
}

var _GCMap1=new GCMap
{
	name="ArenaGCMap";
	group=1;
	//io
	//var _ArenaIO = new VArena_Socket_Logic{}
}