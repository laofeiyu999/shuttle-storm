//
//游戏内界面的界面部分的类定义:开始>>双打>>模型2
//

//模型2
class VBegin_Model_D2 item
{
	size = "100%,100%";pos = "700,-200";
	var _rt2= new rtexture
	{
		eye.far = 1000;
		size = "100%,100%";bkcolor = "#000000";
		var _scene = new scene
		{
			camera.pos = "-0.15, 1.88, -2.3";
			camera.dir = " 0, 0, 2.3";
			camera.up = "0, 1, 0";

			var _V3Action = new V3Action
			{
				SetUserPath="$./../../../../client/user/";name="Action";
				SETBODYID(window.find("GAME_LOGIC")._User2.GetRID());
				if (window.g_DEBUG)
				{
					printf("游戏开始画面RID-P2:"+window.find("GAME_LOGIC")._User2.GetRID());
				}
				pos = "0,1,0";
			};
			//状态机，控制动作播完就不播了
			var _MFSM = new MFSM
			{
				name="FSM";
				SETBODYID(window.find("GAME_LOGIC")._User2.GetRID());
			}
			new CIfUser{name="ifuser";};
		}
	}

	new img3d
	{
		size = "100%,100%";
		src = parent._rt2.UITexture;
	}

	void LoadAct()
	{
		_rt2._scene._MFSM.clearset(temp);				
	}
	var temp = 0;
	//模型2
	//参数data1:RoleID
	//参数data2:动作的索引
	//参数data3:性别
	void SetData(data1,data2,data3)
	{
		temp = window.GetActIDByIndex(data2,data3);
		if (window.g_DEBUG){printf("游戏开始画面-P2的动作ID:"+temp);}
		var _pos = window.GetCamPosByIndex(data2,data3);
		if ( _pos != "")
		{
			var _dir = window.GetCamDirByIndex(data2,data3);
			if (_dir != "")
			{
				_rt._scene.camera.pos = _pos;
				_rt._scene.camera.dir = _dir;
			}
		}
	}
};