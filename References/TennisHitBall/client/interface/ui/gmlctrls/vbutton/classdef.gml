//按钮控件
//yxf 2008年12月2日

//按钮的切图要求
//类型：文字与底图分开 / 文字与底图一起
//数量：4张(正常1 鼠标滑过2 按下3 灰4) / 3张(正常1 鼠标滑过2 按下3)
//其他支持：可支持动画
import("$./../Flicker/ClassDef.gml");


class VBaseButton VN2Button
{
	capturemouse = true;cursor = window.CURSOR_HAND;
	
	/*常量*/
	//按钮的类型
	var BTN_TEXT = 1;	//文字
	var BTN_BG = 0;		//底图
	//按钮图片的状态
	var BTN_IMG_1_NORMAL	= 1;	//正常
	var BTN_IMG_2_OVER		= 2;	//鼠标经过
	var BTN_IMG_3_CLICK		= 3;	//点击
	var BTN_IMG_4_GREY		= 4;	//灰图
	var BTN_IMG_5_FLASH		= 5;	//闪烁
	//end Const
	var m_iType = BTN_BG;				//类型(1:文字0:底图)
	var m_Img_Index = BTN_IMG_1_NORMAL;	//图片的序列状态
	
	var m_BGName = "";			//底图的文件名
	var	m_TopName = "";			//文字的文件名

	var m_IsAni = false;		//是否是动画
	var m_sizeX = 0;			//图像宽度
	var m_sizeY = 0;			//图像高度
	
	var m_state = window.BTN_STATE_LIGHT;	//图像状态 默认必须是可以点的状态
	var m_Selected = false;		//选中与否

	//动画按钮变量
	var m_YFrame1 = -1;		//帧数(几张图)
	var m_YFrame2 = -1;
	var m_YFrame3 = -1;
	var m_YFrame5 = -1;
	var m_AniSpeed;

	//[功能]初始化Button函数-原型
	//[参数]fname:文件名,type:类型(BTN_TEXT:文字;BTN_BG:底图),isani:是否是动画)
	void Init(fname,type,isani)
	{
		m_iType = type;
		m_IsAni = isani;
		if (m_iType == BTN_BG)
		{
			m_BGName = fname;
		}
		if (m_iType == BTN_TEXT)
		{
			staticvar m_TopImg = new img{}	//上面的文字
			m_TopName = fname;
		}
		SetImgSrc(BTN_IMG_1_NORMAL);
	}

	//设置图片大小
	void SetSize(x,y)
	{
		m_sizeX = x;
		m_sizeY = y;
		_text.size(x,y);
		size(x,y);
	}
	
	//设置鼠标悬停框的ID
	//id:	悬停的ID
	void SetHangID(id)
	{
		_btnhover.del();
		//悬停
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangID(id);
	}

	//设置动画图片参数(yFrame1:普通状态下,yFrame2:鼠标over状态,yFrame3:鼠标按下,speed:速度)
	void SetAni(yFrame1,yFrame2,yFrame3,yFrame5,speed)
	{
		//alert("帧数一: "+yFrame1+" 帧数二: "+yFrame2+" 帧数三: "+yFrame3+" 帧数五: "+yFrame5+" 速度: "+speed);
		m_YFrame1 = yFrame1;
		m_YFrame2 = yFrame2;
		m_YFrame3 = yFrame3;
		m_YFrame5 = yFrame5;
		m_AniSpeed = speed;
	}

	//设置按钮的图片 
	//参数 state:正常1 鼠标滑过2 按下3 不可点4 闪烁5
	void SetImgSrc(index)
	{
		
		if(toint(index) != 5)
		{
			CallBack_OnImgChange(index);
		}
		//为大厅和房间下边的按钮而加 2009年11月23日

		SetTextColor(index);
		m_Img_Index = index;
		MIMG.anispeed = -1;//防止按钮图片闪
		if (m_iType == BTN_BG)
		{
			MIMG.size(m_sizeX,m_sizeY);
			MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+index+".tga";
			if (!m_IsAni){return;}
			if (index == BTN_IMG_1_NORMAL)
			{
				if (m_YFrame1 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame1);MIMG.anispeed = m_AniSpeed;
			}
			if (index == BTN_IMG_2_OVER)
			{
				if (m_YFrame2 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame2);MIMG.anispeed = m_AniSpeed;
			}
			if (index == BTN_IMG_3_CLICK)
			{
				if (m_YFrame3 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame3);MIMG.anispeed = m_AniSpeed;
			}
			if (index == BTN_IMG_5_FLASH)
			{
				if (m_YFrame5 == -1){return;}
				MIMG.clipani(m_sizeX+5,m_sizeY+5,1,m_YFrame5);MIMG.anispeed = m_AniSpeed;
			}
			return;
		}
		if (m_iType == BTN_TEXT)
		{
			m_TopImg.size(m_sizeX,m_sizeY);
			m_TopImg.src = "$./imgs"+window.g_Sex+"/"+m_TopName+index+".tga";

			MIMG.size(m_sizeX,m_sizeY);
			MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+index+".tga";
			return;
		}
	}

