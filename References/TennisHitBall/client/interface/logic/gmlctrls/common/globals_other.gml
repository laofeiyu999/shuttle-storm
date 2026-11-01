//个人信息类，全局唯一>>其他未分类
set window
{
	//字符串操作函数======================================================================
	//[功能]把字符串str按照splitstr来划分
	//[参数]str:原始字符串
	//		splitstr:以什么拆分
	//		callbackclass:回调的对象
	//		sleeptime:回调时间间隔
	//[返回值]每次得到的字符串会凋callbackclass的回调函数OnSplitStr(str);
	void SplitStr(str,splitstr,callbackclass,sleeptime)
	{
		var start = 0;
		while(true)
		{
			var b = str.Find(splitstr,start);
			if( b<0 || b == str.Count )
			{
				if( start<str.Count )
				{
					var s = str.Mid(start,str.Count);
					callbackclass.OnSplitStr(s);
				}
				callbackclass.OnSplitEnd();
				break;
			}
			var length = 0+b-start;
			var s = str.Mid(start,length);
			callbackclass.OnSplitStr(s);
			start = b+1;
			sleep(sleeptime);
		}
	}
	/*使用方法
		class Tp item
		{
			void OnSplitStr(s)
			{
				alert("OnSplitStr:"+s);
			}

			void Run()
			{
				var str = "a,b,cdeft";
				alert("Str:"+str);
				window.SplitStr(str,",",this,1000);
			}
		};
		new Tp{Run();}
	*/

	//[功能]把字符串str按照splitstr来划分
	//[参数]str:原始字符串
	//		splitstr:以什么拆分
	//		arrSize:数组的大小 (可以缺省)
	//[返回值]一个数组
	void SplitStr2(str,splitstr,arrSize)
	{
		var _Size = arrSize;
		if (_Size.__Long__ == 0)
		{
			_Size = window.GetSplitCount(str,splitstr);
		}
		var _array = sysarray(_Size);
		var _i = 0;
		while (_i < _Size)
		{
			_array[_i] = -1;
			_i += 1;
		}
		var _start = 0;
		var _index = 0;
		while(true)
		{
			var _pos = str.Find(splitstr,_start);
			if( _pos<0 || _pos == str.Count )
			{
				if( _start<str.Count )
				{
					_array[_index] = str.Mid(_start,str.Count);
				}
				break;
			}
			var length = _pos - _start;
			_array[_index] = str.Mid(_start,length);
			_start = _pos+1;
			_index += 1;
		}
		return _array;
	}
	/*使用方法
	var _arr = window.SplitStr2("1,2,3,4,5,6",",",6);
	alert(""+_arr[0]+","+_arr[1]+","+_arr[5]);
	*/

	//[功能]取一个字符串里分隔符所分割
	//[参数]str:原始字符串
	//		splitstr:以什么拆分
	//[返回值]有效数据的数量
	void GetSplitCount(str,splitstr)
	{
		var _iNum = 0; //分隔符的数量
		var _start = 0;
		while(true)
		{
			var _pos = str.Find(splitstr,_start);
			if( _pos<0 || _pos == str.Count )
			{
				if( _start<str.Count )
				{
					_iNum += 1;
				}
				break;
			}
			var length = _pos - _start;
			_iNum += 1;
			_start = _pos+1;
		}
		return _iNum;
	}

	//[功能]把字符串str(%n)替换成replacestr的子项
	//[参数]str:原始字符串
	//		replacestr:替换的参数
	//[返回值]返回替换后的字符串
	void ReplaceStr(str,replacestr)
	{
		var _Num = window.GetSplitCount(replacestr,",");
		var _array = window.SplitStr2(replacestr,",",_Num);
		var _i = 0;
		while (_i < _Num)
		{
			str = str.Replace("%"+_i,_array[_i]);
			_i += 1;
		}
		return str;
	}

	//[功能]把字符串str(%n)替换成replacestr的子项
	//[参数]str:原始字符串
	//		replacestr:替换的参数
	//[返回值]返回替换后的字符串
	void ReplaceStr2(str,replacestr)
	{
		var _Num = window.GetSplitCount(replacestr,",");
		var _array = window.SplitStr2(replacestr,",",_Num);

		var _i = 0;
		while (_i < _Num)
		{
			if (tostring(_array[_i]) == "-1")
			{
				_array[_i] = "";
			}
			var _tempindex = _i;
			switch(_i)
			{
				case 10:_tempindex = "A";break;
				case 11:_tempindex = "B";break;
				case 12:_tempindex = "C";break;
				case 13:_tempindex = "D";break;
				case 14:_tempindex = "E";break;
				case 15:_tempindex = "F";break;
				case 16:_tempindex = "G";break;
				case 17:_tempindex = "H";break;
				case 18:_tempindex = "I";break;
				case 19:_tempindex = "J";break;
			}
			str = str.Replace("%"+_tempindex,_array[_i]);
			_i += 1;
		}
		return str;
	}

	/*使用方法
	var _str = window.ReplaceStr("%0喜欢%1","YY,XX");
	alert(_str);
	*/
	//[]
	void GetDotSecPos(_arrstring)
	{
		var _count = window.GetSplitCount(_arrstring,".");
		var _arr = window.SplitStr2(_arrstring,".",2);
		var _resultnum = 0;
		var _temp = 0;
		if (_count != 0)
		{
			_resultnum = ""+_arr[0];
			_temp = _arr[1];
			_resultnum = _resultnum+"."+_temp.Mid(0,2);
			return _resultnum;
		}
		else
		{
			_resultnum = _arrstring;
			return _resultnum;
		}
	}

	//[功能]获取玩家悬停的信息
	//[参数]_index:TIPINFO表中的索引号
	//[返回]返回显示的文字
	void GetUserHangWndTip(_index)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.TIPINFO,window.GAMEUI_TIPINFO_TIPINDEX,_index);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _userHangWndTip = _VNet2DBRow.GetData(window.GAMEUI_TIPINFO_TIPTEXT);
		_VNet2DBRow.del();
		return _userHangWndTip;
	}

	//音效与背景音乐=======================================================================
	void PlaySound(sid)
	{
		snd_loop = false;
		var _soundpath = SoundPath(sid,1);
		if (_soundpath == ""){return;}
//		snd = _soundpath;
		var sndid = window.find("musicctrl").PlaySnd(_soundpath);
		return sndid;
	}
	void StopSound(id)
	{
		window.find("musicctrl").StopSnd(id);
	}

	//0:没有音乐在播放
	//1:有音乐在播放，有音乐在播放时，调用PlayMusic()函数无效
	var _PlayingMedia = 0;
	void PlayMusic(sid)
	{
		printf("B# PlayMusic()sid:"+sid);
		window.StopPlay();	//在此统一做

		if (_PlayingMedia != 0){return;}
		var _musicPath = SoundPath(sid,2);
		if (_musicPath == ""){return;}
		snd_loop = 10000;
		media = _musicPath;
		snd_loop = false;
		_PlayingMedia = 1;
	}

	//[功能]得到sid对应的声音文件完整路径
	//[参数]sid：ID
	//		type:类型 1音效 2音乐
	void SoundPath(sid,type)
	{
		var _typepath;
		if (type == 1) _typepath = g_Sound;
		if (type == 2) _typepath = g_Music;
		var _soundrow = new VNet2DBRow{InitByInt(window.GAMEUI, window.SOUND_REGISTER, window.GAMEUI_SOUND_REGISTER_SOUNDID, sid);}
		if (!_soundrow.IsReady()){_soundrow.del();return "";}
		var soundpath = "$./../../../Sound/"+_typepath+"/" + _soundrow.GetData( window.GAMEUI_SOUND_REGISTER_FILENAME );

		_soundrow.del();
		return soundpath;
	}

	void OnMediaLoopEnd()
	{
		_PlayingMedia = 0;
	}

	void StopPlay()
	{
		_PlayingMedia = 0;
		window.media_stop();
	}

	//[功能]根据ID取背景音乐的名字
	//		库：GameUI.mdb	SOUND_REGISTER
	//[参数] id:音乐ID
	//[返回值]：音乐的名字
	void GetMusicNameByID(id)
	{
		window.g_Row.InitByBigInt(window.GAMEUI,window.SOUND_REGISTER,window.GAMEUI_SOUND_REGISTER_SOUNDID,id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetMusicNameByID:DBname:"+window.GAMEUI+",TBName:"+window.SOUND_REGISTER+",id:"+id);
			return window.DB_ERR;
		}

		var _name= window.g_Row.GetData(window.GAMEUI_SOUND_REGISTER_SHOWNAME);
		window.g_Row.Release();
		return _name;
	}

	//提示信息============================================================================
	//载入提示条的函数
	//参数 id：提示条在数据库中的ID
	//参数 time：延长小时的时间 不填则为默认时间
	//参数 Text:提示的文字
	void LoadInfoBoard(id,time,Text)
	{
		var _IfCut = 0;//是否永久显示提示条 0定时 1不定时
		var _TIME = window._Time_InfoBoard;
		if (time == 1){_IfCut = 1;}	//不消失
		if (time > 1){_TIME = time;} //会消失

		window.g_Row.InitByInt(window.GAMEUI,window.INFOBOARD,window.GAMEUI_INFOBOARD_ID,id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-LoadInfoBoard:DBname:"+window.GAMEUI+",TBName:"+window.INFOBOARD);
			return;
		}
		var _Type = window.g_Row.GetData(window.GAMEUI_INFOBOARD_ITYPE);
		var _text = window.g_Row.GetData(window.GAMEUI_INFOBOARD_TEXT);
		if (_Type == 1){_text = Text;}// 0取数据库的内容 1自定义内容 2全屏遮罩

		window.g_Row.Release();

		window.find("TOPLAYER").delallchild();
		if (_Type == 2)//需要遮罩
		{
			set window.find("TOPLAYER")
			{
				new item//遮罩层
				{
					size = "100%,100%";capturemouse = true;drag = "window";//bgcolor = "#000000";alpha = 50;
					window.find("gameinput").AddExclusiveShortcutUser(this);
					void OnDelete()
					{
						window.find("gameinput").DelShortcutUser(this);
					}
					void DI_ShortcutKey(data)
					{
						if (window.g_Sex)
						{
							printf("B# 提示信息响应了快捷键:"+data);
						}
					}
				}
				new VMyInfoBoard{};
			}
			window.find("VMyInfoBoard_Logic").SetData(_text,_TIME,_IfCut);
		}
		else
		{
			set window.find("TOPLAYER")
			{
				new VMyInfoBoard{};
			}
			window.find("VMyInfoBoard_Logic").SetData(_text,_TIME,_IfCut);
		}
	}

	//添加好友或者黑名单
	//参数 _nickname：要添加的好友或黑名单昵称
	//参数 type：好友（Friends），黑名单(BlackList)
	void AddFriendAll(_nickname,type)
	{
		printf("B# window.AddFriendAll-_nickname:"+_nickname+",type:"+type);
		if (_nickname == "" || _nickname == 0)
		{
			window.find("UIController").LoadDLG(254);//操作失败，无效的昵称！
			return;
		}
		window.find("friendsys").AddFriend(_nickname,type);

		window.LMH1_ClickAddFriend();//引导事件
	}

	//添加好友
	void AddFriend(_nickname)
	{
		window.AddFriendAll(_nickname,window.FRIEND_FRIEND);
	}
	//添加黑名单
	void AddBlacklist(_nickname)
	{
		window.AddFriendAll(_nickname,window.FRIEND_BLACKLIST);
	}

	//删除好友或者黑名单
	//参数 _nickname：要删除的好友或黑名单昵称
	void DelFriend(_nickname)
	{
		printf("B# window.DelFriend-_nickname:"+_nickname);
		if (_nickname == "" || _nickname == 0)
		{
			//window.find("UIController").LoadDLG(254);//操作失败，无效的昵称！
			return;
		}
		window.find("friendsys").DelFriend(_nickname);
		window.find("FRIEND_LOGIC")._VFriend_Logic.SetBtnState();
	}

	//得到服务器类型
	void GetSerType(){return g_GC_WhichCheck;}
	void SetSerType(type){g_GC_WhichCheck = type;}

	//取得频道的类别
	//1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯 7大奖赛
	void GetChannelType(type)
	{
		var _Temp = toint(type);
		if (_Temp == 0)
		{
			_Temp = window.GetSerType();
		}
		var _name = "";
		switch (_Temp)
		{
			case 1:{_name = "新手赛";break;}
			case 2:{_name = "资格赛";break;}
			case 3:{_name = "巡回赛";break;}
			case 4:{_name = "黄金赛";break;}
			case 5:{_name = "大师赛";break;}
			case 6:{_name = "大满贯";break;}
			case 7:{_name = "大奖赛";break;}
		}
		return _name;
	}

	//设置选中的训练频道
	void SetTrainChannel(_type)
	{
		window.g_TrainChannel = _type;
	}
	//得到选中的训练频道
	void GetTrainChannel()
	{
		return window.g_TrainChannel;
	}

	//[功能]判断一个数字有几位数
	//[参数]num:任意正整数
	//[返回值]整数的位数
	void GetNumCount(num)
	{
		var _count = 0;
		while (num > 0)
		{
			_count += 1;
			num = num/10;
		}
		return _count;
	}

	//[功能]转换成支持html的格式
	//[返回值]转换后字符串
	void TransHtmlform(_str)
	{
		var _Temp = _str;
		_Temp = _Temp.Replace("<v1>","<VHelp_Text1>");
		_Temp = _Temp.Replace("</v1>","</VHelp_Text1>");
		_Temp = _Temp.Replace("<v2>","<VHelp_Text2>");
		_Temp = _Temp.Replace("</v2>","</VHelp_Text2>");
		_Temp = _Temp.Replace("/sp","&nbsp;&nbsp;");
		return _Temp;
	}

	//[功能]通过ID取得Action的位置
	//[参数]_UID:玩家ID
	//[返回值]一个2D位置"x,y"
	void GetAction2DPos(_UID)
	{
		var _Temp = window.find("NAME_GCMap").FindGameBodyByUserID(_UID).find("Action").Get2DPos(0,1.9,0);

		var _posTypeCount = window.GetSplitCount(_Temp,",");
		var _posArray = window.SplitStr2(_Temp,",",_posTypeCount);
//		printf("C# GetAction2DPos:x:"+_posArray[0]+",y:"+_posArray[1]+",z:"+_posArray[2]);
		_Temp = ""+toint(_posArray[0])+","+toint(_posArray[1]);
		window.find("NAME_GCMap").FindGameBodyByUserID(_UID).find("Action").setZ(_posArray[2]);
		window.find("VRoleModel_Info_Logic_Name_"+_UID).setZ(_posArray[2]);
		return _Temp;
	}

	//[功能]通过ID取得录像中的Action的位置
	//[参数]_UID:玩家ID
	//[返回值]一个2D位置"x,y"
	void GetAction2DPosInLookAt(_UID)
	{
		var _actionFinderName = "ActionFinder" + _UID;
		var _temp = window.find(_actionFinderName).parent.Get2DPos(0,1.9,0);

		var _posTypeCount = window.GetSplitCount(_temp,",");
		var _posArray = window.SplitStr2(_temp,",",_posTypeCount);
//		printf("C# GetAction2DPosInLookAt:x:"+_posArray[0]+",y:"+_posArray[1]+",z:"+_posArray[2]);
		_temp = ""+_posArray[0]+","+_posArray[1];
		window.find(_actionFinderName).parent.setZ(_posArray[2]);
		window.find("VRoleModel_Info_Logic_Name_"+_UID).setZ(_posArray[2]);

		return _temp;
	}

	//==================================游戏中界面的动作==================================
	//根据动作的索引取动作的ID
	//库：a001user.mdb	表：InterfaceAct
	//错误值：-1
	void GetActIDByIndex(index,Sex)
	{
		printf("B# GetActIDByIndex-动作的ID:index："+index+",Sex:"+Sex);

		if (toint(Sex) == window.USER_SEX_MAN)//男
		{
			window.g_Row.InitByInt(window.A001USER,window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		else
		{
			window.g_Row.InitByInt("a002user.mdb",window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetActIDByIndex:DBname:"+window.A001USER+",TBName:"+window.INTERFACEACT);
			return window.DB_ERR;
		}
		var _ActID = window.g_Row.GetData(window.A001USER_INTERFACEACT_ACTINDEX);//气氛动作ID
		window.g_Row.Release();
		return _ActID;
	}

	//根据动作索引去摄像机的位置
	//库：a001user.mdb	表：InterfaceAct
	//错误值：""
	void GetCamPosByIndex(index,Sex)
	{
		//摄像机位置
		var _CameraPos = "";

		if (toint(Sex) == window.USER_SEX_MAN)//男
		{
			window.g_Row.InitByInt(window.A001USER,window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		else
		{
			window.g_Row.InitByInt("a002user.mdb",window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetCamPosByIndex:DBname:"+window.A001USER+",TBName:"+window.INTERFACEACT);
			return _CameraPos;
		}

		var _CamPosX = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMPOSX);
		if (toint(_CamPosX) >= 100)
		{
			_CameraPos = "";
		}
		else
		{
			var _CamPosY = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMPOSY);
			var _CamPosZ = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMPOSZ);
			_CameraPos = ""+_CamPosX+","+_CamPosY+","+_CamPosZ;
		}
		window.g_Row.Release();
		return _CameraPos;
	}

	//根据动作索引去摄像机的方向
	//库：a001user.mdb	表：InterfaceAct
	//错误值：""
	void GetCamDirByIndex(index,Sex)
	{
		//摄像机方向
		var _CameraDir = "";

		if (toint(Sex) == window.USER_SEX_MAN)//男
		{
			window.g_Row.InitByInt(window.A001USER,window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		else
		{
			window.g_Row.InitByInt("a002user.mdb",window.INTERFACEACT,window.A001USER_INTERFACEACT_INDEX,index);
		}
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetCamDirByIndex:DBname:"+window.A001USER+",TBName:"+window.INTERFACEACT);
			return _CameraDir;
		}
		var _CamDirX = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMLOOKX);
		if (toint(_CamDirX) >= 100)
		{
			_CameraDir = "";
		}
		else
		{
			var _CamDirY = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMLOOKY);
			var _CamDirZ = window.g_Row.GetData(window.A001USER_INTERFACEACT_CAMLOOKZ);
			_CameraDir = ""+_CamDirX+","+_CamDirY+","+_CamDirZ;
		}
		window.g_Row.Release();
		return _CameraDir;
	}

	//根据显示ID取模型的部件文件名:目前用作技能镶嵌的球拍
	//参数 did:部件的显示ID
	//目前-已被废弃
	void GetSkinByDID(did)
	{
		window.g_Row.InitByInt(window.M_G_CLINET,window.PARTS,window.M_G_CLINET_PARTS_ACTIONID,did);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSkinByDID:"+window.M_G_CLINET+",TBName:"+window.PARTS+",did:"+did);
			return window.DB_ERR;
		}

		var _SkinName = window.g_Row.GetData(window.M_G_CLINET_PARTS_SKIN);//3字段
		window.g_Row.Release();
		return _SkinName;
	}

	//==========================================================================================

	//根据排行的类型取得玩家的排行数据
	//参数 type:排行方式（0-11）
	void GetTSDataByType(type)
	{
		var _Point = 0;//得分
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTSDataByType:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return 0;
		}
		switch (type)
		{
			case 0:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEALLNUM);break;}//101竞技-总比赛场次(个人信息-战绩统计)
			case 1:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEALLNUM);break;}//101竞技-总比赛场次(个人信息-战绩统计)
			case 2:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEWINNUM);break;}//91竞技-胜利场次
			case 3:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEALLSCORE);break;}//92竞技-总得分
			case 4:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEACE);break;}//93竞技-Ace球总数
			case 5:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLSCORE);break;}//94竞技-技能得分数
			case 6:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLNUM);break;}//95竞技-技能总数
			case 7:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLRATE);break;}//96竞技-技能得分率
			case 8:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKSKILL);break;}//97竞技-普通破解技能
			case 9:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLBREAKSKILL);break;}//98竞技-技能破解技能
			case 10:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKSUCCESS);break;}//99竞技-破发成功率
			case 11:{_Point = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKNUM);break;}//100竞技-破发局数
		}

		window.g_Row.Release();
		printf("B# 明星榜:GetTSDataByType():type:"+type+",_Point:"+_Point);
		return _Point;
	}

	//[功能]取自己排行中的排名
	//[参数]_tbName:表名
	//		_uid:玩家ID(不传就是自己的)
	//[返回值]队伍ID
	void GetMyIndexInTopStar(_tbName)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_MyIndex = -1;
			var _index = 0;
			void GetMyIndex(uid)
			{
				_index += 1;
				if (uid == window.GetMyUID())
				{
					m_MyIndex = _index;
				}
			}
		};

		var _SQL = "SELECT * FROM "+_tbName+" ORDER BY currindex ASC";
		_VNet2DBTable.Select(window.TOPSTAR,_SQL );
		_VNet2DBTable.ReadData("GetMyIndex",""+window.TOPSTAR_TS_A_ALLSCORE_INDEX);
		var _res = _VNet2DBTable.m_MyIndex;
		_VNet2DBTable.del();
		printf("B# [排行榜]GetMyIndexInTopStar():_tbName:"+_tbName+",_SQL:"+_SQL+",_res:"+_res);
		return _res;
	}

	//[功能]取自己在人气榜中的排名
	//[参数]无
	//[返回值]_myIndex：自己在人气榜中的排名
	void GetMyFavorIndex()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_MyIndex = -1;
			var _Index = 0;
			void GetMyIndex(_nkName)
			{
				_Index += 1;
				if(_nkName == window.GetMyName())
				{
					m_MyIndex = _Index;
				}
			}
		}
		var _SQL = "SELECT * FROM "+window.JIVEFLOWER+" ORDER BY "+window.GAMEUI_JIVEFLOWER_VALUE_STR+" DESC";
		_VNet2DBTable.Select(window.GAMEUI,_SQL);
		_VNet2DBTable.ReadData("GetMyIndex",""+window.GAMEUI_JIVEFLOWER_NKNAME);
		var _myIndex = _VNet2DBTable.m_MyIndex;
		_VNet2DBTable.del();
		return _myIndex;
	}
	//[功能]取自己在人气榜中的分数
	//[参数]无
	//[返回值]_favorPoint：自己在人气榜中的分数
	void GetMyFavorPoint(_nkName)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.JIVEFLOWER,window.GAMEUI_JIVEFLOWER_NKNAME,_nkName);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			return window.DB_ERR;
		}
		var _favorPoint = _VNet2DBRow.GetData(window.GAMEUI_JIVEFLOWER_VALUE);
		_VNet2DBRow.Release();
		return _favorPoint;
	}

	//[功能]取自己排行中的前次排名
	//[参数]_tbName:表名
	//[返回值]前次排名
	void GetMyLastRank(_tbName)
	{
		window.g_Row.InitByString(window.TOPSTAR,_tbName,window.TOPSTAR_TS_A_ACE_NKNAME,window.GetMyName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _myLastRank = window.g_Row.GetData(window.TOPSTAR_TS_A_ACE_LASTINDEX);
		window.g_Row.Release();
		return _myLastRank;
	}

	//根据按键ID取得按键的名字
	//参数 iRow:数据库行数
	//错误值 -1
	void GetKeyNameByRow(iRow)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.KEYSET,window.GAMEUI_KEYSET_ID,iRow);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetKeyNameByRow:"+window.GAMEUI+",TBName:"+window.KEYSET);
			return window.DB_ERR;
		}

		var _Keyname = window.g_Row.GetData(window.GAMEUI_KEYSET_ACTIVE);//1字段
		window.g_Row.Release();
		return _Keyname;
	}

	//==========================================================================================

	//[功能]根据服务器ID取服务器名字
	//[参数]_sevID：服务器的ID
	//[返回值]服务器名字/-1(没有找到相应值或参数错误)
	void GetSevNameByID(sevID)
	{
		if (sevID < 0)
		{
			return window.DB_ERR;
		}
		window.g_Row.InitByInt(window.GAMEUI,window.GAMESERVER,window.GAMEUI_GAMESERVER_SVRID,sevID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSevNameByID:DBname:"+window.GAMEUI+",TBName:"+window.GAMESERVER+",sevID:"+sevID);
			return window.DB_ERR;
		}

		var _name = window.g_Row.GetData(window.GAMEUI_GAMESERVER_SVRNAME);
		window.g_Row.Release();
		return _name;
	}
	//[功能]通过事件ID取箭头id
	//[参数]id:事件ID
	//[返回值]箭头的id
	void GetArrowIDByID(id)
	{
		if (id < 0)
		{
			return window.DB_ERR;
		}

		window.g_Row.InitByInt(window.M_G_CLINET,"EventCounter",window.M_G_CLINET_EVENTCOUNTER_EVENTID,id);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetArrowIDByID:DBname:"+window.M_G_CLINET+",TBName:"+window.EVENTCOUNTER+",id:"+id);
			return window.DB_ERR;
		}

		var _arrowID = window.g_Row.GetData(window.M_G_CLINET_EVENTCOUNTER_ARROWID);
		window.g_Row.Release();
		return _arrowID;
	}
	//[功能]通过ID取按键
	//[参数]按键的ID
	//[返回值]按键
	void GetKeyByID(id)
	{
		if (id < 0)
		{
			return window.DB_ERR;
		}

		window.g_Row.InitByInt(window.GAMEUI,window.KEYSET,window.GAMEUI_KEYSET_ID,id);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetKeyByID:DBname:"+window.GAMEUI+",TBName:"+window.KEYSET+",id:"+id);
			return window.DB_ERR;
		}

		var _key = window.g_Row.GetData(window.GAMEUI_KEYSET_KEYVALUE);
		window.g_Row.Release();
		return _key;
	}

	//[功能]取游戏设置其他的功能
	//[参数]index:索引
	//[返回值]true/false
	void GetGameSetUpOtherByIndex(index)
	{
		var _COtherSet = new COtherSet{}
		var _Res = _COtherSet.GetOtherSet(index);
		if (toint(_Res) == 0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	//[功能]游戏中送花操作
	//[参数]nkname:送花的对象昵称
	void GamePresentFlower(nkname)
	{
		if(window.GetItemNumByEnterID(window.FLOWER_ID)>0)
		{
			var _param = ""+window.FLOWER_ID+",1"+","+nkname;
			window.Too_FavorFlower(_param);
		}
		else
		{
			window.find("UIController").LoadDLG(642);	//您没有“献花专用花束”，是否马上购买?
			//数量,点券,钱
			var _num = window.GetSubNumByItemID(window.FLOWER_BUY_ID);
			var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(window.FLOWER_BUY_ID));
			var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);
			var _money = window.GetPriceByIndex(window.FLOWER_BUY_ID);
			if ( _DeadORLive >0)
			{
				_money = toint(_money)*0.8;
			}
			var _vip = window.GetVipTypeByUID(window.GetMyUID());
			if (_vip == window.G_VIPVALUE)
			{
				var _vipagio = window.GetVipBuyAgio(_vip);
				_money = ""+toint(_money) * _vipagio +"(Vip"+_vipagio+"折)";	
			}
			var _param = ""+_num+","+_moneytype+","+toint(_money);
			window.find("VMB_NoEnoughFlower_Logic").ReplaceData(_param);
		}
	}
	
	//[功能]献花成功后将对方的值写入
	//[参数]uid:玩家的UID
	//		value:当前的值
	//[返回值]参数错误或查无此人
	void SetValueOnFlowerSuccess(uid,value)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVEFLOWER,window.GAMEUI_JIVEFLOWER_ID,uid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-SetValueOnFlowerSuccess:"+window.GAMEUI+",TBName:"+window.JIVEFLOWER+",uid:"+uid);
			return;
		}

		window.g_Row.SetInt(window.GAMEUI_JIVEFLOWER_VALUE,value);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//[功能]判断各种名字是否合法{创建角色,商场赠送,房间名,创建队伍名,邮件，好友}
	//[参数]namestr:判断的文字
	//		tipParam:提示的参数
	//[返回值]1合法, -1有特殊字符 -2有脏话
	void JudgeAnyNameLicit(namestr,tipParam)
	{
		if (window.g_CStrFilter.Filter2(namestr) == 0)//判断是否是打印字符
		{
			window.find("UIController").LoadDLG(332);//%0不可包含特殊字符!
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(tipParam);
			return -1;
		}
		if (window.g_DirtyFilter_Name.IsDirty(namestr))
		{
			window.find("UIController").LoadDLG(333);//%0不可包含不文明或敏感字符！
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(tipParam);
			return -2;
		}
		if (namestr == "")
		{
			window.find("UIController").LoadDLG(843);//内容不能为空
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(tipParam);
			return -1;
		}
		return 1;
	}
	
	//[功能]获取分辨率的偏移比例
	//[参数]_data1：最新分辨率的宽/高；data2：上次分辨率的宽/高
	//[返回值]返回偏移比例
	void SetResolutionOffSet(data1,data2)
	{
		window.g_UIOffSetRate = tofloat(data1)/data2;
		printf("xiayy:g_UIOffSetRate:"+window.g_UIOffSetRate);
	}

	//[功能]获取玩家大概位置
	//[参数]_无
	//[返回值]返回玩家大概位置，1登陆界面 2频道选择界面 3大厅界面 4房间界面 5游戏界面
	void GetProbablyPos()
	{
		return window.g_probablyPos;
	}

	//设置家族名称显示内容，_state：true显示，false不显示
	void SetRolemodel_FamilyNameShowState(_state)
	{
		window.g_RoleModel_FamilyNameShowState = _state;
	}

	//设置用户昵称显示内容，_state：true显示，false不显示
	void SetRolemodel_UserNameShowState(_state)
	{
		window.g_RoleModel_UserNameShowState = _state;
	}

	//设置用户情侣昵称显示内容，_state：true显示，false不显示
	void SetRolemodel_LoverNameShowState(_state)
	{
		window.g_RoleModel_LoverNameShowState = _state;
	}

	//设置人物模型信息的显示状态 _state:true显示，false不显示
	void SetRolemodelInfoShowState(_state)
	{
		if(window.g_probablyPos == window.POS_PROBABLY_ROOM || window.g_probablyPos == window.POS_PROBABLY_GAME)
		{
			var _index = window.g_AllPlayersNum;
			while(_index != 0)
			{
				window.find("VRoleModel_Info_Logic_Name_"+window.g_AllPlayersUID[_index-1]).SetShowState(_state);
				//printf("xiayy:SetRolemodelInfoShowState:_index:"+_index+",_state:"+_state+",g_AllPlayersUID:"+window.g_AllPlayersUID[_index-1]);
				_index -= 1;
			}
		}
		if(window.g_probablyPos == window.POS_PROBABLY_TRAIN)
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetShowState(_state);
		}
		
	}
	
	//[功能]取玩家列表的哈希值
	void GetUserListHash(page)
	{
		var _hash = window.find("HALLGCMap")._HallIO.__GetUserListHash(page);
		//printf("GetUserListHash():page:"+page+",_hash:"+_hash);
		return _hash;
	}

	//[功能]取邀请列表的哈希值
	void GetInviteListHash(page)
	{
		var _hash = window.find("HALLGCMap")._HallIO.__GetInvietListHash(page);
		//printf("GetInviteListHash():page:"+page+",_hash:"+_hash);
		return _hash;
	}

	//[功能]背包中续费
	//[参数]enterid: 物品ID
	void GameCtndeaditems(_enterid)
	{
		window.find("UIController").LoadDLG(857);	//您没有“献花专用花束”，是否马上购买?
		//数量,点券,钱
		window.find("VMB_PackPropCtn_Logic").SetItemIds(_enterid);
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);
		var _money = window.GetPriceByIndex(_enterid);
		if ( _DeadORLive >0)
		{
			_money = toint(_money)*0.8;
		}
		var _itemname = window.GetNameByEnterID(_enterid);
		var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(_enterid));
		var _buytime = window.GetTimeByEnterID(_enterid);
		var _count = window.GetSplitCount(_buytime,",");
		var _arr = window.SplitStr2(_buytime,",",_count);
		var _param = ""+_itemname+","+_arr[0]+","+_moneytype+","+toint(_money);
		window.find("VMB_PackPropCtn_Logic").ReplaceData(_param);
	}

