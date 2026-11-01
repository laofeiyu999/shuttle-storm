//
//游戏内界面的界面部分的类定义:游戏中>>单打>>一局比赛结束提示-模型1
//

//一局比赛结束提示
//参数 RoleID:角色ID
//参数 Spoint: 胜利局数
//参数 Fpoint: 失败局数
//参数 MyName: 自己的昵称
//参数 OtherName: 对方的昵称
//参数 ActIndex：动作的ID,摄像机参数的索引	
//参数 Sex：性别
class VPlay_OneGameEnd_1 item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 30;
	var MoveModel = new item
	{
		size = "100%,100%";//pos = "1024,600";
		left = parent.width;//bgcolor = "#ff";
		top = parent.height;
		var _rt2= new rtexture
		{
			eye.far = 1000;
			eye.FOV = 0.5;
			size = "100%,100%";bkcolor = "#000000";
			var _scene = new scene
			{
				camera.pos = window._Camera_OneGameEnd_Pos;
				camera.dir = window._Camera_OneGameEnd_Dir;
				camera.up = window._Camera_OneGameEnd_Up;

				var _V3Action = new V3Action
				{
					SetUserPath="$./../../../../client/user/";name="Action";
					SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
					//SETBODYID(window.g_TestRID);
					if (window.g_DEBUG)
					{
						printf("一局比赛结束RID-P1:"+window.find("GAME_LOGIC")._User1.GetRID());
					}
					
					pos = window._Camera_OneGameEnd_Model_Pos;
				};
				//状态机，控制动作播完就不播了
				var _MFSM = new MFSM
				{
					VNETLOG(11095,"6:"+window.find("GAME_LOGIC")._User1.GetRID()+"\n")
					name="FSM";
					SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
					//SETBODYID(window.g_TestRID);
				}
				new CIfUser{name="ifuser";};
			}
		}

		new img3d
		{
			size = "100%,100%";
			src = parent._rt2.UITexture;
		}
	}

	var point = new item
	{
		size = "250,200";
		//pos = "-286,0";
		halign(1,-300);valign(90,0);
		new img//bk
		{
			//pos = "0,450";
			src = "$./imgs/diTu.tga";
		}
		new img //p1底图
		{
			pos = "17,30";
			src = "$./imgs"+window.g_Sex+"/zjdi.tga";
		}
		new img //p1底图
		{
			pos = "17,120";
			src = "$./imgs"+window.g_Sex+"/dfdi.tga";
		}
		
		var p1point = new img{valign(7,0);halign(95,0);}//P1 point
		var p2point = new img{valign(88,0);halign(95,0);}//p2 point
		var p1name = new text
		{
			size = "120,20";
			bold = true;txtborder = "#000000";
			font = "宋体,-1,20";
			color = "#FFFFFF";
			xcenter = true;
			pos = "26,35";
		}//p1 name
		var p2name = new text
		{
			size = "120,20";
			bold = true;txtborder = "#000000";
			font = "宋体,-1,20";
			color = "#FFFFFF";
			xcenter = true;
			pos = "26,125";
		}//p2 name
		
	}
	void ChangeP1Point()
	{
		point.p1point.src = "$./imgs/num/NewBlue"+_tempspoint+".tga";
	}
	void ChangeP2Point()
	{
		point.p2point.src = "$./imgs/num/NewBlue"+_tempfpoint+".tga";
	}
	var _tempspoint = 0;
	var _tempfpoint = 0;
	void InWindow()
	{
		window.PlaySound(126);
	}
	void OutWindow()
	{
		window.PlaySound(106);
	}
	void ChangePoint()
	{
		window.PlaySound(117);
	}
	void SetData(RoleID,Spoint,Fpoint,MyName,OtherName,ActIndex,Sex)
	{
		point.p1point.src = "$./imgs/num/NewBlue"+_tempspoint+".tga";
		point.p2point.src = "$./imgs/num/NewBlue"+_tempfpoint+".tga";
		point.p1name.src = MyName;
		point.p2name.src = OtherName;
		var _ActID = window.GetActIDByIndex(ActIndex,Sex);//动作ID
		MoveModel._rt2._scene._MFSM.clearset(_ActID);
//		MoveModel._rt2._scene._V3Action.Act = _ActID;
//		MoveModel._rt2._scene._V3Action.AniCtrl.Reset();
//		MoveModel._rt2._scene._V3Action.AniCtrl.Start();
		if (window.g_DEBUG){printf("一局结束的动作ID-S-P1:"+_ActID);}
		
		var _pos = window.GetCamPosByIndex(ActIndex,Sex);
		if ( _pos != "")
		{
			var _dir = window.GetCamDirByIndex(ActIndex,Sex);
			if (_dir != "")
			{
				MoveModel._rt._scene.camera.pos = _pos;
				MoveModel._rt._scene.camera.dir = _dir;
			}
		}
		if(Spoint != _tempspoint)
		{
			point.p1point.setParamTimer("size","98,92","0,92",233,833);
			_tempspoint = Spoint;
			timer(1067,"ChangeP1Point");
			point.p1point.setParamTimer("size","0,92","98,92",233,933);
		}
		if(Fpoint != _tempfpoint)
		{
			point.p2point.setParamTimer("size","98,92","0,92",233,833);
			_tempfpoint = Fpoint;
			timer(1067,"ChangeP2Point");
			point.p2point.setParamTimer("size","0,92","98,92",233,933);
		}
		window.PlaySound(105);
//		MoveModel.setParamTimer("pos","1024,600","0,0",267,0);
		MoveModel.setParamTimer("left",""+width,"0",267,0);
		MoveModel.setParamTimer("top",""+height,"0",267,0);
		timer(333,"InWindow");
		timer(833,"ChangePoint");
		timer(1867,"OutWindow");
		//point.setParamTimer("pos","-286,0","650,0",267,333);
		//point.setParamTimer("pos","650,0","1100,0",133,1867);
		point.setParamTimer("halign","1,-300","80,0",267,333);
		point.setParamTimer("halign","80,0","100,300",133,1867);
	}
};