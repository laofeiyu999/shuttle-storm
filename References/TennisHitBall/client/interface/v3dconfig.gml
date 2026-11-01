//STOPAUTOLOADDLL();
//onlysystemwnd();

var _custui = new item
{
	class  myDebugPage DebugPage
	{
		src="V3DCore调试设置";

		var _sx		=10;
		var _sy		=10;
		var _szw	=200;
		var _szh	=20;
		var _dev	= window.mainDevice;

		var _loadtex		= _dev.dbgLoadTex;
		var _show2DTxt		= _dev.dbgShow2DText;
		var _show3DTxt		= _dev.dbgShow3DText;
		var _showParticle	= _dev.dbgShowParticle;
		var _showSModel		= _dev.dbgShowSModel;
		var _showFModel		= _dev.dbgShowFModel;
		var _showTreeModel	= _dev.dbgShowTreeModel;
		var _LoadAction		= _dev.dbgLoadAction;
		var _UpdateAction	= _dev.dbgUpdateAction;
		var _maxpartocc		= _dev.dbgMaxParticleOcc;

		void UpdateV3DConfig()
		{
			_dev.dbgLoadTex			= _loadtex		; 
			_dev.dbgShow2DText		= _show2DTxt	; 
			_dev.dbgShow3DText		= _show3DTxt	; 
			_dev.dbgShowParticle	= _showParticle	;
			_dev.dbgShowSModel		= _showSModel	; 
			_dev.dbgShowFModel		= _showFModel	; 
			_dev.dbgShowTreeModel	= _showTreeModel;
			_dev.dbgLoadAction		= _LoadAction	; 
			_dev.dbgUpdateAction	= _UpdateAction	;
			_dev.dbgMaxParticleOcc	= _maxpartocc;
		}
	
		void UpdateLrcConfig()
		{
			window._lrccnfg.DisableHitRule = _hitrule;
			window._lrccnfg.DisableHitEffect = _createeff;
		}

		class mscheckbox WndDlgItem
		{
			buttonstyle="checkbox";
			SetWndAutoRect(parent._sx,parent._sy,parent._szw,parent._szh);
			//SetWndAutoRect(10,200,100,20);
			parent._sy+=22;
		}

		class msedit WndDlgItem
		{
			buttonstyle="edit";
			SetWndAutoRect(parent._sx,parent._sy,parent._szw,parent._szh);
			parent._sy+=22;
		}

		class msbutton WndDlgItem
		{
			buttonstyle="button";
			SetWndAutoRect(parent._sx,parent._sy,parent._szw,parent._szh);
			parent._sy+=22;
		}

		new mscheckbox
		{
			src="加载贴图"
			SetCheck(parent._loadtex);
			void OnClick(){	parent._loadtex = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示2D文字"
			SetCheck(parent._show2DTxt);
			void OnClick(){	parent._show2DTxt = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示3D文字"
			SetCheck(parent._show3DTxt);
			void OnClick(){	parent._show3DTxt = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示粒子"
			SetCheck(parent._showParticle);
			void OnClick(){	parent._showParticle = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示人物"
			SetCheck(parent._showSModel);
			void OnClick(){	parent._showSModel = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示静态模型"
			SetCheck(parent._showFModel);
			void OnClick(){	parent._showFModel = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="显示组合模型"
			SetCheck(parent._showTreeModel);
			void OnClick(){	parent._showTreeModel = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="更新动作"
			SetCheck(parent._UpdateAction);
			void OnClick(){	parent._UpdateAction = GetCheck(true); parent.UpdateV3DConfig();	}
		}
		new mscheckbox
		{
			src="动作插值"
			SetCheck(parent._dev.dbgSlerpAction );
			void OnClick(){	parent._dev.dbgSlerpAction = GetCheck(true); }
		}

		var _maxpartoccedit = new msedit
		{
			src=parent._maxpartocc;
		}

		new msbutton
		{
			src="最大粒子浓度";
			void OnClick()
			{
				parent._maxpartocc = parent._maxpartoccedit.src;
				parent.UpdateV3DConfig();
			}
		}
		new msedit
		{
			src="当前粒子浓度：OnUpdate关闭";
			void OnUpdate_bak()
			{
				src=window.mainDevice.perfPartOcc;
			}
		}
		new mscheckbox{
			src="显示界面"
			SetCheck(parent._dev.dbgShowUI );
			void OnClick(){	parent._dev.dbgShowUI = GetCheck(true); }
		}
		new msedit
		{
			src="UITexNum: OnUpdate关闭";
			void OnUpdate_bak()
			{
				src="UITexNum:"+parent._dev.UITexNum;
			}
		}
		new msedit
		{
			src="UITexNum: OnUpdate关闭";
			void OnUpdate_bak()
			{
				src="UITexNum:"+parent._dev.UpdateUITexNum;
			}
		}
		new mscheckbox{
			src="保存界面贴图"
			SetCheck(parent._dev.SaveUITex );
			void OnClick(){	parent._dev.SaveUITex = GetCheck(true); }
		}

	}

	void CreateCUI()
	{
		new myDebugPage{}
	}
}

void OnDebugWndCreated()
{
	_custui.CreateCUI();
	//new myDebugPage;
}