//	//[功能]应用分辨率
//	//[参数]type:调用类型 0正常 1第一次
//	void ApplyResolution(type)
//	{
////		alert("type:"+type);
//		var _CDisplaySet = window.find("CDisplaySet");
//
//		var resolution = _CDisplaySet.GetResolution();
//
//		var setwidth= resolution / window.RESOLUTION_BASERATE;
//		var setheight = resolution % window.RESOLUTION_BASERATE;
//
//		var final_width = setwidth;
//		var final_height = setheight;
//		//var final_width2 = setwidth;
//		//var final_height2 = setheight;
//
//
//		var fullscreen = _CDisplaySet.GetFullScreen();
//
//		if(toint(fullscreen)==0)
//		{
//			window.mainDevice.IsFullscreen = false;
//		}
//
//		var curresolution = _CDisplaySet.GetCurResolution();
//		var curwidth = curresolution / window.RESOLUTION_BASERATE;
//		var curheight = curresolution % window.RESOLUTION_BASERATE;
//
//		//alert("final_width="+final_width+" final_height="+final_height+" curwidth="+curwidth+" curheight="+curheight);
//
//		//如果是非全屏看看是否比桌面的分辨率大,大的话用桌面分辨率，如果桌面分辨率的宽小于最小宽度，则用规定的最小分辨率
//		if(toint(fullscreen)==0)
//		{
//			if(toint(curwidth)<window.RESOLUTION_MINWIDTH)
//			{
//				final_width = window.RESOLUTION_MINWIDTH;
//				final_height = window.RESOLUTION_MINHEIGHT;
//				alert("游戏的最小分辨率为"+window.RESOLUTION_MINWIDTH+"*"+window.RESOLUTION_MINHEIGHT+"，当前桌面分辨率太小");
//				window.del();
//			}
//			else if(toint(curwidth)<toint(setwidth) || toint(curheight)<toint(setheight))
//			{
//				final_width = curwidth;
//				final_height = curheight;
//			}
//		}
//
//		var final_width2 = final_width;
//		var final_height2 = final_height;
//
//		var flag=0;
//		if (window.GetAutoHideBar()==0 && final_width==curwidth && final_height==curheight)
//		{
//			flag=1;
//
//			var w1=window.GetWindowOffSize(0);
//			var h1=window.GetWindowOffSize(1);
//
//			final_width=final_width-w1;
//			final_height=final_height-h1;
//
//			var _left	=window.GetTaskBarRect(0);
//			var _right	=window.GetTaskBarRect(1);
//			var _top	=window.GetTaskBarRect(2);
//			var _bottom =window.GetTaskBarRect(3);
//
//			if (_left==0 && _top==0 && _bottom==curheight)
//			{// 左
//				//alert("左 _left="+_left+" _right="+_right+" _top="+_top+" _bottom="+_bottom);
//				final_width=final_width-_right;
//				window.pos(_right,0);
//			}
//
//			if (_left==0 && _top==0 && _right==curwidth)
//			{// 上
//				//alert("上 _left="+_left+" _right="+_right+" _top="+_top+" _bottom="+_bottom);
//				final_height=final_height-_bottom;
//				window.pos(0,_bottom);
//			}
//
//			if (_left>0)
//			{// 右
//				//alert("右 _left="+_left+" _right="+_right+" _top="+_top+" _bottom="+_bottom);
//				final_width=final_width-(_right-_left);
//				window.pos(0,0);
//			}
//
//			if (_left==0 && _top>0)
//			{// 下
//				//alert("下 _left="+_left+" _right="+_right+" _top="+_top+" _bottom="+_bottom);
//				final_height=final_height-(_bottom-_top);
//				window.pos(0,0);
//			}
//		}
//
//		if(toint(fullscreen)==0)
//		{
//			if (type != 1)
//			{
//				var reso_str = ""+final_width+","+ final_height;
//				window.size=reso_str;
//				window.wndsize=reso_str;
//			}
//
//			if (flag==0) window.centerToScreen();
//			window.find("clickmedragwindow").drag = "window";
//			window.mainDevice.IsFullscreen = false;
//		}
//		else
//		{
//			if (type != 1)
//			{
//				var reso_str = ""+final_width2+","+ final_height2;
//				window.size=reso_str;
//				window.wndsize=reso_str;
//			}
//
//			if (flag==0) window.centerToScreen();
//			window.find("clickmedragwindow").drag = "none";
//			window.mainDevice.FSize(final_width2,final_height2);
//			window.mainDevice.IsFullscreen = true;
//		}
//	}
}