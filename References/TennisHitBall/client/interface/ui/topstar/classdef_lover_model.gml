//情侣排行榜点击出来的模型

//class VTS_Lover_Model item
//{
//	size = "300,350";//bgcolor = "#FF";
//	name = "Name_VTS_Lover_Model";
//	
//	//鼠标悬停背景
//	var _hangBK = new VPic9_HandWnd_UI
//	{
//		SetSize(300,350);
//	}
//
//	//==========================快捷键===================================
//	window.find("gameinput").AddExclusiveShortcutUser(this);
//	void OnDelete()
//	{
//		window.g_MouseROnly = false;
//		window.find("gameinput").DelShortcutUser(this);
//	}
//	void DI_ShortcutKey(data)
//	{
//		switch (data)
//		{
//			case 3: //Esc
//			{
//				del();break;
//			}
//		}
//	}
//	//===============================================================
//	movetocursor(1,1);//size = "100,180";
//	setFocus = "true";capturemouse="true";
//
//	void OnLostFocus()
//	{
//		if (updatecount>1)
//			del();
//		else 
//			setFocus = "true";
//	}
//	void OnMouseDownL(){del();}
//
//	var _woman = new VUIModelShow{}
//	var _man = new VUIModelShow{halign(100,0);}
//
//	void SetData(data1,data2)
//	{
//		_woman.Init(window.USER_SEX_WOMAN,"-0.40,1.50,0.3");
//		var _a1 = window.SplitStr2(data1,",");
//		_woman.ShowRole(_a1[0],_a1[1],_a1[2],_a1[3],_a1[4],_a1[5],_a1[6],_a1[7],_a1[8],_a1[9],_a1[10],_a1[11],_a1[12]);
//
//		_man.Init(window.USER_SEX_MAN,"0.25,1.50,0.5");
//		var _a2 = window.SplitStr2(data2,",");
//		_man.ShowRole(_a2[0],_a2[1],_a2[2],_a2[3],_a2[4],_a2[5],_a2[6],_a2[7],_a2[8],_a2[9],_a2[10],_a2[11],_a2[12]);
//	}
//};

//情侣排行榜 情侣形象展示窗

class VTS_LoverModel_Wnd VUIBG_UI
{
	size = "0%,0%";
	size="300,493";pos="640,75";
	bgcolor=-1;
	alpha=50;
	void Init()
	{
		InitBG("");
		InitClose();		// new个X关闭钮
		InitBtnBG();		// 按钮框
		
		new img{size="267,450";pos = "15,28";src="$./imgs"+window.g_Sex+"/bk.tga";}
		
		staticvar s_LovModel = new item
		{
			size = "225,450";pos = "0,0";//bgcolor = "#FF";
			var _man = new VUIModelShow{halign(120,0);}
			var _woman = new VUIModelShow{}
			
			void SetData(data1,data2)
			{
					pos = "35,50";
					if ( data1!="" && data2!="" )
						window.POS_PROBABLY_TSLovMod = 1;
					else
						window.POS_PROBABLY_TSLovMod = 0;					
					_woman.Init(window.USER_SEX_WOMAN,"-0.10,1.45,0.4");
					var _a1 = window.SplitStr2(data1,",");
					_woman.ShowRole(_a1[0],_a1[1],_a1[2],_a1[3],_a1[4],_a1[5],_a1[6],_a1[7],_a1[8],_a1[9],_a1[10],_a1[11],_a1[12],_a1[13]);

					_man.Init(window.USER_SEX_MAN,"-0.31,1.50,0.3");
					var _a2 = window.SplitStr2(data2,",");
					_man.ShowRole(_a2[0],_a2[1],_a2[2],_a2[3],_a2[4],_a2[5],_a2[6],_a2[7],_a2[8],_a2[9],_a2[10],_a2[11],_a2[12],_a2[13]);
			}
		}
	}
};