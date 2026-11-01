//攻击伤害
class VMyOneNum_New_UI img
{
	var m_isType = 0;
	var m_PosIndex=0;
	var m_LastPercent = 100;
	//data 数字  type 属性 baoji 暴击
	void SetData(data,type,baoji)
	{
		killtimer("timer_num");
		killtimer("timer_pos");
		killtimer("timer_size");
		if(type>0){src="$./imgs/icon"+type+".tga";pos(0,(parent.height-height)/2);m_isType=1;}
		else
		{
//			if(baoji){src="$./imgs/pointP2.tga";}
//			else{src="$./imgs/pointP1.tga";}
			if ( toint(baoji) == 0 )
			{ baoji =2;
			}
			src="$./imgs/pointP"+baoji+".tga";
			clipani(parent.m_NumRealWidth,parent.m_NumRealHeight,1,10);
			aniindex(data);
		}
	}
	void Start()
	{
		runPos(5,50,200,"");
//		RunAlpha(1,100,600,"");
	}
	//开始的百分比 结束的百分比 用的时间 结束时运行的函数名
	void runPos(_percent1,_percent2,_time,_endFunc)
	{
		var _x=0;
		var _y=top*_percent2/100;
		if(!m_isType)
		{
			m_LastPercent=width*100/parent.m_NumRealWidth;
			if(parent.m_type>0)
			{
				_x=(parent.m_NumWidth*m_PosIndex+parent.m_typeImgWidth-parent.m_extraWidth)*_percent2/100*m_LastPercent/100;
			}
			else
			{
				_x=parent.m_NumWidth*m_PosIndex*_percent2/100*m_LastPercent/100;
			}
		}
		var _w=width*_percent2/100;
		var _h=height*_percent2/100;

		var __xsize=width*_percent1/100;
		var __ysize=height*_percent1/100;
		var __xpos = 0;
		var __ypos = top*_percent2/100;
		if(!m_isType)
		{
			if(parent.m_type>0)
			{
				__xpos=(parent.m_NumWidth*m_PosIndex+parent.m_typeImgWidth-parent.m_extraWidth)*_percent1/100*m_LastPercent/100;
			}
			else
			{
				__xpos=parent.m_NumWidth*m_PosIndex*_percent1/100*m_LastPercent/100;
			}
		}

		setParamTimer("pos",""+__xpos+","+__ypos,""+_x+","+_y,_time,0,"","timer_pos");
		setParamTimer("size",""+__xsize+","+__ysize,""+_w+","+_h,_time,0,_endFunc,"timer_size");
	}
	//开始的透明度 结束的透明度 用的时间 结束时运行的函数名
	void RunAlpha(_start,_end,_time,_endFunc)
	{
		setParamTimer("alpha" , _start , _end , _time , 0 , _endFunc , "timer_num");
	}
	void HideSelf()
	{
		show = false;
	}
	void SetPos1(_PosIndex)//没属性时用的
	{
		pos(parent.m_NumWidth*_PosIndex,0);
		m_PosIndex = _PosIndex;
		Start();
	}
	void SetPos2(_PosIndex,type)//有属性时用的
	{
		m_PosIndex = _PosIndex;
		if(type==0)
			pos(parent.m_typeImgWidth-parent.m_extraWidth+parent.m_NumWidth*_PosIndex,0);
		Start();
	}
};
class VOneFightInfoNum_New item		//包括 属性符号和数字
{
	var m_typeImgWidth=0;//属性图片的宽度
	var m_NumRealWidth = 66;//一个数字的真正的宽度
	var m_NumRealHeight = 66;//一个数字的真正的高度
	var m_NumWidth=10;//一个数字的显示宽度
	var m_MaxZoom=50;//最大的缩放 80就是80%

	var m_FuncName="VMyOneNum_New_UI";

	var m_extraWidth = (m_NumRealWidth-m_NumWidth)/2;

