//
//组合框
//yxf 2009年10月14日

class VMyComboBox_Sub item
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
	var m_dropmenu_bk = new item{bkcolor="#FFFFFF";}//alpha = 30;

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
		void SetText(num)
		{
			while(index<num)
			{
				new text
				{
					var _Index = parent.index;	//有效期序号
					name = "_text"+parent.index;
					pos(0,23*parent.index);cursor = window.CURSOR_HAND;
					xcenter=true;ycenter=true;//font="宋体,-1,12";
					color="#000000";

					//选中的效果
					var _chg = new item{name = "_chg"+parent.parent.index;bkcolor="#aaaaaa";show=false;}
					void OnMouseOver(){_chg.show=true;color="#FF";}
					void OnMouseOut(){_chg.show=false;color="#000000";}

					void OnMouseDownL()
					{
						if(window.find("VMyComboBox_Sub"+parent.parent.m_t_ID)._show_chg)
						{
							parent.parent.SetShow(false);
						}
						
						window.find("VMyComboBox"+parent.parent.m_t_ID).WhichSelect(_Index);
					}
				}
				index+=1;
			}
		}
	}//m_chgtext
};

//总的类
class VMyComboBox item
{
	var m_sizeX = 0;//下拉菜单宽
	var m_ID = 0;//商城物品ID

	setFocus="true";
	
	//三角按钮
	var m_btn = new VMyButton
	{
		font = "宋体,-1,16";Init("▼");
		pos(135,0);size(20,20);
		void OnMouseDownL()
		{
			if (GetState() == window.BTN_STATE_GREY)
			{
				return;
			}
			parent.SetPos();
			if(window.find("VMyComboBox_Sub"+parent.m_ID)._show_chg)
			{
				window.find("VMyComboBox_Sub"+parent.m_ID).SetShow(false);
			}
			else
			{
				window.find("VMyComboBox_Sub"+parent.m_ID).SetShow(true);
			}
		}
	}

	//失去焦点隐藏下拉菜单
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(window.find("VMyComboBox_Sub"+m_ID)._show_chg)
			{
				window.find("VMyComboBox_Sub"+m_ID).SetShow(false);
			}
		}
	}
	
	//外部接口=================================================================================
	//参数：大小，显示的选项字符串,EnterID
	void SetData(str,ID)
	{
		m_ID = ID;
		//===========================================================下拉框
		set window//.find(""+window.TOPLAYER)
		{
			var _drop_ui = new VMyComboBox_Sub
			{
				m_t_ID = ID;
				name = "VMyComboBox_Sub"+ID;capturemouse="true";
			}
		}
		//===========================================================下拉框
		name = "VMyComboBox"+ID;
		var count = window.GetSplitCount(str,",");
		var index = 0;
		m_btn.pos(m_sizeX-25,1);//设置三角按钮的位置
		size(m_sizeX,count*22+40);//设置总的下拉菜单大小
		window.find("VMyComboBox_Sub"+ID).m_chgtext.size(m_sizeX-5,count*23+10);//设置选项框的大小
		window.find("VMyComboBox_Sub"+ID).SetBaseListSize(m_sizeX,count*23+12);//设置下拉背景的大小
		
		window.find("VMyComboBox_Sub"+ID).m_chgtext.SetText(count);
		staticvar _arr = window.SplitStr2(str,",",count);
		
		while(index<count)
		{
			window.find("VMyComboBox_Sub"+ID).m_chgtext.find("_text"+index).src = _arr[index];
			window.find("VMyComboBox_Sub"+ID).m_chgtext.find("_text"+index).size(m_sizeX-15,22);
			window.find("VMyComboBox_Sub"+ID).m_chgtext.find("_chg"+index).size(m_sizeX+20,22);
			index+=1;
		}
	}// end of SetData()
	//外部接口=========================================================================================
	
	//设置位置
	void SetPos()
	{
		window.find("VMyComboBox_Sub"+m_ID).m_dropmenu_bk.pos(window.mousex-m_btn.mousex-m_sizeX+18,window.mousey-m_btn.mousey+18);
		window.find("VMyComboBox_Sub"+m_ID).m_chgtext.pos(window.mousex-m_btn.mousex-m_sizeX+26,window.mousey-m_btn.mousey+23);
	}

	//删除下拉菜单对象
	void OnDelete()
	{
		window.find("VMyComboBox_Sub"+m_ID).del();
	}

	//[接口]设置小三角的状态
	//[参数] 灰 与 亮
	void SetState(param)
	{
		m_btn.SetState(param);
	}
};