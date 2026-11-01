// 安全组件
new Security
{
	name = "Security";

	// 需排除进程, 进程名为进程管理器中所见
	AddExcludeProcess("按键精灵.exe");
	AddExcludeProcess("按键精灵1.exe");
	AddExcludeProcess("按键精灵2.exe");
	AddExcludeProcess("按键精灵3.exe");
	AddExcludeProcess("按键精灵4.exe");
	AddExcludeProcess("按键精灵5.exe");
	AddExcludeProcess("按键精灵6.exe");
	AddExcludeProcess("按键精灵7.exe");
	AddExcludeProcess("按键精灵8.exe"); //按键精灵
	AddExcludeProcess("Knight.exe");
	AddExcludeProcess("KnightV.exe"); //金山游侠
	AddExcludeProcess("GearNT.exe"); //变速齿轮
	AddExcludeProcess("WNmore.exe"); //万能内存修改器
	AddExcludeProcess("MemoryAlter.exe"); //图特内存修改器
	AddExcludeProcess("FPE.exe"); //FPE2001
	AddExcludeProcess("SpeedGame.exe")//speedgame

	// 是否开启进程检查
	EnableCheckExcludeProcess( 1);

	// 发现不法进城后调用
	void CallBack_FoundExcludeProcess( excludeProcess)
	{
		window.TrainingToHall();
		window.HallToChannelChoose();
		window.ChannelChooseToLogin();
		window.GameToHall();
		window.find("UIController").LoadDLG(816);
	}

	// 初始化静态内存列表
	InitStaticMemList();
}