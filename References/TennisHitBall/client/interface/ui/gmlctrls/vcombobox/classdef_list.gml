//
//组合框 Combo Box - 数据来自List
//yxf 2009年10月25日

//偷懒了
class VComboxBase2 item
{
	capturemouse = false;//bgcolor = "#FF";
	var m_BgOverState = 0;//0：非over  1：over

	//默认文本背景
	//var m_DefaultText_BK = new item{bgcolor = "#cdcfce";size = "100%,18";}
	
	//默认名字
	var s_DefaultText = new BKText{size = "90%,18";xcenter = true;ycenter = true;}

	//三角按钮
	var m_btn = new VBTN_DropSmall_New
	{
		halign(100,0);
		void OnPressed()
		{
			if (GetState() == window.BTN_STATE_GREY)
			{
				return;
			}
			if(parent.m_BgItem._ShowState)
			{
				parent.m_BgItem.SetShow(false);
				parent.m_DBList.DelBind();
			}
			else
			{
				parent.m_BgItem.SetShow(true);
				parent.m_DBList.AddBind();
			}
		}
	}
		
	//下拉框背景
	var m_BgItem = new item
	{
		pos(0,19);bgcolor = "#0";alpha = 70;show = false;
		var _ShowState = false;//记录显示状态
		void SetShow(param)
		{
			parent.capturemouse = param;
			//capturemouse = param;
			_ShowState = param;
			show = param;
			parent.m_DBList.show = param;
		}

		void OnMouseOver()
		{
			parent.m_BgOverState = 1;
		}
		void OnMouseOut()
		{
			parent.m_BgOverState = 0;
		}
	}

	//失去焦点隐藏下拉菜单
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(m_BgOverState == 0)
			{
				window.find("VGameSetUp_ResolutionList_Logic_NAME").SetShow(false);
				m_BgItem.SetShow(false);
			}
			else
			{
				setFocus="true";
			}
		}
	}
	//interface===============================================================
	//设置大小
	void SetSize(_width,_height)
	{
		size(_width,_height);
		m_DBList.size(_width+3,_height-20);
		m_BgItem.size(_width,_height-19);
		m_DefaultText_BK.size = "100%,18";
		s_DefaultText.size = "87%,18";
	}

	//设置默认的昵称
	void SetDefaultText(_str)
	{
		s_DefaultText.src = _str;
	}
	
	//得到选择的昵称
	void GetText(){return s_DefaultText.src;}
	
	//按钮灰
	void SetState(state)
	{
		m_btn.SetState(state);
	}

	//CallBack
	void OnCreated()
	{
		staticvar m_DBList = GetList();

		OnMyCreated();
	}
};

//分辨率
class VCombox_Resolution_UI VComboxBase2
{
	void GetList()
	{
		var _DBList = new VGameSetUp_ResolutionList_Logic
		{
			name = "VGameSetUp_ResolutionList_Logic_NAME";show=false;
		
			void OnDelete(){DelBind();}
			
			void OnMouseDownL(){parent.m_BgItem.SetShow(false);DelBind();}

			void DelBind(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}

			void AddBind()
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.RESOLUTION,"Bind_VGameSetUp_ResolutionList_Logic");

				var _SQL = "SELECT * FROM "+window.RESOLUTION;
				printf("B# VCombox_Resolution_UI:_SQL:"+_SQL);
				window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VGameSetUp_ResolutionList_Logic",window.GAMEUI,_SQL);
				m_dropmenu_bk.SetSize(currowcount());
			}
			//设置菜单的显示状态
			void SetShow(_bool)
			{
				show = _bool;
				if (_bool)
				{
					AddBind();
				}
				else
				{
					DelBind();
				}
			}
		}
		return _DBList;
	}
};

class VCombox_BgMusic_UI_Ex item
{
	var m_DropMenuId = 0;
	var m_OverState = 0;//0：非over  1：over

	//默认文本背景
	//var m_DefaultText_BK = new item{bgcolor = "#cdcfce";}