	//inclass("ZoomFuncClass");
	var m_type=0;

	//返回data的某一位的数字 _zeroNum从0开始 0代表个位
	void GetNum(data,_zeroNum)
	{
		var _i=1;
		var _j = 0;
		while(_j<_zeroNum)
		{
			_i = _i*10;
			_j += 1;
		}
		return (data/_i)%10;
	}
	//data 数字  baoji 暴击 type 属性 _pos在屏幕中的位置
	void SetData(data,type,baoji,_pos)
	{
		m_extraWidth = (m_NumRealWidth-m_NumWidth)/2;
		m_type=type;

		var _count = (""+data).Count;
		staticvar _num = 0;
		var _i=_count;
		if(type<1)
		{
			size(_count*m_NumWidth+2*m_extraWidth,m_NumRealHeight);
			SetPos(_pos);
			while (_i>0)
			{
				vml("_num = GetNum("+data+","+(_i-1)+");");
				vml("new "+m_FuncName+"{SetData("+_num+",0,"+baoji+");SetPos1("+(_count-_i)+",0);}");
				_i -= 1;
			}
		}
		else
		{
			size(m_typeImgWidth+_count*m_NumWidth+m_extraWidth,m_NumRealHeight);
			SetPos(_pos);
			while (_i>0)
			{
				vml("_num = GetNum("+data+","+(_i-1)+");");
				vml("new "+m_FuncName+"{SetData("+_num+",0,"+baoji+");SetPos2("+(_count-_i)+",0);}");
				_i -= 1;
			}
			vml("new "+m_FuncName+"{SetData(0,"+type+","+baoji+");SetPos2(0,"+type+");}");
		}
		Start();
	}
	void runPos(_percent1,_percent2,_time,_moveY,_endFunc)
	{
		var _w=width*_percent2/100;
		var _h=height*_percent2/100;
		var _x=left-(_w-width)/2;
		var _y=top-(_h-height)/2;
		var __xsize=width*_percent1/100;
		var __ysize=height*_percent1/100;
		var __xpos = left-(__xsize-width)/2;
		var __ypos = top-(__ysize-height)/2;

		setParamTimer("pos",""+__xpos+","+__ypos,""+_x+","+(_y+_moveY),_time,0,"","timer_pos");
		setParamTimer("size",""+__xsize+","+__ysize,""+_w+","+_h,_time,0,_endFunc,"timer_size");
	}
	void SetPos(_pos)
	{
		pos=_pos;
		var _left=left-width/2;
		if(m_MaxZoom!=100)
		{
			if(left-toint(width*m_MaxZoom/100/2)<0)
			{
				_left=-toint(width*(100-m_MaxZoom)/100/2);
			}
			else
			{
//				bgcolor="#FF0000";
				if(left+toint(width*m_MaxZoom/100/2)>window.width)
				{
					_left = toint(window.width-width/2-width*m_MaxZoom/100/2);
//					bgcolor="#FFff00";
				}
			}
		}
		pos(_left,top-height/2);
	}
};
//==================================================/单个数字的函数/=================================================================
//如果一段时间内打算什么也不干 用 sleep(300);//毫秒
//开始的百分比(5就是5%) 结束的百分比 用的时间 结束时运行的函数名（每次计算都以当前的大小为100%）
//runPos(5,50,200,"run1");

//开始的透明度 结束的透明度 用的时间 结束时运行的函数名
//RunAlpha(1,100,1000,"");

//	void Start()
//	{
//		runPos(5,60,300,"run1");
//		RunAlpha(1,100,1000,"");
//	}
//	void run1()
//	{
//		RunAlpha(1,100,1000,"");
//	}
//	void run2()
//	{
//		sleep(300);
//		run3();
//	}
//	void run3()
//	{
//		del();
//	}
//===================================================================================================================
//=================================================/总框的函数/==================================================================
//开始的百分比(5就是5%) 结束的百分比 用的时间 y方向移动的距离 结束时运行的函数名（每次计算都以当前的大小为100%）
//runPos(5,50,200,-100,"");
//如果一段时间内打算什么也不干 用 sleep(300);//毫秒
//===================================================================================================================

