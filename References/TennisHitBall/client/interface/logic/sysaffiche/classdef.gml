//
//系统公告的提示逻辑类定义
//
importex("$./../../UI/SysAffiche/ClassDef.gml");

class VSysAffiche item
{
	size = "616,86";valign(25,0);halign(50,0);bgcolor = "#FF";
	
	void Init()
	{
		staticvar s_Text = new VMyText
		{
			font = "宋体,-1,20";color = "#FFFFFF";
			size = "600,70";pos = "8,8";
			autoenter = true;ycenter = true;
		}
	}

	inclass("VSysAffiche_UI");//界面显示类
	
	Init();

	//=====================================================================
	void SetData(data)
	{
		printf("B# [公告]:显示;"+data);
		s_Text.SetData(data);
	}

	void SetTextColor(_color)
	{
		s_Text.color = ""+_color;
	}
};