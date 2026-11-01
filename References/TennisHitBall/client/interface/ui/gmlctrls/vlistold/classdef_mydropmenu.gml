//下拉菜单 
//陈晓聪 2009年4月20日

class VMyMenu_UI item
{
	pos = "0,19";//bgcolor = "#FF00";
	var m_MenuId = 0;//记录是那个菜单
	var m_width = 0;//记录宽度
	var m_type = 0//记录类型
	var m_bShouldShow = true;//enableUpdate(1);
	var m_CheckIndex = 0;//为了设置选项某项的字变灰和变亮而记录的index
	show = false;
	//下拉框背景
	var m_dropmenu_bk = new VMenuBG_UI
	{
		void SetData(_width,_height)
		{
			size(_width,_height);
		}
	}
	var m_item_MenuText = new item
	{
		void SetData(_Str)
		{
			delallchild();
			staticvar _tempNum = 0;//临时的数量
			staticvar _TextNum = window.GetSplitCount(_Str,",");//alert("_TextNum:"+_TextNum+",_Str:"+_Str);
			staticvar _arr = window.SplitStr2(_Str,",",_TextNum);

			//设置菜单和背景的size
			if (parent.m_type == 0)
			{
				parent.SetSize(parent.m_width,_TextNum*15+2);
				size(parent.m_width,_TextNum*15+2);
				//alert(0);
			}
			else
			{
				
				parent.SetSize(parent.m_width-18,_TextNum*15+2);
				size(parent.m_width-18,_TextNum*15+2);
				//alert(1);
			}
			
			while (_tempNum<_TextNum)
			{
				//alert("_tempNum"+_tempNum);
				//菜单中的一个文本
				var _text = new VMenuOption
				{
					var _SelectIndex = parent._tempNum;//记录自己是哪个
					pos(3,15*_SelectIndex);cursor = window.CURSOR_HAND;
					if (parent.parent.m_type == 0){size(parent.parent.m_width-6,15);}
					else{size(parent.parent.m_width-18,15);}
					if (tostring(parent._arr[_SelectIndex]) == "0")
					{
						src = "永久有效";
					}
					else
					{
						src = parent._arr[_SelectIndex];
					}

					void OnMouseDownL()
					{
						if(GetGreyState()){return;}
						parent.parent.show=false;
						window.find("DropMenu"+parent.parent.m_MenuId).SetDefaultSrc(src);
						window.find("DropMenu"+parent.parent.m_MenuId).WhichOnSelect(_SelectIndex);
					}
					void CheckGrey()
					{
						if(_SelectIndex==parent.parent.m_CheckIndex){SetColorGrey();}
					}
					void CheckLight()
					{
						if(_SelectIndex==parent.parent.m_CheckIndex){SetColorLight();}
					}
					void ClearGrey()
					{
						SetColorLight();
					}
				}
				_tempNum += 1;
			}
		}
	}

	void CheckIndexForGrey(_index)
	{
		m_CheckIndex = _index;
		m_item_MenuText.scriptprcallsub("CheckGrey");
	}
	void CheckIndexForLight(_index)
	{
		m_CheckIndex = _index;
		m_item_MenuText.scriptprcallsub("CheckLight");
	}
	void ClearGrey()
	{
		m_item_MenuText.scriptprcallsub("ClearGrey");
	}

	//设置宽度的值和类型
	//_type：0宽的，1窄的
	void SetWidthAndType(_width,_type)
	{
		m_width = _width;
		m_type = _type;
		//alert("SetWidthAndType"+m_width+","+m_type);
	}

	//设置size
	void SetSize(_width,_height)
	{	
//		alert("SetSize:"+_width+","+_height);
		size(_width,_height);
		m_dropmenu_bk.SetData(_width,_height);
		if(m_type == 1){window.find("DropMenu"+m_MenuId).SetSize(_width+18,_height);}
		else{window.find("DropMenu"+m_MenuId).SetSize(_width,_height);}
	}

	//设置pos偏移值
	void SetPosExcursion(_x,_y)
	{
		pos = "0,19";
		pos(left+_x,top+_y);
	}

	//设置菜单的显示状态
	void SetShow()
	{
		if(m_bShouldShow == false){show = false;return;}
		if (isVisible()){show = false;}
		else{show = true;}
	}
	
	//用于在滚动条的界面里
	void ShouldShow()
	{
		m_bShouldShow = true;
	}
	//用于在滚动条的界面里
	void ShouldHide()
	{
		m_bShouldShow = false;
		show = false;
	}

	void GetSrc()
	{
		return m_tempSrc;
	}
	//_data：文字， 
	void SetData(_data)
	{
		m_item_MenuText.SetData(_data);
	}
};

class VMyDropMenu_UI item
{
	var m_DropMenuId = 0;
	var m_isListShow = false;
	var m_OverState = 0;//0：非over  1：over
	var m_defaultIndex=0;
	//默认文本背景
	//var m_DefaultText_BK = new VTextBG{}
	//默认的文本
	var m_DefaultText = new BKText
	{
		ycenter = true; xcenter = true;
		void SetData(data)
		{
			size(data-12,18);
			parent.m_DefaultText_BK.size(data,18);
		}
		void SetSrc(data)
		{
			src = data;
		}
		void SetPos(_x,_y)
		{
			pos(_x,_y);
		}
	}

