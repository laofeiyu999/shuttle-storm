//
//引导的全屏遮罩
//

class VGuideCapture item
{
	name = "VGuideCapture_Name";
	size = "100%,100%";bgcolor = -1;alpha = 0;capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	
	//[功能]生成一个按钮
	//[参数]btnname：按钮的名字-字符串 如"btn_name"
	void NewBtn(btnname)
	{
		printf("B# VGuideCapture-NewBtn():btnname:"+btnname);
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.UIGUIDEEX,window.GAMEUI_UIGUIDEEX_BTNNANE,btnname);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VGuideCapture-NewBtn():DBname:"+window.GAMEUI+",TBName:"+window.UIGUIDEEX);
			del();
			return;
		}
		var _layer = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_LAYER);
		var _clickevent = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_CLICKEVENT);
		printf("B# VGuideCapture-NewBtn():_layer:"+_layer);
		printf("B# VGuideCapture-NewBtn():_clickevent:"+_clickevent);
		_VNet2DBRow.del();

		new item
		{
			cursor = window.CURSOR_HAND;
			var _BtnName = btnname;
			var m_SizeX = window.find(btnname).width;
			var m_SizeY = window.find(btnname).height;
			if (m_SizeX == 0 || m_SizeY == 0)
			{
				parent.del();
				return;
			}
			var m_Fun = _clickevent;
			var m_PosX = 0;
			var m_PosY = 0;
			var m_Layer = toint(_layer);
			if (m_Layer == -1 || m_Layer >= 5)
			{
				m_PosX = window.find(btnname).parent.parent.parent.parent.parent.left.__Long__ 
					+ window.find(btnname).parent.parent.parent.parent.left.__Long__ 
					+ window.find(btnname).parent.parent.parent.left.__Long__
					+ window.find(btnname).parent.parent.left.__Long__
					+ window.find(btnname).parent.left.__Long__
					+ window.find(btnname).left.__Long__;

				m_PosY = window.find(btnname).parent.parent.parent.parent.parent.top.__Long__ 
					+ window.find(btnname).parent.parent.parent.parent.top.__Long__
					+ window.find(btnname).parent.parent.parent.top.__Long__
					+ window.find(btnname).parent.parent.top.__Long__
					+ window.find(btnname).parent.top.__Long__
					+ window.find(btnname).top.__Long__;
			}
			else
			{
				//alert("-1:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				if (m_Layer == 4)
				{
					m_PosX += window.find(btnname).parent.parent.parent.parent.left.__Long__;
					m_PosY += window.find(btnname).parent.parent.parent.parent.top.__Long__;
					m_Layer -= 1;
					//alert("4:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				}
				if (m_Layer == 3)
				{
					m_PosX += window.find(btnname).parent.parent.parent.left.__Long__;
					m_PosY += window.find(btnname).parent.parent.parent.top.__Long__;
					m_Layer -= 1;
					//alert("3:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				}
				if (m_Layer == 2)
				{
					m_PosX += window.find(btnname).parent.parent.left.__Long__;
					m_PosY += window.find(btnname).parent.parent.top.__Long__;
					m_Layer -= 1;
					//alert("2:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				}
				if (m_Layer == 1)
				{
					m_PosX += window.find(btnname).parent.left.__Long__;
					m_PosY += window.find(btnname).parent.top.__Long__;
					m_Layer -= 1;
					//alert("1:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				}
				if (m_Layer == 0)
				{
					m_PosX += window.find(btnname).left.__Long__;
					m_PosY += window.find(btnname).top.__Long__;
					//alert("0:"+m_Layer+",X:"+m_PosX+",Y:"+m_PosY);
				}
			}
			
			//printf("B# VGuideCapture-NewBtn():btnname:"+btnname+",PosX:"+m_PosX+",PosY:"+m_PosY);
			//printf("B# VGuideCapture-NewBtn():btnname:"+btnname+",SizeX:"+m_SizeX+",SizeY:"+m_SizeY);

			pos(m_PosX,m_PosY);
			size(m_SizeX,m_SizeY);
			bgcolor = -1;alpha = 0;

			void OnMouseDownL()
			{
				printf("B# VGuideCapture-NewBtn():m_Fun:"+m_Fun);
				vml(m_Fun);
				//此处注释原因：会导致Radio选不中 2009年12月9日 yxf
				//window.LMH1_SetBtnFlash(_BtnName,false);
				parent.del();
			}
		}
	}

	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGuideCapture-OnCreated");//不激活
		printf("B# VGuideCapture-OnCreated()");
	}

	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VGuideCapture-OnDelete");//能激活
		printf("B# VGuideCapture-OnDelete()");
	}
};