	void OnMouseUpL_Lost()//鼠标在其他地方抬起
	{
		LogicMouseUpL_Lost();//模型旋转用到(逻辑)
	}
	void OnMouseOver()
	{
		if(m_state == window.BTN_STATE_GREY){return;}
		//if (m_Selected) {return;}
		SetImgSrc(BTN_IMG_2_OVER);//显示的换图片
		MouseOver_Sound();//音效用
		LogicMouseOverFunc();
		_frmCnt = 0;
	}
	void OnMouseOut()
	{
		if(m_state == window.BTN_STATE_GREY){return;}
		if (m_Selected) {SetImgSrc(BTN_IMG_3_CLICK);LogicMouseOutFunc();return;}
		SetImgSrc(BTN_IMG_1_NORMAL);//显示的换图片
		LogicMouseOutFunc();
	}
	void OnMouseDownL()
	{
		if(m_state == window.BTN_STATE_GREY){return;}
		SetImgSrc(BTN_IMG_3_CLICK);//显示的换图片
		MouseDownL_Sound();//音效用
		LogicMouseDownL();//模型旋转用到(逻辑)
	}
	void OnMouseUpL()
	{
		if (m_Selected) {return;}
		if(m_state == window.BTN_STATE_GREY){return;}
		SetImgSrc(BTN_IMG_1_NORMAL);//显示的换图片
		MouseUpL_Sound();//音效用
		LogicMouseUpL();//模型旋转用到(逻辑)
	}
	
	void MouseOver_Sound(){window.PlaySound(127);}
	void MouseDownL_Sound(){window.PlaySound(114);}
	
	//返回按钮的状态
	void GetState(){return m_state;}
	//设置按钮的状态
	void SetState(data1)
	{
		m_state = data1;
		//灰图与彩图的切换
		if (data1 == window.BTN_STATE_GREY)
		{
			OnSetGreyFunc();
			cursor = window.CURSOR_ARROW;
			/*注意这是一个很牛逼的BUG，被孙小东同学发现了规律，在此表扬!
			2009年3月17日 15:53
			*/
//			MIMG.anispeed = -1;//防止按钮图片闪
			SetImgSrc(BTN_IMG_4_GREY);
		}
		else
		{
			OnSetLightFunc();
			cursor = window.CURSOR_HAND;
			SetImgSrc(BTN_IMG_1_NORMAL);
		}
	}

	//删除悬停而加
	void OnDelete()
	{
		if (_btnhover.m_IsOpen)
		{
			window.find("TOPLAYER").find("VBtnHangWnd_UI").del();
		}
	}

	void InitText(data)
	{
		_text.del();//为了保证在换字的时候只有一个text存在
		staticvar _text=new text		//保证text只有在需要的时候才出来所以写在函数里用staticvar来new
		{
			size(parent.m_sizeX,parent.m_sizeY);font="宋体,-1,12";xspace = 0;
			xcenter = true;ycenter = true;color = "#2C1E78";
			//txtborder = "#FFD990";
		}
		_text.src = data;
		InitTextFunc();
	}
	//可以被重载
	//设置在鼠标不同状态下的字体
	void SetTextColor(data)
	{
		switch (data)
		{
		case 1:
			_text.color = "#2C1E78";
			break;
		case 2:
			_text.color = "#7264BE";
			break;
		case 3:
			_text.color = "#7264BE";
			break;
		case 4:
			_text.color = "#939393";
			break;
		}
	}
	void SetTextFont(data)
	{
		_text.font = data;
	}

	//[功能]设置按钮闪-可重载
	//[参数]param:true/false
	void SetFlicker(param)
	{
		if (param)
		{
			m_IsAni = true;
			SetAni(1,1,1,2,10);
			SetImgSrc(BTN_IMG_5_FLASH);
		}
		else
		{
			m_IsAni = false;
			SetImgSrc(BTN_IMG_1_NORMAL);
		}
	}

	void SetImgSrcEx(state)
	{
		//printf("BTN:SetImgSrcEx:state:"+state+"m_BGName:"+m_BGName);
		SetImgSrc(state);
	}
};//end of VBaseButton

