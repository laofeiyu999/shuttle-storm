//
//游戏内界面的界面部分的类定义:游戏中>>单打
//

import("$./ClassDef_PlayUI_S_Special_1.gml");
import("$./ClassDef_PlayUI_S_Special_2.gml");
import("$./ClassDef_PlayUI_S_OneGameEnd_1.gml");
import("$./ClassDef_PlayUI_BaseInfo.gml");
import("$./../../Logic/Game/ClassDef_PlayLogic_Skill.gml");
import("$./ClassDef_PlayUI_S_Energy_Name.gml");
import("$./ClassDef_PlayUI_StorePower.gml");
import("$./ClassDef_GameNum.gml");
import("$./ClassDef_PlayUI_PromptInfo.gml");
import("$./ClassDef_PlayUI_Sector.gml");			//回球角度

class VGame_Playing_S_UI item
{
	size = "100%,100%";
	name = "VGame_Playing_S_UI";
	void Init()
	{
		//p1昵称+能量
		//参数：见类定义
		staticvar s_P1_Head = 	new VRole_P1_Name_Energy_UI{halign(2,0);valign(2,0);}

		//p2昵称+能量
		//参数：见类定义
		staticvar s_P2_Head = new VRole_P2_Name_Energy_UI{halign(2,2);valign(8,0);}	

		//p1的技能
		//参数：见类定义
		//p1的技能
		//参数：见类定义
		staticvar s_P1_Skill = new VShortBarIcon_All_Logic
		{
			//pos(400,710);
			halign(80,0);valign(100,0);
		}
		//游戏中辅助信息提示
		staticvar s_PromptInfo = new VGame_Playing_PromptInfo_UI{};

		//比分
		//参数 data2:p1的分
		//参数 data3:P2的分
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
				src = "$./imgs/hen.tga";
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
					_p1num_1.src = "$./imgs/L_"+temp+".tga";
					_p1num_2.show=false;
					_p1num_3.show=false;
				}
				else
				{
					_p1num_2.show=true;
					_p1num_3.show=true;
					_p1num_1.src = "$./imgs/L_"+_data2_1+".tga";
					_p1num_2.src = "$./imgs/L_"+_data2_2+".tga";
					if(toint(data2)>99){_p1num_3.src = "$./imgs/L_"+_data2_3+".tga";}
				}
				
				temp = toint(data3)%1000;
				_data3_1 = temp%10;
				_data3_2 = temp%100/10;
				_data3_3 = temp/100;

