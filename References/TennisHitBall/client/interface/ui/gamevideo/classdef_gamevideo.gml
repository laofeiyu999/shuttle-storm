import("$./../Game/ClassDef_PlayUI_S_Special_1.gml");
import("$./../Game/ClassDef_PlayUI_S_Special_2.gml");
import("$./../Game/ClassDef_PlayUI_S_OneGameEnd_1.gml");
import("$./../Game/ClassDef_PlayUI_BaseInfo.gml");
importex("$./../Game/ClassDef_PlayUI_S_Energy_Name.gml");
import("$./../Game/ClassDef_PlayUI_StorePower.gml");
import("$./../Game/ClassDef_GameNum.gml");
import("$./../Game/ClassDef_PlayUI_D_Energy_Name.gml");

class VGameVideoPlay_UI item
{
	size = "100%,100%";

	void Init()
	{
		if(parent.m_RoomType == 2)
		{
			//p1昵称+能量
			//参数：见类定义
			staticvar s_P1_Head = new VRole_P1_P3_Name_Energy_UI{halign(2,0);valign(2,0);}

			//p2昵称+能量
			//参数：见类定义
			staticvar s_P2_Head = new VRole_P2_P4_Name_Energy_UI{halign(2,0);valign(16,0);}
		}
		else
		{
			//情侣不显示
			if (parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE && parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
			{
				//p1昵称+能量
				//参数：见类定义
				staticvar s_P1_Head = new VRole_P1_Name_Energy_UI{halign(2,0);valign(2,0)}

				//p2昵称+能量
				//参数：见类定义
				staticvar s_P2_Head = new VRole_P2_Name_Energy_UI{halign(2,2);valign(8,0);}
			}
		}

		//比分
		//参数 data2:p1的分
		//参数 data3:P2的分
		if (parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE && parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
		{
			staticvar s_P1vsP2Point = new item
			{
				size = "500,67";
				halign(95,0);
				valign(5,0);

				var _p1num_1 = new img						//个位自己的比分
				{
					size = "67,67";pos(210,0);
				}
				var _p1num_2= new img						//十位自己的比分
				{
					size = "67,67";pos(160,0);
				}
				var _p1num_3= new img						//百位自己的比分
				{
					size = "67,67";pos(110,0);
				}
				var _Temp = new img							//斜杠
				{
					size = "46,30";
					valign(50,0);
					halign(50,63);
					src = "$./../Game/imgs/hen.tga";
				}
				var _p2num_1 = new img						//个位对方的比分
				{
					size = "67,67";pos="440,0";
				}
				var _p2num_2 = new img						//十位对方的比分
				{
					size = "67,67";pos="390,0";
				}
				var _p2num_3= new img						//百位对方的比分
				{
					size = "67,67";pos="340,0";
				}
				var _data2_1 = 0;							//计算个位用自己的比分
				var _data2_2 = 0;							//计算十位用自己的比分
				var _data2_3 = 0;							//计算百位用自己的比分

				var _data3_1 = 0;							//计算个位用对方的比分
				var _data3_2 = 0;							//计算十位用对方的比分
				var _data3_3 = 0;							//计算百位用对方的比分

				//参数1：
				//参数2：自己的比分
				//参数3：对方的比分
				void SetData(data1,data2,data3)
				{
					var temp = toint(data2)%1000;
					_data2_1 = temp%10;					//计算个位
					_data2_2 = temp%100/10;				//计算十位
					_data2_3 = temp/100;				//计算百位
					if(toint(data2) == -1)//非决胜局
					{
						temp = "A";
						_p1num_1.src = "$./../Game/imgs/L_"+temp+".tga";
						_p1num_2.show=false;
						_p1num_3.show=false;
					}
					else
					{
						_p1num_2.show=true;
						_p1num_3.show=true;
						_p1num_1.src = "$./../Game/imgs/L_"+_data2_1+".tga";
						_p1num_2.src = "$./../Game/imgs/L_"+_data2_2+".tga";
						if(toint(data2)>99){_p1num_3.src = "$./../Game/imgs/L_"+_data2_3+".tga";}
					}

					temp = toint(data3)%1000;
					_data3_1 = temp%10;
					_data3_2 = temp%100/10;
					_data3_3 = temp/100;

					if(toint(data3) == -1)
					{
						temp = "A";
						_p2num_1.src = "$./../Game/imgs/L_"+temp+".tga";
						_p2num_1.pos="340,0";
						_p2num_2.show=false;
						_p2num_3.show=false;
					}
					else
					{
						_p2num_2.show=true;
						_p2num_3.show=true;
						_p2num_1.src = "$./../Game/imgs/L_"+_data3_1+".tga";
						_p2num_2.src = "$./../Game/imgs/L_"+_data3_2+".tga";
						if(toint(data3)>99)
						{
							_p2num_3.src = "$./../Game/imgs/"+_data3_3+".tga";
							_p2num_1.pos="440,0";
							_p2num_2.pos="390,0";
							_p2num_3.pos="340,0";
						}
						if(toint(data3)<100){_p2num_1.pos="390,0";_p2num_2.pos="340,0";}
					}
				}
			}
		}

		//一球结束：普通的提示信息
		//无参：
		staticvar s_TipCommon = new item
		{
			size = "100%,100%";
			var _top = new item
			{
				size = "100%,172";bgcolor = "#000000";alpha = 30;pos = "0,-172";
			}
			var _bottom = new item
			{
				size = "100%,172";bgcolor = "#000000";alpha = 30;pos = "0,780";
				void AlphaEnd()
				{
					//初始化滚屏坐标
					parent._top.pos = "0,-200";
					pos = "0,780";
					parent.show = false;
				}
			}
			//开始
			void SetStart()
			{
				if (parent.m_RoomType == window.ROOM_TYPE_LOVERDOUBLE || parent.m_RoomType == window.ROOM_TYPE_LOVERDOUBLE_WAGER)
				{
					show = false;
				}
				else
				{
					show = true;
				}
				_top.alpha = window._Time_StartAlpha;_bottom.alpha = window._Time_StartAlpha;
				//在这里做动画的时间控制
				_top.setParamTimer("pos","0,-172","0,0",window._Time_BackStart,window._Time_BackDelay);
				_bottom.setParamTimer("pos","0,780","0,608",window._Time_BackStart,window._Time_BackDelay);
			}
			//结束
			void SetEnd()
			{
				_top.setParamTimer("alpha",window._Time_StartAlpha,window._Time_EndAlpha,window._Time_BackEnd,0);
				_bottom.setParamTimer("alpha",window._Time_StartAlpha,window._Time_EndAlpha,window._Time_BackEnd,0,"AlphaEnd");
			}
		}

		//局分情况显示
		//参数 gamenum:总局数 1-n
		//参数 currnum:当前局 1-n,0为初始值
		//参数 winorlost:输赢 1表示输 2表示赢
		if (parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE && parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
		{
			staticvar s_GameNum = new VPlay_Game_Num
			{
				// 段晓彤修改
				halign(85,0); 
				top = parent.s_P1vsP2Point.top + parent.s_P1vsP2Point.height + 15;

				if (parent.m_RoomType == window.ROOM_TYPE_LOVERDOUBLE || parent.m_RoomType == window.ROOM_TYPE_LOVERDOUBLE_WAGER)
				{
					return;
				}
				void SetData(gamenum,currnum,winorlost)
				{
					printf("C# 录像：总局数:"+gamenum+",当前局数:"+currnum+",输赢:"+winorlost);
					SetShow(gamenum,currnum,winorlost);
				}
			}
		}

		//基础提示信息
		if (parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE && parent.m_RoomType != window.ROOM_TYPE_LOVERDOUBLE_WAGER)
		{
			staticvar s_BaseTipInfo =new VRole_BaseTipInfo_UI{valign(50,0);halign(50,0);}
		}

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VGame_StorePower_UI{}

		//退出按钮
		staticvar s_Btn_Exit = new img
		{
			size = "82,32";
			valign(95,0);halign(95,0);
			src = "$./imgs/tc-text.tga";
			void OnMouseOver()
			{
				cursor = window.CURSOR_HAND;
			}
		}

	}//end init
};