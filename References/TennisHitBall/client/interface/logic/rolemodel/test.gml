
import("$./../../Const.gml");
import("$./../Init.gml");
//importex("$./ClassDef_Model.gml");
//importex("$./ClassDef_ModelMgr.gml");

//size = "1024,768";
wndsize = "1024,768";
bgcolor = "#123456";
//drag = "window";
window.autouiscale=true;

new img
{
//	src = "$./9-商城.jpg";
}

new text
{
	src = "生成";color = "#FFFFFF";

	void OnMouseDownL()
	{
		set window
		{
			new VModelMgr_Logic
			{
				name = "VModelMgr";
				InitModel(window.MODEL_INIT_CREATEROLE);
				SwitchSex(1);
			}
		}
	}
}


new text
{
	src = "删除";pos = "0,30";color = "#FFFFFF";

	void OnMouseDownL()
	{
		window.find("VModelMgr").del();
	}
}

new text
{
	src = "男角色";pos = "0,60";color = "#FFFFFF";

	void OnMouseDownL()
	{
		window.find("VModelMgr").SwitchSex(1);
	}
}

new text
{
	src = "女角色";pos = "0,90";color = "#FFFFFF";

	void OnMouseDownL()
	{
		window.find("VModelMgr").SwitchSex(2);
	}
}