//上下移动的按钮
class VBaseMoveBtn_UI VBaseButton
{
//	 m_pos_y = 0;
	var _relatePosFlag = 0;	//相对位置：0为相对左边的位置，1为相对右边的位置,2为相对右下的位置
	var _posX = 0;
	var _posY = 0;
	var _offSetMoveFlag = -1;
	void loop()
	{
		var _num = window.GetSplitCount(GetMoveArr(),",");
		if(_num<=0){return;};
		var _array = window.SplitStr2(GetMoveArr(),",",_num);
		var _index = -1;
		m_isLoop = true;
		while(m_loopSign==1)
		{
			_index+=1;
			if(_index>_num-1){_index=0;}
			ChangeBtnState(toint(_array[_index]));
			_offSetMoveFlag *= -1;
			sleep(GetSleepTime());
		}
	}
	void LogicMouseOverFunc()
	{
		m_loopSign = 1;
		if(m_isLoop == true){return;}
		loop();
	}
	void LogicMouseOutFunc()
	{
		m_loopSign = 0;m_isLoop = false;
		ResetBtnState();
	}
	var m_isLoop = false;
	var m_loopSign = 1;
	void OnSetGreyFunc(){m_loopSign = 0;ResetBtnState();}		//当按钮被设置成灰的时候 重设按钮
	void OnSetLightFunc(){m_loopSign = 1;}						//当按钮被设置成灰的时候 重设按钮
	void ResetBtnState()
	{
		//pos(left,m_pos_y);
		if(_relatePosFlag == 0)
		{
			pos(_posX,_posY);
		}
		if(_relatePosFlag == 1)
		{
			halign(100,-_posX);top = _posY
		}
		if(_relatePosFlag == 2)
		{
			halign(100,-_posX);valign(100,-_posY);
		}
	}					//重新设置按钮状态  这里是pos
	// 段晓彤修改
	var _frmCnt = 0;
	void ChangeBtnState(_y)
	{
		//pos(left,top+_y);
		if(_relatePosFlag == 0)
		{
			pos(left,top+_y);
			return ;
		}
		if(_relatePosFlag == 1)
		{
			pos(left,top+_y);
			return ;
		}
		if(_relatePosFlag == 2)
		{
			_frmCnt = _frmCnt + _y;
			valign(100,-_posY+_frmCnt);
			return ;
			//valign(100,-_posY+_offSetMoveFlag*3);
		}
	}					//改变按钮的状态  这里是改变位置
	

	//设置相对位置标志
	//_flag：0为相对左边的位置，1为相对右边的位置
	void SetRelatePos(_flag)
	{
		_relatePosFlag = _flag;
	}
	//设置pos	pos设置必须调用这个
	void SetPos(_x,_y)
	{	
		_posX = _x;
		_posY = _y;
		//pos(_x,_y);
		staticvar m_pos_y = 0 ;
		if(_relatePosFlag == 0)
		{
			pos(_x,_y);
			m_pos_y = _y;
		}
		if(_relatePosFlag == 1)
		{
			halign(100,-_x);top = _y
			m_pos_y = _y;
		}
		if(_relatePosFlag == 2)
		{
			halign(100,-_x);valign(100,-_y);
			m_pos_y = parent.height-_y;
		}
	}
	//需要重载
	void GetMoveArr(){return "-2,-2,-2,2,2,2";}
	//可以重载
	void GetSleepTime(){return 100;}
};

//按钮下文字类
class VButton_TextImg img
{
	var m_ImgSrc = "";	//记住路径
	var m_IsOpen = false;//0为相应突变的界面未打开，1为已打开
	//设置按钮的图片 
	//参数 state:正常1 鼠标滑过2 按下3 不可点4 闪烁5
	void SetImgSrc(index)
	{
		src = "$./imgs"+window.g_Sex+"/"+m_ImgSrc+index+"-text.tga";
	}

	//[功能]初始化Button函数-原型
	//[参数]fname:文件名
	void Init(fname)
	{
		m_ImgSrc = fname;
		SetImgSrc(1);
	}

	//[接口]外部设值
	//[参数]_index:正常1 鼠标滑过2 按下3 不可点4 闪烁5
	void SetData(_index)
	{
		//printf("BTN1:m_IsOpen:"m_IsOpen);
		//printf("BTN::SetData:_index:"+_index+",m_IsOpen:"+m_IsOpen+",m_ImgSrc:"+m_ImgSrc);
		if (_index.__Long__ > 3 && _index.__Long__ < 1)
		{
			printf("B# Error:VButton_TextImg-无效的索引号:m_ImgSrc:"+m_ImgSrc);
			return;
		}
		
		if(m_IsOpen && _index == 2)
		{
			return;
		}
		SetImgSrc(_index);
	}

