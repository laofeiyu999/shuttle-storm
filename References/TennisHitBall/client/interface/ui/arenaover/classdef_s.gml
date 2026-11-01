//
//活动场-游戏结束结算界面的定义>>单打
//安峰册 2009-11-24


import("$./ClassDef_Data.gml");

class VArena_Over_S_UI item
{
	size = "100%,100%";	alpha = 30;

	void Init()
	{
		printf("VArena_Over_S_UI-Init()");
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
			size = "100%,100%";
			//角色模型定义
			var _rt= new rtexture
			{
				size = "100%,100%";bkcolor = "#000000";
				eye.far = 1000;
				eye.FOV = 0.5;
				var _PlayerBody = new scene
				{
					camera.pos = "-0.6, 1.3, -3.2";
					camera.dir = "0.6, -0.5, 3.2";
					camera.up = "0, 1, 0";
					var _V3Action = new V3Action
					{
						pos = "-0.65,0,-1";name="Action";
						SetUserPath="$./../../../../client/user/";
						SETBODYID(window.GetMyRID());
//						SETBODYID(2);
						if (window.g_DEBUG)
						{
							printf("竞技结算-模型-S:"+window.GetMyRID());
						}
					}
					//状态机，控制动作播完就不播了
					var _MFSM = new MFSM
					{
						name="FSM";
						SETBODYID(window.GetMyRID());
					}
					new CIfUser{name="ifuser";};
				}
			}
			new img3d
			{
				size = "100%,100%";
				src = parent._rt.UITexture;
			}

			//模型
			//参数data1：性别
			//参数data2:RoleID
			//参数data3:动作的索引
			void SetData(data1,data2,data3)
			{
				printf("B# VArenaOver_UI-设置模型参数-data1:"+data1+",data2:"+data2+",data3:"+data3);
				var _ActID = window.GetActIDByIndex(data3,data1);
				if (window.g_DEBUG)
				{
					printf("B# VArenaOver_UI-模型动作-S:"+temp);
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
				_rt._PlayerBody._MFSM.clearset(_ActID);
//				_rt._PlayerBody._V3Action.Act = _ActID;
//				_rt._PlayerBody._V3Action.AniCtrl.Reset();
//				_rt._PlayerBody._V3Action.AniCtrl.Start();
			}
		}

		staticvar s_bk = new VArenaOver_BG
		{
			setParamTimer("alpha",100,0,300,2433,"SetAlphaEnd");
			void SetAlphaEnd()
			{
				parent.s_P1_Data.ShowData(1);
				if(parent.s_P2_Data.s_NkName._text.src.Count>0)
				{
					parent.s_P2_Data.ShowData(2);
				}
			}
		}
		
		//游戏结算图标
		new img
		{
//			pos = "163,108";
			src="$./imgs" + window.g_Sex+ "/arenaOver_title.tga"; show = true;
			left = parent.s_bk.left;
			top = parent.s_bk.top-height/2;
		}
//
//		//保存录像按钮
//		staticvar s_SaveVideo = new VBTN_A_New
//		{
//			pos(767,526);
//			show=false;
//			InitText("保存录像");
//			timer(2433,"saveVideoShow");
//			void saveVideoShow()
//			{
//				show=true;
//			}
//			SetTextColor(1);
//			_text.bold = true;
//		}

		//自己的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VArena_Over_Data_UI
		{
			//pos = "350,150";
			left = parent.s_bk.left + 230;
			top = parent.s_bk.top+30;
		}

		//对方的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VArena_Over_Data_UI
		{	
//			pos = "520,150";
			left = parent.s_bk.left + 430;
			top = parent.s_bk.top+30;
		}


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
				setParamTimer("top","100",""+(parent.s_bk.top+parent.s_bk.height),267,2333);
				setParamTimer("size","286,95","320,125",67,2600);
				setParamTimer("size","320,125","286,95",67,2667);
			}
		}
	}
	//奖券,活动点,积分,贡献点的显示
	//_stateArray:奖券,活动点,积分,贡献点的状态，0为没有，1为有
	void ShowContent(_stateArray)
	{
		s_bk.ShowContent(_stateArray);
		s_P1_Data.ShowContent(_stateArray);
		s_P2_Data.ShowContent(_stateArray);
	}
};