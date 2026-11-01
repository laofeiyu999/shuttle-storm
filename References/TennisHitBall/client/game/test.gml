bgcolor = "#444444";
import("$./../../mdb/dbdef.gml");
var a = new scene
{
  	var b = new V3Action
	{
		name="Action"; 
		SetUserPath="$./../../client/user/"; 
		SETBODYID(2);
		pos = "0, 0, -1";
	};

	camera.src="keyboard";
	camera.pos = "0, 2, -6";
	camera.dir = "0, -0.35, 1";
	camera.up = "0, 1, 0";
	Fov("0.55");
}

new item
{
	bgcolor = "#aaaaaa";
	size = "50, 50";
	pos = "20, 20";

	void OnClick()
	{
		window.a.b.Act(4);
	}
}

<END>
PauseMsg(1000);				通过测试
AniSpeedMsg( 0.5, 1000);	通过测试
AniSpeedMsg2( 500, 1000);	对参数不太理解, 没有通过测试
ActMsg(4, 2000);			通过测试
SETBODYID(2);				通过测试
Act(4);						通过测试
ChgParts();					脚本接口有乱舞代码, 参数传入方式也需要变, 就没改, 程序接口没有问题