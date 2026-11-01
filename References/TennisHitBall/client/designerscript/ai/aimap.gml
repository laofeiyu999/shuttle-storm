import("$./AImapClass.gml");

//这段非yxf添加，详情咨询hfz
set window.find("GAMELAYER")
{
	// modify by hanshuo   10.29.2009 把这类单独整成个类, 方便后面的功能继承
	
	var _GCMap = new AIGCMap
	{	
		
	}//end GCMap

	_GCMap.InitAIGame( 1);

	//用来实现镜头切换的东西-yxf
	var _ImgSaver = new StaticImage
	{
		size="100%,100%";
		Fov("0.55");		// 8.26 韩硕,修正截图与屏幕不符的问题
	};
	var _Img3D = new img3d
	{
		src = parent._ImgSaver.UITexture;
		capturemouse=true;
		visible = false;
		size="100%,100%";
		zindex = "top";
		
		//显示与否
		void SetVisible(param)
		{
			visible = param;
			if (param)
			{
				printf("B# 显示镜头切换效果！");
				setParamTimer("alpha",0,100,window._Time_SaveScreen,0,"ShowEnd");
			}
		}
		
		//显示结束后，通知何方志帅或者不帅的动作播完了2008年8月27日19:37
		void ShowEnd()
		{
			visible = false;
			//printf("B# 切屏特效显示结束后，通知何方志帅或者不帅的动作播完了\n");
			//window.find("GameInterface").ShowOver_HAction();//帅或者普通动作结束了
		}
	}

	GameEvent_ReadyServe();//接发球提示特效SXD
	GameEvent_ServeOver(); //删除接发球特效SXD
}