	void SetDefaultTextFont(_font)
	{
		m_DefaultText.font = _font;
	}
	
	//三角按钮
	var m_btn = new VBTN_DropSmall_New
	{
		capturemouse = false;
		void OnPressed()
		{
			if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
			{
				if(window.find("Menu"+parent.m_DropMenuId).isVisible())
				{
					window.find("Menu"+parent.m_DropMenuId).show = false;
					parent.m_isListShow = false;
				}
				else
				{
					window.find("Menu"+parent.m_DropMenuId).show = true;
					parent.m_isListShow = true;
					parent.setFocus="true";
					parent.RePos();
				}
			}
		}
		void SetData(data)
		{
			pos(toint(data)-20,0);
		}
		void LogicMouseOverFunc()
		{
			parent.m_OverState = 1;
		}
		void LogicMouseOutFunc()
		{
			parent.m_OverState = 0;
		}
	}

	//失去焦点隐藏下拉菜单
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(m_OverState == 0)
			{
				window.find("Menu"+m_DropMenuId).show = false;
				m_isListShow = false;
			}
			else
			{
				setFocus="true";
			}
		}
	}

	//删除下拉菜单对象
	void OnDelete()
	{
		window.find("Menu"+m_DropMenuId).del();
	}

	//需要在显示部分new的时候定制，需要先写，设置是哪个下拉菜单
	void SetID(_id)
	{
		name = "DropMenu"+_id;
		m_DropMenuId = _id;
		set window
		{
			//菜单
			staticvar _Menu = new VMyMenu_UI
			{
				capturemouse="true";show = false;
				name = "Menu"+_id;
				m_MenuId = _id;
			}
		}
	}

	//设置宽度 显示部分需调用
	//_type：0宽的，1窄的
	void SetWidthAndType(_width,_type)
	{
//		alert("parent;SetWidthAndType:"+_width);
		window.find("Menu"+m_DropMenuId).SetWidthAndType(_width,_type);
		m_DefaultText.SetData(_width);
		m_btn.SetData(_width);
	}

	//设置数据 逻辑部分需要调用
	//_data：文字
	void SetData(_data)
	{
//		alert("parent;SetData:"+_data+",name:"+this.name+",name2:"+window._Menu.name);
		window.find("Menu"+m_DropMenuId).SetData(_data);
	}

	//可以在外部调用
	//设置默认文本的数据
	void SetDefaultSrc(data, items)
	{
		// 段晓彤修改
//		alert("defaultSrc="+data);
		if (tostring(data) == "0")
		{
			m_DefaultText.SetSrc("永久有效");
		}
		else
		{
			m_DefaultText.SetSrc(data);
		}
	}
	//可以在外部调用
	//设置默认文本的数据
	void SetDefaultIndex(data)
	{
		m_defaultIndex = data;
		m_DefaultText.SetData(window.find("Menu"+m_DropMenuId).m_item_MenuText._arr[data]);
	}	//可以在外部调用
	//得到默认文本的数据
	void GetIndex()
	{
		return m_defaultIndex;
	}

	//可以在外部调用
	//得到默认文本的数据
	void GetDefaultSrc()
	{
		return m_DefaultText.src;
	}

	//不要在外部调用
	//设置size
	void SetSize(_x,_y)
	{
		size(_x,_y+24);
		//alert("VMyDropMenu_UI::SetSize:"+_x+","+_y);
	}

	//可以在外部调用
	//设置按钮位置
	void SetBtnPos(_x,_y)
	{
		m_btn.SetPos(_x,_y);
	}

	//需要在显示部分调整
	//设置整个菜单的位置
	void SetPos(_x,_y)
	{
		window.find("Menu"+m_DropMenuId).SetPosExcursion(GetOffSetX()+_x,GetOffSetY()+_y);//菜单的偏移位置
		pos(_x,_y);
	}
	void RePos()
	{
		window.find("Menu"+m_DropMenuId).SetPosExcursion(GetOffSetX()+left,GetOffSetY()+top);//菜单的偏移位置
	}

	void GetOffSetX()
	{
		return parent.parent.left+parent.left;
	}
	void GetOffSetY()
	{
		return parent.parent.top+parent.top;
	}

	void GreyIndex(_index)
	{
		window.find("Menu"+m_DropMenuId).CheckIndexForGrey(_index);
	}
	void LightIndex(_index)
	{
		window.find("Menu"+m_DropMenuId).CheckIndexForLight(_index);
	}
	void ClearGrey()
	{
		window.find("Menu"+m_DropMenuId).CheckIndexForGrey();
	}

	//不需要被重载 用于内部调用
	void WhichOnSelect(_index)
	{
		m_defaultIndex=_index;
		WhichSelect(_index);
	}
	//需要被重载
	void WhichSelect(_index){}


	//设置小三角的状态
	void SetState(state)
	{
		m_btn.SetState(state);
	}
};