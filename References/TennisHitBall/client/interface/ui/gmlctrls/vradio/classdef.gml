//单选控件
//yxf 2008年12月2日

//Radio的切图要求
//类型：文字与底图分开 / 文字与底图一起
//数量：1张(不显示1 按下3)	2张(正常1 按下3) 
//		3张(正常1 鼠标滑过2 按下3) 4张(正常1 鼠标滑过2 按下3 不可点4)
//其他支持：可支持动画

class VBaseRadio VN2Radio 
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

	var m_IsCheck = false;		//标识是否被中 
	var m_Num = 0;				//切图的数量

	var m_IsAni = false;		//是否是动画
	var m_sizeX = 0;			//图像宽度
	var m_sizeY = 0;			//图像高度
	var m_posX = 0;
	var m_posY = 0; 
	
	//动画Radio变量
	var m_YFrame1 = -1;
	var m_YFrame2 = -1;
	var m_YFrame3 = -1;
	var m_YFrame5 = -1;
	var m_AniSpeed;

	var m_State = window.BTN_STATE_LIGHT; //标签可以按的状态

	var m_SoundType = 0;	//按下的声音类型 0是默认 1是大厅下面的长得像按钮的Radio

	//设置Radio的图片
	//参数 state:不显示0 正常1 鼠标滑过2 按下3 不可点4
	void SetImgSrc(state)
	{
		SetTextColor(state);
		MIMG.anispeed = -1;//防止按钮图片闪
		if (m_iType == 0)//类型(1:文字0:底图)
		{
			if (m_Num == 1)
			{
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+"3.tga";
				return;
			}

			MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+state+".tga";

			if (!m_IsAni){return;}
			if (state == BTN_IMG_1_NORMAL)
			{
				if (m_YFrame1 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame1);MIMG.anispeed = m_AniSpeed;
			}
			if (state == BTN_IMG_2_OVER)
			{
				if (m_YFrame2 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame2);MIMG.anispeed = m_AniSpeed;
			}
			if (state == BTN_IMG_3_CLICK)
			{
				if (m_YFrame3 == -1){return;}
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame3);MIMG.anispeed = m_AniSpeed;
			}
			if (state == BTN_IMG_5_FLASH)
			{
				if (m_YFrame5 == -1){return;}
//				alert("m_sizeX:"+m_sizeX+",m_sizeY:"+m_sizeY+",m_YFrame5:"+m_YFrame5+",m_AniSpeed:"+m_AniSpeed);
				MIMG.clipani(m_sizeX,m_sizeY,1,m_YFrame5);MIMG.anispeed = m_AniSpeed;
			}
			
			return;
		}

		if (m_iType == 1)//类型(1:文字0:底图)
		{
			if (m_Num == 1)
			{
				m_TopImg.src = "$./imgs"+window.g_Sex+"/"+m_TopName+"3.tga";
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+"3.tga";
			}
			else
			{
				m_TopImg.size(m_sizeX,m_sizeY);
				m_TopImg.pos(m_posX,m_posY);

				m_TopImg.src = "$./imgs"+window.g_Sex+"/"+m_TopName+state+".tga";
				MIMG.src = "$./imgs"+window.g_Sex+"/"+m_BGName+state+".tga";
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
		SetImgSrc(BTN_IMG_1_NORMAL);
	}

	//设置动画图片参数(yFrame1:普通状态下,yFrame2:鼠标over状态,yFrame3:鼠标按下,speed:速度)
	void SetAni(yFrame1,yFrame2,yFrame3,yFrame5,speed)
	{
		m_YFrame1 = yFrame1;
		m_YFrame2 = yFrame2;
		m_YFrame3 = yFrame3;
		m_YFrame5 = yFrame5;
		m_AniSpeed = speed;
	}

	//设置图片大小
	void SetSize(x,y)
	{
		m_sizeX = x;
		m_sizeY = y;
		size(x,y);
	}
	//设置鼠标悬停框的ID
	//id:	悬停的ID
	void SetHangID(id)
	{
		//悬停
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangID(id);
	}
	void OnMouseOver()
	{
		if(GetState() == window.BTN_STATE_GREY){return;}
		if (m_IsCheck){return;}
		if (m_Num < 3){return;}
		SetImgSrc(BTN_IMG_2_OVER);//显示的换图片
		if (m_SoundType == 1)
		{
			window.PlaySound(127);//给某些长得像按钮的Radio使用（大厅）
		}
	}
	void OnMouseOut()
	{
		if(GetState() == window.BTN_STATE_GREY){return;}
		if (m_IsCheck){return;}
		if (m_Num < 3){return;}
		SetImgSrc(BTN_IMG_1_NORMAL);//显示的换图片
	}
	void OnMouseDownL()
	{
		if(GetState() == window.BTN_STATE_GREY){return;}
		MouseDownL_Sound();
		if (m_SoundType == 0)
		{
			window.PlaySound(131);//默认
		}
		else
		{
			window.PlaySound(114);//给某些长得像按钮的Radio使用（大厅）/商称（购物，充值）
		}
	}
	void OnMouseUpL()
	{
		if(GetState() == window.BTN_STATE_GREY){return;}
	}
	void MouseCheck()
	{
		if(GetState()==window.BTN_STATE_GREY){return;}
		m_IsCheck = true;
		if (m_Num == 1){m_TopImg.show = true;}
		SetImgSrc(BTN_IMG_3_CLICK);
	}//子类OnClick需要调用此函数
	void MouseUnCheck()
	{
		if(GetState()==window.BTN_STATE_GREY){return;}
		m_IsCheck = false;
		if (m_Num == 1){m_TopImg.show = false;}
		SetImgSrc(BTN_IMG_1_NORMAL);
	}//子类OnClick需要调用此函数

	//返回Radio的状态-是否被选中
	void GetChecked(){return m_IsCheck;}

	//返回标签的状态
	void GetState(){return m_State;}
	//设置标签的状态
	void SetState(data1)
	{
		m_State = data1;
		//灰图与彩图的切换
		if (data1 == window.BTN_STATE_GREY)
		{
			cursor = window.CURSOR_ARROW;
			find("RADIO_GREY").del();
			new item
			{
				size = "100%,100%";
				name = "RADIO_GREY";capturemouse = true;
			}
			SetImgSrc(BTN_IMG_4_GREY);
		}
		else
		{
			cursor = window.CURSOR_HAND;
			find("RADIO_GREY").del();
			SetImgSrc(BTN_IMG_1_NORMAL);
		}
		
	}

	//[功能]设置上面点的图显示与否	夏洋洋添加于2009-12-17
	//[参数]_data：true为显示，false为隐藏
	void SetTopImgShow(_data)
	{
		m_TopImg.show = _data;
	}

	void InitText(data)
	{
		_text.del();//为了保证在换字的时候只有一个text存在
		//保证text只有在需要的时候才出来所以写在函数里用staticvar来new
		staticvar _text=new VMyRadioInsideFont{}		//此text类需要自己写
		_text.src = data;
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
	class VMyRadioBaseFont text
	{
		size(parent.m_sizeX,parent.m_sizeY);font="宋体,-1,12";xcenter = true;ycenter = true;//txtborder = "#0";
	};
	/*
	类的内部定义一个text类型的class 用来统一记录普通和灰状态下的字体
	radio内部需要程序写字的时候重写这个class
	*/
	class VMyRadioInsideFont VMyRadioBaseFont		//VMyRadioInsideFont这个类用来定义与VMyRadioBaseFont类的不同
	{
		xspace = 0;
	};

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
};
//==========================================================新====================================================
//单选 底
class VRadio_Single_bk_New_UI VBaseRadio
{
	SetSize(19,17);
	Init("new/SingleChoose_New/dxk",0,1,false);
};
//单选 底
class VRadio_Single_New_UI VRadio_Single_bk_New_UI
{
	SetSize(19,17);
	Init("new/SingleChoose_New/d",1,1,false);
};

//基本标签
//BK
class VRadio_BK_UI VBaseRadio
{
	SetSize(59,21);
	Init("new/BK/zbq0",0,4,false);
	class VMyRadioInsideFont VMyRadioBaseFont//需要什么样的字体自己写
	{
		pos = "0,2";
	};
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
};
//BK_37
class VRadio_BK37_UI VBaseRadio
{
	SetSize(37,18);
	Init("new/BK/bq0",0,4,false);
	class VMyRadioInsideFont VMyRadioBaseFont//需要什么样的字体自己写
	{
		pos = "0,0";
	};
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
};

//商城
//男
class VRadio_Mall_boy_New VBaseRadio
{
	SetSize(38,30);
	Init("new/Mall/boy0",0,4,false);
};
//女
class VRadio_Mall_girl_New VBaseRadio
{
	SetSize(36,31);
	Init("new/Mall/girl0",0,4,false);
};
//聊天工具
class VRadio_ChatItem_New VBaseRadio
{
	SetSize(70,24);
	Init("new/Mall/i_ChatItem",0,4,false);
};
//辅助工具
class VRadio_HelpItem_New VBaseRadio
{
	SetSize(70,24);
	Init("new/Mall/i_HelpItem",0,4,false);
};
//全部
class VRadio_Mall_all_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/qb-text0",0,4,false);
};
// 服饰
class VRadio_Mall_Dress_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/fs0",0,4,false);
};
// 美容
class VRadio_Mall_HairDressing_New VBaseRadio
{
	SetSize(45,28);
	Init("new/Mall/mr0",0,4,false);
};
// 道具
class Vradio_Mall_Item_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/dj0",0,4,false);
};
//上装
class VRadio_Mall_cloth_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/sz0",0,4,false);
};
//手套
class VRadio_Mall_glove_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/st0",0,4,false);
};
//鞋
class VRadio_Mall_shoes_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/x0",0,4,false);
};
//袜子
class VRadio_Mall_sock_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/wz0",0,4,false);
};
//裤子
class VRadio_Mall_trousers_New VBaseRadio
{
	SetSize(56,24);
	Init("new/Mall/kq0",0,4,false);
};
//容貌
class VRadio_Mall_face_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/rm0",0,4,false);
};
//发型
class VRadio_Mall_hair_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/fx0",0,4,false);
};
//背饰
class VRadio_Mall_back_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/bs0",0,4,false);
};
//眼镜
class VRadio_Mall_glass_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/yj0",0,4,false);
};
//手腕 手链
class VRadio_Mall_hand_New VBaseRadio
{
	SetSize(85,24);
	Init("new/Mall/hwsl0",0,4,false);
};
//项链
class VRadio_Mall_neck_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/xl0",0,4,false);
};
//削球
class VRadio_Mall_cut_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/XQ0",0,4,false);
};
//扣杀
class VRadio_down_down_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/ks0",0,4,false);
};
//放高球
class VRadio_Mall_high_New VBaseRadio
{
	SetSize(55,24);
	Init("new/Mall/fgq0",0,4,false);
};
//发球
class VRadio_Mall_start_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/fq0",0,4,false);
};
//上旋
class VRadio_Mall_up_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/sx0",0,4,false);
};
//后场
class VRadio_Mall_background_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/hc0",0,4,false);
};
//前场
class VRadio_Mall_front_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/qc0",0,4,false);
};
//能量
class VRadio_Mall_power_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/nl0",0,4,false);
};
//技巧
class VRadio_Mall_Skill_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/jq0",0,4,false);
};
//体力
class VRadio_Mall_stamina_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/tl0",0,4,false);
};
//力量
class VRadio_Mall_strength_New VBaseRadio
{
	SetSize(42,24);
	Init("new/Mall/ll0",0,4,false);
};

//排行榜
//本赛季排行
class VRadio_TopStar_ThisSeason_New VBaseRadio
{
	SetSize(85,24);
	Init("new/TopStar/ThisSeason",0,4,false);
};
//总排行
class VRadio_TopStar_TotalTopList_New VBaseRadio
{
	SetSize(51,24);
	Init("new/TopStar/TotalTopList",0,4,false);
};

//=====================家族=========================
//夏洋洋 2010-3-2
//家族大厅
class VRadio_FamilyHall VBaseRadio
{
	SetSize(74,25);
	Init("new/Family/jzdt0",0,4,false);
};
//家族信息
class VRadio_FamilyInfo VBaseRadio
{
	SetSize(74,25);
	Init("new/Family/jzxx0",0,4,false);
};
//家族设置
class VRadio_FamilySet VBaseRadio
{
	SetSize(74,25);
	Init("new/Family/jzsz0",0,4,false);
};
//申请信息
class VRadio_FamilyApplyInfo VBaseRadio
{
	SetSize(74,25);
	Init("new/Family/sqxx0",0,4,false);
};
