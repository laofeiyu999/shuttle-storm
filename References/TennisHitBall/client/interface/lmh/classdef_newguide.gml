//
//引导的全屏遮罩(新的强制引导)
//2010年9月15日 yxf

class VGuideCapture_New item
{
	name = "VGuideCapture_New_Name";
	size = "100%,100%";capturemouse = true;//bgcolor = -1;alpha = 0;
	new VGame_BtnLayer_Top_Logic{}
	
	//多余蛋糕容器
	new item
	{
		name = "Name_OtherCakeContainer";size = "100%,100%";
		
		void Run(obj)
		{
			delallchild();
			var _res = window.PartCake("",obj);
			window.CreateOtherPartCake(this,_res,"#000000",30);
		}
	}

	//亮块
	var m_btn = new item
	{
		cursor = window.CURSOR_HAND;
		var m_Fun;

		void SetParam(param)
		{
			var _arr = window.SplitStr2(param,",",4);
			size( toint(_arr[0]), toint(_arr[1]) );
			pos( toint(_arr[2]), toint(_arr[3]) );

			parent.m_btnframe.pos(left-2,top-2);
			parent.m_btnframe.SetSize(width+3,height+3);
		}
	}
	
	//亮块线框s
	var m_btnframe = new VPic9_GuideFrame_UI
	{
	}

	//箭头
	var m_arrowimg = new img
	{
		void SetParam(_src,param,speed,_pos)
		{
			src = "$./../UI/PublicImage/Guide/"+_src;
			pos = ""+_pos;

			var _arr = window.SplitStr2(param,",",4);
			clipani(toint(_arr[0]), toint(_arr[1]), toint(_arr[2]), toint(_arr[3]));
			anispeed = speed;
		}
	}

	//说明文字图片
	var m_textimg = new img
	{
		void SetParam(_src,_pos)
		{
			src = "$./../UI/PublicImage/Guide/"+_src;
			pos = ""+_pos;
		}
	}

	
	//[功能]初始化
	//[参数]btnname：按钮的名字-字符串 如"btn_name"
	void Init(btnname)
	{
		printf("B# VGuideCapture_New-Init():btnname:"+btnname);
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.UIGUIDEEX,window.GAMEUI_UIGUIDEEX_BTNNANE,btnname);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VGuideCapture_New-Init():未找到记录！DBname:"+window.GAMEUI+",TBName:"+window.UIGUIDEEX+",btnname:"+btnname);
			del();
			return;
		}

		var _type = _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_TYPE);
		if(_type.__Long__ != 2)
		{
			_VNet2DBRow.del();
			printf("B# error-VGuideCapture_New-Init():错误的类型！:"+_type);
			del();
			return;
		}
		
		var _clickevent			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_CLICKEVENT);
		var _btnclicktype		= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_BTNCLICKTYPE);	//0不区分左右键和单双击 1左键单击 2左键双击 3右键单击 4右键双击
		var _arrowsrc			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWSRC);
		var _arrowparam			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWPARAM);
		var _arrowanispeed		= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWANISPEED);
		var _textimgsrc			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_TEXTIMGSRC);
		var _exdata				= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_EXDATA);

		var _textimgparam		= 0;
		var _btnparam	= 0;
		var _arrowpos	= 0;
		var _temp= window.find("CDisplaySet").GetDisplaySet(0);
		var _display = _temp/10000;
		if ( _display == window.RESOLUTION_MINWIDTH )
		{
			_btnparam			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_BTNPARAM);
			_arrowpos			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWPOS);
			_textimgparam		= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_TEXTIMGPARAM);
		}
		if ( _display == window.RESOLUTION_1152 )
		{
			_btnparam			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_BTNPARAM1);
			_arrowpos			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWPOS1);
			_textimgparam		= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_TEXTIMGPARAM1);
		}
		if ( _display == window.RESOLUTION_1280 )
		{
			_btnparam			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_BTNPARAM2);
			_arrowpos			= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_ARROWPOS2);
			_textimgparam		= _VNet2DBRow.GetData(window.GAMEUI_UIGUIDEEX_TEXTIMGPARAM2);
		}

		_VNet2DBRow.del();
		m_btn.SetParam(_btnparam);
		m_btn.m_Fun = _clickevent;
		m_arrowimg.SetParam(_arrowsrc,_arrowparam,_arrowanispeed,_arrowpos);
		m_textimg.SetParam(_textimgsrc,_textimgparam);
		find("Name_OtherCakeContainer").Run(m_btn);
		
		if(_exdata != "")
		{
			vml(_exdata);
			find("Name_Img_Jump").src = "$./../UI/PublicImage/Guide/jump.tga";
		}

		switch(_btnclicktype)
		{
			case 0:
				set m_btn
				{
					void OnClick()
					{
						vml(m_Fun);
						parent.del();
					}
				}
				break;
			case 1:
				set m_btn
				{
					void OnMouseDownL()
					{
						vml(m_Fun);
						parent.MouseDownL_Sound();
						parent.del();
					}
				}
				break;
			case 2:
				set m_btn
				{
					void OnLBDClick()
					{
						vml(m_Fun);parent.ClickItem_Sound();
						parent.del();
					}
				}
				break;
			case 3:
				set m_btn
				{
					void OnMouseDownR()
					{
						vml(m_Fun);
						parent.del();
					}
				}
				break;
			case 4:
				set m_btn
				{
					void OnRBDClick()
					{
						vml(m_Fun);
						parent.del();
					}
				}
				break;
			default:break;
		}
	}

	void MouseDownL_Sound(){window.PlaySound(114);}
	void ClickItem_Sound(){window.PlaySound(129);}//点击物品图标时的声音
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGuideCapture_New-OnCreated");//不激活
		printf("B# VGuideCapture_New-OnCreated()");
		//window.SetForceGuideState(1);
	}

	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VGuideCapture_New-OnDelete");//能激活
		printf("B# VGuideCapture_New-OnDelete()");
		//window.SetForceGuideState(0);
	}
};