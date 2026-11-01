//
//游戏内界面的界面部分的类定义:游戏中>>双打>>一局比赛结束提示-模型1和3 
//

//一局比赛结束提示
//P1RID,P1point,P2point,P1Name,P2Name,P1Act,P1Sex,P3RID,P3Name,P3Act,P3Sex,P4Name
//参数 P1RID:我自己的角色ID
//参数 P1point: 胜利局数
//参数 P2point: 失败局数
//参数 P1Name: 自己的昵称
//参数 P2Name: 对方P2的昵称
//参数 P1Act: 我的动作的索引
//参数 P1Sex：我的性别
//参数 P3RID：我的队友P3的RID
//参数 P3Name：我的队友P3的昵称
//参数 P3Act：我的队友P3的动作的索引
//参数 P3Sex：我的队友P3的性别
//参数 P4Name：对方P4的昵称
class VPlay_OneGameEnd_D_1 item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 30;
	var m_Model = new item
	{
		size = "100%,100%";//pos = "1024,600";
		left = parent.width;//bgcolor = "#ff";
		top = parent.height;
		var _rt2= new rtexture
		{
			eye.far = 1000;
			eye.FOV = 0.5;
			size = "100%,100%";bkcolor = "#000000";
			var _scene1 = new scene
			{
				camera.pos = window._Camera_OneGameEnd_Pos;
				camera.dir = window._Camera_OneGameEnd_Dir;
				camera.up = window._Camera_OneGameEnd_Up;

				//模型P1
				var _Model_P1 = new item
				{
					size = "100%,100%";
					var _V3Action = new V3Action
					{
						SetUserPath="$./../../../../client/user/";name="Action";
						SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
						//SETBODYID(window.g_TestRID1);
						if (window.g_DEBUG)
						{
							printf("一局比赛结束RID-Pl:"+window.find("GAME_LOGIC")._User1.GetRID());
						}	
						pos = window._Camera_OneGameEnd_Model_Pos;
					};
					//状态机，控制动作播完就不播了
					var _MFSM = new MFSM
					{
						name="FSM";
						SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
						//SETBODYID(window.g_TestRID1);
					}
					new CIfUser{name="ifuser";};
				}
			}
			var _scene2 = new scene
			{
				camera.pos = window._Camera_OneGameEnd_Pos2;
				camera.dir = window._Camera_OneGameEnd_Dir2;
				camera.up = window._Camera_OneGameEnd_Up2;

				//模型P3
				var _Model_P3 = new item
				{
					size = "100%,100%";
					var _V3Action = new V3Action
					{
						SetUserPath="$./../../../../client/user/";name="Action";
						SETBODYID(window.find("GAME_LOGIC")._User3.GetRID());
						//SETBODYID(window.g_TestRID2);
						if (window.g_DEBUG)
						{
							printf("一局比赛结束RID-P3:"+window.find("GAME_LOGIC")._User3.GetRID());
						}
						pos = window._Camera_OneGameEnd_Model_Pos2;
					};
					//状态机，控制动作播完就不播了
					var _MFSM = new MFSM
					{
						name="FSM";
						SETBODYID(window.find("GAME_LOGIC")._User3.GetRID());
						//SETBODYID(window.g_TestRID2);
					}
					new CIfUser{name="ifuser";};
				}
			}
		}

		new img3d
		{
			size = "100%,100%";
			src = parent._rt2.UITexture;
		}
	}
	//比分
	var m_Point = new item
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
			//pos = "17,463";
			pos = "17,20";
			src = "$./imgs"+window.g_Sex+"/zjdi.tga";
		}
		new img //p3底图
		{
			//pos = "17,503";
			pos = "17,60";
			src = "$./imgs"+window.g_Sex+"/zjdi.tga";
		}
		new img //p2底图
		{
			//pos = "17,557";
			pos = "17,105";
			src = "$./imgs"+window.g_Sex+"/dfdi.tga";
		}
		new img //p4底图
		{
//			pos = "17,597";
			pos = "17,145";
			src = "$./imgs"+window.g_Sex+"/dfdi.tga";
		}

		var _p1point = new img{valign(7,0);halign(95,0);}//己方的比分
		var _p2point = new img{valign(88,0);halign(95,0);}//对方的比分
		var _p1name = new text
		{
			size = "120,20";font = "宋体,-1,20";xcenter = true;
			//pos = "26,468";
			pos = "26,25";
			bold = true;txtborder = "#000000";color = "#FFFFFF";
		}//p1 name
		var _p3name = new text
		{
			size = "120,20";font = "宋体,-1,20";xcenter = true;]
			//pos = "26,508";
			pos = "26,65";
			bold = true;txtborder = "#000000";color = "#FFFFFF";
			//src = "p3的imgz";
		}//p3 name
		var _p2name = new text
		{
			size = "120,20";font = "宋体,-1,20";xcenter = true;
			//pos = "26,562";
			pos = "26,110";
			bold = true;txtborder = "#000000";color = "#FFFFFF";
		}//p2 name
		var _p4name = new text
		{
			size = "120,20";font = "宋体,-1,20";xcenter = true;
			//pos = "26,602";
			pos = "26,150";
			bold = true;txtborder = "#000000";color = "#FFFFFF";
			//src = "p4的imgz";
		}//p4 name
	}
	void ChangeP1Point()
	{
		m_Point._p1point.src = "$./imgs/num/NewBlue"+_tempspoint+".tga";
	}
	void ChangeP2Point()
	{
		m_Point._p2point.src = "$./imgs/num/NewBlue"+_tempfpoint+".tga";
	}
	var _tempspoint = 0;
	var _tempfpoint = 0;
	//
	void SetData(P1RID,P1point,P2point,P1Name,P2Name,P1Act,P1Sex,P3RID,P3Name,P3Act,P3Sex,P4Name)
	{
		printf("P1RID:"+P1RID+",P1point:"+P1point+",P2point:"+P2point+",P1Name:"+P1Name
			+",P2Name:"+P2Name+",P1Act:"+P1Act+",P1Sex:"+P1Sex+",P3RID:"+P3RID
			+",P3Name:"+P3Name+",P3Act:"+P3Act+",P3Sex:"+P3Sex+",P4Name:"+P4Name);

		m_Point._p1point.src = "$./imgs/num/NewBlue"+_tempspoint+".tga";
		m_Point._p2point.src = "$./imgs/num/NewBlue"+_tempfpoint+".tga";
		m_Point._p1name.src = P1Name;
		m_Point._p2name.src = P2Name;
		m_Point._p3name.src = P3Name;
		m_Point._p4name.src = P4Name;

		var _P1Act = window.GetActIDByIndex(P1Act,P1Sex);//P1的动作
		var _P3Act = window.GetActIDByIndex(P3Act,P3Sex);//P3的动作
		m_Model._rt2._scene1._Model_P1._MFSM.clearset(_P1Act);
		m_Model._rt2._scene2._Model_P3._MFSM.clearset(_P3Act);

		if (window.g_DEBUG){printf("一局结束-P1的动作ID:"+_P1Act);}
		if (window.g_DEBUG){printf("一局结束-P3的动作ID:"+_P3Act);}

		var _pos = window.GetCamPosByIndex(ActIndex,Sex);
		if ( _pos != "")
		{
			var _dir = window.GetCamDirByIndex(ActIndex,Sex);
			if (_dir != "")
			{
				m_Model._rt._scene1.camera.pos = _pos;
				m_Model._rt._scene1.camera.dir = _dir;

				m_Model._rt._scene2.camera.pos = _pos;
				m_Model._rt._scene2.camera.dir = _dir;
			}
		}
		if(P1point != _tempspoint)
		{
			m_Point._p1point.setParamTimer("size","98,92","0,92",233,833);
			_tempspoint = P1point;
			timer(1067,"ChangeP1Point");
			m_Point._p1point.setParamTimer("size","0,92","98,92",233,933);
		}
		if(P2point != _tempfpoint)
		{
			m_Point._p2point.setParamTimer("size","98,92","0,92",233,833);
			_tempfpoint = P2point;
			timer(1067,"ChangeP2Point");
			m_Point._p2point.setParamTimer("size","0,92","98,92",233,933);
		}
//		m_Model.setParamTimer("pos","1024,600","0,0",267,0);
		m_Model.setParamTimer("left",""+width,"0",267,0);
		m_Model.setParamTimer("top",""+height,"0",267,0);
		window.PlaySound(105);//比赛结束后评分时人物形象进入画面时
		timer(333,"window.PlaySound(126)");//比赛结束后结算框进入屏幕的声音
		timer(833,"window.PlaySound(117)");//比赛结束后评论分数框翻转时
		timer(1867,"window.PlaySound(106)");//比赛结束后结算框离开屏幕的声音
		//m_Point.setParamTimer("pos","-286,0","650,0",267,333);
		//m_Point.setParamTimer("pos","650,0","1100,0",133,1867);
		m_Point.setParamTimer("halign","1,-300","80,0",267,333);
		m_Point.setParamTimer("halign","80,0","100,300",133,1867);
	}
};