	//[接口]外部设值
	//[参数]state:true打开 false关闭
	void SetOpenState(state)
	{
		//printf("BTN::SetOpenState:state:"+state+",m_ImgSrc:"+m_ImgSrc);
		m_IsOpen = state;
		if (m_IsOpen)
		{
			SetImgSrc(3);
		}
		else
		{
			SetImgSrc(1);
		}
	}
};

//旋转按钮
class VBaseRoateBtn_UI VBaseMoveBtn_UI
{
	//可以不调用SetPos(_x,_y)函数
	void ResetBtnState(){m_TopImg.rotate = 0; MIMG.rotate = 0;}			//重新设置按钮状态  这里是角度
	void ChangeBtnState(data){m_TopImg.rotate = data;MIMG.rotate = data;}	//改变按钮的状态  这里是改变角度
	//需要重载
	void GetMoveArr(){return "5,10,5,0,-5,-10,-5,0";}
	//可以重载
	void GetSleepTime(){return 100;}
};

//-----------------------------------------------新------------------------------------------------------
//录像播放
class VBTN_VideoPlay VBaseButton
{
	SetSize(12,13);
	Init("new/VideoRecorder/play");
};
//录像暂停
class VBTN_VideoPause VBaseButton
{
	SetSize(7,13);
	Init("new/VideoRecorder/Pause");
};
//录像停止
class VBTN_VideoStop VBaseButton
{
	SetSize(11,12);
	Init("new/VideoRecorder/Stop");
};
//录像退出
class VBTN_VideoQuit VBaseButton
{
	SetSize(13,12);
	Init("new/VideoRecorder/Quit");
};

//===============公共===================
//关闭
class VBTN_Close_New VBaseButton
{
	SetSize(20,20);
	Init("new/Public_New/close");
};
//帮助
class VBTN_Help_New VBaseButton
{
	SetSize(20,20);
	Init("new/Public_New/help");
};
//大下拉钮
class VBTN_DropBig_New VBaseButton
{
	SetSize(27,26);
	Init("new/Public_New/DropBig");
};
//小下拉钮
class VBTN_DropSmall_New VBaseButton
{
	SetSize(19,19);
	Init("new/Public_New/DropSmall");
};
//向上菜单
class VBTN_UpMenu_New VBaseButton
{
	SetSize(18,19);
	Init("new/Public_New/fs0");
};
//拖动块
class VBTN_DragBtn_New VBaseButton
{
	SetSize(20,14);
	Init("new/Public_New/ht");
};
//左转
class VBTN_TurnLeft_New VBaseButton
{
	SetSize(37,38);
	Init("new/Public_New/z(gai)");
	void MouseOver_Sound(){}
	void MouseUpL_Sound()
	{
		window.PlaySound(133);//松开点击人物形象转身按钮时
	}
	void MouseDownL_Sound()
	{
		window.PlaySound(132);//点击人物形象转身按钮时的声音
	}
//	SetHangID(11);
};
//右转
class VBTN_TurnRight_New VBaseButton
{
	SetSize(37,38);
	Init("new/Public_New/y(gai)");

	void MouseOver_Sound(){}
	void MouseUpL_Sound()
	{
		window.PlaySound(133);//松开点击人物形象转身按钮时
	}
	void MouseDownL_Sound()
	{
		window.PlaySound(132);//点击人物形象转身按钮时的声音
	}
//	SetHangID(12);
};

//标签左翻钮
class VBTN_RadioLeft_New VBaseButton
{
	SetSize(11,13);
	Init("new/Public_New/forward");
};
//标签右翻钮
class VBTN_RadioRight_New VBaseButton
{
	SetSize(11,13);
	Init("new/Public_New/next");
};

//=============背景钮==============
//A
class VBTN_A_New VBaseButton
{
	SetSize(78,24);
	Init("new/BK_New/A");
	void InitTextFunc()
	{
//		set _text
//		{
//			bold = true;
//		}
	}
	void SetTextColor(data)
	{
		switch (data)
		{
		case 1:
			_text.color = "#2C1E78";
			break;
		case 2:
			_text.color = "#7264BE";
			break;
		case 3:
			_text.color = "#7264BE";
			break;
		case 4:
			_text.color = "#939393";
			break;
		}
	}
	void LogicMouseOverFunc()
	{
		Flash(true);
	}
	void LogicMouseOutFunc()
	{
		Flash(false);
	}
	void OnSetGreyFunc()
	{
		Flash(false);
	}

