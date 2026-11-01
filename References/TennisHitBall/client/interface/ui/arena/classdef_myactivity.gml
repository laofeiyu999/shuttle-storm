//
//活动场>我的活动
//

import("$./ClassDef_Top_DBList.gml");

class VArena_MyActivity_UI item
{
	pos(0,0);size = "100%,100%";bgcolor=-1;alpha=-1;
	//=============================与界面交互========================================
	void Init()
	{
		// 左上列表背景
		new VPic9_BK2_UI
		{
			pos="14,62";size="412,215";
			new img{pos="7,6";src="$./imgs"+window.g_Sex+"/hdsmjjl-text.tga";};
			new VPic9_MsgBK_UI{pos="3,24";size="407,189";};
		};

		// 左下列表背景
		new VPic9_BK2_UI
		{
			pos="14,282";
			size="412,190";
			// 活动总人数
			new img
			{
				pos="7,17";
				src="$./imgs"+window.g_Sex+"/hdzrs-text.tga";
			};
			// 结算剩余时间
			new img
			{
				pos="7,47";
				src="$./imgs"+window.g_Sex+"/jssysj-text.tga";
			};
			// 活动积累时间 2009年12月2日 遵老虎旨意 干死
//			new img
//			{
//				pos="7,77";
//				src="$./imgs"+window.g_Sex+"/hdljsj-text.tga";
//			};
			// 修整剩余时间
			new img
			{
				pos="7,142";
				src="$./imgs"+window.g_Sex+"/xzsysj-text.tga";
			};
			// 当前积分
			new img
			{
				pos="206,17";
				src="$./imgs"+window.g_Sex+"/dqjf-text.tga";
			};
			// 当前活动点数
			new img
			{
				pos="206,47";
				src="$./imgs"+window.g_Sex+"/dqhdds-text.tga";
			};
			// 获奖感言
			new img
			{
				pos="7,112";
				src="$./imgs"+window.g_Sex+"/hsgy-text.tga";
			};
		};	

		//活动说明
		//new BaseText{pos="30,94";size="390,32";}
		//活动说明与奖励
		//[参数]param1:说明
		//[参数]param:物品奖励
		// 物品列表
		staticvar s_Desc_Award = new VContentIframe_UI
		{
			pos="24,94";size="396,177";//bgcolor = "#FF";alpha = 60;
			//src = "物品列表,控件没有先放BKText代替";
		}

		//活动总人数
		//[参数]param1:
		staticvar s_AllNum = new BKText//VN2NumShow
		{
			ycenter=true;xcenter = false;
			pos="125,299";size="88,20";
			//src = "总人数";
//			src = "$./../PublicImage/num/game_skill.tga";
//
//			void SetData(data1,data2,data3)
//			{
//				var _tempNum = toint(data1);
//				var _tempCount = tostring(_tempNum).Count;
//				_tempCount = toint(_tempCount);
//				var _numSizeX = _tempCount*12;
//				size(_numSizeX,20);
//				setNum(_tempNum);
//			}
		}

		//结算剩余时间
		//[参数]param1:(单位：秒)
		staticvar s_FootLeaveTime = new BKText
		{
			ycenter=true;xcenter = false;src = "00:00:00";
			pos="125,327";size="88,20";
		}

		//活动剩余时间  2009年12月2日 遵老虎旨意 干死
		//[参数]param1:(单位：秒)
//		staticvar s_ActivityLeaveTime = new BKText
//		{
//			ycenter=true;xcenter = false;
//			pos="115,357";size="95,20";
//			//src = "活动剩余时间";
//		}

		//休整剩余时间
		//[参数]param1:(单位：秒)
		staticvar s_FallowLeaveTime = new BKText
		{
			ycenter=true;xcenter = false;src = "00:00:00";
			pos="125,422";size="88,20";
		}

		//配对：按钮
		staticvar s_Btn_BeginQueue = new VBTN_A_New
		{
			InitText("继续活动");
			left = parent.s_FallowLeaveTime.left + parent.s_FallowLeaveTime.width + 7;
			top = parent.s_FallowLeaveTime.top -3;
		}

		//当前积分
		//[参数]param1
		staticvar s_CurrMark = new VN2NumShow
		{
			ycenter=true;xcenter = false;
			pos="330,297";//size="88,20";
			//src = "当前积分";
			src = "$./../PublicImage/num/game_skill.tga";

			void SetData(data1,data2,data3)
			{
				setNum(data1);
			}

			void NEWNUM()//在这里产生一个数字显示对象
			{
				new img;
			}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../PublicImage/num/game_skill.tga";
					clipani(16,20,1,10);
					aniindex=num;
					left=index*10;
				}
			}
		}
		//当前活动点数
		//[参数]param1
		staticvar s_CurrPoint = new VN2NumShow
		{
			ycenter=true;xcenter = false;//bgcolor = "#FF";
			pos="330,327";//size="88,20";
			//src = "当前活动点数";
			src = "$./../PublicImage/num/game_skill.tga";

			void SetData(data1,data2,data3)
			{
				setNum(data1);
			}
			void NEWNUM()//在这里产生一个数字显示对象
			{
				new img;
			}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../PublicImage/num/game_skill.tga";
					clipani(16,20,1,10);
					aniindex=num;
					left=index*10;
				}
			}
		}
		//充点：按钮
		staticvar s_Btn_AddPoint = new VBTN_37_New
		{
			InitText("充点");pos="382,328";SetHangID(21);
		}

		//获胜感言
		staticvar s_E_WinSlogan = new BKText
		{
			ycenter=true;xcenter = false;
			pos="125,392";
			size = "173,20";
			//src = "我就是传说中的高手！";
		}		
		//设置：按钮
		staticvar s_Btn_SetSlogan = new VBTN_37_New
		{
			InitText("设置");
			left = parent.s_E_WinSlogan.left + parent.s_E_WinSlogan.width - width;
			top = parent.s_E_WinSlogan.top;
		}
		//退出：按钮
		staticvar s_Btn_Exit = new VBTN_A_New
		{
			pos="340,421";
			top = parent.s_Btn_BeginQueue.top;
			InitText("退出");
			
		}

		// 右列表背景
		new VPic9_BK2_UI
		{
			pos="429,64";size="197,408";
		};

		//我的队友
//		new item
//		{
//			size = "171,26";pos="434,353";
//			new VListBG2_UI{size = "171,21";};
//			new BaseText{size="78,21";src="队伍成员";bold=true;xcenter=true;ycenter=true;}
//		};
	}
};