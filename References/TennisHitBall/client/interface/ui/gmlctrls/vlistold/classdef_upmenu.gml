
class VMyUpMenu_UI item
{
	size = "70,18";
	var m_type = 0;//0宽的 1窄的
	var m_bMouseOut = ture;
	void GetOptionHeight(){return 20;}				//列表中每个选项的高度
	void GetTopEdge(){return 5;}					//选项上部留的空间
	void GetLeftEdge(){return 5;}					//选项左侧留的空间
	var m_CheckItem = new item
	{
		valign(100,0);size = "100%,100%";capturemouse = true;//bgcolor = "#FF0000";alpha = 50;
		void OnMouseOver(){parent.m_bMouseOut = false;}
		void OnMouseOut(){parent.m_bMouseOut = true;}//parent.Hide();
	}
	var m_ChangeTypeCheckItem = new item{halign(100,0);size = "18,100%,0,-19";capturemouse = true;show = false;}//这个用来挡住部分的m_CheckItem
	//默认文本背景
	var m_DefaultText_BK = new VPic9_EditBK_UI{valign(100,0);size = "100%,18";}
	//默认的文本
	var m_DefaultText = new BaseText
	{
		valign(100,0);size = "100%,18,-18,0";ycenter = true; xcenter = true;parent.size(parent.width,height);
	}
	//三角按钮
	var m_btn = new VBTN_UpMenu_New
	{
		halign(100,0);valign(100,0);capturemouse = false;
		SetHangID(37);
		void OnPressed()
		{
			if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
			{
				if(parent.m_Menu.isVisible())
				{
					parent.Hide();
				}
				else
				{
					parent.Show();
				}
			}
		}
	}
	class MyOption VMenuOption
	{
		size = "100%,"+parent.parent.GetOptionHeight();
		drawstartx = parent.parent.GetLeftEdge();
		var m_index = 0;
		void OnMouseDownL()
		{
			parent.parent.m_DefaultText.SetData(src);
			parent.parent.Hide();
			MouseDownFunc();
		}
	};
	class MyText MyOption//用于对text的控制 需要时重载
	{
	};
	var m_Menu = new VMenuBG_UI
	{
		show = false;
		var _tempNum = 0;//临时的数量
		var _TextNum = 0;//记录总的文本数量用的
		var _arr = "";

		void SetData(_Str)
		{
			_TextNum = window.GetSplitCount(_Str,",");//alert("_TextNum:"+_TextNum+",_Str:"+_Str);
			_arr = window.SplitStr2(_Str,",",_TextNum);
			if(parent.m_type == 0){size = "100%,"+(_TextNum*parent.GetOptionHeight()+parent.GetTopEdge());}
			else{size = "100%,"+(_TextNum*parent.GetOptionHeight()+parent.GetTopEdge())+",-18,0";}
//			parent.size(parent.width,height+20);
			while (_tempNum<_TextNum)
			{
				//alert("_tempNum"+_tempNum);
				//菜单中的一个文本
				new MyText
				{
					var _SelectIndex = parent._tempNum;//记录自己是哪个
					pos(0,height*_SelectIndex+parent.parent.GetTopEdge());cursor = window.CURSOR_HAND;
					src = parent._arr[_SelectIndex];

					void MouseDownFunc()
					{
						parent.parent.WhichSelect(_SelectIndex);
					}
				}
				_tempNum += 1;
			}
		}
	}
	void Show()//把自己放大 让文本显示
	{
		size(width,m_Menu.height+m_DefaultText.height+1);
//		m_CheckItem.size(width,m_Menu.height+m_DefaultText.height+1);
		if(m_type==1){m_ChangeTypeCheckItem.show = true;}
		m_Menu.show = true;
	}
	void Hide()//把自己缩小 让文本隐藏
	{
		size(width,m_DefaultText.height);
//		m_CheckItem.size(width,m_DefaultText.height);
		m_ChangeTypeCheckItem.show = false;
		m_Menu.show = false;
	}
	void Lost()
	{
		if(m_bMouseOut==true){Hide();}
	}
	//设置宽度
	void SetWidth(data)
	{
		size(data,m_DefaultText.height);
	}
	//设置类型
	void SetType(data)
	{
		m_type = data;
		if(data==1)
		{
			m_Menu.size = "100%,"+m_Menu.height+",-18,0";
		}
		else
		{
			m_Menu.size = "100%,"+m_Menu.height;
		}
	}
	//设置数据
	void SetData(data)
	{
		m_Menu.SetData(data);
	}
	//可以在外部调用
	//设置默认文本的数据
	void SetDefaultSrc(data)
	{
		m_DefaultText.SetSrc(data);
	}
	//可以在外部调用
	//得到默认文本的数据
	void GetDefaultSrc()
	{
		return m_DefaultText.src;
	}
	//设置小三角的状态
	void SetState(state)
	{
		m_btn.SetState(state);
	}
	//需要被重载
	void WhichSelect(_index){}
};