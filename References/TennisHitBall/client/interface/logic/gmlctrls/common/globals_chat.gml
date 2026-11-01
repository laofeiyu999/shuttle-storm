//全局变量 + 函数>>聊天

set window
{

	var charFlag = 0;	//进入聊天输入框的标志位：0为左键/Enter进入；1为右键私聊进入
	var lastPrivateName = "";	//用于判断前一次聊天为私聊还是普通聊天，空为普通聊天，有内容则为私聊
	var _charShowFlag = true;	//聊天框显示状态标志位
	//聊天======================================================================
	//[备注]为了效率使用事件触发式，当使用后，购买后，接受礼品后,丢弃后调用
	//[功能]检查小喇叭的数量
	void CheckBugleNum()
	{
		//因不显示小喇叭数量 所以注释掉 2009年12月10日 yxf
		//window.find("s_btn_Loudspeaker_Name").InitLaba();
	}

	//得到聊天的类型
	//返回值 ：2游戏中 1房间中 0其他
	void GetChatTypeByPos()
	{
		var _Type = 0;
		var _pos = window.GetUIPos();
		printf("B# GetChatTypeByPos:"+_pos);
		switch (_pos)
		{
			case 80:{_Type = 1;break;}
//			case 80:{_Type = 1;break;}
//			case 80:{_Type = 1;break;}

			case 90://游戏中 POS_GAME
			{
				_Type = 2;break;
			}
		}
		return _Type;
	}

	//聊天========================================================================
	//[功能]表情解析函数
	//参数：content：需要解析的字符串
	void ParseFace(content)
	{
		var _Temp = content;
		/*
		_Temp = _Temp.Replace("/歪歪","<F_yy></F_yy>");
		_Temp = _Temp.Replace("/闭嘴","<F_biz></F_biz>");
		_Temp = _Temp.Replace("/不屑","<F_bux></F_bux>");
		_Temp = _Temp.Replace("/大哭","<F_dak></F_dak>");
		_Temp = _Temp.Replace("/呕吐","<F_exin></F_exin>");
		_Temp = _Temp.Replace("/害羞","<F_haix></F_haix>");
		_Temp = _Temp.Replace("/大汗","<F_han></F_han>");
		_Temp = _Temp.Replace("/加油","<F_jiay></F_jiay>");
		_Temp = _Temp.Replace("/惊讶","<F_jingy></F_jingy>");
		_Temp = _Temp.Replace("/囧rz","<F_jiong></F_jiong>");
		_Temp = _Temp.Replace("/巨雷","<F_julei></F_julei>");
		_Temp = _Temp.Replace("/开心","<F_kaixin></F_kaixin>");
		_Temp = _Temp.Replace("/口哨","<F_kous></F_kous>");
		_Temp = _Temp.Replace("/愤怒","<F_nule></F_nule>");
		_Temp = _Temp.Replace("/色色","<F_sese></F_sese>");
		_Temp = _Temp.Replace("/傻笑","<F_shax></F_shax>");
		_Temp = _Temp.Replace("/无力","<F_wuli></F_wuli>");
		_Temp = _Temp.Replace("/疑问","<F_yiw></F_yiw>");
		_Temp = _Temp.Replace("/再见","<F_bye></F_bye>");
		_Temp = _Temp.Replace("/可怜","<F_kelian></F_kelian>");
		*/

		_Temp = _Temp.Replace("&x2f歪歪","<F_yy></F_yy>");
		_Temp = _Temp.Replace("&x2f闭嘴","<F_biz></F_biz>");
		_Temp = _Temp.Replace("&x2f不屑","<F_bux></F_bux>");
		_Temp = _Temp.Replace("&x2f大哭","<F_dak></F_dak>");
		_Temp = _Temp.Replace("&x2f呕吐","<F_exin></F_exin>");
		_Temp = _Temp.Replace("&x2f害羞","<F_haix></F_haix>");
		_Temp = _Temp.Replace("&x2f大汗","<F_han></F_han>");
		_Temp = _Temp.Replace("&x2f加油","<F_jiay></F_jiay>");
		_Temp = _Temp.Replace("&x2f惊讶","<F_jingy></F_jingy>");
		_Temp = _Temp.Replace("&x2f囧rz","<F_jiong></F_jiong>");
		_Temp = _Temp.Replace("&x2f巨雷","<F_julei></F_julei>");
		_Temp = _Temp.Replace("&x2f开心","<F_kaixin></F_kaixin>");
		_Temp = _Temp.Replace("&x2f口哨","<F_kous></F_kous>");
		_Temp = _Temp.Replace("&x2f愤怒","<F_nule></F_nule>");
		_Temp = _Temp.Replace("&x2f色色","<F_sese></F_sese>");
		_Temp = _Temp.Replace("&x2f傻笑","<F_shax></F_shax>");
		_Temp = _Temp.Replace("&x2f无力","<F_wuli></F_wuli>");
		_Temp = _Temp.Replace("&x2f疑问","<F_yiw></F_yiw>");
		_Temp = _Temp.Replace("&x2f再见","<F_bye></F_bye>");
		_Temp = _Temp.Replace("&x2f可怜","<F_kelian></F_kelian>");
		
		return _Temp;
	}

	//[功能]干掉泡泡表情
	//参数：content：需要解析的字符串
	void DelFuckPaopaoFace(content)
	{
		var _Temp = content;
		/*
		_Temp = _Temp.Replace("/yy","");
		_Temp = _Temp.Replace("/bz","");
		_Temp = _Temp.Replace("/bx","");
		_Temp = _Temp.Replace("/dk","");
		_Temp = _Temp.Replace("/ex","");
		_Temp = _Temp.Replace("/hx","");
		_Temp = _Temp.Replace("/h","");
		_Temp = _Temp.Replace("/jiay","");
		_Temp = _Temp.Replace("/jy","");
		_Temp = _Temp.Replace("/jiong","");
		_Temp = _Temp.Replace("/jl","");
		_Temp = _Temp.Replace("/kx","");
		_Temp = _Temp.Replace("/ks","");
		_Temp = _Temp.Replace("/nu","");
		_Temp = _Temp.Replace("/se","");
		_Temp = _Temp.Replace("/sx","");
		_Temp = _Temp.Replace("/wl","");
		_Temp = _Temp.Replace("/yw","");
		_Temp = _Temp.Replace("/bye","");
		_Temp = _Temp.Replace("/kl","");
		*/

		_Temp = _Temp.Replace("&x2fyy","");
		_Temp = _Temp.Replace("&x2fbz","");
		_Temp = _Temp.Replace("&x2fbx","");
		_Temp = _Temp.Replace("&x2fdk","");
		_Temp = _Temp.Replace("&x2fex","");
		_Temp = _Temp.Replace("&x2fhx","");
		_Temp = _Temp.Replace("&x2fh","");
		_Temp = _Temp.Replace("&x2fjiay","");
		_Temp = _Temp.Replace("&x2fjy","");
		_Temp = _Temp.Replace("&x2fjiong","");
		_Temp = _Temp.Replace("&x2fjl","");
		_Temp = _Temp.Replace("&x2fkx","");
		_Temp = _Temp.Replace("&x2fks","");
		_Temp = _Temp.Replace("&x2fnu","");
		_Temp = _Temp.Replace("&x2fse","");
		_Temp = _Temp.Replace("&x2fsx","");
		_Temp = _Temp.Replace("&x2fwl","");
		_Temp = _Temp.Replace("&x2fyw","");
		_Temp = _Temp.Replace("&x2fbye","");
		_Temp = _Temp.Replace("&x2fkl","");
		
		return _Temp;
	}

	//=======================================================================================
	//[功能]往聊天框里说话统一入口
	//[参数]_type:类型
	//		_content:内容 
	//		_nkname:发送者昵称
	void WriteChatAll(_type,_content,_nkname)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,_type,1);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-WriteChat:DBname:"+window.M_G_SERVER+",TBName:"+window.CHATRECEIVE);
			return;
		}
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,_type);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,_content);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,_nkname);
		_VNet2DBRow.UpdateEnd();
		_VNet2DBRow.del();

