//
//游戏内界面的界面部分的类定义:开始>>双打>>模型1
//

//模型1
class VBegin_Model_D1 item
{
	size = "100%,100%";pos = "-700,-200";
	//角色模型定义
	var _rt= new rtexture
	{
		size = "100%,100%";bkcolor = "#000000";
		eye.far = 1000;
		var _PlayerBody = new scene
		{
			camera.pos = "0.15, 2.05, -2.3";
			camera.dir = " 0, 0, 2.3";
			camera.up = "0, 1, 0";
			var _V3Action = new V3Action
			{
				pos = "0,1,0";name="Action";
				SetUserPath="$./../../../../client/user/";
				SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
				if (window.g_DEBUG)
				{
					printf("游戏开始画面RID-P1:"+window.find("GAME_LOGIC")._User1.GetRID());
				}
			}	
			//状态机，控制动作播完就不播了
			var _MFSM = new MFSM
			{
				name="FSM";
				SETBODYID(window.find("GAME_LOGIC")._User1.GetRID());
			}
			new CIfUser{name="ifuser";};
		}
	}
	new img3d
	{
		size = "100%,100%";
		src = parent._rt.UITexture;
	}
	
	void LoadAct()
	{
		_rt._PlayerBody._MFSM.clearset(temp);				
	}
	var temp = 0;
	//模型1
	//参数data1:RoleID
	//参数data2:动作的索引
	//参数data3:性别
	void SetData(data1,data2,data3)
	{
		temp = window.GetActIDByIndex(data2,data3);
		if (window.g_DEBUG){printf("游戏开始画面-P1的动作ID:"+temp);}
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
	}
};