import("$./../../UI/GameVideo/ClassDef_PlayBox.gml");


class VGameVideo_PlayBox_Logic item
{
	size(257,88);bkcolor="#ff0000";alpha=40;
	var _CurPlayTime = 0;	//当前时间
	var _TotalPlayTime = 0;	//总时间
	var _isCanDel = true;
	var _jinDuTiaoLength = 245;//进度条长度
	var _jinDuTiaoPosX = 20;//进度条的其实位置
	//=======================与显示交互==============================
	void Init()
	{
		//录像进度条
		staticvar s_JinDuTiao = new item
		{
			size(parent._jinDuTiaoLength,14);
			cursor = window.CURSOR_HAND;
			var _item = new item
			{
				size(0,14);bkcolor="#0000ff";alpha=40;
				void SetMySize(param)
				{
					size(param,14);
				}
			}
		}
		//录像进度滑块
		staticvar s_drag = new item
		{
			drag="self";size(20,20);
			void SetMyPos(param)
			{
				pos(param,0);
				parent.s_MoveBtn.pos(param,0);
			}
		}
		staticvar s_MoveBtn = new item
		{
			cursor = window.CURSOR_HAND;
			size(20,20);bkcolor="#00ff00";alpha=40;
		}
		//录像时间
		staticvar s_VideoTime = new item
		{
			size(120,20);pos(100,44);bkcolor="#ff0000";
			//录像时间数字-
			var _CurTimeNum1 = new text //分
			{
				pos="00,0";size="30,20";
			}
			var _CurTimeNum2 = new text //秒
			{
				pos="30,0";size="30,20";
			}
			var _TotalTimeNum1 = new text //分
			{
				pos="60,0";size="30,20";
			}
			var _TotalTimeNum2 = new text //秒
			{
				pos="90,0";size="30,20";
			}
			void SetData(data1,data2,data3,data4)
			{
				_CurTimeNum1.src=data1;
				_CurTimeNum2.src=data2;
				_TotalTimeNum1.src=data3;
				_TotalTimeNum2.src=data4;
			}
		}
		//播放状态
		staticvar s_PlayState = new text
		{
			size(70,20);pos(0,30);bkcolor="#00ffff";
			src="正在播放";
			void SetData(data)
			{
				src=data;
			}
		}
		//开始播放
		staticvar s_PlayVideo = new VMyButton
		{
			Init("播放");pos(0,50);
		}
		//暂停播放
		staticvar s_PauseVideo = new VMyButton
		{
			Init("暂停");pos(0,50);capturemouse=true;
		}
		//停止播放
		staticvar s_StopVideo = new VMyButton
		{
			Init("停止");pos(100,50);
		}
		//退出播放
		staticvar s_QuitVideo = new VMyButton
		{
			Init("退出");pos(180,50);
		}
	}
	inclass("VGameVideo_PlayBox_UI");
	//=============================================================
	Init();