//普通攻击单个数字
class VMyOneNum_Normal_UI VMyOneNum_New_UI
{
	void Start()
	{
		runPos(100,150,100,"run1");
	}
	void run1()
	{
		runPos(100,62.5,40,"run2");
	}
//	void run2()
//	{
//		runPos(100,150,10,"run3");
//	}
//	void run3()
//	{
//		runPos(100,75,15,"run4");
//	}
//	void run4()
//	{
//		sleep(180);
//		run5();
//	}
//	void run5()
//	{
//		runPos(100,80,200,"");
//		RunAlpha(1,100,160,"");
//	}
//	void run5()
//	{
//		
//	}
};

//普通攻击的总体框
class VOneFightInfoNum_Normal VOneFightInfoNum_New
{
	m_typeImgWidth=0;//属性图片的宽度
	m_NumRealWidth = 30;//一个数字的真正的宽度
	m_NumRealHeight =35;//一个数字的真正的高度
	m_NumWidth=25;		//一个数字的显示宽度
	m_FuncName="VMyOneNum_Normal_UI";
	m_MaxZoom=100;//最大的缩放 80就是80%
	void Start()
	{
		runPos(100,150,100,0,"run1");
	}
	void run1()
	{
		runPos(100,62.5,40,0,"run2");
	}
	void run2()
	{
//		sleep(180);
//		del();
	}
//	void run2()
//	{
//		runPos(100,150,10,0,"run3");
//	}
//	void run3()
//	{
//		runPos(100,75,15,0,"run4");
//	}
//	void run4()
//	{
//		sleep(180);
//		run5();
//	}
//	void run5()
//	{
//		runPos(100,80,200,-50,"run6");
//	}
//	void run6()
//	{
//		del();
//	}
};

////暴击 单个数字
//class VMyOneNum_Baoji_UI VMyOneNum_New_UI
//{
//	void Start()
//	{
//		runPos(10,50,25,"run1");
//	}
//	void run1()
//	{
//		runPos(100,230,10,"run2");
//	}
//	void run2()
//	{
//		runPos(100,80,30,"run3");
//	}
//	void run3()
//	{
//		runPos(100,125,40,"run4");
//	}
//	void run4()
//	{
//		runPos(100,80,30,"run5");
//	}
//	void run5()
//	{
//		sleep(120);
//		run6();
//	}
//	void run6()
//	{
//		runPos(100,90,120,"");
//		RunAlpha(1,100,120,"");
//	}
//};
////暴击 总体框
//class VOneFightInfoNum_Baoji VOneFightInfoNum_New
//{
//	m_typeImgWidth=44;//属性图片的宽度
//	m_NumRealWidth = 60;//一个数字的真正的宽度
//	m_NumRealHeight = 57;//一个数字的真正的高度
//	m_NumWidth=40;		//一个数字的显示宽度
//	m_FuncName="VMyOneNum_Baoji_UI";
//	m_MaxZoom=80;//最大的缩放 80就是80%
//	void Start()
//	{
//		runPos(10,50,25,-30,"run1");
//	}
//	void run1()
//	{
//		runPos(100,230,10,-20,"run2");
//	}
//	void run2()
//	{
//		runPos(100,80,30,0,"run3");
//	}
//	void run3()
//	{
//		runPos(100,125,40,0,"run4");
//	}
//	void run4()
//	{
//		runPos(100,80,30,0,"run5");
//	}
//	void run5()
//	{
//		sleep(120);
//		run6();
//	}
//	void run6()
//	{
//		runPos(100,90,120,-30,"run7");
//	}
//	void run7()
//	{
//		del();
//	} 
//};