	//默认的文本
	var m_DefaultText = new BKText
	{
		ycenter = true; xcenter = true;
		void SetData(data)
		{
			size(data-10,18);
			parent.m_DefaultText_BK.size(data,18);
		}
		void SetSrc(data){src = data;}
		void SetPos(_x,_y){pos(_x,_y);}
	}

	var m_isListShow = false;
	//三角按钮
	var m_btn = new VBTN_DropSmall_New
	{
		void OnPressed()
		{
			if (GetState() == window.BTN_STATE_LIGHT) 
			{
				if(window.find("VGameSetUp_MusicList_"+parent.m_DropMenuId).GetShow())
				{
					parent.SetMyHide(false);
				}
				else
				{
					parent.SetMyHide(true);
				}
			}
		}
		void SetData(data){pos(toint(data)-20,0);}
		void LogicMouseOverFunc()
		{
			parent.m_OverState = 1;
		}
		void LogicMouseOutFunc()
		{
			parent.m_OverState = 0;
		}
	}

//	//失去焦点隐藏下拉菜单
//	void OnLostFocus()
//	{
//		if (updatecount>1)
//		{
//			if(m_OverState == 0)
//			{
//				window.find("VGameSetUp_MusicList_"+m_DropMenuId).SetShow(false);
//				m_isListShow = false;
//			}
//			else
//			{
//				setFocus="true";
//			}
//		}
//	}

	//删除下拉菜单对象
	void OnDelete()
	{
		window.find("VGameSetUp_MusicList_"+m_DropMenuId).del();
	}
	
	//[功能]显示隐藏
	//[参数]param:true false
	void SetMyHide(param)
	{
		if (param)
		{
			ShowGroupHide();
		}
		window.find("VGameSetUp_MusicList_"+m_DropMenuId).SetShow(param);
		m_isListShow = param;
	}

	//[功能]设置音乐SQL区间和ID
	//[参数]_id;name使用
	//		_type1:左区间
	//		_type2:右区间
	void SetID(_id,_type1,_type2)
	{
		printf("_id:"+_id+",_type1:"+_type1+",_type2:"+_type2);
		name = "ComBoxList_"+_id;
		m_DropMenuId = _id;
		set window
		{
			new VGameSetUp_MusicList_Logic
			{
				var m_ListName = _id;

				var m_Type1 =  _type1;	//类型左区间 1登录 2大厅 3游戏
				var m_Type2 =  _type2;	//类型左区间 1登录 2大厅 3游

				name = "VGameSetUp_MusicList_"+m_ListName;//show=false;
			
				void OnDelete(){DelBind();}
				
				void OnMouseDownL(){parent.m_BgItem.SetShow(false);DelBind();}

				void DelBind(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}

				void AddBind()
				{
					window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.SOUND_REGISTER,"Bind_VGameSetUp_MusicList_Logic"+m_ListName);
					
					var _SQL = "SELECT * FROM "+window.SOUND_REGISTER+" WHERE type>="+m_Type1+" AND type<="+m_Type2;
					printf("B# VCombox_BgMusic_UI:_SQL:"+_SQL);
					window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VGameSetUp_MusicList_Logic"+m_ListName,window.GAMEUI,_SQL);
					m_dropmenu_bk.SetSize(currowcount());
				}

				var m_isShow = false;//记录是否显示
				//设置菜单的显示状态
				void SetShow(_bool)
				{
					m_isShow = _bool;
					show = _bool;
					if (m_isShow)
					{
						AddBind();
					}
					else
					{
						DelBind();
					}
				}

				//获得菜单的显示状态
				void GetShow(){return m_isShow;}

				//设置pos偏移值
				void SetPosExcursion(_x,_y)
				{
					pos = "0,19";
					pos(left+_x,top+_y);
				}
			}
		}
	}

	//可以在外部调用
	//设置默认文本的数据
	void SetDefaultSrc(data){m_DefaultText.SetSrc(data);}

	//可以在外部调用
	//得到默认文本的数据
	void GetDefaultSrc(){return m_DefaultText.src;}
	
	void SetDefaultTextFont(_font){m_DefaultText.font = _font;}

	//设置大小
	void SetSize(_width,_height)
	{
		size(_width,_height);
		window.find("VGameSetUp_MusicList_"+m_DropMenuId).size(_width,_height-20);
		m_DefaultText.SetData(_width);
		m_btn.SetData(_width);
	}

	//可以在外部调用
	//设置按钮位置
	void SetBtnPos(_x,_y){m_btn.SetPos(_x,_y);}

	//需要在显示部分调整
	//设置整个菜单的位置
	void SetPos(_x,_y)
	{
		window.find("VGameSetUp_MusicList_"+m_DropMenuId).SetPosExcursion(GetOffSetX()+_x,GetOffSetY()+_y);//菜单的偏移位置
		pos(_x,_y);
	}

	void GetOffSetX()
	{
		return parent.parent.parent.left + parent.parent.left+parent.left;
	}
	void GetOffSetY()
	{
		return parent.parent.parent.top + parent.parent.top+parent.top;
	}

	//设置小三角的状态
	void SetState(state){m_btn.SetState(state);}
};

