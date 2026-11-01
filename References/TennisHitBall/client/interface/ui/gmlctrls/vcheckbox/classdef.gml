//复选控件
//yxf 2008年12月11日

//CheckBox的切图要求
//类型：文字与底图分开 / 文字与底图一起
//数量：1张(不显示1 按下3)	2张(正常1 按下3) 
//		3张(正常1 鼠标滑过2 按下3) 4张(正常1 鼠标滑过2 按下3 不可点4)
//其他支持：可支持动画

class VBaseCheckBox VN2CheckBox 
{
	capturemouse = true;cursor = window.CURSOR_HAND;

	var m_BGName = "";			//底图的文件名
	var	m_TopName = "";			//文字的文件名

	var m_iType = -1;			//类型(1:文字0:底图)
	var m_IsCheck = false;		//标识是否被中 
	var m_Num = 0;				//切图的数量

	var m_IsAni = false;		//是否是动画
	var m_sizeX = 0;			//图像宽度
	var m_sizeY = 0;			//图像高度
	//动画Radio变量
	var m_YFrame1 = -1;
	var m_YFrame2 = -1;
	var m_YFrame3 = -1;
	var m_AniSpeed;
	//是不是灰掉
	var m_isLight = 1;

	void SetGrey()
	{
		s_CaptureItem.del();
		staticvar s_CaptureItem = new item{bgcolor="#aaaaaa";alpha=50;zindex="top";capturemouse=true;size(parent.height,parent.height);}
		m_isLight = 0;
	}
	void SetLight()
	{
		m_isLight = 1;
		s_CaptureItem.del();
	}
	void GetState()
	{
		return m_isLight;
	}

	//设置Radio的图片
	//参数 state:不显示0 正常1 鼠标滑过2 按下3 不可点4
	void SetImgSrc(state)
	{
		if (m_iType == 1)
		{
			if (m_Num == 1)
			{
				if (!m_IsCheck){m_TopImg.show = false;}
				m_TopImg.src = "$./imgs"+window.g_Sex+"/"+m_TopName+"3.tga";
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+"3.tga";
			}
			else
			{
				m_TopImg.src = "$./imgs"+window.g_Sex+"/"+m_TopName+state+".tga";
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+state+".tga";
			}
			return;
		}
		if (m_iType == 0)
		{
			if (m_Num == 1)
			{
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+"3.tga";
			}
			else
			{
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+state+".tga";
			}
			if (!m_IsAni){return;}
			if (state == 1)
			{
				if (m_YFrame1 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame1);MIMG.anispeed = m_AniSpeed;
			}
			if (state == 2)
			{
				if (m_YFrame2 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame2);MIMG.anispeed = m_AniSpeed;
			}
			if (state == 3)
			{
				if (m_YFrame3 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame3);MIMG.anispeed = m_AniSpeed;
			}
			return;
		}
	}

	//初始化Radio函数
	//fname:文件名,type:类型(1:文字0:底图),num 数量(1,2,3,4)isani:是否是动画)
	void Init(fname,type,num,isani)
	{
		m_Num = num;
		m_iType = type;
		m_IsAni = isani;
		if (type == 0)
		{
			m_BGName = fname;
		}
		if (type == 1)
		{
			staticvar m_TopImg = new img{}	//上面的文字
			m_TopName = fname;
		}
		SetImgSrc(1);
	}
	//设置动画图片参数(yFrame1:普通状态下,yFrame2:鼠标over状态,yFrame3:鼠标按下,speed:速度)
	void SetAni(yFrame1,yFrame2,yFrame3,speed)
	{
		m_YFrame1 = yFrame1;
		m_YFrame2 = yFrame2;
		m_YFrame3 = yFrame3;
		m_AniSpeed = speed;
	}
	//设置图片大小
	void SetSize(x,y)
	{
		m_sizeX = x;
		m_sizeY = y;
		size(x,y);
	}
	void OnMouseOver()
	{
		if(!GetState()){return;}
		if (m_IsCheck){return;}
		if (m_Num < 3){return;}
		SetImgSrc(2);//显示的换图片
	}
	void OnMouseOut()
	{
		if(!GetState()){return;}
		if (m_IsCheck){return;}
		if (m_Num < 3){return;}
		SetImgSrc(1);//显示的换图片
	}

	void MouseCheck()
	{
		m_IsCheck = true;
		if (m_Num == 1)
		{
			m_TopImg.show = true;
		}
		SetImgSrc(3);
	}//子类OnClick需要调用此函数
	void MouseUnCheck()
	{
		m_IsCheck = false;
		if (m_Num == 1)
		{
			m_TopImg.show = false;
		}
		SetImgSrc(1);
	}//子类OnClick需要调用此函数

	//void OnCheck_Sound(){window.PlaySound(131);}-暂时没有音效

	//返回Radio的状态-是否被选中
	void GetChecked(){return m_IsCheck;}
};

////////////////////////////////////////////////////////////////////////////////////////////

//√
class VCK_Gou_Bk_UI VBaseCheckBox
{
	SetSize(23,23);
	Init("Chbox/bk",0,1,false);
};

class VCK_Gou_UI VCK_Gou_Bk_UI
{
	SetSize(23,23);
	Init("Chbox/gou",1,1,false);
};

//这个就是替换以前的VRmPsd_UI
class VRmPsd_UI VCK_Gou_Bk_UI
{
	SetSize(23,23);
	Init("Chbox/gou",1,1,false);
};

//聊天表情
class VCK_ChatBrow_UI VBaseCheckBox
{
	SetSize(22,22);
	Init("Chat/face",0,3,false);
};

/*
//记住密码-已经废弃了2008年12月11日 yxf
class VRmPsd_UI VN2CheckBox
{
	cursor = window.CURSOR_HAND;
	
	var _bck = 0;		//是否已选择

	var _UpImg = new img{}	//前景

	void IsCheck(){return _bck;}
	
	MIMG.src = "$./imgs"+window.g_Sex+"/Chbox/bk3.tga";
	_UpImg.src = "$./imgs"+window.g_Sex+"/Chbox/gou3.tga";

	_UpImg.show = false;

	void MouseCheck(){_UpImg.show = true;_bck = 1;}
	void MouseUnCheck(){_UpImg.show = false;_bck = 0;}
};
*/

//============================================新========================================
//√
class VCK_CK_BK_New VBaseCheckBox
{
	SetSize(16,16);
	Init("new/ck_bk",0,1,false);
};

class VCK_CK_New VCK_CK_BK_New
{
	SetSize(16,16);
	Init("new/ck",1,1,false);
};