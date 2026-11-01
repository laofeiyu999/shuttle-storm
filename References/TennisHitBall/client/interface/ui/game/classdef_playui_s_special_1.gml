//
//游戏内界面的界面部分的类定义:游戏中>>单打>>特殊提示信息-帅的动作-模型1
//

//p1一球结束：特殊提示信息
//参数 RoleID:角色的ID
//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 
//参数 Sex：性别
class VPlay_Special_1 item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 22;show = false;
	new scene
	{
		new fmodel
		{
			src = "$./../../../model/C03151.v3f";
			pos="0,0,20";
			setShader("add_texture.fx");
		}
		new fmodel
		{
			src = "$./../../../model/CO3150.v3f";
			pos="1,-0.1,5";
			setShader("add_texture.fx");
		}
	}
	var MoveModel = new item
	{
		size = "100%,100%";
		pos = "1024,0";
		var _rt2= new rtexture
		{
			eye.far = 1000;
			eye.FOV = 0.7;
			size = "100%,100%";bkcolor = "#000000";
			var _scene = new scene
			{
				camera.pos = window._Camera_Special_Pos;
				camera.dir = window._Camera_Special_Dir;
				camera.up = window._Camera_Special_Up;

				var _V3Action = new V3Action
				{
					name="Action";
					SetUserPath="$./../../../../client/user/";
					SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
					//SETBODYID(window.g_TestRID);
					if (window.g_DEBUG)
					{
						printf("C# GameShow:特殊信息提示RID-S-P1:"+window.find("GAME_LOGIC")._User1.GetRID());
					}
					pos = window._Camera_Special_Model_Pos;
				};
				//状态机，控制动作播完就不播了
				var _MFSM = new MFSM
				{
					VNETLOG(11095,"4:"+window.find("GAME_LOGIC")._User1.GetRID()+"\n")
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
	//上边图片文字
	var tips = new img
	{
		valign(70,0);halign(70,0);size = "2540,550";alpha = 100;
	}
	//参数 RoleID:角色的ID
	//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
	//参数 Sex：性别
	void SetData(data1,data2,data3)
	{
		printf("C# GameShow:是自己的帅动作:RoleID:"+data1+",ActIndex:"+data2+",Sex:"+data3);
		window.PlaySound(101);
		var temp = toint(data2)/100;
		switch (temp)
		{
			case 1:{tips.src = "$./imgs/Ace.tga";break;}
			case 2:{tips.src = "$./imgs/Smash.tga";break;}
			case 3:{tips.src = "$./imgs/FifthStop.tga";break;}
			case 4:{tips.src = "$./imgs/Anti_Kill.tga";break;}	
		}
		var _ActID = window.GetActIDByIndex(data2,data3);//动作ID
//		MoveModel._rt2._scene._MFSM.clearset(_ActID);
		MoveModel._rt2._scene._V3Action.Act = _ActID;
		MoveModel._rt2._scene._V3Action.AniCtrl.Reset();
		MoveModel._rt2._scene._V3Action.AniCtrl.Start();
		if (window.g_DEBUG){printf("C# GameShow:特殊动作ID-S-P1:"+_ActID);}

		var _pos = window.GetCamPosByIndex(data2,data3);
		if ( _pos != "")
		{
			var _dir = window.GetCamDirByIndex(data2,data3);
			if (_dir != "")
			{
				MoveModel._rt._scene.camera.pos = _pos;
				MoveModel._rt._scene.camera.dir = _dir;
			}
		}
		//提示字图片大小及移动
		tips.setParamTimer("size",window._Size_SpecialText_1,window._Size_SpecialText_2,window._Time_Tips_Zoom,window._Time_Tips_Wait);
		tips.setParamTimer("size",window._Size_SpecialText_2,window._Size_SpecialText_3,window._Time_Tips_Big,window._Time_Tips_Zoom);
		tips.setParamTimer("alpha",100,0,window._Time_Tips_Big+window._Time_Tips_Zoom+window._Time_Tips_Wait,0);
		//模型移动
		MoveModel.setParamTimer("pos",window._Pos_SpecialBegin,window._Pos_SpecialEnd,window._Time_SpecialMove,0);
	}
};