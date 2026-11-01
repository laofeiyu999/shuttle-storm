//下拉菜单类
//2009-2-4
//吴楠
import("$./../VPopWnd/ClassDef.gml");

class VDROP_UI item
{
	size="100%,100%";
	show=false;
	
	var m_t_ID=0;//记录物品ID
	var _show_chg = false;//记录显示状态
	void SetShow(param)
	{
		_show_chg = param;
		show=param;
	}

	//下拉框背景
	var m_dropmenu_bk = new VLISTBASE_UI{}

	//设置下拉框大小
	void SetBaseListSize(_sizeX,_sizeY)
	{
		m_dropmenu_bk.SetSize(_sizeX,_sizeY);
	}

	//选项文本
	var m_chgtext = new item
	{
		name = "CHGTEXT"+parent.m_t_ID;

		//设置文本显示内容的函数
		//参数1：参数个数 参数2：1，商城选项 2，明星榜选项
		var index = 0;
		var _type = 0;//下拉菜单类型1：商城 2：明星榜
		void SetText(num,type)
		{
			_type=type;
			while(index<num)
			{
				new text
				{
					var _Index = parent.index;	//有效期序号
					name = "_text"+parent.index;
					pos(0,23*parent.index);cursor = window.CURSOR_HAND;
					xcenter=true;ycenter=true;//font="宋体,-1,12";
					color="#ffffff";

					//选中的效果
					var _chg = new img
					{
						name = "_chg"+parent.parent.index;
						src="$./imgs"+window.g_Sex+"/ListChange.tga";
						show=false;
					}

					void OnMouseOver(){_chg.show=true;color="#000000";}
					void OnMouseOut(){_chg.show=false;color="#ffffff";}

					void OnMouseDownL()
					{
						if(src!=0)
						{
							window.find("DROPMENU"+parent.parent.m_t_ID).m_DefaultText.src=src;
						}
						else
						{
							window.find("DROPMENU"+parent.parent.m_t_ID).m_DefaultText.src="永久有效";
						}
						if(window.find("VDROP_UI"+parent.parent.m_t_ID)._show_chg)
						{
							parent.parent.SetShow(false);
						}
						if(parent._type == 1 || parent._type == 3)
						{
							window.find("DROPMENU"+parent.parent.m_t_ID).WhichSelect(_Index);
						}
						if(parent._type == 2)
						{
							window.find("DROPMENU"+parent.parent.m_t_ID).WhichSelect(_Index);
						}
					}
				}
				index+=1;
			}
		}
	}//m_chgtext
};

////总的下拉菜单类
class VDROPMENU_UI item
{
	var m_sizeX = 0;//下拉菜单宽
	var m_ID = 0;//商城物品ID

	setFocus="true";

	//默认文本背景
	var m_IMG_bg = new img
	{
		src="$./imgs"+window.g_Sex+"/bk.tga";
	}
	
	//默认的文本
	var m_DefaultText = new text
	{
		ycenter=true;pos(5,0);
		//font="宋体,-1,21";
	}

	//三角按钮
	var m_btn = new VLISTCHECK_UI
	{
		pos(135,2);
		void OnMouseDownL()
		{
			if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
			{
				parent.SetPos();
				if(window.find("VDROP_UI"+parent.m_ID)._show_chg)
				{
					window.find("VDROP_UI"+parent.m_ID).SetShow(false);
				}
				else
				{
					window.find("VDROP_UI"+parent.m_ID).SetShow(true);
				}
			}
		}
	}

	//失去焦点隐藏下拉菜单
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(window.find("VDROP_UI"+m_ID)._show_chg)
			{
				window.find("VDROP_UI"+m_ID).SetShow(false);
			}
		}
	}
	
	//外部接口=================================================================================
	//参数：大小，有效时间,EnterID,type:类型1，商城有效期 2，明星榜 3 普通
	void SetData(count,strTime,ID,type,defaultid)
	{
		if(count == 1)
		{
			m_btn.SetState(window.USER_STATE_WAIT);//按钮为灰的
		}
		m_ID = ID;
		//===========================================================下拉框
		set window
		{
			var _drop_ui = new VDROP_UI
			{
				m_t_ID=ID;
				name = "VDROP_UI"+ID;capturemouse="true";
			}
		}
		//===========================================================下拉框
		name = "DROPMENU"+ID;
		var index = 0;

		m_btn.pos(m_sizeX-25,2);//设置三角按钮的位置

		size(m_sizeX,count*22+40);//设置总的下拉菜单大小
		m_IMG_bg.size(m_sizeX,25);//设置默认文本背景大小
		m_DefaultText.size(m_sizeX-5,25);//设置默认文本的大小
		window.find("VDROP_UI"+ID).m_chgtext.size(m_sizeX-15,count*23+10);//设置选项框的大小
		window.find("VDROP_UI"+ID).SetBaseListSize(m_sizeX,count*23+12);//设置下拉背景的大小
		
		window.find("VDROP_UI"+ID).m_chgtext.SetText(count,type);
		staticvar _arr = window.SplitStr2(strTime,",",count);

		if(type == 1)
		{
			
			if(toint(_arr[0])==0)
			{
				m_DefaultText.src="永久有效"
			}
			else
			{
				m_DefaultText.src=""+_arr[0]+"天有效";
			}
			while(index<count)
			{
				if(toint(_arr[index])==0)
				{
					window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).src="永久有效";
					window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).size(m_sizeX-15,22);
					window.find("VDROP_UI"+ID).m_chgtext.find("_chg"+index).size(m_sizeX,22);
				}
				else
				{
					window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).src=""+_arr[index]+"天有效";
					window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).size(m_sizeX-15,22);
					window.find("VDROP_UI"+ID).m_chgtext.find("_chg"+index).size(m_sizeX,22);
				}
				index+=1;
			}
		}
		if(type == 2 || type == 3)
		{
			m_DefaultText.src=_arr[defaultid];
			
			while(index<count)
			{
				window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).src=_arr[index];
				window.find("VDROP_UI"+ID).m_chgtext.find("_text"+index).size(m_sizeX-15,22);
				window.find("VDROP_UI"+ID).m_chgtext.find("_chg"+index).size(m_sizeX,22);
				index+=1;
			}
		}
		
	}// end of SetData()
	//外部接口=========================================================================================
	
	//设置位置
	void SetPos()
	{
		window.find("VDROP_UI"+m_ID).m_dropmenu_bk.pos(window.mousex-m_btn.mousex-m_sizeX+25,window.mousey-m_btn.mousey+16);
		window.find("VDROP_UI"+m_ID).m_chgtext.pos(window.mousex-m_btn.mousex-m_sizeX+32,window.mousey-m_btn.mousey+23);
	}

	//设置是否显示默认文本背景
	//参数：true显示，false不显示
	void SetIMGShow(param)
	{
		m_IMG_bg.show=param;
	}

	//设置默认显示第几个选项
	//参数：0，1，2，...
	void SetDefaultText(index)
	{
		if(toint(_arr[index])==0)
		{
			m_DefaultText.src="永久有效";
		}
		else
		{
			m_DefaultText.src=""+_arr[index]+"天有效";
		}
	}

	//删除下拉菜单对象
	void OnDelete()
	{
		window.find("VDROP_UI"+m_ID).del();
	}
};