class VCombox_Friend_UI_Ex item
{
	var m_DropMenuId = 0;
	var m_isDefaultText = true;	//当前显示是否为默认值 true为默认值 false非默认值

	//默认文本背景
	var m_DefaultText_BK = new item{bgcolor = "#cdcfce";}

	//默认名字
	var m_DefaultText = new BaseText//BaseEdit
	{
		xcenter = true;ycenter = true;maxsize = 12;
		var m_bIsEdit = true;
		
//		void OnFocus()
//		{
//			parent.m_DefaultText_Temp.show = false;
//		}
		void SetData(data)
		{
			size(data-18,18);
			parent.m_DefaultText_BK.size(data,18);
			parent.m_DefaultText_Temp.size(data,18);
		}
		void SetSrc(data){src = data;}
		void SetPos(_x,_y){pos(_x,_y);}

		void OnKeyChar()
		{
			parent.OnNameChange(src);
		}

		//设置是否可以输入	夏洋洋添加于2009-12-17
		void SetIsEdit(_data)
		{
			m_bIsEdit = _data;
		}
		function OnInsertChar(c)
		{
			if(m_bIsEdit)
			{
				return true;
			}
		}
	}

	//默认名字-显示用
	var m_DefaultText_Temp = new BaseText
	{
		xcenter = true;ycenter = true;
	}

	var m_isListShow = false;
	//三角按钮
	var m_btn = new VBTN_DropSmall_New
	{
		void OnPressed()
		{
			if (GetState() == window.BTN_STATE_LIGHT) 
			{
				if(window.find("VMall_Friend_List_Logic_"+parent.m_DropMenuId).GetShow())
				{
					parent.SetMyHide(false);
				}
				else
				{
					parent.SetMyHide(true);
				}
			}
		}
		void SetData(data){pos(toint(data)-20,0);}
	}

	//删除下拉菜单对象
	void OnDelete()
	{
		window.find("VMall_Friend_List_Logic_"+m_DropMenuId).del();
	}
	
	//[功能]显示隐藏
	//[参数]param:true false
	void SetMyHide(param)
	{
		window.find("VMall_Friend_List_Logic_"+m_DropMenuId).SetShow(param);
		m_isListShow = param;
	}