	staticvar m_img = new VFlicker_A_UI{pos = "0,8";SetState(window.FLICKER_FLICKER);show = false;}
	void Flash(param)
	{
		if (param==true)
		{
			m_img.show = true;
		}
		else
		{
			m_img.show = false;
		}
	}
};
// add by chenjihui
// 2011-1-4
// bk 94
class VBTN_94_New VBaseButton
{
	SetSize(94,24);
	Init("new/BK_New/A");
	void InitTextFunc()
	{
//		set _text
//		{
//			bold = true;
//		}
	}
	void SetTextColor(data)
	{
		switch (data)
		{
		case 1:
			_text.color = "#2C1E78";
			break;
		case 2:
			_text.color = "#7264BE";
			break;
		case 3:
			_text.color = "#7264BE";
			break;
		case 4:
			_text.color = "#939393";
			break;
		}
	}
	void LogicMouseOverFunc()
	{
		Flash(true);
	}
	void LogicMouseOutFunc()
	{
		Flash(false);
	}
	void OnSetGreyFunc()
	{
		Flash(false);
	}

	staticvar m_img = new VFlicker_A_UI{pos = "0,8";SetState(window.FLICKER_FLICKER);show = false;}
	void Flash(param)
	{
		if (param==true)
		{
			m_img.show = true;
		}
		else
		{
			m_img.show = false;
		}
	}
};
//bk 37
class VBTN_37_New VBaseButton
{
	SetSize(37,18);
	Init("new/BK_New/xk");
	void SetTextColor(data)
	{
		switch (data)
		{
		case 1:
			_text.color = "#2C1E78";
			break;
		case 2:
			_text.color = "#7264BE";
			break;
		case 3:
			_text.color = "#7264BE";
			break;
		case 4:
			_text.color = "#939393";
			break;
		}
	}
	void InitTextFunc()
	{
		set _text
		{
			if(parent.m_state==window.BTN_STATE_GREY){color = "#676767";}
			else{}
		}
	}
};
//bk 43
class VBTN_43_New VBTN_37_New
{
	SetSize(43,18);
	Init("new/BK_New/xan0");
};
//bk 58
class VBTN_58_New VBTN_37_New
{
	SetSize(58,18);
	Init("new/BK_New/bk_58_");
};
//B
class VBTN_B_New VBaseButton
{
	SetSize(19,19);
	Init("new/BK_New/B");
};
//观战
class VBTN_ViewGame_New VBTN_37_New
{
	SetSize(35,17);
	Init("new/BK_New/ViewGame");
};

//================PageCtrl=============
//大 前
class VBTN_forward_New VBaseButton
{
	SetSize(19,19);
	Init("new/PageCtrl_New/fyz0");
};
//大 后
class VBTN_next_New VBaseButton
{
	SetSize(19,19);
	Init("new/PageCtrl_New/fyy0");
};
//小 前
class VBTN_smallForward_New VBaseButton
{
	SetSize(19,14);
	Init("new/PageCtrl_New/z0");
};
//小 后
class VBTN_smallNext_New VBaseButton
{
	SetSize(19,14);
	Init("new/PageCtrl_New/y0");
};
//右
class VBTN_CreateRoomRight_New VBaseButton
{
	SetSize(20,21);
	Init("new/PageCtrl_New/right");
};
//左
class VBTN_CreateRoomLeft_New VBaseButton
{
	SetSize(20,21);
	Init("new/PageCtrl_New/left");
};

//==============scroll=====================
//小 向上
class VBTN_ScrollUp_New VBaseButton
{
	SetSize(13,14);
	Init("new/Scroll_New/anxs0");
};
//小 向下
class VBTN_ScrollDown_New VBaseButton
{
	SetSize(13,14);
	Init("new/Scroll_New/anxx0");
};
//大 向上
class VBTN_BigScrollUp_New VBaseButton
{
	SetSize(26,26);
	Init("new/Scroll_New/big_up");
};
//大 向下
class VBTN_BigScrollDown_New VBaseButton
{
	SetSize(26,26);
	Init("new/Scroll_New/big_down");
};

//================商城=====================
//购物车
class VBTN_Mall_ShoppingBag_New VBTN_B_New
{
	SetSize(19,19);
	Init("new/Mall_New/ShoppingBag",BTN_TEXT);
};

