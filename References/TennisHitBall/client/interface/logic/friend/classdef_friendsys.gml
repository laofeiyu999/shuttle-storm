//好友系统的类定义
//yxf 2009年1月4日

/*class VFriendSys FriendSys
{
	name="friendsys";

	//Open(window.FRIENDIP);//连接好友服务器

	//登录成功后,ui调用
	//参数：玩家ID，昵称
	void Login(ID,nkname)
	{
		printf("B# window.FRIENDIP="+window.FRIENDIP+"\n");
		UserLogin(ID,nkname);
	}
	//登陆重复，被t C调用
	void LoginErr()
	{
	}
	//登录成功 C调用
	void LoginOK()
	{
	}
	//删除好友后调用 C调用
	void RefreshList()
	{
	}
	//操作反馈-我已加你为好友,以后常联系喔!
	void scr_OperateReport(index,_name)
	{
		window.FriendsOperat(index,_name);
	}
	//收到礼品后-马晨需要 C调用
	void OnWawaRecvMessage(commtype,msg)
	{
		//此接口作用：不在同一服务器之间的赠送
		printf("B# OnWawaRecvMessage:commtype："+commtype+",msg:"+msg);
		//发出得到接受赠送物品的列表消息:参数不清楚是什么
		window.Too_GetNewPresent(msg);
	}
	//收到索要消息-拒绝
	//参数：索要者昵称
	void OnReceiveRequestItem(NKName)
	{
		window.WriteChat7(1019,NKName);
	}
	//收到连胜信息
	void OnReceiveArenaWin(id,p)
	{
		printf("B# 公告-收到连胜信息OnReceiveArenaWin:id="+id+" p:"+p);
		window.find("HALL_CAFFICHEMGR_LOGIC").AddMsg(id,p);
		window.find("HALL_CAFFICHEMGR_EX_LOGIC").AddMsgEx(id,p);
	}
};*/

//好友系统
class VFriendSys FriendSys
{
	name="friendsys";
	SetEdition(2);

	var _login = 0;
	var _ingame = 0;
	var _loginok = 0;
	//登陆
	void Login(jid , nkname)
	{
		if(toint(_login)==0)
		{
			_login = 1;
			SetJidAndNkName(jid,nkname);
			Open(window.FRIENDIP);
			//Open("socket://192.168.0.106:5200");
			//Open("socket://192.168.0.246:5202");
			//Open("socket://192.168.0.33:5200");
			print("window.FRIENDIP="+window.FRIENDIP+"\n");
		}
	}
	void LoginErr()
	{

	}
	void LoginOK()
	{

	}
	void OnClose()
	{
		_loginok = 0;
	}
	void OnConnected()
	{

	}
	void SetInGame(ingame)
	{
		_ingame = ingame;
		SendTypeMessage("fr","ingame",ingame);
	}
	//原先好友的操作返回提示
	void scr_OperateReport(index, nkname)
	{
		var _mdbid = 34000+index;
		printf("B# xmpp1:scr_OperateReport:index:"+index+",nkname:"+nkname+",_mdbid:"+_mdbid);

		if (index == 9 || index == 11)	//上线 下线
		{
			if (!window.GetGameSetUpOtherByIndex(window.OTHER_FRIEND))
			{
				return;
			}
		}
		if (index != 12)
		{
			window.WriteChat7(_mdbid, nkname);
		}
		
	}
	//新加的好友的操作返回提示
	void scr_OperateReportNew(index, param)
	{
		if (index == 5001 || index == 5002 || index == 3005)
		{
			return;
		}

		var _mdbid = 110000+index;
		printf("B# xmpp1:scr_OperateReportNew:index:"+index+",param:"+param+",_mdbid:"+_mdbid);
		if (index != 5003)
		{
			window.WriteChat7(_mdbid,param);
		}
		
		if (1000 == index)
		{
			var _Param;
			if(param.Find("黑名单") >= 0)
			{
				//把一名玩家放入黑名单,客户端向服务器发送消息
				//参数：用户ID,任务ID,任务描述
				_Param = ""+window.GetMyUID()+","+window.CLIENT_4_ADDBLACKLIST+","+window.CLIENT_4_ADDBLACKLIST_STR+",1";
				window.Tos_AddEvent(_Param);
				return;
			}
			if(param.Find("好友") >= 0)
			{
				if(window.CLIENT_BLACK_TO_FRIEND_NKNAME.Count >0 && param.Find(window.CLIENT_BLACK_TO_FRIEND_NKNAME)>=0)
				{
					//在黑名单中把一名玩家加为好友,客户端向服务器发送消息
					//参数：用户ID,任务ID,任务描述
					_Param = ""+window.GetMyUID()+","+window.CLIENT_5_BLACK_TO_FRIEND+","+window.CLIENT_5_BLACK_TO_FRIEND_STR+",2";
					window.Tos_AddEvent(_Param);
					window.CLIENT_BLACK_TO_FRIEND_NKNAME = "";
				}else
				{
					//在好友栏中添加至少1名好友,客户端向服务器发送消息
					//参数：用户ID,任务ID,任务描述
					_Param = ""+window.GetMyUID()+","+window.CLIENT_2_ADD_FRIEND+","+window.CLIENT_2_ADD_FRIEND_STR+",1";
					window.Tos_AddEvent(_Param);
				}
				return;
			}
		}
	}
	//commtype的消息操作
	void OnWawaRecvMessage(commtype,msg,from,to,sendername,Color)
	{
		printf("B# xmpp1:OnWawaRecvMessage()commtype:"+commtype+",msg:"+msg+",from:"+from+",to:"+to+",sendername:"+sendername+",color:"+Color);
		if (toint(commtype) == window.FRIEND_DEFMSG_REFUSE_REQUEST)
		{
			//索要拒绝
			window.WriteChat7(1019,sendername);
			return;
		}
		if (toint(commtype) == window.FRIEND_DEFMSG_MAIL)
		{
			//printf("新的邮件id mailid:"+msg);网球是赠送的礼物
			window.Too_GetNewPresent(msg);
			return;
		}
		if (toint(commtype) == 7)
		{
			//printf("拍卖消息 msg:"+msg);
			//window.AuctionOtherHighPrice(msg);
			return;
		}
		if (toint(commtype) == window.FRIEND_DEFMSG_TEAMMATE)
		{
			//队长的消息
			//参数：用户id，报名id(玩家ID或者队伍ID)，报名类型(活动ID)
			window.Tos_ApplyArenaRace(msg);
			return;
		}
		if (toint(commtype) == window.FRIEND_DEFMSG_STATE)
		{	
			//查询好友是否有空
			
			//[返回值]0(合适) 1(黑名单) 2(状态不在空闲) 3(界面不合适)
			var _res = window.JudgeMyState(NkName);
			window.F_IsFriendFree_Res(from,_res);
			return;
		}
		if (toint(commtype) == window.FRIEND_DEFMSG_STATE_RES)
		{
			//查询好友是否有空-反馈消息
			if (toint(msg) == window.JUDGE_MYSTATE_DEFAULT)
			{
				window.SetTempTeamDelete(from,window.TEMPTEAM_DELETE_FREE);
			}
			else
			{
				window.SetTempTeamDelete(from,window.TEMPTEAM_DELETE_BUSY);
			}
			return;
		}
		if(toint(commtype) == window.FRIEND_DEFMSG_MAIL_DATA)
		{
			var num = window.GetSplitCount(msg,"#");
			//printf("num "+num);
			if(0==num) return;
			var arrContent = window.SplitStr2(msg,"#",num);
			var i=0;
			while(toint(num)>i)
			{
				var subnum = window.GetSplitCount(arrContent[i],"&");
				var arrsubcontent = window.SplitStr2(arrContent[i],"&",subnum);
				if(2>subnum) return;
				var _VNet2DBRow = new VNet2DBRow{};
				_VNet2DBRow.InitByBigInt(window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,arrsubcontent[1],true);
				if (_VNet2DBRow.IsReady())
				{
					//printf("isready");
					var j=0;
					while(toint(subnum)>j+1)
					{
						//printf("subcontent "+arrsubcontent[j]+" constent "+arrsubcontent[j+1]);
						switch (toint(arrsubcontent[j]))
						{
							case 1:
								_VNet2DBRow.SetInt(1,arrsubcontent[j+1]);
								break;
							case 2:
								_VNet2DBRow.SetString(2,arrsubcontent[j+1]);
								break;
							case 3:
								_VNet2DBRow.SetInt(3,arrsubcontent[j+1]);
								break;
							case 4:
								_VNet2DBRow.SetString(4,arrsubcontent[j+1]);
								break;
							case 5:
								_VNet2DBRow.SetString(5,arrsubcontent[j+1]);
								break;
							case 6:
								_VNet2DBRow.SetBigInt(6,arrsubcontent[j+1]);
								break;
							case 7:
								_VNet2DBRow.SetInt(7,arrsubcontent[j+1]);
								break;
							case 8:
								_VNet2DBRow.SetInt(8,arrsubcontent[j+1]);
								break;
							case 9:
								_VNet2DBRow.SetInt(9,arrsubcontent[j+1]);
								break;
							case 10:
								_VNet2DBRow.SetBigInt(10,arrsubcontent[j+1]);
								break;
						
						}
						j+=2;
					}
					_VNet2DBRow.UpdateEnd();
				}
				_VNet2DBRow.del();

				i+=1;
			}
			return;
		}
	}

