//
//游戏结束结算界面的定义>>单打
//刘高辰 08.09.09修改
//yxf 2008年11月6日

import("$./ClassDef_Data.gml");

class VGame_Over_S_UI item
{
	size = "100%,100%";	alpha = 30;

	void Init()
	{
		new img
		{
			src = "$./imgs"+window.g_Sex+"/bk.jpg";	
			size = "100%,100%";
		}

		//模型1
		//参数data1：性别
		//参数data2:RoleID
		//参数data3:动作的索引
		staticvar s_P1_Model = new item
		{
			size = "100%,100%";//bgcolor = "#ff";
			//pos = "1024,0";
			left = parent.width;
			//角色模型定义
			var _rt= new rtexture
			{
				size = "100%,100%";bkcolor = "#000000";
				eye.far = 1000;
				eye.FOV = 0.5;
				var _PlayerBody = new scene
				{
					camera.pos = window._Camera_GameOver_Pos;
					camera.dir = window._Camera_GameOver_Dir;
					camera.up = window._Camera_GameOver_Up;
					var _V3Action = new V3Action
					{
						pos = window._Camera_GameOver_Model_Pos;name="Action";
						SetUserPath="$./../../../../client/user/";
						SETBODYID(window.find("GAME_OVER_LOGIC")._User1.GetRID());
						//SETBODYID(window.g_TestRID);
						if (window.g_DEBUG)
						{
							printf("游戏结算画面-P1-S:"+window.find("GAME_OVER_LOGIC")._User1.GetRID());
						}
					}	
					//状态机，控制动作播完就不播了
					var _MFSM = new MFSM
					{
						VNETLOG(11095,"3:"+SETBODYID(window.find("GAME_OVER_LOGIC")._User1.GetRID())+"\n")
						name="FSM";
						SETBODYID(window.find("GAME_OVER_LOGIC")._User1.GetRID());
						//SETBODYID(window.g_TestRID);
					}
					new CIfUser{name="ifuser";};
				}
			}
			new img3d
			{
				size = "100%,100%";
				src = parent._rt.UITexture;
			}

			var temp = 0;
			//模型1
			//参数data1：性别
			//参数data2:RoleID
			//参数data3:动作的索引
			void SetData(data1,data2,data3)
			{
				temp = window.GetActIDByIndex(data3,data1);
				if (window.g_DEBUG)
				{
					printf("B# 游戏结算画面-P1动作-S:"+temp);
				}
				var _pos = window.GetCamPosByIndex(data2,data3);
				if ( _pos != "")
				{
					var _dir = window.GetCamDirByIndex(data2,data3);
					if (_dir != "")
					{
						_rt._PlayerBody.camera.pos = _pos;
						_rt._PlayerBody.camera.dir = _dir;
					}
				}
				setParamTimer("left",""+parent.width,"0",233,1333,"LoseShow");
			}	
			void LoseShow()
			{
				_rt._PlayerBody._MFSM.clearset(temp);
				sleep(100);
				parent.s_P2_Model.show = true;
				parent.s_P2_Model.LoadAct();
			}
		}	

		staticvar s_bk = new VGameOver_BG
		{
			setParamTimer("alpha",100,0,300,2433,"SetAlphaEnd");
			void SetAlphaEnd()
			{
				parent.s_P1_Data.ShowData(1);
				parent.s_P2_Data.ShowData(2);
			}
		}
		//游戏结算图标
		new img
		{
			//pos = "163,108";
			src="$./imgs" + window.g_Sex+ "/gameOver_title.tga"; show = true;
			left = parent.s_bk.left;
			top = parent.s_bk.top-height/2;
		}

		//	系统评价底
		//保存录像按钮
		staticvar s_SaveVideo = new VBTN_A_New
		{
			//pos(767,536);
			left = parent.s_bk.left+parent.s_bk.width - width-30;
			top = parent.s_bk.top+parent.s_bk.height-height-20;
			show=false;
			InitText("保存录像");
			timer(2433,"saveVideoShow");
			void saveVideoShow()
			{
				show=true;
			}
			SetTextColor(1);
			_text.bold = true;
		}

		//自己的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VGame_Over_Data_UI
		{
			//pos = "350,150";
			//bgcolor = "#ff";
			left = parent.s_bk.left + 230;
			top = parent.s_bk.top+30;
		}

		//对方的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VGame_Over_Data_UI
		{
//			pos = "520,150";
//			bgcolor = "#ff";
			left = parent.s_bk.left + 430;
			top = parent.s_bk.top+30;
		}

		
		//系统评价-自己的
		//参数 data2
		staticvar s_Appraise = new img
		{
			size = "26,28";
			//pos = "253,551";
			left = parent.s_bk.left+500;
			top = parent.s_bk.top+parent.s_bk.height-height-50;
			src = "";
			show = false;xcenter = true;bold = true;
			timer(4000,"show=true");
			void SetData(data1,data2)
			{
				var _needSize = "";
				switch (data2)
				{
					case 0:{_needSize = "83, 84";src = "$./imgs/d.tga";break;}		  // MatchRank_D              
					case 1:{_needSize = "83, 84";src = "$./imgs/c.tga";break;}		  // MatchRank_C              
					case 2:{_needSize = "83, 84";src = "$./imgs/b.tga";break;}		  // MatchRank_B              
					case 3:{_needSize = "83, 84";src = "$./imgs/a.tga";break;}		  // MatchRank_A              
					case 4:{_needSize = "83, 84";src = "$./imgs/s.tga";break;}		  // MatchRank_S              
					case 5:{_needSize = "126, 84";src = "$./imgs/ss.tga";break;}		  // MatchRank_SS            
					case 6:{_needSize = "179, 84";src = "$./imgs/sss.tga";break;}		  // MatchRank_SSS      
					default:{src = "$./imgs/d.tga";break;}		  // MatchRank_MAX(保护)
				}
				size = "500,500";
				setParamTimer("size","500,500",""+_needSize,100,4000);
				timer(4200,"PlaySoun");
			}

			void PlaySoun()
			{
				window.PlaySound(149);
			}
		}
		
		//比赛时间
		//参数data2:单位秒
		staticvar s_Time = new BaseText
		{
			size = "182,23";
			//pos = "541,551";
			left = parent.s_bk.left+100;
			top = parent.s_bk.top+parent.s_bk.height-height-7;
			show = false;xcenter = true;bold = true;
			timer(4000,"show=true");
			void SetData(data1,data2)
			{
				var _min = toint(data2)/60; //分钟
				var _sec = toint(data2)%60;	//秒钟
				src = ""+_min+":"+_sec;
				if(toint(data2)%60<10)
				{
					src = ""+_min+":0"+_sec;
				}
			}
		}


//		//模型2
//		//参数data1：性别
//		//参数data2:RoleID
//		//参数data3:动作的索引
//		staticvar s_P2_Model = new item
//		{
//			size = "100%,100%";pos = "280,0";
//			show = false;
//			//角色模型定义
//			var _rt= new rtexture
//			{
//				size = "100%,100%";bkcolor = "#000000";
//				eye.far = 1000;
////				eye.FOV = 0.5;
//				var _PlayerBody = new scene
//				{
//
//					camera.pos = "-0.2, 1.10, -3.5";
//					camera.dir = " 0, -1, 3.3";
//					camera.up = "0, 1, 0";
//					var _V3Action = new V3Action
//					{
//						pos = "0,-1.0,-1.5";name="Action";
//						SetUserPath="$./../../../../client/user/";
//						SETBODYID(window.find("GAME_OVER_LOGIC")._User2.GetRID());
////						SETBODYID(2);
//						if (window.g_DEBUG)
//						{
//							printf("游戏结算画面-P2-S:"+window.find("GAME_OVER_LOGIC")._User2.GetRID());
//						}
//					}	
//					//状态机，控制动作播完就不播了
//					var _MFSM = new MFSM
//					{
//						VNETLOG(11095,"3:"+window.find("GAME_OVER_LOGIC")._User2.GetRID()+"\n")
//						name="FSM";
//						SETBODYID(window.find("GAME_OVER_LOGIC")._User2.GetRID());
//					}
//					new CIfUser{name="ifuser";};
//				}
//			}
//			new img3d
//			{
//				size = "100%,100%";
//				src = parent._rt.UITexture;
//			}
//
//			var temp = 0;
//			void LoadAct()
//			{
//				_rt._PlayerBody._MFSM.clearset(temp);
//			}
//			//模型2
//			//参数data1：性别
//			//参数data2:RoleID
//			//参数data3:动作的索引
//			void SetData(data1,data2,data3)
//			{
//				temp = window.GetActIDByIndex(data3,data1);
//				if (window.g_DEBUG)
//				{
//					printf("游戏结算画面-P2动作-S:"+temp);
//				}
//				var _pos = window.GetCamPosByIndex(data2,data3);
//				if ( _pos != "")
//				{
//					var _dir = window.GetCamDirByIndex(data2,data3);
//					if (_dir != "")
//					{
//						_rt._PlayerBody.camera.pos = _pos;
//						_rt._PlayerBody.camera.dir = _dir;
//					}
//				}
//			}		
//		}	

		//胜利或者失败
		//参数 data2 0为默认 1表示输 2表示赢
		staticvar s_Win = new img
		{
//			pos = "1024,100";
			left = parent.width;
			top = 100;
			void SetData(data1,data2)
			{
				if(data2 == 2)
				{
					window.PlaySound(121);
					src = "$./imgs/win.tga";
				}
				else
				{
					window.PlaySound(109);
					src = "$./imgs/lose.tga";
				}
				timer(2333,"window.PlaySound(135)");
//				setParamTimer("pos","1024,100","200,600",267,2333);
				setParamTimer("left",""+parent.width,""+(parent.s_bk.left+70),267,2333);
				setParamTimer("top","100",""+(parent.s_bk.top+parent.s_bk.height+30),267,2333);
				setParamTimer("size","286,95","320,125",67,2600);
				setParamTimer("size","320,125","286,95",67,2667);
			}
		}
	}
};