//		window.g_Row.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,_type,1);
//		if (!window.g_Row.IsReady())
//		{
//			window.g_Row.Release();
//			printf("B# error-WriteChatAll:DBname:"+window.M_G_SERVER+",TBName:"+window.CHATRECEIVE+",type"+_type);
//			return;
//		}
//		window.g_Row.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,_type);
//		window.g_Row.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,_content);
//		window.g_Row.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,_nkname);
//		window.g_Row.UpdateEnd();
//		window.g_Row.Release();
	}
	//往家族频道里写
	void WriteToFamilyChat(_content)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,window.CHAT_PRIVATE,1);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-WriteChatAll:DBname:"+window.M_G_SERVER+",TBName:"+window.CHATRECEIVE+",type"+_type);
			return;
		}
		window.g_Row.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,1);
		window.g_Row.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,_content);
		window.g_Row.SetInt(window.M_G_SERVER_CHATRECEIVE_CHANNLID,1);
		window.g_Row.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,"");
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}
	
	//[功能]往聊天框里写系统提示
	//[参数]_id:相应数据库内容
	//		_param:参数("sad,asd")  允许为空
	void WriteChat7(_id,_param)
	{
		var _content = "";
		window.g_Row.InitByInt(window.GAMEUI,window.INFOBOARD,window.GAMEUI_INFOBOARD_ID,_id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-WriteChat7:DBname:"+window.GAMEUI+",TBName:"+window.INFOBOARD+",id:"+_id);
			return;
		}
		var _Type = window.g_Row.GetData(window.GAMEUI_INFOBOARD_ITYPE);
		if (_Type != window.TIPINFO_CHAT)
		{
			window.g_Row.Release();
			return;
		}

		var _content = window.g_Row.GetData(window.GAMEUI_INFOBOARD_TEXT);
		if (_param != 0 || _param != "")
		{
			_content = window.ReplaceStr(_content,_param);
		}
		window.g_Row.Release();

//		alert("WriteChat7:"+_content);
		window.WriteChatAll(window.CHAT_SYS_POINT,_content,"");
	}

	//[功能]往聊天框里写滚动公告
	//[参数]_content:内容
	void WriteChat8(_content)
	{
		window.WriteChatAll(window.CHAT_SCROLL,_content,"");
	}

	//[功能]往聊天框里写系统公告
	//[参数]_content:内容
	void WriteChat5(_content)
	{
		window.WriteChatAll(window.CHAT_SYS_POST,_content,"");
	}
	
	//[功能]往聊天框里写系统公告
	//[参数]_content:内容
	//		_param:替换的参数
	//		_iswrite:是否写入聊天框
	void WriteChat5_id(_id,_param,_iswrite)
	{
		var _content = "";
		window.g_Row.InitByInt(window.GAMEUI,window.INFOBOARD,window.GAMEUI_INFOBOARD_ID,_id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-WriteChat7:DBname:"+window.GAMEUI+",TBName:"+window.INFOBOARD+",id:"+_id);
			return;
		}
		var _Type = window.g_Row.GetData(window.GAMEUI_INFOBOARD_ITYPE);
		if (_Type != window.TIPINFO_CHAT)
		{
			window.g_Row.Release();
			return;
		}

		var _content = window.g_Row.GetData(window.GAMEUI_INFOBOARD_TEXT);
		if (_param != 0 || _param != "")
		{
			_content = window.ReplaceStr2(_content,_param);
		}
		window.g_Row.Release();
		
		if (_iswrite)
			window.WriteChatAll(window.CHAT_SYS_POST,_content,"");
		return _content;
	}
	//[功能]往聊天框里写系统公告
	//[参数]_content:内容
	//		_param:替换的参数
	void WriteChat5_id_GM(_id,_param)
	{
		var _res = window.WriteChat5_id(_id,_param,false);
		window.WriteChat8(_res);
	}

	//[功能]往聊天框里写系统提示带昵称
	//[参数]_content:内容
	//		_nkname:玩家昵称
	void WriteChat13(_content,_nkname)
	{
		window.WriteChatAll(window.CHAT_SYS_NICK,_content,_nkname);
	}

	//往聊天框写 提示信息:type一般是7 content提示的内容
	void WriteChat(type,content,nkname)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,type,1);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-WriteChat:DBname:"+window.M_G_SERVER+",TBName:"+window.CHATRECEIVE);
			return;
		}
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,type);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,content);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,nkname);
		_VNet2DBRow.UpdateEnd();
		_VNet2DBRow.del();
	}
	//往聊天框中写-您获得了物品:type 10  goodsName 物品名称 quality品质  goodsID物品ID gooodsNum数量
	void WriteChat2(type,goodsName,quality,goodsID,gooodsNum)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,type,1);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# WriteChat2 往表chatReceive写获得了物品失败\n");return;
		}
		
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,type);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,goodsName);
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_SENDERID,quality);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,goodsID);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_ACCEPTNAME,gooodsNum);
		_VNet2DBRow.UpdateEnd();
		_VNet2DBRow.del();
	}
	//往聊天框中写-邀请消息：
	void WriteChat3(type,uid,nkname,roomid)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,type,1);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# WriteChat3 往表chatReceive写邀请消息失败\n");return;
		}
		
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE,type);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT,goodsName);
		_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_SENDERID,uid);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME,nkname);
		_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_ACCEPTNAME,roomid);
		_VNet2DBRow.UpdateEnd();
		_VNet2DBRow.del();
	}

	//获得实景喇叭中人物的状态的字符串
	void GetRoleStateStr()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,window.GetMyRID());
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# ROLEDT表里查找rid失败rid="+window.GetMyRID()+"\n");return;
		}
		var _uid = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_UID);//uid

		var _str = ""+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID0);//部件
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID1);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID2);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID3);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID4);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID5);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID6);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID7);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID8);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID9);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID10);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID11);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID12);
		_VNet2DBRow.Release();
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_uid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# USERDT表里查找uid失败uid="+_uid+"\n");return;
		}
		var _sex = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_SEX);//sex
		_VNet2DBRow.del();

		return ""+_sex+","+_str;
	}


	//[功能]显示泡泡
	//[参数]uid:玩家ID
	//		_str:内容
	//		_pos:房间 游戏
	void OnChatPaopao(uid,_str,_pos)
	{
		//_str = window.DelFuckPaopaoFace(_str);
		if (_str == "")
		{
			return;
		}
		if(toint(_pos) == window.CHAT_UIPOS_ROOM )//房间里
		{
			set window.find("TOPLAYER")
			{
				find("SpeakFroth_"+uid).del();
				new VSpeakFroth_UI
				{
					SetData(_str,1);
					SetNameByID(uid);
				}
			}
		}
		else if(toint(_pos) == window.CHAT_UIPOS_GAME )//在游戏中
		{
			
		}
	}

	//[功能]点击了私聊
	//[参数]_nkName:对方的昵称
	void OnClick_PrivateChat(_nkName)
	{
		window.find("CHAT_LOGIC")._chatMgr._send.Want_PrivateChat(_nkName);
	}

	//[功能]设置聊天激活标志
	//[参数]flag:{CHAT_ENTER_NO,CHAT_ENTER_YES}
	//		classname:调用处的类名
	void SetChatEnterFlag(flag,classname)
	{
		printf("B# 聊天:SetChatEnterFlag():flag:"+flag+",classname:"+classname);
		window.g_ChatController = flag;
	}

	//[功能]得到聊天激活标志
	//[返回值]flag:{CHAT_ENTER_NO,CHAT_ENTER_YES}
	void GetChatEnterFlag()
	{
		printf("B# 聊天:GetChatEnterFlag():g_ChatController:"+window.g_ChatController);
		return window.g_ChatController;
	}

	//[功能]看看数否有消息未显示
	void GetUnReadFriendMsg()
	{
		var _SQL = "SELECT * FROM MsgChatReceive WHERE reciveUID>0";
		window.g_Table.Select( window.GAMEUI,_SQL );
		var _size = window.g_Table.GetSize();
		//printf("B# [动画图标]GetUnReadFriendMsg-SQL:"+_SQL+",_size:"+_size);
		window.g_Table.Release();
		return _size;
	}

	//[功能]获取频道ID
	//[参数]_id：聊天的id
	//[返回值]_channelID：频道id
	void GetChatChannelID(_id)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,_id);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _channelID = window.g_Row.GetData(window.M_G_SERVER_CHATRECEIVE_CHANNLID);
		window.g_Row.Release();
		return _channelID;
	}

	//[功能]快捷键聊天
	//[参数]_shotcutKey:快捷键
	//[返回值]_msg:聊天内容
	void GetShotcutContent(_shotcutKey,type)
	{
		var _VNet2DBTable = new VNet2DBTable
		{
			var _content = "";
			void GetData(_des)
			{
				_content = _des;
			}
		}
		var _SQL = "SELECT * FROM "+window.SHOTCUTCHATCONTENT+" WHERE "+window.GAMEUI_SHOTCUTCHATCONTENT_SHOTCUT_KEY_STR+"="+_shotcutKey;
		_VNet2DBTable.Select(window.GAMEUI,_SQL);
		if(type == 1)
		{
			_VNet2DBTable.ReadData("GetData",""+window.GAMEUI_SHOTCUTCHATCONTENT_CUSTOMDES);
		}
		else
		{
			_VNet2DBTable.ReadData("GetData",""+window.GAMEUI_SHOTCUTCHATCONTENT_DES);
		}
		var _msg = _VNet2DBTable._content;
		_VNet2DBTable.del();
		return _msg;
	}

	//标记好友消息
	void FlagFriendMsgRead()
	{
		if (window.g_FriendMsgID == "")
		{
			return;
		}
		var _arrNum = window.GetSplitCount(window.g_FriendMsgID,",");
		var _arrID = window.SplitStr2(window.g_FriendMsgID,",",_arrNum);
		var _i = 0;
		while (_i < _arrNum)
		{
			var id = toint(_arrID[_i]);
			//printf("FlagFriendMsgRead:_i:"+_i+",id:"+id);
			window.g_Row.InitByInt(window.GAMEUI,window.MSGCHATRECEIVE,window.GAMEUI_MSGREQUESTNEW_ID,id);
			if (window.g_Row.IsReady())
			{
				window.g_Row.SetInt(window.GAMEUI_MSGCHATRECEIVE_RECIVEUID,-1);
				window.g_Row.SetString(window.GAMEUI_MSGCHATRECEIVE_SENDERNAME,"-1");
				window.g_Row.UpdateEnd();
			}
			window.g_Row.Release();
			_i += 1;
		}
	}
}