	//退出
	void scr_OffLine()
	{
		_login = 0;
		_loginok = 0;
		OffLine();
	}
	void OnDelete()
	{
		scr_OffLine();
	}
	//取得自己的详细描述信息 好友的详细描述信息的格式，"id,nkname,sex,channel"
	void scr_GetSelfInfo()
	{
		var infostr="";
		//temp
		infostr="not find row ";
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.GAMEUI,window.SELFDT,window.GAMEUI_SELFDT_IMSELF,-1);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return infostr;
		}
		var uid = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_SELFID);
		//var nkname = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_SELFNAME);
		var sex = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_SELFSEX);
//		var lv = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_CURLEVEL);
		var channel = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_SCHANNEL);
		var _roomID = _VNet2DBRow.GetData(window.GAMEUI_SELFDT_DESKID);

		_VNet2DBRow.del();
		var nkname = window.GetNameByUID(uid);
		var _qualify = window.GetQualifyByUID(uid);
		var _roletype = window.GetRoleTypeByUID(uid);
		var _gamestate = window.GetStateByUID(uid);
		var lv = window.GetLVByUID(uid);

		infostr = ""+uid+","+nkname+","+sex+","+lv+","+channel+","+_qualify+","+_roletype+","+_gamestate+","+_roomID;
		printf("B# xmpp1:scr_GetSelfInfo()infostr:"+infostr);
		printf("B# xmpp1:注意 scr_GetSelfInfo()uid:"+uid+",nkname:"+nkname+",sex:"+sex
			+",lv:"+lv+",channel:"+channel+",_qualify:"+_qualify+",_roletype:"+_roletype
			+",_gamestate:"+_gamestate+",_roomID:"+_roomID);
		return infostr;
	}

	//获得别人的详细描述信息
	void scr_ReceiveFriendAllInfo(data)
	{
		var arrinfo = window.SplitStr2(data , "," );
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.M_G_SERVER , window.FRIENDDT , window.M_G_SERVER_FRIENDDT_JID , arrinfo[0]);
		if (!_VNet2DBRow.IsReady())
		{
			printf("xmpp1 注意 没进去");
			_VNet2DBRow.del();
			return;
		}
		printf("B# xmpp1 注意 uid:"+arrinfo[0]+",nkname:"+arrinfo[1]+",sex:"+arrinfo[2]+",lv:"+
			arrinfo[3]+",channel:"+arrinfo[4]+",_qualify:"+arrinfo[5]+",_roletype:"+
			arrinfo[6]+",_gamestate:"+arrinfo[7]+",_roomID:"+arrinfo[8]);
		
		_VNet2DBRow.SetString(window.M_G_SERVER_FRIENDDT_NKNAME , arrinfo[1]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_SEX , arrinfo[2]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_ROLEMAXLV , arrinfo[3]);
		_VNet2DBRow.SetString(window.M_G_SERVER_FRIENDDT_CURRCHANNEL , arrinfo[4]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_QUALIFY , arrinfo[5]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_ROLETYPE , arrinfo[6]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_GAMESTATE , arrinfo[7]);
		_VNet2DBRow.SetInt(window.M_G_SERVER_FRIENDDT_ROOMID , arrinfo[8]);
		_VNet2DBRow.UpdateEnd();
		_VNet2DBRow.del();
	}

	void MsgReturnProcess(part , type , p1 , p2 , p3 , p4 ,p5)
	{
		printf("B# xmpp1:MsgReturnProcess()part:"+part+",type:"+type+",p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4+",p5:"+p5);
		if(part=="fr" && type=="hornqueue")
		{
			var _labatype = "喇叭";
			if (p1 == 0) _labatype = "小喇叭";
			if (p1 == 1) _labatype = "动作喇叭";

			//小喇叭 动作喇叭反馈信息
			if (toint(p2) == 1)
			{
				window.WriteChat7(2001,_labatype);//您的%0即将显示，请注意查看！
				return;
			}
				//小喇叭 动作喇叭反馈信息
			if (toint(p2) > 1)
			{
				window.WriteChat7(2002,+""+p2+","+_labatype);//您前面还有%0条%1等待显示，请耐心等待！
				return;
			}
			return;
		}
		if(part=="fr" && type=="tennisquit")
		{
			//被t下线
			window.UnknownToLogin();
			window.find("UIController").LoadDLG(40);//因相同账号重复登陆强制下线！
		}
		if(part=="fr" && type=="updatefrienddtok")
		{
			_loginok = 1;
			//登陆成功，把所有的在线好友的详细描述信息都查一遍
			GetAllFriendInfo();
			if(1==_ingame)
				SendTypeMessage("fr","ingame",_ingame);
			return;
		}
		if(part=="fr" && type=="add" && toint(p1)==1000)
		{
			//添加好友成功，获得这个好友的详细描述信息
			var _VNet2DBRow = new VNet2DBRow{};
			_VNet2DBRow.InitByString(window.M_G_SERVER , window.FRIENDDT , window.M_G_SERVER_FRIENDDT_NKNAME , p2);
			if (!_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.del();
				return;
			}
			var jid = _VNet2DBRow.GetData(window.M_G_SERVER_FRIENDDT_JID );
			SendGetFriendInfo(jid , p2);
			_VNet2DBRow.del();
			return;
		}
		if(part == "fr" && type =="msg")
		{
			if(p1 == 1033)
			{
				window.find("SENDMSG_LOGIC")._SendMsg_Logic._iframe.ReceiveMsgData("消息系统","不能自己给自己聊天");
			}
			if(p1 == 1034)
			{
				window.find("SENDMSG_LOGIC")._SendMsg_Logic._iframe.ReceiveMsgData("消息系统","不是自己好友,无法发送");
			}
			if(p1 == 1035)
			{
				window.find("SENDMSG_LOGIC")._SendMsg_Logic._iframe.ReceiveMsgData("消息系统","好友不在线,无法发送");
			}
			if(p1 == 1036)
			{
				//关于每日一声问候任务的处理
				var _Param = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG+","+window.CLIENT_3_SENDMSG_STR+",1";
				window.Tos_AddEvent(_Param);
				var _Param2 = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG2+","+window.CLIENT_3_SENDMSG_STR+",1";
				window.Tos_AddEvent(_Param2);
				var _Param3 = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG3+","+window.CLIENT_3_SENDMSG_STR+",1";
				window.Tos_AddEvent(_Param3);
			}
			return;
		}
		if(part=="tg")
		{
			/*临时组队相关反馈*/

			if (type=="getalluser")
			{
				//得到临时组队信息(服务器反馈)
				window.find("TEAMSET_LOGIC")._VTeamSet_Logic.SelectList();

				//[功能]临时组队-询问所有好友此时的状态
				window.TempTeamAskState(window.TEMPTEAM_DELETE_DEFAULT);
				return;
			}
			if (type=="recinvite")
			{
				if (p1 == -3010)
				{
					window.WriteChat7(1998); //邀请已经失效
					return;
				}
				if (p1 == -3011)
				{
					window.WriteChat7(1997);//无法找到邀请者
					return;
				}
				if (p1 == -3012)
				{
					window.WriteChat7(1996);//自己已经有组了无法接收新的邀请
					return;
				}
				if (p1 == 3010)
				{
					//同意邀请加人战队(服务器反馈)
					window.WriteChat7(1999); //你已加入队伍！
					return;
				}
			}
			if (type=="dismiss")
			{
				var _id = -1;
				if (p1 == 3020)//队友下线自动解散队伍
				{
					_id = 3020;
				}
				if (p1 == 3021)//解散队伍成功
				{
					_id = 3021;
				}
				if (p1 == -3020)//没有找到队伍
				{
					_id = 3022;
				}
				//解散队伍(服务器反馈)
				window.WriteChat7(_id); //队伍已解散
				return;
			}
			if (type=="invite")
			{
				invite(p1, p2, p3, p4);
				return;
			}
			if (type=="askadd")
			{
				printf("B# 组队-askadd:p1:"+p1+",p2:"+p2+",p3:"+p3);
				if (p1 == 3005)//对方不同意!
				{
					//[返回值]0(拒绝) 1(黑名单) 2(状态不在空闲) 3(界面不合适)
					if (p3 == window.JUDGE_MYSTATE_BACKLIST || p3 == 0 || p3 == window.JUDGE_MYSTATE_SETONINVITE)
					{
						window.WriteChat7(113005,""+p2);
					}
					else
					{
						window.WriteChat7(3019,""+p2);
					}
				}
				if (p1 == 3004)//创建组队成功
				{
					window.find("ARENA_LOOKOVER_LOGIC").del();
					window.find("TEAMSET_LOGIC").del();

					//创建组队成功
					window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.OnConfirm_Apply();
				}
				return;
			}
			return;
		}//tg
		if(part=="ts")
		{
			if (type=="getallvalue")
			{
				if (p1 == 5000)//得到鲜花的数量
				{
					window.find("VTopStar_Favor_List_Logic_1").MySelect();
					return;
				}
			}
			if (type=="flower")
			{
				if (p1 == 5001)
				{
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").SetFlowerValue(p3,p2);
					}

					window.SetValueOnFlowerSuccess(p3,p2);
					//window.find("VTopStar_Favor_List_Logic_1").MySelect();
					window.find("UIController").LoadDLG(643);//献花成功，您使用了一个“献花专用花束”
					return;
				}
				if (p1 == 5002)//别人为你鲜花了
				{
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").SetFlowerValue(window.GetMyUID(),p2);
					}

					var _param = ""+p3+","+p2;
					window.WriteChat7(115002,_param);
					return;
				}
			}
			if (type == "getflower")
			{
				if (p1 == 5003)//查询得到花的数量
				{
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").SetFlowerValue(p2,p3);
					}
					return;
				}
			}
			return;
		}//ts
		if(part == "fr" && type=="transmsg")
		{
			window.find("UIController").LoadDLG(666);
			window.find("DLGLAYER").find("VMB_FamilyPopUpTipInfo_Logic").ReplaceData(p1);
		}
		if(part == "cs")
		{
			window.FamilyRecData_p1 = p1;
			window.FamilyRecData_p2 = p2;
			window.FamilyRecData_p3 = p3;
			window.FamilyRecData_p4 = p4;

			//用户提示
			if(p1 == window.SUC_FAMILY_USER_TIP)
			{
				window.WriteToFamilyChat(""+p2+"为家族积累积分达到"+p3);
			}
			//加分成功
			if(p1 == window.SUC_FAMILY_ADD)
			{
				window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			}
			//家族升级了
			if(p1 == window.SUC_FAMILY_LVUP)
			{
//				window.WriteChat(7,""+"恭喜您的家族达到"+window.GetFamilyLev()+"级");
//				window.WriteChat(7,""+"您的家族获得设置"+window.GetFamilyLev()+"级徽章的资格");
				window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetFamilyColor();
			}
			//家族人数已满
			if(p1 == window.ERR_FAMILY_FULL)
			{
			}
			//无法找到要加入的家族
			if(p1 == window.ERR_FAMILY_NOFAMILY)
			{
			}
			//已经在家族无法加入
			if(p1 == window.ERR_FAMILY_INGROUP)
			{
			}
			//有人加入家族
			if(p1 == window.SUC_FAMILY_ADDUSER)
			{
//				window.WriteChat(7,"有人申请加入家族");
				window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				if(window.GetMyName() == p2)
				{
					if(window.GetUIPos() != window.POS_CHANNELCHOOSE)
					{
						window.find("UIController").LoadDLG(666);
						window.find("DLGLAYER").find("VMB_FamilyPopUpTipInfo_Logic").ReplaceData("您加入了家族");
						window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(window.GetFamilyName());
						//window.SetFamilyLevUpMonitor();
						//window.find("FamilyLevUpMonitor_Name").InitDB(window.GetFamilyIDByName());
					}
				}
				if(window.g_probablyPos == window.POS_PROBABLY_ROOM || window.g_probablyPos == window.POS_PROBABLY_GAME || window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
				{
					var _uid = window.GetFamilyPeopleUIDByName(p2);
					window.F_Family_GetOtherPlayerFamilyName(_uid);
				}
				//任务 加入家族
				window.TaskEvent_AddInFamily(window.GetFamilyPeopleUIDByName(p2));
			}
			//不同意加人家族
			if(p1 == window.SUC_FAMILY_RECINV_NOAGREE)
			{
			}
			//被邀请人等级不够
			if(p1 == window.ERR_FAMILY_ASKADD_LV)
			{
			}
			//等级太低无法创建
			if(p1 == window.ERR_FAMILY_CREATE_LV)
			{
			}
			//等级太低无法申请加入家族
			if(p1 == window.ERR_FAMILY_APPLY_LV)
			{
			}
			//解散家族时家族人数不能超过1个
			if(p1 == window.ERR_FAMILY_DIS_NUM)
			{
			}

			if(type == "getFamilyInfo")
			{
				if(p1 == window.SUC_FAMILY_GETINFO_NONE)
				{
					
				}
				if(p1 == window.SUC_FAMILY_GETINFO1)
				{
					window.find("UIController").LoadUI("UI_LOOKUPFAMILYINFO");
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyInfo(p2);
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilySlogan(p3);
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyTm(p4);
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyBoyAndGirlNum(p5);
				}
			}
			if(type == "getinfo")
			{
				if(p1 == window.SUC_FAMILY_GETINFO_NONE)
				{
					if(window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_BaseInfo.s_Family.SetData(-1);
					}
				}
				if(p1 == window.SUC_FAMILY_GETINFO)
				{
					if(window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_BaseInfo.s_Family.SetData(""+p3);
						//add by chenjihui
						//2010-12-21
						//家族名称
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_Sociality.s_Fname_FamilyDates.SetData(""+p3);
						//家族徽章
						var _parserBadgeData = window.parserBadgeData(p4);
						var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_Sociality.s_FBedge_FamilyDates.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
						
						var _arrData = window.Splitstr2(p5,";",2);
						//家族等级
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_Sociality.s_FLevel_FamilyDates.SetData(_arrData[0]);
						//家族成员
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_Sociality.s_FMember_FamilyDates.SetData(_arrData[1],window.GetFamilyMaxPeopleNum(_arrData[0]));

					}
				}

				if(window.g_probablyPos == window.POS_PROBABLY_ROOM || window.g_probablyPos == window.POS_PROBABLY_GAME || window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
				{
//					var _index = window.g_Room_userNum;
//					while(_index != 0)
//					{
//						var _userID = window.find("VRoleModel_Info_Logic_Name_"+p2)._uid;
//						if(p2 == _userID)
//						{
							if(p1 == window.SUC_FAMILY_GETINFO_NONE)
							{
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetFamilyName(-1);
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetFamilyIcom(false);
							}
							if(p1 == window.SUC_FAMILY_GETINFO)
							{
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetFamilyName(p3);
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetFamilyIcom(true,p4);
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetFamilyColorByLv(p5);
								window.find("VRoleModel_Info_Logic_Name_"+p2).SetShowState(true);
							}
							window.find("VColumn_RoomUser_Logic_Name_"+p2).SetFamilyIcom(p4);
//						}
//						_index -= 1;
//					}
				}
				if(window.g_probablyPos == window.POS_PROBABLY_TRAIN)
				{
					if(p1 == window.SUC_FAMILY_GETINFO_NONE)
					{
						window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetFamilyName(-1);
						window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetFamilyIcom(false);
					}
					if(p1 == window.SUC_FAMILY_GETINFO)
					{
						window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetFamilyName(p3);
						window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetFamilyIcom(true,p4);
						window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetFamilyColorByLv(p5);
					}
				}
				
			}
			//登入登出家族,客户端打开家族界面时登入,关闭时登出
			if(type == "enter")
			{
				//登入家族成功
				if(p1 == window.SUC_FAMILY_ENTER)
				{
					if(window.g_probablyPos == window.POS_PROBABLY_HALL)
					{
						window.LMH1_Hall_Bottom_Family();	//引导事件
						window.find("UIController").LoadUI("UI_FAMILY");
					}
				}
				//登出家族成功
				if(p1 == window.SUC_FAMILY_ENTER1)
				{
					window.find("FAMILY_LOGIC").del();
				}
			}
			//检查家族名称
			if(type == "checkname")
			{
				//名字重复
				if(p1 == window.SUC_FAMILY_CHECK_HAVE)
				{
					window.find("CREATEFAMILY_LOGIC")._CreateFamily.s_NameCheckResult.showResult(false);
					window.find("VMB_ChangeNameCard_Logic")._Box.s_NameCheckResult.showResult(false);
				}
				//没有重复
				if(p1 == window.SUC_FAMILY_CHECK_NONE)
				{
					window.find("CREATEFAMILY_LOGIC")._CreateFamily.s_NameCheckResult.showResult(true);
					window.find("VMB_ChangeNameCard_Logic")._Box.s_NameCheckResult.showResult(true);
				}
				return;
			}
			//解散家族
			if(type == "dismiss")
			{
//				//自己不在家族
//				if(p1 == window.ERR_FAMILY_DIS_NONE)
//				{
//				}
//				//没有权力解散家族
//				if(p1 == window.ERR_FAMILY_DIS_LIMIT)
//				{
//				}
				//家族解散了
				if(p1 == window.SUC_FAMILY_DIS)
				{
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
					window.find("FamilyLevUpMonitor_Name").DelMonitor();
					if(window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_BaseInfo.s_Family.SetData(-1);
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(-1);

					if(window.g_probablyPos == window.POS_PROBABLY_ROOM || window.g_probablyPos == window.POS_PROBABLY_GAME || window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
					{
						var _uid = window.GetMyUID();
						window.F_Family_GetOtherPlayerFamilyName(_uid);
					}
				}
			}
			//家族某人邀请人加入
			if(type == "askadd")
			{
//				//邀请人需要在家族
//				if(p1 == window.ERR_FAMILY_ASKADD_ADDDATA)
//				{
//				}
//				//被邀请的人已经在家族
//				if(p1 == window.ERR_FAMILY_ASKADD_INGROUP)
//				{}
//				//找不到被邀的人
//				if(p1 == window.ERR_FAMILY_ASKADD_NONE)
//				{}
//				//没有权力邀请
//				if(p1 == window.ERR_FAMILY_ASKADD_LIMIT)
//				{}
//				//不能自己邀请自己
//				if(p1 == window.ERR_FAMILY_ASKADD_SAME)
//				{}
//				//成功发送加入家族邀请
//				if(p1 == window.SUC_FAMILY_ASKADD_SEND)
//				{}
			}
			//接收邀请(客户端直接接收到)
			if(type == "invite")
			{
				if(window.GetUIPos() == window.POS_GAME || window.GetUIPos() == window.POS_TRAINING)
				{
					window.F_Friend_TransMsg(p1,"对方正在游戏中，请稍候再发送邀请");
				}
				else
				{
					window.FamilyInviterID = p1;
					window.FamilyInviteID = p3;
					window.find("UIController").LoadDLG(659);
					window.find("DLGLAYER").find("VMB_GetFamilyInvite_Logic").ReplaceData(p4);
				}	
			}
			//同意邀请加人家族
			if(type == "recinvite")
			{
//				//家族人数已满
//				if(p1 == window.ERR_FAMILY_FULL)
//				{}
//				//无法找到要加入的家族
//				if(p1 == window.ERR_FAMILY_NOFAMILY)
//				{}
//				//已经在家族无法加入
//				if(p1 == window.ERR_FAMILY_INGROUP)
//				{}
				//有人加入家族
				if(p1 == window.SUC_FAMILY_ADDUSER)
				{
//					window.WriteChat(7,""+p2+"加入了家族");
				}
//				//拒绝加人家族
//				if(p1 == window.SUC_FAMILY_RECINV_NOAGREE)
//				{
//					window.find("UIController").LoadDLG(665);
//				}
				if (p1 == -2053)
				{
					//window.WriteChat7(115003); //此家族没有一个人,无法直接加入
					window.find("UIController").LoadDLG(817);
					return;
				}	
			}
			if(type == "modifyfamilyname")
			{
				if(p1 == 2300)
				{
					if (window.GetFamilyHeadName() == window.GetMyName())
					{
						window.del();//修改家族名称成功！程序关闭
//						window.find("UIController").LoadDLG(810);//修改家族名称成功！
					}
					else
						window.WriteChat7(115004,""+window.GetFamilyHeadName()+","+window.GetFamilyName(window.GetMyName()));//族长XXX修改了家族名为XXX
					window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
					window.find("VMB_ChangeNameCard_Logic").OnConfirm().del();
					return;
				}
				if(p1 == -2390)
				{
					window.find("UIController").LoadDLG(811);//修改家族名称的人不在家族中
					return;
				}
				if(p1 == -2391)
				{
					window.find("UIController").LoadDLG(812);//修改家族名称的人没有权限
//					window.find("VMB_ChangeNameCard_Logic")._Box.s_NameCheckResult.nofamilypower();
					return;
				}
				if(p1 == -2392)
				{
					window.find("UIController").LoadDLG(651);//家族名称重复
//					window.find("VMB_ChangeNameCard_Logic")._Box.s_NameCheckResult.familynamenotuse();
					return;
				}
				if(p1 == -2022)
				{
					window.find("UIController").LoadDLG(650);//家族名不能为空
					return;
				}
				if(p1 == -2023)
				{
					window.find("UIController").LoadDLG(651);//家族名不能为空格
//					window.find("VMB_ChangeNameCard_Logic")._Box.s_NameCheckResult.familynamenotuse();
					return;
				}
				if(p1 == -2024)
				{
					window.find("UIController").LoadDLG(813);//家族名不能太长
					return;
				}
			}
			//把家族中一个成员踢出
			if(type == "kick")
			{
//				//要踢的人不在本家族
//				if(p1 == window.ERR_FAMILY_KICK_NOGROUP)
//				{
//				}
//				//自己不在家族
//				if(p1 == window.ERR_FAMILY_KICK_MYNOGROUP)
//				{
//				}
//				//不能自己踢自己
//				if(p1 == window.ERR_FAMILY_KICK_SELF)
//				{
//				}
//				//没有权限踢人或者是无法踢比自己权限高的
//				if(p1 == window.ERR_FAMILY_KICK_LIMIT)
//				{
//				}
				//踢人完毕
				if(p1 == window.SUC_FAMILY_KICK)
				{
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
				//被人踢了
				if(p1 == window.SUC_FAMILY_KICKED)
				{
					//window.find("UIController").LoadDLG(658);
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(-1);
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
					window.find("FamilyLevUpMonitor_Name").DelMonitor();

					if(window.g_probablyPos == window.POS_PROBABLY_ROOM || window.g_probablyPos == window.POS_PROBABLY_GAME || window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
					{
						var _uid = window.GetUIDByName(p2);
						window.F_Family_GetOtherPlayerFamilyName(_uid);
					}
				}
			}
			//脱离家族
			if(type == "leave")
			{
//				//脱离家族的人必须在家族里面
//				if(p1 == window.ERR_FAMILY_LEAVE_NOGROUP)
//				{
//				}
//				//族长不能直接退出家族
//				if(p1 == window.ERR_FAMILY_LEAVE_NOLEADER)
//				{
//					window.find("UIController").LoadDLG(655);
//				}
//				//不允许直接退出
//				if(p1 == window.ERR_FAMILY_LEAVE_NOALLOW)
//				{
//				}
				//脱离家族
				if(p1 == window.SUC_FAMILY_LEAVE)
				{
//					window.WriteChat(7,""+p2+"脱离家族");
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
				//自己脱离家族成功
				if(p1 == window.SUC_FAMILY_LEAVESELF)
				{
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
					window.find("FamilyLevUpMonitor_Name").DelMonitor();
					if(window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_BaseInfo.s_Family.SetData(-1);
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(-1);
				}
				
			}
			//修改家族口号
			if(type == "modifyslogan")
			{
				window.FamilySetLog[window.FAMILYSET_FAMILYSLOGAN] = 0;
//				//不在家族
//				if(p1 == window.ERR_FAMILY_MS_NOUSER)
//				{
//				}
//				//找到不到家族
//				if(p1 == window.ERR_FAMILY_MS_NOGROUP)
//				{
//				}
//				//口号为空
//				if(p1 == window.ERR_FAMILY_MS_EMPTY)
//				{
//				}
//				//口号太长
//				if(p1 == window.ERR_FAMILY_MS_LENGTH)
//				{
//				}
//				//没有权限
//				if(p1 == window.ERR_FAMILY_MS_LIMIT)
//				{
//				}
				//口号被修改了
				if(p1 == window.SUC_FAMILY_MS)
				{
					window.FamilySetLog[window.FAMILYSET_FAMILYSLOGAN] = 1;
					
					window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilySet.ModifyCheck_2();
//					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
//					window.WriteChat(7,"家族签名已修改");
				}
			}
			//修改家族公告板
			if(type == "modifycallboard")
			{
				window.FamilySetLog[window.FAMILYSET_FAMILYAFFICHE] = 0;
//				//不在家族
//				if(p1 == window.ERR_FAMILY_MC_NOUSER)
//				{
//				}
//				//找到不到家族
//				if(p1 == window.ERR_FAMILY_MC_NOGROUP)
//				{
//				}
//				//公告为空
//				if(p1 == window.ERR_FAMILY_MC_EMPTY)
//				{
//				}
//				//公告太长
//				if(p1 == window.ERR_FAMILY_MC_LENGTH)
//				{
//				}
//				//没有权限
//				if(p1 == window.ERR_FAMILY_MC_LIMIT)
//				{
//				}
				//公告被修改了
				if(p1 == window.SUC_FAMILY_MC)
				{
					window.FamilySetLog[window.FAMILYSET_FAMILYAFFICHE] = 1;
					
					window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilySet.ModifyCheck_3();
//					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
//					window.WriteChat(7,"公告已修改");
				}
			}
			//修改家族中某人的权限
			if(type == "modifypopedom")
			{
//				//不能自己改自己的
//				if(p1 == window.ERR_FAMILY_MP_SELF)
//				{
//				}
//				//自己不在家族
//				if(p1 == window.ERR_FAMILY_MP_NOSELF)
//				{
//				}
//				//被修改权限的人不在家族
//				if(p1 == window.ERR_FAMILY_MP_NOOTHER)
//				{
//				}
//				//被修改权限的人不在本家族
//				if(p1 == window.ERR_FAMILY_MP_NOIN)
//				{
//				}
//				//没有权限修改
//				if(p1 == window.ERR_FAMILY_MP_LIMIT)
//				{
//				}
//				//无需修改,现在已经是一样的了
//				if(p1 == window.ERR_FAMILY_MP_NEED)
//				{
//				}
				//提升为管理员
				if(p1 == window.SUC_FAMILY_MP1)
				{
//					window.WriteChat(7,""+p2+"被提升为家族管理员");
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
				//降为普通成员
				if(p1 == window.SUC_FAMILY_MP2)
				{
//					window.WriteChat(7,""+p2+"被撤销了家族管理员资格");
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
//				//管理员达到上限,无法增加
//				if(p1 == window.ERR_FAMILY_MP_NUM)
//				{
//				}
			}
			//修改能否自动加入的标志
			if(type == "modifyapply")
			{
				window.FamilySetLog[window.FAMILYSET_FAMILYCHECK] = 0;
//				//不在家族
//				if(p1 == window.ERR_FAMILY_MA_NOUSER)
//				{
//				}
//				//找到不到家族
//				if(p1 == window.ERR_FAMILY_MA_NOGROUP)
//				{
//				}
//				//没有权限
//				if(p1 == window.ERR_FAMILY_MA_LIMIT)
//				{
//				}
				//成功修改标志
				if(p1 == window.SUC_FAMILY_MA)
				{
					window.FamilySetLog[window.FAMILYSET_FAMILYCHECK] = 1;
					
					window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilySet.ModifyCheck_4();
//					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
			}
			//屏蔽某人的在家族中的聊天
			if(type == "chat")
			{
//				//自己不在公会        
//				if(p1 == window.ERR_FAMILY_CHAT_NOUSER)
//				{
//				}
//				//找不到被屏蔽人   
//				if(p1 == window.ERR_FAMILY_CHAT_NOOTHER)
//				{
//				}
//				//被屏蔽的人不在本家族
//				if(p1 == window.ERR_FAMILY_CHAT_NOIN)
//				{
//				}
//				//没有权限            
//				if(p1 == window.ERR_FAMILY_CHAT_LIMIT)
//				{
//				}
//				//被屏蔽了            
//				if(p1 == window.SUC_FAMILY_CHAT1)
//				{
//					window.WriteChat(7,""+p2+"被管理员/族长屏蔽了发言");
//				}
//				//取消屏蔽了          
//				if(p1 == window.SUC_FAMILY_CHAT2)
//				{
//					window.WriteChat(7,"取消了对"+p2+"的屏蔽");
//				}
			}
			//申请加入一个家族
			if(type == "apply")
			{
//				//已经在公会,不允许申请
//				if(p1 == window.ERR_FAMILY_APPLY_INTEAM)
//				{
//					window.find("UIController").LoadDLG(662);
//					window.find("DLGLAYER").find("VMB_CreateFamily_HaveFamily_Logic").ReplaceData("申请");
//				}
//				//重复申请
//				if(p1 == window.ERR_FAMILY_APPLY_REPEAT)
//				{
//				}
//				//没有这个家族
//				if(p1 == window.ERR_FAMILY_APPLY_NOTEAM)
//				{
//				}
//				//成功申请
//				if(p1 == window.SUC_FAMILY_APPLY)
//				{
//					//window.find("UIController").LoadDLG(660);
//					//window.find("DLGLAYER").find("VMB_ApplyFamily_OK_Logic").ReplaceData(""+window.GetFamilyName());
//				}
//				//有人申请加入家族
//				if(p1 == window.SUC_FAMILY_APPLY1)
//				{
//					//window.WriteChat(7,"有人申请加入家族");
//					//window.SendFamilyTipInfo(1,1,"yangyang");
//				}
				if (p1 == window.ERR_FAMILY_APPLY_NOUSER)
				{
					window.find("UIController").LoadDLG(817);//此家族没有一个人,无法直接加入
				}	
			}
			//对申请的处理
			if(type == "doapply")
			{
//				//没有这个成员 
//				if(p1 == window.ERR_FAMILY_DOAPPLY_NOUSER)
//				{
//				}
//				//没有申请信息或者申请信息已经失效
//				if(p1 == window.ERR_FAMILY_DOAPPLY_NOINFO)
//				{
//				}
//				//没有权力处理申请                
//				if(p1 == window.ERR_FAMILY_DOAPPLY_LIMIR)
//				{
//				}
//				//不同意申请加入
//				if(p1 == window.SUC_FAMILY_DOAPPLY)
//				{
//				}
			}
			//获得申请信息
			if(type == "getallapply")
			{
//				//同步申请完成
//				if(p1 == window.SUC_FAMILY_SYN_APPLY)
//				{
//				}
			}
			//转让族长
			if(type =="transfer")
			{
//				//自己不在家族
//				if(p1 == window.ERR_FAMILY_TRAN_NOSELF)
//				{
//				}
//				//没有权限  
//				if(p1 == window.ERR_FAMILY_TRAN_LIMIT)
//				{
//				}
//				//被修改的人不在家族
//				if(p1 == window.ERR_FAMILY_TRAN_NOOTHER)
//				{
//				}
//				//不能自己对自己操作
//				if(p1 == window.ERR_FAMILY_TRAN_SAME)
//				{
//				}
//				//不在同一个家族    
//				if(p1 == window.ERR_FAMILY_TRAN_NOIN)
//				{
//				}
				//成功              
				if(p1 == window.SUC_FAMILY_TRAN)
				{
//					window.WriteChat(7,""+window.GetNameByUID()+"把族长权限转让给了"+p2);
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
			}
			//修改家族图标
			if(type == "modifyicon")
			{
				window.FamilySetLog[window.FAMILYSET_FAMILYNAME] = 0;
//				//不在家族
//				if(p1 == window.ERR_FAMILY_MI_NOUSER)
//				{
//				}
//				//找到不到家族
//				if(p1 == window.ERR_FAMILY_MI_NOGROUP)
//				{
//				}
//				//没有权限
//				if(p1 == window.ERR_FAMILY_MI_LIMIT)
//				{
//				}
				//成功修改
				if(p1 == window.SUC_FAMILY_MI)
				{
					window.FamilySetLog[window.FAMILYSET_FAMILYNAME] = 1;
					
					window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilySet.ModifyCheck_5();
//					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
//					window.WriteChat(7,""+window.GetFamilyLev()+"级徽章已设置完成");
				}
			}
			//创建一个家族
			if(type == "create")
			{
//				//创建人已经是某个家族成员
//				if(p1 == window.ERR_FAMILY_CREATE_HAVE)
//				{
//					window.find("UIController").LoadDLG(662);
//					window.find("DLGLAYER").find("VMB_CreateFamily_HaveFamily_Logic").ReplaceData("创建");
//				}
//				//家族名不能为空
//				if(p1 == window.ERR_FAMILY_CREATE_NULL_NAME)
//				{
////					window.find("UIController").LoadDLG(650);
//				}
//				//家族名不能为空格,家族名不能太长,家族名字已经被其他家族使用
//				if(p1 == window.ERR_FAMILY_CREATE_SPACE_NAME || p1 == window.ERR_FAMILY_CREATE_MOD_NAME || p1 == window.ERR_FAMILY_CREATE_SAME)
//				{
//					window.find("UIController").LoadDLG(651);
//				}
//				//公告为空
//				if(p1 == window.ERR_FAMILY_CREATE_NULL_SLOGAN)
//				{
//				}
//				//公告太长
//				if(p1 == window.ERR_FAMILY_CREATE_MOD_SLOGAN)
//				{
//				}
				//创建成功
				if(p1 == window.SUC_FAMILY_CREATE)
				{
					window.find("CREATEFAMILY_LOGIC").del();
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
					if(window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.m_Class_BaseInfo.s_Family.SetData(""+window.GetFamilyName());
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(window.GetFamilyName());
					//任务 加入家族
					window.TaskEvent_AddInFamily(window.GetMyUID());
				}
			}
			//家族排行榜
			if(type == "getallteam")
			{
				//同步家族数据成功 
				if(p1 == window.SUC_FAMILY_SYN)
				{	
					window.FamilyDataHash = p2;
					if(window.IsHallHtnOpened(window.G_HALLBTN_TOPSTAR))
					{
						window.find("VTopStar_FamilyDBList_All_Logic_NAME").ReFlash();
					}
					if(window.IsHallHtnOpened(window.G_HALLBTN_FAMILY))
					{
						window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Family.SetData(window.GetFamilyName());
				}
				//清除客户端的数据 
				if(p1 == window.SUC_FAMILY_SYN_CLEAR)
				{
					window.ClearFamilyTopListData();
				}
//				//服务器繁忙,稍后重试(一般情况为当时同步人数过多)
//				if(p1 == window.SUC_FAMILY_SYN_BUSY)
//				{
//				}

			}
			//清除所有申请信息
			if(type == "clearallapply")
			{
//				//找不到用户
//				if(p1 == window.ERR_FAMILY_CLEARALLAPPLY_NOUSER)
//				{
//				}
//				//没有权限
//				if(p1 == window.ERR_FAMILY_CLEARALLAPPLY_LIMIT)
//				{
//				}
				//成功
				if(p1 == window.SUC_FAMILY_CLEARALLAPPLY)
				{
					window.g_CArenaFunction.ClearApplyInfoTB();
					window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilyApplyInfo.DelAllApplyInfo();
				}
			}

			if(window.GetUIPos() != window.POS_CHANNELCHOOSE)
			{
				window.ShowFamilyTipInfo(window.FamilyRecData_p1);
			}
		}//cs
	}

	//[private]接收邀请(客户端直接接收到)
	/*
		参数
		id		邀请人的id
		nkname		邀请人的昵称
		teamname	要组成队伍的名称
		raceid		邀请加入的组队类型
	*/
	void invite(id,nkname,teamname,raceid)
	{
		printf("B# xmpp1-组队:invite():id:"+id+",nkname:"+nkname+",teamname:"+teamname+",raceid:"+raceid);
		
		//[返回值]0(合适) 1(黑名单) 2(状态不在空闲) 3(界面不合适)
		var _res = window.JudgeMyState(nkname);
		if (toint(_res) > window.JUDGE_MYSTATE_DEFAULT)
		{
			//同意邀请加人战队(直接服务器)
			//参数：askid,raceid,isagree
			window.F_recinvite(id,raceid,_res);//拒绝
			return;
		}

		window.find("UIController").LoadDLG(200);//[%0]邀请你加入队伍[%1]去参加[%2]同意吗？
		var _racename = window.GetRaceNameByID(raceid);
		window.find("DLGLAYER").find("VMyMB_AraneInvite_Logic").ReplaceData(""+nkname+","+teamname+","+_racename);
		window.find("DLGLAYER").find("VMyMB_AraneInvite_Logic").SetServerData(id,raceid);
	}

	//
	void DisposeHornNotChat(pMsg,strAttribute,pName,pSenderJid,commType)
	{
		printf("B# xmpp1:DisposeHornNotChat():pMsg:"+pMsg+",strAttribute:"+strAttribute+",pName:"+pName+",pSenderJid:"+pSenderJid+",commType:"+commType);
		if(1==commType)
		{
			//pMsg参数说明：动作ID,Ava1,...,Ava13;说话内容
			window.find("VSenceBugle_Mgr_Logic_Name").SetData(pMsg,pName,pSenderJid);
		}
		if(100==commType)	//各种消息
		{
			//16,TT001,TT002,TT002,80,
			var _num = window.GetSplitCount(pMsg,",");
			var _arr = window.SplitStr2(pMsg,",",_num);
			var _param = "";
			var _i = 1;
			while (_i < _num)
			{
				_param += ""+_arr[_i]+",";
				_i += 1;
			}
			printf("B# xmpp1:DisposeHornNotChat():id:"+_arr[0]+",_param:"+_param);
//			window.find("HALL_CAFFICHEMGR_LOGIC").AddMsg(_arr[0],_param);
			//window.find("HALL_CAFFICHEMGR_EX_LOGIC").AddMsgEx(_arr[0],""+_arr[3]+","+_arr[4]);
			if (toint(_arr[0]) == 16)//临时的做法 以后得服务器来做 2010年5月15日
			{
				window.find("HALL_CAFFICHEMGR_EX_LOGIC").AddMsgEx(_arr[0],""+_arr[3]+","+_arr[4]);
				return;
			}
			window.find("HALL_CAFFICHEMGR_EX_LOGIC").AddMsgEx(_arr[0],_param);
		}
	}
};

//相关接口
set window
{
	//得到临时组队信息(直接服务器)
	/*
		参数
		type	得到组队成员的类型(1.好友 2.家族 3.夫妻...),格式:"未知关系,未知关系,未知关系,未知关系,未知关系,未知关系,未知关系,夫妻,家族,好友"
				如要好友和家族:"0,0,0,0,0,0,0,0,1,1",
				如要好友和夫妻:"0,0,0,0,0,0,0,1,0,1"
		num		每种类型得到的数量 -1表示所有
	*/
	void F_getalluser(type,num)
	{
		window.find("friendsys").ClearTGInviteList();
		window.find("friendsys").SendTypeMessage("tg","getalluser",type,num);
	}

	//邀请组队(直接服务器)
	/*
		参数
		id		邀请的人
		gname		临时组队的名称
		addnk		要加入战队的人物名字
		raceid		邀请加入的活动id
		svid		服务器id
	*/
	void F_askadd(id,gname,addnk,raceid,svid)
	{
		//printf("id:"+id+",gname:"+gname+",addnk:"+addnk+",raceid:"+raceid);
		window.find("friendsys").SendTypeMessage("tg","askadd",id,gname,addnk,raceid,svid);
	}

	//同意邀请加人战队(直接服务器)
	/*
		参数
		askid		邀请人的id
		raceid		邀请加入的组队类型
		isagree		1 同意，0不同意
		svid		服务器id
	*/
	void F_recinvite(askid,raceid,isagree)
	{
		printf("B# 组队:F_recinvite-1askid:"+askid+",raceid:"+raceid+",isagree:"+isagree);
		if (toint(isagree) == 1)
		{
			window.g_ArenaTeamInviteUID = askid;
			window.g_ArenaTeamRaceID = raceid;
			//[功能]判断是否要提示取消报名
			if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_TEAMINVITE))
			{
				printf("B# JudgeIsNeedCancelQueue-F_recinvite():"+_Param);
				return;
			}
		}
		printf("B# 组队:F_recinvite-2askid:"+askid+",raceid:"+raceid+",isagree:"+isagree);
		window.F_recinvite_Ex(askid,raceid,isagree);
	}

	//排除各种判断后调用
	void F_recinvite_Ex(askid,raceid,isagree)
	{
		printf("B# 组队:F_recinvite_Ex-askid:"+askid+",raceid:"+raceid+",isagree:"+isagree);
		window.find("friendsys").SendTypeMessage("tg","recinvite",askid,raceid,isagree,window.GetMySvID());
	}

	//解散队伍(直接服务器)
	/*
		参数
		id		解散人的id
		raceid	解散的组队类型
	*/
	void F_dismiss(id,raceid)
	{
		window.find("friendsys").SendTypeMessage("tg","dismiss",id,raceid);
	}

	//队长通知队友去报名
	/*
		参数
		touserjid 接受者的jid
		msg 发送的消息
		sendernkname 发送者的昵称
		color  聊天消息的颜色
		commtype 消息类型 可以不填，不填默认是聊天消息
	*/
	void F_CallTeammate(touserjid,msg)
	{
		window.find("friendsys").SendMsg(touserjid , msg , window.GetMyName() , "#1" , window.FRIEND_DEFMSG_TEAMMATE);
	}

	//得到玩家的排行榜数据
	/*
		参数
		num 得到数量,-1表示所有
	*/
	void F_getallvalue(num)
	{
		window.find("friendsys").SendTypeMessage("ts","getallvalue",num);
	}

	//查询玩家的人气值
	/*
		参数
		findid		被查询人的id
	*/
	void F_getflower(uid)
	{
		window.find("friendsys").SendTypeMessage("ts","getflower",uid);
	}


	//查询好友是否有空
	/*
		参数
		touserjid 接受者的jid
		msg 发送的消息
		sendernkname 发送者的昵称
		color  聊天消息的颜色
		commtype 消息类型 可以不填，不填默认是聊天消息
	*/
	void F_IsFriendFree(touserjid,msg)
	{
		window.find("friendsys").SendMsg(touserjid , msg , window.GetMyName() , "#1" , window.FRIEND_DEFMSG_STATE);
	}

	//查询好友是否有空-返回消息
	/*
		参数
		touserjid 接受者的jid
		msg 发送的消息		(目前代表状态 0(合适) 1(黑名单) 2(状态不在空闲) 3(界面不合适))
		sendernkname 发送者的昵称
		color  聊天消息的颜色
		commtype 消息类型 可以不填，不填默认是聊天消息
	*/
	void F_IsFriendFree_Res(touserjid,msg)
	{
		window.find("friendsys").SendMsg(touserjid , msg , window.GetMyName() , "#1" , window.FRIEND_DEFMSG_STATE_RES);
	}
}