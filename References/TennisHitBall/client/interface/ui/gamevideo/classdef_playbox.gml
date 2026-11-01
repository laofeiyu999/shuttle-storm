


class VGameVideo_PlayBox_UI item
{
	size(286,120);bkcolor=-1;show=false;
	//=======================与显示交互==============================
	void Init()
	{
		new img
		{
			size(286,120);
			src="$./imgs"+window.g_Sex+"/video_bk_new.tga";
		}
		
		//录像进度条
		staticvar s_JinDuTiao = new item
		{
			size(245,8);pos(21,47);//bgcolor="#ff";
			var _curPosX = 0;
			//cursor = window.CURSOR_HAND;
			new VPic3_VedioPowerLineGray_UI
			{
				size(245,8);//pos(0,6);
			}
			var _item = new item
			{
				size(0,8);//pos(0,6);
				new VPic3_VedioPowerLine_UI
				{
					size(245,8);
					//src="$./imgs"+window.g_Sex+"/video_plan.tga";
				}
				void SetMySize(param)
				{
					//printf("xyy:_curPosX:"+param);
					parent._curPosX = param;
					size(param,8);
				}
			}
		}
//		//录像进度滑块
//		staticvar s_drag = new item
//		{
//			//drag="self";
//			size(18,18);pos(20,46);//bgcolor = "#FF";alpha = 80;
//			void SetMyPos(param)
//			{
//				//printf("xyy:param:"+param);
//				if(param < parent.s_MoveBtn.width/2)
//				{
//					pos(20,46);
//					parent.s_MoveBtn.pos(20,46);
//				}
//				else
//				{
//					pos(10+param,46);
//					parent.s_MoveBtn.pos(10+param,46);
//				}
//				
//			}
//		}
//		staticvar s_MoveBtn = new VBTN_DragBtn_New
//		{
//			cursor = window.CURSOR_HAND;
//			pos(20,46);//size(13,16);
//			//src="$./imgs"+window.g_Sex+"/video_moveBtn.tga";
//		}
		//录像时间
		staticvar s_VideoTime = new item
		{
			size(90,20);pos(175,72);
			//录像时间数字-
			var _CurTimeNum1 = new text //分
			{
				pos="0,0";size="20,20";bold = true;
			}
			new text
			{
				size="20,20";pos="15,0";src=":"; bold = true;
			}
			var _CurTimeNum2 = new text //秒
			{
				pos="21,0";size="20,20";bold = true;
			}
			new text
			{
				size="20,20";pos="37,0";src="/";bold = true;
			}
			var _TotalTimeNum1 = new text //分
			{
				pos="45,0";size="20,20";bold = true;
			}
			new text
			{
				size="20,20";pos="59,0";src=":";
			}
			var _TotalTimeNum2 = new text //秒
			{
				pos="66,0";size="20,20";bold = true;
			}
			void SetData(data1,data2,data3,data4)
			{
				if(toint(data1)<10)
				{
					_CurTimeNum1.src="0"+data1;
				}
				else
				{
					_CurTimeNum1.src=data1;
				}
				if(toint(data2)<10)
				{
					_CurTimeNum2.src="0"+data2;
				}
				else
				{
					_CurTimeNum2.src=data2;
				}
				if(toint(data3)<10)
				{
					_TotalTimeNum1.src="0"+data3;
				}
				else
				{
					_TotalTimeNum1.src=data3;
				}
				if(toint(data4)<10)
				{
					_TotalTimeNum2.src="0"+data4;
				}
				else
				{
					_TotalTimeNum2.src=data4;
				}
			}
		}
		//播放状态
		staticvar s_PlayState = new text
		{
			size(70,20);pos(15,20);bold = true;
			src="正在播放";
			void SetData(data)
			{
				src=data;
			}
		}
		//开始播放
		staticvar s_PlayVideo = new VBTN_VideoPlay
		{
			pos(47,72);show = false;
		}
		//暂停播放
		staticvar s_PauseVideo = new VBTN_VideoPause
		{
			pos(47,72); //capturemouse=true;
		}
		//停止播放
		staticvar s_StopVideo = new VBTN_VideoStop
		{
			pos(72,72);
		}
//		//退出播放
//		staticvar s_QuitVideo = new VBTN_43_New
//		{
//			pos(194,8);InitText("退出");//valign(100,-6);halign(100,-360);
//		}

		//退出播放
		staticvar s_QuitVideo = new VBTN_VideoQuit
		{
			pos(250,20);
		}
	}
	void PlayBoxShow()
	{
		show=true;
	}
};