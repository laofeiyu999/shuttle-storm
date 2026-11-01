//可翻动radio的控件

class VRadioCtrl_UI item
{
	var m_max = 0;
	var m_index = 0;
	var m_arrText = "";	//标签上的文字
	var m_arrname;	//标签上的name

	void GetRadioWidth(){return 61;}//radio宽度
	void GetRadioHeight(){return 22;}//radio高度
	void GetRadioSpace(){return 1;}//radio间距
	void GetBtnWidth(){return 11;}//button宽度
	void GetBtnRadionSpace(){return 1;}//button和radio的间距

	var m_radioBar = new item{var m_AllRadio = new item{}}

	//_arrTital：标签中的字的字符串用逗号分开   _max：最多显示的标签数    radio：的groupname的特别之处
	void InitMax(_arrTital,_max,_name)
	{
		if(_max<1){return;alert("最大标签数不能小于1");}

		m_max = _max;
		var _num = window.GetSplitCount(_arrTital,",");
		m_arrText = window.SplitStr2(_arrTital,",",_num);

		m_radioBar.pos = ""+(GetBtnWidth()+GetBtnRadionSpace())+",0";

		if(_num >_max)
		{
			//设置radioBar的大小和控件的大小
			var _BarWidth = GetRadioWidth()*_max+GetRadioSpace()*(_max-1);
			m_radioBar.size(_BarWidth,GetRadioHeight());
			var _Width = _BarWidth+(GetBtnWidth()+GetBtnRadionSpace())*2;
			size(_Width,GetRadioHeight());
			ShowCtrlBtn();//显示按钮
		}
		else
		{
			//设置radioBar的大小和控件的大小
			var _BarWidth = GetRadioWidth()*_num+GetRadioSpace()*(_num-1);
			m_radioBar.size(_BarWidth,GetRadioHeight());
			var _Width = _BarWidth+(GetBtnWidth()+GetBtnRadionSpace())*2;
			size(_Width,GetRadioHeight());
			HideCtrlBtn();//不显示按钮
		}
		m_radioBar.m_AllRadio.size(GetRadioWidth()*_num+GetRadioSpace()*(_num-1),GetRadioHeight());
		
		set m_radioBar
		{
			set m_AllRadio
			{
				delallchild();

				staticvar s_arrRadio = sysarray(_num);
				
				parent.parent.m_index=0;
				while(parent.parent.m_index < _num)
				{
					var _radio = new VRadio_BK_UI
					{
						var _MyIndex = parent.parent.parent.m_index;
						var _Tempname = parent.parent.parent.m_arrname[_MyIndex];
						if (_Tempname != "")
						{
							name = _Tempname;
						}
						void OnCheck()
						{
							if (GetChecked()){return;}
							parent.parent.parent.parent.vml("OnCheckRadio"+_MyIndex+"();");
							MouseCheck();
						}
						void OnUnCheck()
						{
							MouseUnCheck();
						}
					}
					s_arrRadio[parent.parent.m_index] = _radio;
					s_arrRadio[parent.parent.m_index].pos = ""+(parent.parent.m_index*(parent.parent.GetRadioWidth()+parent.parent.GetRadioSpace()))+",0";
					s_arrRadio[parent.parent.m_index].groupname="RadioCtrl_"+_name+"_Group_Name";
					s_arrRadio[parent.parent.m_index].InitText(parent.parent.m_arrText[parent.parent.m_index]);
					if(parent.parent.m_index==0){s_arrRadio[parent.parent.m_index].startstate = 1;}
					parent.parent.m_index += 1;
				}
			}
		}
	}

	//设置radio的name
	//需要在InitMax()前调用有效
	void SetRadioName(_str)
	{
		m_arrname = window.SplitStr2(_str,",");
	}

	//设置radio第几个是灰的
	void SetRadioGreyIndex(_Index)
	{
		m_radioBar.m_AllRadio.s_arrRadio[_index].SetState(window.BTN_STATE_GREY);
	}
	//设置radio第几个是亮的
	void SetRadioLightIndex(_Index)
	{
		m_radioBar.m_AllRadio.s_arrRadio[_index].SetState(window.BTN_STATE_LIGHT);
	}
	//设置宽度
	void SetWidth(_width)
	{
		size(_width,GetRadioHeight());
		s_right.pos = ""+(width-s_right.width)+",5";
	}
	
	void ShowCtrlBtn()//显示按钮
	{
		staticvar s_left = new VBTN_RadioLeft_New{pos = "0,5";}
		staticvar s_right = new VBTN_RadioRight_New{pos = ""+(parent.width-width)+",5";}
		SetEvent();
	}
	void HideCtrlBtn()//不显示按钮
	{
		s_left.del();
		s_right.del();
	}
	void SetEvent()
	{
		set s_left
		{
			void OnPressed()
			{
				parent.PressedLeft();
			}
		}
		set s_right
		{
			void OnPressed()
			{
				parent.PressedRight();
			}
		}
	}
	void PressedLeft()
	{
		var _move = GetRadioWidth()+GetRadioSpace();
		if(m_radioBar.m_AllRadio.left+_move>0){return;}
		m_radioBar.m_AllRadio.pos(m_radioBar.m_AllRadio.left+_move,0);
	}
	void PressedRight()
	{
		var _move = GetRadioWidth()+GetRadioSpace();
		if(m_radioBar.m_AllRadio.left+m_radioBar.m_AllRadio.width<=m_radioBar.width){return;}
		m_radioBar.m_AllRadio.pos(m_radioBar.m_AllRadio.left-_move,0);
	}

	//[功能]让一个按钮闪 - yxf 2009年10月24日
	//[参数]index:序号
	//		param:true false
	void Flash(index,param)
	{
		m_radioBar.m_AllRadio.s_arrRadio[index].Flash(param);
	}
	
	//手动设置点击其中一个按钮
	//index:序号
	void OnClickRadio(index)
	{
		var i = 0;
		while(i<m_max)
		{
			if(i == index)
			{
				m_radioBar.m_AllRadio.s_arrRadio[index].Check();
			}
			else
			{
				m_radioBar.m_AllRadio.s_arrRadio[i].UnCheck();
			}
			i += 1;
		}
		
	}
};
/*
	--------------------------------------可翻动radio的控件-------------------------
	VRadioCtrl_UI类:

	//_arrTital：标签中的字的字符串用逗号分开   _max：最多显示的标签数    radio：的groupname的特别之处
	void InitMax(_arrTital,_max,_name)//这里自动设置size

	//设置radio第几个是灰的
	void SetRadioGreyIndex(_Index)
	//设置radio第几个是亮的
	void SetRadioLightIndex(_Index)

	//设置宽度	写在InitMax(_arrTital,_max,_name)后面	用来拉宽控件
	void SetWidth(_width)

	注意：>>>>>>必须重载的函数<<<<<<
	void OnCheckRadio0(){}
	void OnCheckRadio1(){}
	void OnCheckRadio2(){}
	......
	有几个radio就重载几个OnCheckRadio函数编号从0开始，函数里是OnCheck()时干的事

	下面这些可重载（非必须，可不写，以下是默认的）
	void GetRadioWidth(){return 61;}//radio宽度
	void GetRadioHeight(){return 22;}//radio高度
	void GetRadioSpace(){return 1;}//radio间距
	void GetBtnWidth(){return 11;}//button宽度
	void GetBtnRadionSpace(){return 1;}//button和radio的间距
*/