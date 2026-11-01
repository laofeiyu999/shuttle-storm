//游戏设置的类显示定义

//总的类：包含了 按键，显示，声音
class VGameSetUp_UI VUIBG_UI
{
	size = "350, 462";bgcolor = -1;alpha = -1;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/yxsz-bt-text.tga");
		InitClose();
		InitBtnBG();

		//按键：Radio
		staticvar s_R_Key = new VRadio_BK_UI{pos = "20, 43";InitText("按键");}
		//显示：Radio
		staticvar s_R_Display = new VRadio_BK_UI{pos = "81, 43";InitText("显示");}
		//声音：Radio
		staticvar s_R_Sound = new VRadio_BK_UI{pos = "142, 43";InitText("声音");}
		//其它：Radio
		staticvar s_R_Other = new VRadio_BK_UI{pos = "203, 43";InitText("其它");}
		//快捷发言
		staticvar s_R_ShotcutChat = new VRadio_BK_UI{pos = "264, 43";InitText("快捷发言");}

		//恢复默认：按钮
		staticvar s_Btn_Default = new VBTN_A_New{pos="30,"+(parent.height-window.G_POP_BTN_POSY);InitText("恢复默认");}
		//保存：按钮
		staticvar s_Btn_Save = new VBTN_A_New{pos=""+(parent.width-width)/2+","+(parent.height-window.G_POP_BTN_POSY);InitText("保存设置");}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New{pos=""+(parent.width-110)+","+(parent.height-window.G_POP_BTN_POSY);InitText("取消");}
	}
	void SetAlpha()
	{
		setParamTimer("alpha",100,50,500,0);
	}
	void OnDragFunc()
	{
		s_Class_DisPlay.OnDragFunc();
		s_Class_Sound.OnDragFunc();
	}
}