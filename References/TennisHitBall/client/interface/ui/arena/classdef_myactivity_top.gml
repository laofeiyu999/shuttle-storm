//
//活动场>我的活动>排行
//

class VArena_MyActivity_Top_UI item
{
	size = "0%,0%";size = "197,273";pos(0,40);bgcolor=-1;alpha=0;
	//=============================与界面交互========================================
	void Init()
	{
		// 右列表背景
		staticvar s_BG = new VPic9_BK2_UI{size="197,273";halign(50,0);}//

		// 右侧标题:排名
		staticvar s_Title = new item
		{
			size = "185,26";pos="5,10";
			new VListBG2_UI{size = "185,21";};
			//昵称
			new BaseText{pos = "42,0";size="78,21";src="昵称";bold=true;xcenter=true;ycenter=true;}
			//排名
			new BaseText{size="32,21";src="排名";bold=true;xcenter=true;ycenter=true;}
			//积分
			//参数 data1: 
			var _value = new BaseText
			{
				pos = "130,0";size="60,21";bold=true;xcenter=true;ycenter=true;
				src="积分";
				//src = window.GetTopTitleByID(window.GetMyRaceID());
			}
		};

		//我的排名
//		new item
//		{
//			size = "171,26";pos="5,237";
//			new VListBG2_UI{size = "171,21";};
//			new BaseText{size="78,21";src="我的排名";bold=true;xcenter=true;ycenter=true;}
//		};
		//我的排名
		//[参数]param1：排名
		//[参数]param2: 昵称
		//[参数]param3: 积分
		staticvar s_MyIndex = new item
		{
			size = "185,26";pos="5,37";
			void SetSize1(){size = "185,28";}
			void SetSize2(){size = "185,56";}
			//new VListBG2_UI{size = "185,21";};
			//背景
			var m_Bg = new img
			{
				size = "185,28";
				void SetSize1(){size = "185,28";}
				void SetSize2(){size = "185,56";}
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
			//昵称
			var m_name1 = new BaseText{pos = "40,0";size="78,27";src = window.GetMyName();xcenter=true;ycenter=true;}
			var m_name2 = new BaseText{pos = "40,27";size="78,27";xcenter=true;ycenter=true;}
			//排名
			var m_index = new BaseText
			{
				size="32,100%";src="- -";xcenter=true;ycenter=true;
//				void SetPos1(){pos = "10,10";}
//				void SetPos2(){pos = "10,15";}
			}
			//积分
			//参数 data1: 
			var m_data = new BaseText
			{
				pos = "130,0";src="- -";size="60,100%";xcenter=true;ycenter=true;
//				void SetPos1(){pos = "130,10";}
//				void SetPos2(){pos = "130,15";}
			}

			void SetData(_index,_name,_data)
			{
				//m_name.SetData(_name);
				if (toint(_index) <= 0)
				{
					_index = "--";
				}
				if (toint(_data) < 0)
				{
					_data = "--";
				}
				m_index.SetData(_index);
				m_data.SetData(_data);
			}

			//我的排名的背景动画
			void FlashMyTopBG()
			{
				m_Bg.FlashBG();
			}
			void FlashMyTopBG2()
			{
				m_Bg.FlashBG2();
			}
		}

		staticvar _line = new item
		{
			size = "185,3";bgcolor= "#cccccc";
			left = parent.s_MyIndex.left;
			top = parent.s_MyIndex.top + parent.s_MyIndex.height+5;
			void setpos()
			{
				left = parent.s_MyIndex.left;
				top = parent.s_MyIndex.top + parent.s_MyIndex.height+2;
			}
		}

		//显示按钮 + 隐藏按钮
		set parent
		{
			//显示
			staticvar s_Btn_Show = new VBTN_ShowTop_New
			{
				pos="0,359";show = false;
				void OnPressed()
				{
					setParamTimer("pos","0,359","205,359",300,0,"BtnShowEnd");
					parent._MyActivity_Top.setParamTimer("left","-197","10",300,0);
				}

				void BtnShowEnd()
				{
					pos="0,359";
					show = false;
					parent.s_Btn_Hide.show = true;
				}
			}

			//隐藏
			staticvar s_Btn_Hide = new VBTN_HideTop_New
			{
				pos="205,359";show = false;
				void OnPressed()
				{
					setParamTimer("pos","205,359","0,359",300,0,"BtnHideEnd");
					parent._MyActivity_Top.setParamTimer("left","10","-197",300,0);
				}
				void BtnHideEnd()
				{
					pos="205,359";
					show = false;
					parent.s_Btn_Show.show = true;
				}
			}
		}
	}//Init
	
};