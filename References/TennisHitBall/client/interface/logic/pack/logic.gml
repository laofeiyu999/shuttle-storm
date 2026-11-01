//背包 Logic+UI
//yxf 2008年9月16日9:23

importex("$./ClassDef.gml");
import("$./ClassDef_MsgBox.gml");

new item
{
	size = "100%,100%";name = "PACK_LOGIC";enableUpdate(1);//capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	var _LastPos = window.GetUIPos();	//记住上次的位置
	window.SetUIPos(window.POS_PACK);
	//==========================快捷键==================================
	void OnCreated()
	{
		window.g_WantToOpenPack = false;
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetPackOpenState(true);
		window.LMH1_PackCreated();//引导事件
		
		//is mall open?
		if (window.IsHallHtnOpened(window.G_HALLBTN_MALL))
		{
			window.find("MALL_LOGIC").ClickSexRadio(window.GetMySex());
		}

		zindex = "top";
	}
	void OnDelete()
	{	
		window.g_WantToOpenPack = false;
		window.find("gameinput").DelShortcutUser(this);
		window.SetPackOpenState(false);
		window.SetUIPos(_LastPos);	//将上次的位置设置回去
		window.LMH1_PackDel();//引导事件
	}
	void DI_ShortcutKey(data)
	{
		if (window.GetForceGuideState() == 1) 
		{
			printf("A# 变态-PACK_LOGIC强制引导中。。。。");
			return;//强制引导中
		}
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
		}
	}
	//==================================================================
	var _VPack_Logic = new VPack_Logic{}
}