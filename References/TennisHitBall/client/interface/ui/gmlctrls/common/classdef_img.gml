
//游戏中-谁发球就有一个图片标识
class VWhoServe_UI img3d
{
	src = "$./../../Game/imgs/Serve.tga";
};

//性别显示类
class VSex_UI img
{
	//font = "宋体,-1,12";//color = "#0";ycenter = true;
	size = "27,27";
	void SetData(data)
	{
		//src = "?"
		if (data == 1){src = "$./../../SelfInfo/imgs"+window.g_Sex+"/boy.tga";}
		if (data == 2){src = "$./../../SelfInfo/imgs"+window.g_Sex+"/girl.tga";}
	}
};
//bgcolor = "#FFFFFF";
//new VWhoServe_UI{}