//充值
class VBTN_Mall_addmoney_New VBTN_37_New
{
	SetSize(76,46);//SetTextFont("宋体,-1,16");
	Init("new/Mall_New/addmoney");
	void InitTextFunc()
	{
		set _text
		{
			if(parent.m_state==window.BTN_STATE_GREY){color = "#676767";}
			else{}
			font = "宋体,-1,14";
			pos = "16,0";
		}
	}
	InitText("充值");
};
//上一件
class VBTN_Mall_forward_New VBaseButton
{
	SetSize(49,47);
	Init("new/Mall_New/forward");
};
//下一件
class VBTN_Mall_next_New VBaseButton
{
	SetSize(49,47);
	Init("new/Mall_New/next");
};
//还原形象
class VBTN_Mall_recover_New VBaseButton
{
	SetSize(49,47);
	Init("new/Mall_New/recover");
};
//从购物车删除
class VBTN_Mall_del_New VBaseButton
{
	SetSize(49,47);
	Init("new/Mall_New/delete");
};
//精品区进入按钮
class VBTN_Mall_NiceShoppingTypeEnter VBaseButton
{
	SetSize(298,440);
	Init("new/Mall_New/jp");
}
//休闲区进入按钮
class VBTN_Mall_ComfortShoppingTypeEnter VBaseButton
{
	SetSize(298,440);
	Init("new/Mall_New/xx");
}
//前往精品区
class VBTN_Mall_GoNiceShopping VBaseButton
{
	SetSize(42,126);
	Init("new/Mall_New/qwjpq0");
}
//前往休闲区
class VBTN_Mall_GoComfortShopping VBaseButton
{
	SetSize(42,126);
	Init("new/Mall_New/qwxxq0");
}

//=================聊天====================
//表情
class VBTN_ChatBrow_New VBaseButton
{
	SetSize(20,19);
	Init("new/Chat_New/bq0");
};
class VBTN_ShortCut VBaseButton
{
	SetSize(18,18);
	Init("new/ShotCut/KJJ0");
	SetState(window.BTN_STATE_GREY);
};
//互动表情
class VBTN_ChatActionBrow_New VBaseButton
{
	SetSize(20,19);
	Init("new/Chat_New/jh0");
};
//隐藏
class VBTN_HideChat_New VBaseButton
{
	SetSize(20,19);
	Init("new/Chat_New/xx0");
};
//显示
class VBTN_ShowChat_New VBaseButton
{
	SetSize(20,19);
	Init("new/Chat_New/xs0");
};
//喇叭
class VBTN_Chat_Speaker_New VBTN_37_New
{
	SetSize(58,18);
	Init("new/Chat_New/Speaker");
	void InitTextFunc()
	{
		set _text
		{
			if(parent.m_state==window.BTN_STATE_GREY){color = "#676767";}
			else{}
			xcenter = false;
			drawstartx = 30;
		}
	}
};

//=================游戏大厅 房间列表====================
//创建
class VBTN_Hall_Create_New VBaseButton
{
	SetSize(98,87);
	Init("new/Hall/Create");
};
//查找
class VBTN_Hall_find_New VBaseButton
{
	SetSize(98,87);
	Init("new/Hall/find");
};
//单打
class VBTN_Hall_One_New VBaseButton
{
	SetSize(98,87);
	Init("new/Hall/One");
};
//双打
class VBTN_Hall_Two_New VBaseButton
{
	SetSize(98,87);
	Init("new/Hall/Two");
};

