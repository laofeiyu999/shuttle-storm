//fps=100;

new img3d{};

bgcolor="#123456";

mainDevice.TexturePath(0,"$./海鸥");
mainDevice.TexturePath(1,"$./../User/A001");

var act = "$./海鸥/daiji-01.v3act"

class mymodel skinmodel
{
//	Skeleton="$./海鸥/zou.v3ske";

	Skincount = 1;
	setSkin(0,"$./海鸥/haiou.v3s");
	
//	Action=window.act;
//	BlendDuration = 0.2f;
//	ActBlend = true;
//	CustomColor = 0x7FFFFFFF;
//
//	AniCtrl.Loopes = 10000;
//	AniCtrl.Start();
//
//	setShader("default.fx",0);
//	void OnAniLoopsEnd()
//	{
//		Action=window.act;
//		BlendDuration = 0.2;
//
//		AniCtrl.Start();
//	}
};

class mymodel1 skinmodel
{
//	Skeleton="$./海鸥/zou.v3ske";

	Skincount = 1;
	setSkin(0,"$./../User/A001/skin/A01S00L00F00P03X000.v3s");
	
//	Action=window.act;
//	BlendDuration = 0.2f;
//	ActBlend = true;
//	CustomColor = 0x7FFFFFFF;
//
//	AniCtrl.Loopes = 10000;
//	AniCtrl.Start();
//
//	setShader("default.fx",0);
//	void OnAniLoopsEnd()
//	{
//		Action=window.act;
//		BlendDuration = 0.2;
//
//		AniCtrl.Start();
//	}
};

var s = new scene
{
	camera.src="keyboard";

	var s = new skinmodel{};
	s.Skeleton="$./海鸥/zou.v3ske"
	s.Skincount = 1;
	s.setSkin(0,"$./海鸥/haiou.v3s");
//	var m = new mymodel;
//	m.pos = "1.0,0.0,8";
};
