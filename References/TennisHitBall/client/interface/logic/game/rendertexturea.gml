//import("$./../mdbdef/ScriptDbDef.gml");
//import("$./../../mdb/dbdef.gml");
//import("$./../interface/Logic/GmlCtrls/Common/Globals_Other.gml");
import("$./../../../game/user.gml");

class RenderMap GCMap
{
//		Fov("0.05");
	bgcolor = "#0";
	camera.pos = "0, 1, -3";
	camera.dir = "0, -0.15, 1";
	group = 1;

	/* 参数
		0: 小喇叭ID, 
		1: 第一个人性别, 
		2~14: 第一个人的换装,
		15: 第二个人性别
		16~28: 第二个人的换装,
		……
	*/
	void ScriptInit( initStr)
	{
		var _num = window.GetSplitCount(initStr, ",");
		var _array = window.SplitStr2( initStr, ",", _num);
		var msgID = _array[0];
		
		var roleNum = 1;
		// TODO: 添加读取人数

		var readIndex = 1;
		var _i = 0;

		if( roleNum > 0)
		{
			staticvar _role0 = new VmlActionBugle{};
			_role0.find("ifuser").del();
			_InitRole( _role0, _array[readIndex], _array[readIndex+1], _array[readIndex+2], _array[readIndex+3], 
				_array[readIndex+4], _array[readIndex+5], _array[readIndex+6], _array[readIndex+7], _array[readIndex+8], 
				_array[readIndex+9], _array[readIndex+10], _array[readIndex+11], _array[readIndex+12], _array[readIndex+13]);

			readIndex = readIndex + 14;
		}
		if( roleNum > 1)
		{
			staticvar _role1 = new VmlActionBugle{};
			_role1.find("ifuser").del();
			_InitRole( _role1, _array[readIndex], _array[readIndex+1], _array[readIndex+2], _array[readIndex+3], 
				_array[readIndex+4], _array[readIndex+5], _array[readIndex+6], _array[readIndex+7], _array[readIndex+8], 
				_array[readIndex+9], _array[readIndex+10], _array[readIndex+11], _array[readIndex+12], _array[readIndex+13]);

			readIndex = readIndex + 14;
		}
		if( roleNum > 2)
		{
			staticvar _role2 = new VmlActionBugle{};
			_role2.find("ifuser").del();
			_InitRole( _role2, _array[readIndex], _array[readIndex+1], _array[readIndex+2], _array[readIndex+3], 
				_array[readIndex+4], _array[readIndex+5], _array[readIndex+6], _array[readIndex+7], _array[readIndex+8], 
				_array[readIndex+9], _array[readIndex+10], _array[readIndex+11], _array[readIndex+12], _array[readIndex+13]);

			readIndex = readIndex + 14;
		}
		if( roleNum > 3)
		{
			staticvar _role3 = new VmlActionBugle{};
			_role3.find("ifuser").del();
			_InitRole( _role3, _array[readIndex], _array[readIndex+1], _array[readIndex+2], _array[readIndex+3], 
				_array[readIndex+4], _array[readIndex+5], _array[readIndex+6], _array[readIndex+7], _array[readIndex+8], 
				_array[readIndex+9], _array[readIndex+10], _array[readIndex+11], _array[readIndex+12], _array[readIndex+13]);

			readIndex = readIndex + 14;
		}

		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt( window.M_G_CLINET,window.HORN,window.M_G_CLINET_HORN_HORNID, msgID);
		if ( _VNet2DBRow.IsReady())
		{
			var script = "$./../../../designerscript/horn/" + _VNet2DBRow.GetData( window.M_G_CLINET_HORN_SCRIPT);
			load( script);
			__Init();
		}
		_VNet2DBRow.del();
	}

	void _InitRole( roleItem, sex, av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10, av11, av12)
	{
		if( 1 == sex)
		{
			roleItem.find("Action").SetDbName("a001");
			roleItem.find("FSM").SetDbName("a001");
		}
		if( 2 == sex)
		{
			roleItem.find("Action").SetDbName("a002");
			roleItem.find("FSM").SetDbName("a002");
		}

		roleItem.find("Action").UseThreadLoadActFile();
		roleItem.find("Action").ShowRole2( av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10, av11, 0);	
	}
}


<END>
var rta = new RenderMap
{
	map.ScriptInit( "0, 2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357, 	2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357");

	void OnCreated()
	{
		map._arrayRole[1].find("FSM").clearset( 3005);
	}
}

var img = new img3d
{
	src=window.rta.UITexture;
	size="100%,100%";
	drag = "self";
	capturemouse=true;
	visible = true;
}

var map2 = new GCMap
{
	name="NAME_GCMap"; 
	group=1;
	size="100%,100%"; 
//	camera.src="keyboard";
	camera.pos = "0, 0, -4";
	camera.dir = "0, 0, 1";

	var targetModel = new fmodel
	{
		src="$./../../sample/src/mian.v3f";
//		Texture( "$./src/c020032.tga");
//		SetTexture(0,0,0, window.rta.Texture);
		pos = "-1, 0, 2";
		ShowBox = true;
		ypr = "0, -1, 0";
	}
}

new fmodel{};

new item
{
//	size = "100%, 100%";
	size = "100, 400";
	bgcolor = "#ffff0";
	
	var _img = new img3d{drag="self";pos = "-150, 0";size = "400, 300";capturemouse=false;border=1;}

	var _rta = new rtexture
	{
		size = "0%,0%";
		size = "400,300";

		void ScriptInit( _str)
		{
			map.del();
			staticvar map = new RenderMap{};
			map.ScriptInit( "0, 2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357, 	2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357");
		}
	};

	void OnClick()
	{
		show = false;
		_rta.ScriptInit( "0, 2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357, 	2, 18, 33, 64, 72, 90, 124, 214, 225, 276, 291, 316, 245, 357");
		_img.src=_rta.UITexture;
		show = true;
	}
}