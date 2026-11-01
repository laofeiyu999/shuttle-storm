//
//活动排名类定义
//

//一行显示类：排名+昵称+积分
class VColumn_ArenaTop_UI item
{
	size = "185,28";
	bgcolor= -1;
	alpha = 0;
	void SetSize1(){size = "185,28";}
	void SetSize2(){size = "185,56";}
	
	//===========================与显示交互======================
	void Init(data)
	{
		//new VListBG2_UI{size="100%,27";}//列表背景
		//背景
		staticvar m_Bg = new img
		{
			size = "185,27";
			void SetSize1(){size = "185,27";}
			void SetSize2(){size = "185,54";}
			src="$./imgs"+window.g_Sex+"/ttt.tga";

			void FlashBG()
			{
				window.PlaySound(147);
				setParamTimer("size","185,27","185,0",200,0);
				setParamTimer("pos","0,0","0,14",200,0);				
				sleep(200);

				setParamTimer("size","185,0","185,27",200,0);
				setParamTimer("pos","0,14","0,0",200,0);
			}
			void FlashBG2()
			{
				window.PlaySound(147);
				setParamTimer("size","185,54","185,0",300,0);
				setParamTimer("pos","0,0","0,27",300,0);				
				sleep(200);

				setParamTimer("size","185,0","185,54",300,0);
				setParamTimer("pos","0,27","0,0",300,0);
			}
		}
		if(data == 1)
		{
			staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
			staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		}		

		if(data == 2)
		{
			staticvar s_SelectBK = new VPic3_ChannelListBK2_UI{size = "100%,64";show = false;}//选中背景
			staticvar _IMG = new VListSelect2_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		}
		//昵称
		//参数 data1: 昵称
		staticvar s_NKname1 = new BaseText{pos = "42,0";size="78,27";src="昵称";xcenter=true;ycenter=true;}
		staticvar s_NKname2 = new BaseText{pos = "42,27";size="78,27";src="昵称";xcenter=true;ycenter=true;}
		//排名
		//参数 data1：排名
		staticvar s_Index = new BaseText
		{
			size="32,27";src="排名";xcenter=true;ycenter=true;valign(50,0);
//			void SetPos1(){pos = "10,10";}
//			void SetPos2(){pos = "10,15";}
		}
		//积分
		//参数 data1: 
		staticvar s_AreneData = new BaseText
		{
			pos = "130,0";size="60,27";src="积分";xcenter=true;ycenter=true;valign(50,0);
//			void SetPos1(){pos = "130,10";}
//			void SetPos2(){pos = "130,15";}
		}
	}
	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_IMG.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;_SelectState = false;
	}
	//排名的背景动画
	void FlashTopBG(_time)
	{
		sleep(_time*150);
		m_Bg.FlashBG();
	}
	void FlashTopBG2(_time)
	{
		sleep(_time*150);
		m_Bg.FlashBG2();
	}
};

//
//总的类：List
//
class VArena_TopList_UI VN2ListCtrl
{
	//需要显示时改变
	size="190,310";pos="5,77";//pos="434,102";
	bgcolor=-1;
//	bgcolor="#FF";
	void SetSize1(){size = "190,330";}//游戏外 单人
	void SetSize2(){size = "190,310";}//游戏外 双人
	void SetSize3(){size = "190,195";}//游戏中 单人
	void SetSize4(){size = "190,171";}//游戏中 双人
	void SetPos1(){pos = "5,77";}
	void SetPos2(){pos = "5,100";}
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
};