				if(toint(data3) == -1)
				{
					temp = "A";
					_p2num_1.src = "$./imgs/L_"+temp+".tga";
					_p2num_1.pos="340,0";
					_p2num_2.show=false;
					_p2num_3.show=false;
				}
				else
				{
					_p2num_2.show=true;
					_p2num_3.show=true;
					_p2num_1.src = "$./imgs/L_"+_data3_1+".tga";
					_p2num_2.src = "$./imgs/L_"+_data3_2+".tga";
					if(toint(data3)>99)
					{
						_p2num_3.src = "$./imgs/L_"+_data3_3+".tga";
						_p2num_1.pos="440,0";
						_p2num_2.pos="390,0";
						_p2num_3.pos="340,0";
					}
					if(toint(data3)<100){_p2num_1.pos="390,0";_p2num_2.pos="340,0";}
				}
			}
		}

		//局分情况显示
		//参数 gamenum:总局数 1-n
		//参数 currnum:当前局 1-n,0为初始值
		//参数 winorlost:输赢 1表示输 2表示赢
		staticvar s_GameNum = new VPlay_Game_Num
		{
			// 段晓彤修改
			//pos(750,100);valign(15,0);
			halign(85,0);
			top = parent.s_P1vsP2Point.top + parent.s_P1vsP2Point.height + 15;
			void SetData(gamenum,currnum,winorlost)
			{
				printf("C# 单打-总局数:"+gamenum+",当前局数:"+currnum+",输赢:"+winorlost);
				SetShow(gamenum,currnum,winorlost);
			}
		}
		
		//基础提示信息
		staticvar s_BaseTipInfo =new VRole_BaseTipInfo_UI{valign(50,0);halign(50,0);}

		staticvar s_BallAngle = new VGame_Sector{halign(95,0);valign(53,0);}

		//蓄力时间
		staticvar s_SectorTime = new VGame_SectorTime{left = parent.s_BallAngle.left-(parent.s_BallAngle.width)*0.126;top = parent.s_BallAngle.top+(parent.s_BallAngle.height)*0.45;}

		//最大球速
		staticvar s_MaxSpeed = new VGame_MaxSpeed{valign (62,5);halign (100,-3);show = false;}
				
		staticvar s_Angle = new img
		{
			valign (46,-2);halign (94,0);
			size = "68,19";
			src = "$./imgs/dangqianjiqiu.tga";//当前击球角度图
		}

		staticvar s_Speed = new img
		{
			valign (62,5);halign (97,0);
			size = "133,20";
			src = "$./imgs/jqsd.tga";//当前击球速度图
		}

		staticvar s_HideAngle = new VBTN_Game_Push
		{
			valign (51,-5);halign (99,0);
			SetHangID(59);
			show = true;
		}

		staticvar s_ShowAngle = new VBTN_Game_Pop
		{
			valign (51,-5);halign (99,0);
			SetHangID(60);
			show = false;
		}
		
		//押注金额
		//value:-1,不显示 
		staticvar s_Wager = new item
		{
			size = "700,37";show = false;//bgcolor = "#FF";pos = "0,120";
			left = parent.s_P2_Head.left;
			top = parent.s_P2_Head.top + parent.s_P2_Head.height+5;
			new img{src = "$./../Room/imgs/wagervalue.tga";pos(0,3);}
			var _num = new VN2NumShow
			{
				pos = "90,0";
				//setNum(param2);
				void NEWNUM(){new img;}
				void NUMSET(objname,index,num)//设置数字对象的显示
				{
					set find(objname)
					{
						src = "$./../PublicImage/num/wager.tga";
						clipani(35,37,1,10);
						aniindex=num;
						left=index*25;
					}
				}
			}
			//var _G = new img{src = "$./../Room/imgs/Gold.tga";}
			void SetData(value)
			{
				show = false;
				if (value > 0)
				{
					show = true;
					_num.setNum(value);
					//_G.pos(toint(window.GetNumCount(toint(value)))*25+90,0);
				}
			}
		}
		
		//活动点数
		//data:点数
		staticvar s_RaceData = new item
		{
			size = "700,37";pos = "0,120";show = false;//bgcolor = "#FF";
			new img{src = "$./imgs/point_num.tga";pos(0,3);}
			var _num = new VN2NumShow
			{
				pos = "100,0";
				void NEWNUM(){new img;}
				void NUMSET(objname,index,num)
				{
					set find(objname)
					{
						src = "$./../PublicImage/num/wager.tga";
						clipani(35,37,1,10);
						aniindex=num;
						left=index*25;
					}
				}
			}
			//var _G = new img{src = "$./../Room/imgs/Gold.tga";}
			void SetData(value)
			{
				show = false;
				if (value > 0)
				{
					show = true;
					_num.setNum(value);
					//_G.pos(toint(window.GetNumCount(toint(value)))*25+90,0);
				}
			}
		}

		//连接不好
		new img
		{
			name = "IO_BAD_ING_NAME";show = false;
			src = "$./imgs/ioerr.tga";
			clipani(43,44,1,2);valign(50,0);
			anispeed = 5;
		}
		
		//体力-临时加的 2009年9月29日
		staticvar s_Stamina = new VMyText
		{
			bgcolor = "#FF";pos = "100,200";
		}

		//一局比赛结束提示
		//参数 RoleID:角色ID
		//参数 Spoint: 胜利局数
		//参数 Fpoint: 失败局数
		//参数 MyName: 自己的昵称
		//参数 OtherName: 对方的昵称
		//参数 ActIndex：动作的ID,摄像机参数的索引	
		//参数 Sex：性别
		staticvar s_BoardEnd = new VPlay_OneGameEnd_1{}

		//一球结束：普通的提示信息
		//无参：
		staticvar s_TipCommon = new item
		{
			size = "100%,100%";
			var _top = new item
			{
				size = "100%,172";bgcolor = "#000000";alpha = 30;
				pos = "0,-172";
			}
			var _bottom = new item
			{
				size = "100%,172";bgcolor = "#000000";alpha = 30;pos = "0,"+parent.height;
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
				show = true;
				_top.alpha = window._Time_StartAlpha;_bottom.alpha = window._Time_StartAlpha;
				//在这里做动画的时间控制
				_top.setParamTimer("pos","0,-172","0,0",window._Time_BackStart,window._Time_BackDelay);
				_bottom.setParamTimer("pos","0,"+height,"0,"+(height-_bottom.height),window._Time_BackStart,window._Time_BackDelay);
			}
			//结束
			void SetEnd()
			{
				_top.setParamTimer("alpha",window._Time_StartAlpha,window._Time_EndAlpha,window._Time_BackEnd,0);
				_bottom.setParamTimer("alpha",window._Time_StartAlpha,window._Time_EndAlpha,window._Time_BackEnd,0,"AlphaEnd");
			}
		}
		
		//p1一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 
		//参数 Sex：性别
		staticvar s_TipSpecial_1 = new VPlay_Special_1{}
		
		//p2一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
		//参数 Sex：性别
		staticvar s_TipSpecial_2 = new VPlay_Special_2{}

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VGame_StorePower_UI{}
		
		//大按键
		new VTipBigKey{}

	}//end init

	//鼠标延时隐藏
	new HideCursor_UI{}
};