//=================游戏大厅 下部====================
//菜单
class VBTN_Hall_Menu_New VBaseMoveBtn_UI
{
	SetSize(82,72);
	Init("new/HallBottom/zcd0");
	void OnOpen(){Init("new/HallBottom/zcd0_");}
	void OnClose(){Init("new/HallBottom/zcd0");}
};
//排行榜
class VBTN_Hall_TopList_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/phb0");
	void OnOpen(){Init("new/HallBottom/phb0_");}
	void OnClose(){Init("new/HallBottom/phb0");}
};
//商城
class VBTN_Hall_Mall_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/sc0");
	void OnOpen(){Init("new/HallBottom/sc0_");}
	void OnClose(){Init("new/HallBottom/sc0");}
};
//好友
class VBTN_Hall_friend_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/hy0");
	void OnOpen(){Init("new/HallBottom/hy0_");}
	void OnClose(){Init("new/HallBottom/hy0");}
};
//玩家列表
class VBTN_Hall_playerList_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/wjlb0");
	void OnOpen(){Init("new/HallBottom/wjlb0_");}
	void OnClose(){Init("new/HallBottom/wjlb0");}
};
//家族
class VBTN_Hall_Family_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/jz0");
	void OnOpen(){Init("new/HallBottom/jz0_");}
	void OnClose(){Init("new/HallBottom/jz0");}
};
//游戏大厅
class VBTN_Hall_Hall_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/yxs0");
	void OnOpen(){Init("new/HallBottom/yxs0_");}
	void OnClose(){Init("new/HallBottom/yxs0");}
};
//训练
class VBTN_Hall_Train_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/xl0");
	void OnOpen(){Init("new/HallBottom/xl0_");}
	void OnClose(){Init("new/HallBottom/xl0");}
};
//任务
class VBTN_Hall_Task_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/rw0");
	void OnOpen(){Init("new/HallBottom/rw0_");}
	void OnClose(){Init("new/HallBottom/rw0");}
};
//活动场
class VBTN_Hall_activity_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/hdc0");
	void OnOpen(){Init("new/HallBottom/hdc0_");}
	void OnClose(){Init("new/HallBottom/hdc0");}
};
//录像
class VBTN_Hall_Movie_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/lx0");
	void OnOpen(){Init("new/HallBottom/lx0_");}
	void OnClose(){Init("new/HallBottom/lx0");}
};
//邮件
class VBTN_Hall_mail_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/yj0");
	void OnOpen(){Init("new/HallBottom/yj0_");}
	void OnClose(){Init("new/HallBottom/yj0");}
};
//角色信息
class VBTN_Hall_role_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/grxx0");
	void OnOpen(){Init("new/HallBottom/grxx0_");}
	void OnClose(){Init("new/HallBottom/grxx0");}
};
//背包
class VBTN_Hall_pack_New VBaseMoveBtn_UI
{
	SetSize(68,62);
	Init("new/HallBottom/bb0");
	void OnOpen(){Init("new/HallBottom/bb0_");}
	void OnClose(){Init("new/HallBottom/bb0");}
};
//观战列表
class VBTN_Hall_viewList_New VBaseMoveBtn_UI
{
	SetSize(70,54);
	Init("new/HallBottom/gzlb0");
	SetState(window.BTN_STATE_GREY);
	void OnOpen(){Init("new/HallBottom/gzlb0_");}
	void OnClose(){Init("new/HallBottom/gzlb0");}
};
//更换队伍
class VBTN_Hall_ChangeTeam_New VBaseMoveBtn_UI
{
	SetSize(70,54);
	Init("new/HallBottom/ghdw0");
	void OnOpen(){Init("new/HallBottom/ghdw0_");}
	void OnClose(){Init("new/HallBottom/ghdw0");}
};
//邀请玩家
class VBTN_Hall_Invite_New VBaseMoveBtn_UI
{
	SetSize(70,54);
	Init("new/HallBottom/yqwj0");
	void OnOpen(){Init("new/HallBottom/yqwj0_");}
	void OnClose(){Init("new/HallBottom/yqwj0");}
};
//房间设置
class VBTN_Hall_RomeSet_New VBaseMoveBtn_UI
{
	SetSize(70,56);
	Init("new/HallBottom/fjsz0");
	void OnOpen(){Init("new/HallBottom/fjsz0_");}
	void OnClose(){Init("new/HallBottom/fjsz0");}
};
//游戏开始
class VBTN_GameStart_New VBaseRoateBtn_UI
{
	SetSize(112,104);
	Init("new/HallBottom/ksyx0");

	void LogicMouseOverFunc()
	{
		Flash(true);
	}
	void LogicMouseOutFunc()
	{
		Flash(false);
	}
	void OnSetGreyFunc()
	{
		Flash(false);
	}

	staticvar m_img = new VFlicker_GameStart
	{
		pos = "0,0";
		SetState(window.FLICKER_FLICKER);show = false;
	}
	void Flash(param)
	{
		if (param==true)
		{
			m_img.show = true;
		}
		else
		{
			m_img.show = false;
		}
	}
};
//游戏准备
class VBTN_GamePrepare_New VBaseRoateBtn_UI
{
	SetSize(112,104);
	Init("new/HallBottom/zb0");

	void LogicMouseOverFunc()
	{
		Flash(true);
	}
	void LogicMouseOutFunc()
	{
		Flash(false);
	}
	void OnSetGreyFunc()
	{
		Flash(false);
	}

	staticvar m_img = new VFlicker_GamePrepare
	{
		pos = "0,0";
		SetState(window.FLICKER_FLICKER);show = false;
	}
	void Flash(param)
	{
		if (param==true)
		{
			m_img.show = true;
		}
		else
		{
			m_img.show = false;
		}
	}
};
//取消准备
class VBTN_CancelPrepare_New VBaseRoateBtn_UI
{
	SetSize(112,104);
	Init("new/HallBottom/qxyx0");
	void LogicMouseOverFunc()
	{
		Flash(true);
	}
	void LogicMouseOutFunc()
	{
		Flash(false);
	}
	void OnSetGreyFunc()
	{
		Flash(false);
	}