	//[功能]设置好友SQL和ID
	//[参数]_id;name使用
	//		_type:1在线(默认) 2全部
	void SetID(_id,_type)
	{
		printf("_id:"+_id+",_type:"+_type);
		name = "ComBoxList_"+_id;
		m_DropMenuId = _id;
		set window
		{
			new VMall_Friend_List_Logic
			{
				var m_ListName = _id;

				var m_Type =  _type;	//SQL类型 1在线(默认) 2全部

				name = "VMall_Friend_List_Logic_"+m_ListName;show=false;

				void OnDelete(){DelBind();} 

				void OnMouseDownL(){parent.m_BgItem.SetShow(false);DelBind();}

				//移除绑定
				void DelBind(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}
				
				//获得绑定
				void AddBind()
				{
					window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VMall_Friend_List_Logic"+m_ListName);// 绑定数据表

					var _SQL = "SELECT * FROM FriendDT WHERE Relation="+window.FRIEND_FRIEND+" AND delete=0 AND State>=1 AND State<=3";
					if (m_Type == 2)
					{
						_SQL = "SELECT * FROM FriendDT WHERE Relation="+window.FRIEND_FRIEND+" AND delete=0";
					}
					
					printf("B# VCombox_Friend_UI_Ex:m_Type:"+m_Type+",_SQL:"+_SQL);
					window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_Friend_List_Logic"+m_ListName,window.M_G_SERVER,_SQL);
					m_dropmenu_bk.SetSize(currowcount());
				}

				var m_isShow = false;//记录是否显示
				//设置菜单的显示状态
				void SetShow(_bool)
				{
					m_isShow = _bool;
					show = _bool;
					if (m_isShow)
					{
						AddBind();
					}
					else
					{
						DelBind();
					}
				}

				//获得菜单的显示状态
				void GetShow(){return m_isShow;}

				//设置pos偏移值
				void SetPosExcursion(_x,_y)
				{
					pos = "0,19";
					pos(left+_x,top+_y);
				}

			}
		}

		SetDefaultTextTemp("请选择好友");
	}

	//可以在外部调用
	//设置默认文本的数据
	void SetDefaultSrc(data){SetDefaultText(data);}
	
	//设置默认的昵称-兼容
	void SetDefaultText(_str)
	{
		m_DefaultText_Temp.show = false;
		m_DefaultText.src = _str;
		m_isDefaultText = false;
		OnNameChange(_str);//2009年12月1日
	}
	void SetDefaultTextFont(_font){m_DefaultText.font = _font;}

	//设置默认-显示
	void SetDefaultTextTemp(_str)
	{
		m_DefaultText_Temp.src = _str;
	}
	//获取当前是否为默认值
	void GetIsDefaultText()
	{
		return m_isDefaultText;
	}
	
	//可以在外部调用
	//得到默认文本的数据
	void GetDefaultSrc(){return m_DefaultText.src;}
	//得到选择的昵称-兼容
	void GetText(){return GetDefaultSrc();}

	//设置大小
	void SetSize(_width,_height)
	{
		size(_width,_height);
		window.find("VMall_Friend_List_Logic_"+m_DropMenuId).size(_width,_height-20);
		m_DefaultText.SetData(_width);
		m_btn.SetData(_width);
	}

	//可以在外部调用
	//设置按钮位置
	void SetBtnPos(_x,_y){m_btn.SetPos(_x,_y);}

	//需要在显示部分调整
	//设置整个菜单的位置
	void SetPos(_x,_y)
	{
		window.find("VMall_Friend_List_Logic_"+m_DropMenuId).SetPosExcursion(GetOffSetX()+_x,GetOffSetY()+_y);//菜单的偏移位置
		pos(_x,_y);
	}

	void GetOffSetX()
	{
		return parent.parent.parent.left + parent.parent.left+parent.left;
	}
	void GetOffSetY()
	{
		return parent.parent.parent.top + parent.parent.top+parent.top;
	}

	//设置小三角的状态
	void SetState(state){m_btn.SetState(state);}

	//[功能]设置编辑框是否可输入	夏洋洋添加于2009-12-17
	//[参数]_state：true为可输入，false为不可输入
	void SetEditState(_state)
	{
		m_DefaultText.SetIsEdit(_state);
	}

	//[功能]设置过滤方式
	//[参数]type:1只显示在线 2全部显示
	//[备注]需要在点击下拉三角按钮前调用
	void SetSelectType(type)
	{
		printf("B# VMall_Friend_List_Logic_"+m_DropMenuId+",SetSelectType():type:"+type);
		window.find("VMall_Friend_List_Logic_"+m_DropMenuId).m_Type = type;
	}
};