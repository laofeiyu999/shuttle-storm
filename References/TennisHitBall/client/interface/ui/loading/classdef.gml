//Loading界面的显示部分类定义(到游戏)
//yxf 2009年3月9日

class VLoading_UserState_UI item
{
	size = "230,42";bgcolor = -1;
	void Init()
	{
		new img
		{
			src = "$./imgs"+window.g_Sex+"/ID_BK2.tga";valign(50,0);
		}
		//玩家昵称
		staticvar s_Nkname = new BaseText
		{
			size = "85,22";pos = "2,10";xcenter = true;ycenter = true;//bgcolor = "#FF";
			void SetData(data1){src = data1;}
		}
		//玩家状态
		staticvar s_State = new item
		{
			var _state = 0;	//0未准备 1已完成
			size = "120,42";pos = "85,0";//bgcolor = "#FF";
			var _light1 = new img{src = "$./imgs"+window.g_Sex+"/light1.tga";pos(0,0);}
			var _light2 = new img{src = "$./imgs"+window.g_Sex+"/light1.tga";pos(22,0);}
			var _light3 = new img{src = "$./imgs"+window.g_Sex+"/light1.tga";pos(44,0);}
			var _light4 = new img{src = "$./imgs"+window.g_Sex+"/light1.tga";pos(66,0);}
			var _light5 = new img{src = "$./imgs"+window.g_Sex+"/light1.tga";pos(88,0);}
			//var _finish = new img{valign(50,0);halign(50,0);show = false;}
			void Init()
			{
				_light1.src = "$./imgs"+window.g_Sex+"/light1.tga";
				_light2.src = "$./imgs"+window.g_Sex+"/light1.tga";
				_light3.src = "$./imgs"+window.g_Sex+"/light1.tga";
				_light4.src = "$./imgs"+window.g_Sex+"/light1.tga";
				_light5.src = "$./imgs"+window.g_Sex+"/light1.tga";
			}
			
			void Run()
			{
				var _times = 0;
				while (_state == 0)
				{
					_times += 1;
					if (_times > 5){_times = 0;}
					Init();
					switch (_times)
					{
						case 1:{_light1.replaceSrc("light1.tga","light2.tga");break;}
						case 2:{_light2.replaceSrc("light1.tga","light2.tga");break;}
						case 3:{_light3.replaceSrc("light1.tga","light2.tga");break;}
						case 4:{_light4.replaceSrc("light1.tga","light2.tga");break;}
						case 5:{_light5.replaceSrc("light1.tga","light2.tga");break;}
						default:break;
					}
					var _odds = rand(0,3)
					sleep(_odds*100+100);
				}
			}
			Run();
			//外部接口:0初始值，1已完成
			void SetData(data1)
			{
				_state = data1;
				if (_state == 1)
				{
					_light1.show = false;
					_light2.show = false;
					_light3.show = false;
					_light4.show = false;
					_light5.show = false;
					//_finish.show = true;
					//_finish.src = "$./imgs"+window.g_Sex+"/finish.tga";
				}
			}
		}
	}
};

class VLoadingToGame_UI item
{
	size = "100%,100%";bgcolor = -1;
	
	//===================================与显示交互部分========================================
	void Init()
	{
		new img
		{
			size = "100%,100%";src = "$./imgs"+window.g_Sex+"/loadbk.jpg";
		}
		new img//小人
		{
			//pos = "450,270";
			halign(50,0);top = 270;
			var _res = rand(0,100);
			_res %= 2;
			_res += 1;
			src = "$./imgs"+_res+"/xiaoren.tga";
			if (_res == 1)
			{
				clipani(120,120,1,16);
				anispeed = 30;
			}
			else
			{
				clipani(130,130,1,16);
				anispeed = 20;
			}
		}
		new img//球
		{
			//pos = "350,390";
			halign(50,0);top = 390;
			src = "$./imgs/qiu.tga";
			clipani(300,23,1,10);
			anispeed = 20;
		}
		
//		//标题底
//		staticvar s_titlebk = new img
//		{
//			src = "$./imgs/titlebk.tga";pos(0,50);show = false;
//		}	
		//比赛类型标示
		//参数 data1:无用
		//参数 data2：0普通，1竞技
		//参数 data3: 竞技ID(data2=1有效)
//		staticvar s_GameType = new img
//		{
//			pos(20,60);show = false;
//			void SetData(data1,data2,data3)
//			{
//				parent.s_titlebk.show = false;
//				show = false;
//				if (data2 == 1)
//				{
//					parent.s_titlebk.show = true;
//					show = true;
//					src = "$./imgs/Title_"+data3+".tga";
//				}
//			}
//		}
		
		//小提示
		staticvar s_Tip = new BaseText
		{
			halign(50,0);valign(70,0);
			//color = "#FFFFFF";
			//data1：内容
			void SetData(data1)
			{
				src = "小提示:"+data1;
			}
		}

		//玩家一：自己
		//参数 见类定义
		staticvar s_User1 = new VLoading_UserState
		{
//			pos(25,680);
			left = 25;
			valign(100,-88+height);
		}

		//玩家二：对手
		//参数 见类定义
		staticvar s_User2 = new VLoading_UserState
		{
//			pos(275,680);
			left = 520;
			valign(100,-88+height);
		}

		//玩家三：自己队友
		//参数 见类定义
		staticvar s_User3 = new VLoading_UserState
		{
//			pos(520,680);
			left = 275;
			valign(100,-88+height);
		}

		//玩家四：对手队友
		//参数 见类定义
		staticvar s_User4 = new VLoading_UserState
		{
//			pos(765,680);
			left = 765;
			valign(100,-88+height);
		}
	}
};