	//设置响应事件
	void SetEvent()
	{
//		set s_JinDuTiao
//		{
//			void OnMouseDownL()
//			{
//				parent.timer(1,"SetSoundOn(0)");
//			}
//			void OnMouseUpL()
//			{
//				var isPlaying = false;
//				printf("s_JinDuTiao:OnMouseUpL():width:"+_item.width.__Long__+" ,mousex:"+mousex);
//
//				if(_item.width.__Long__ < mousex)
//				{
//					isPlaying = false;
//				}else
//				{
//					isPlaying = true;
//				}
//				_item.SetMySize(mousex);
//				parent.s_drag.SetMyPos(mousex);
//
//				var _pos = mousex;
//				if(_pos>(parent._jinDuTiaoLength-parent._jinDuTiaoPosX))
//					{
//						_pos=parent._jinDuTiaoLength-parent._jinDuTiaoPosX;
//					}
//				if(_pos<5){_pos=5;}
//				var _temp = window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayTimeLength()*_pos/parent._jinDuTiaoLength;
//				window.find("GAMELAYER").find("GAMEREPLAYLOAD").replayto(_temp);
//				
//				if(isPlaying)
//				{
//					parent.s_PlayVideo.show = false;
//					parent.s_PauseVideo.show=true;
//					parent.s_PlayState.SetData("正在播放");
//				}
//			
//				parent.timer(300,"SetSoundOn(1)");
//			}
//
//			void OnMouseUpL_Lost()
//			{
//				parent.timer(300,"SetSoundOn(1)");
//			}
//		}
//		set s_drag
//		{
//			void OnDrag()
//			{
//				if(parent.mousex-mousex-9>parent._jinDuTiaoLength)
//				{
//					parent.s_JinDuTiao._item.SetMySize(parent._jinDuTiaoLength);
//				}
//				else
//				{
//					parent.s_JinDuTiao._item.SetMySize(parent.mousex-mousex-9);
//				}
//				SetMyPos(parent.mousex-mousex-9);
//				if(parent.mousex>parent._jinDuTiaoLength)
//				{
//					SetMyPos(parent._jinDuTiaoLength);
//				}
//				if(parent.mousex<5)
//				{
//					SetMyPos(5);
//				}
//				parent.timer(10,"SetSoundOn(0)");
//			}
//			void OnMouseUpL_Lost()
//			{
//				var isPlaying = false;
//
//				printf("s_drag:OnMouseUpL_Lost():width:"+_item.width.__Long__+" ,mousex:"+mousex);
//				if(_item.width.__Long__ < parent.mousex)
//				{
//					isPlaying = false;
//				}else
//				{
//					isPlaying = true;
//				}
//
//				var _pos = parent.mousex;
//				if(_pos>(parent._jinDuTiaoLength-parent._jinDuTiaoPosX)){_pos=parent._jinDuTiaoLength-parent._jinDuTiaoPosX;}
//				if(_pos<5){_pos=5;}
//				var _temp = window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayTimeLength()*_pos/parent._jinDuTiaoLength;
//				window.find("GAMELAYER").find("GAMEREPLAYLOAD").replayto(_temp);
//
//				if(isPlaying)
//				{
//					parent.s_PlayVideo.show = false;
//					parent.s_PauseVideo.show=true;
//					parent.s_PlayState.SetData("正在播放");
//				}
//
//				parent.timer(300,"SetSoundOn(1)");
//			}
//			void OnMouseUpL()
//			{
//				var isPlaying = false;
//				
//				printf("s_drag:OnMouseUpL():width:"+_item.width.__Long__+" ,mousex:"+mousex);
//				if(_item.width.__Long__ < parent.mousex)
//				{
//					isPlaying = false;
//				}else
//				{
//					isPlaying = true;
//				}
//				
//				var _pos = parent.mousex;
//				if(_pos>(parent._jinDuTiaoLength-parent._jinDuTiaoPosX)){_pos=parent._jinDuTiaoLength-parent._jinDuTiaoPosX;}
//				if(_pos<5){_pos=5;}
//				var _temp = window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayTimeLength()*_pos/parent._jinDuTiaoLength;
//				window.find("GAMELAYER").find("GAMEREPLAYLOAD").replayto(_temp);
//
//				if(isPlaying)
//				{
//					parent.s_PlayVideo.show = false;
//					parent.s_PauseVideo.show=true;
//					parent.s_PlayState.SetData("正在播放");
//				}
//
//
//				parent.timer(300,"SetSoundOn(1)");
//			}
//		}
		set s_PlayVideo
		{
			void OnClick()
			{
				window.find("GAMELAYER").find("GAMEREPLAYLOAD").setPlay(1);
				show = false;
				parent.s_PauseVideo.show=true;
				parent.s_PlayState.SetData("正在播放");
			}
		}
		set s_PauseVideo
		{
			void OnClick()
			{
				window.find("GAMELAYER").find("GAMEREPLAYLOAD").setPlay(0);
				show=false;
				parent.s_PlayVideo.show = true;
				parent.s_PlayState.SetData("暂停中");
			}
		}
		set s_StopVideo
		{
			void OnClick()
			{
				window.find("GAMELAYER").find("GAMEREPLAYLOAD").replayto(1);
				window.find("GAMELAYER").find("GAMEREPLAYLOAD").setPlay(0);
				parent.s_PauseVideo.show=false;
				parent.s_PlayVideo.show = true;
				parent.s_PlayState.SetData("已停止");
			}
		}
		set s_QuitVideo
		{
			void OnClick()
			{
				window.find("UIController").LoadDLG(106);
			}
		}
	}
	void SetPlan()
	{
		while(1)
		{
			_TotalPlayTime = window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayTimeLength();//录像的总时间
			_CurPlayTime = window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayCurTime();//录像当前的时间
			//printf("B# 观战录像：_TotalPlayTime："+_TotalPlayTime+",_CurPlayTime:"+_CurPlayTime);
			if (_TotalPlayTime > 200)
			{
				s_VideoTime.SetData(_CurPlayTime/1000/60,_CurPlayTime/1000%60,_TotalPlayTime/1000/60,_TotalPlayTime/1000%60);
				if(_isCanDel)
				{	
					//遮丑需要这样做 - 2009年12月14日 yxf
					timer(500,"RealBeginPlay");
				}

				//var _temp = 226*window.find("GAMELAYER").find("GAMEREPLAYLOAD").getPlayCurTime()/window.find("GAMELAYER").find("GAMEVIDEO_SCENE").find("GAMEREPLAYLOAD").getPlayTimeLength();
				var _temp = _jinDuTiaoLength*_CurPlayTime/_TotalPlayTime;
				s_JinDuTiao._item.SetMySize(_temp);
				s_drag.SetMyPos(_temp);
				if(_temp>_jinDuTiaoLength-9)
				{
					s_drag.SetMyPos(_jinDuTiaoLength-9);
				}
			}
			
			sleep(500);
		}
	}
	SetEvent();
	
	//真正开始播放了-干掉loading
	void RealBeginPlay()
	{
		_isCanDel = false;
		window.find("LOADING_LOGIC").del();
		window.find("DLGLAYER").delallchild();
		
		//获得错过的精彩数据 2010年6月7日 yxf
		parent._videoPlay.GetMissData();
	}

	//设置音效的开关
	//参数:onoff 1开 0关
	void SetSoundOn(onoff)
	{
		window.tstatic.SetReplaySound(onoff);
	}
};