	staticvar m_img = new VFlicker_CancelPrepare
	{
		pos = "0,0";
		SetState(window.FLICKER_FLICKER);show = false;
	}
	void Flash(param)
	{
		if (param==true)
		{
			m_img.show = true;
		}
		else
		{
			m_img.show = false;
		}
	}
};

//===================================大厅和登录上边的按钮===================================
//游戏设置
class VBTN_GameSet_New VBaseButton
{
	SetSize(14,14);
	Init("new/TopBTN/sz0");
};
//小充值
class VBTN_SmallAddMondy_New VBaseButton
{
	SetSize(14,14);
	Init("new/TopBTN/cz0");
};
//帮助
class VBTN_SmallHelp_New VBaseButton
{
	SetSize(14,14);
	Init("new/TopBTN/yw0");
};
//返回
class VBTN_SmallRetrun_New VBaseButton
{
	SetSize(14,14);
	Init("new/TopBTN/fh0");
};

//修改密码
class VBTN_changePassword_Login_New VBaseButton
{
	SetSize(72,19);
	Init("new/TopBTN_Login/changePassword");
};
//注册账号
class VBTN_LoggingIn_Login_New VBaseButton
{
	SetSize(72,19);
	Init("new/TopBTN_Login/LoggingIn");
};
//小充值
class VBTN_AddMondy_Login_New VBaseButton
{
	SetSize(46,20);
	Init("new/TopBTN_Login/addmoney");
};
//退出
class VBTN_Exit_Login_New VBaseButton
{
	SetSize(46,20);
	Init("new/TopBTN_Login/exit");
};

//显示 隐藏
class VBTN_ShowHide_New VBTN_37_New
{
	SetSize(26,87);
	Init("new/HallBottom/ShowHide");

	void InitTextFunc()
	{
		set _text
		{
			pos = "7,0";size = "20,87";autoenter = true;
		}
	}
};

//=================================录像播放器=====================================
//播放
class VBTN_video_play_New VBaseButton
{
	SetSize(28,27);
	Init("new/VideoRecorder/return");
};
//播放
class VBTN_video_stop_New VBaseButton
{
	SetSize(23,22);
	Init("new/VideoRecorder/stop");
};
//播放
class VBTN_video_exit_New VBaseButton
{
	SetSize(23,25);
	Init("new/VideoRecorder/exit");
};
//===============================房间队伍列表=====================================
//角色信息
class VBTN_RoleInfo_New VBaseButton
{
	SetSize(21,22);
	Init("new/Room/roleInfo");
};

//加为好友
class VBTN_AddFriend_New VBaseButton
{
	SetSize(19,18);
	Init("new/Room/addFriend");
};
//私聊
class VBTN_PrivateChat_New VBaseButton
{
	SetSize(21,17);
	Init("new/Room/privateChat");
};
//赠花
class VBTN_PresentFlower_New VBaseButton
{
	SetSize(15,16);
	Init("new/Room/presentFlower");
};
//动作
class VBTN_Action_New VBaseButton
{
	SetSize(20,18);
	Init("new/Room/action");
};

//踢
class VBTN_Kick_New VBaseButton
{
	SetSize(11,11);
	Init("new/Room/kick");
};
//隐藏活动中排行	夏洋洋添加于2009-12-26
class VBTN_HideTop_New VBaseButton
{
	SetSize(21,61);
	Init("new/ShowOrHideTop/h0");
};
//显示活动中排行	夏洋洋添加于2009-12-26
class VBTN_ShowTop_New VBaseButton
{
	SetSize(21,61);
	Init("new/ShowOrHideTop/yc0");
};
//===========================家族=================================================
class VBTN_Family_Family_Single VBaseButton
{
	SetSize(110,79);
	Init("new/Family/jzgrs0");
}
class VBTN_Family_Family_other VBaseButton
{
	SetSize(110,79);
	Init("new/Family/w0");
}
class VBTN_Family_Family_both VBaseButton
{
	SetSize(110,79);
	Init("new/Family/jzgrs0");
}
//情侣信息-房间玩家列表小按钮
class VBTN_LoverInfo_Little VBaseButton
{
	SetSize(21,22);
	Init("new/Room/qlxtb0");
};

//================隐藏弹出按钮====================
//add by chenjihui
//2011-7-14
class VBTN_Game_Pop VBaseButton
{
	SetSize(20,25);
	Init("new/showorhidetop/pop0");
}
class VBTN_Game_Push VBaseButton
{
	SetSize(20,25);
	Init("new/showorhidetop/push0");
}
