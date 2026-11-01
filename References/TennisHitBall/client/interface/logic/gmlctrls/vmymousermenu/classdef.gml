//
//鼠标右键的类定义
//yxf	2009年9月27日
//

//鼠标右键选项类
class VMouseR_Sub item
{
	size = "100,20";bgcolor = "#FF";
	var m_State = 1;				//状态 0不能点 1能点
	var m_Color_Normal = "#000000";	//正常颜色
	var m_Color_Over = "#FFFFFF";	//滑过颜色
	var m_Color_Grey = "#6B6463";	//不可点颜色

	void Init()
	{
		//文字
		staticvar s_Text = new text
		{
			color = parent.m_Color_Normal;size = "94,22";ycenter = true;
		}
	}

	void OnMouseOver(){if (m_State == 1){s_Text.color = m_Color_Over;}}
	void OnMouseOut(){if (m_State == 1){s_Text.color = m_Color_Normal;}}

	//[功能]设置状态
	//参数 state：0不能点 1能点
	void SetState(state)
	{
		m_State = state;
		if (m_State == 0)s_Text.color = m_Color_Grey;
		if (m_State == 1)s_Text.color = m_Color_Normal;
	}

	//[功能]得到状态
	void GetState(){return m_State;}

	//[功能]设置文字
	void SetData(_src)
	{
		s_Text.src = _src;
	}
	
	//[功能]得到文字
	void GetData(_src)
	{
		return ""+s_Text.src;
	}

	inclass("VMouseR_Sub_UI");

	Init();
};

//右键基类
class VMouseR item
{
	if (window.g_MouseROnly){window.g_roomenu = 0;del();}
	window.g_MouseROnly = true;
	//==========================快捷键===================================
	window.find("gameinput").AddExclusiveShortcutUser(this);
	void OnDelete()
	{
		window.g_MouseROnly = false;
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				window.g_roomenu = 0;del();break;
			}
		}
	}
	//===============================================================
	bgcolor = "#FF";movetocursor(1,1);//size = "100,180";
	setFocus = "true";capturemouse="true";

	void OnLostFocus()
	{
		if (updatecount>1)
		{window.g_roomenu = 0;del();}
		else 
		{setFocus = "true";}
	}
	void OnMouseDownL(){window.g_roomenu = 0;del();}
	//=============================核心脚本===========================
	var m_Num = -1;			//共有几个选项（初始）
	var m_NumUI = -1;		//共有几个选项（显示）
	var m_HeightSub = 20;	//子项高度
	var m_SizeX = 100;		//宽度
	var m_SizeY = 0;		//高度
	var m_OffSet = 0;		//偏移量
	var m_BubPosX = 0;		//子项的X坐标
	
	//[功能]初始化右键菜单
	//[参数]subdata:子项内容文字
	//		subfun:子项自定义函数 为空则调用默认函数[OnClick_Menu+index()]
	void Init(subdata,subfun)
	{
		m_Num = window.GetSplitCount(subdata,",");
		m_NumUI = toint(m_Num);
		var _funNum = window.GetSplitCount(subfun,",");

		var _arr = window.SplitStr2(subdata,",",m_Num);
		var _arrFun = window.SplitStr2(subfun,",",_funNum);

		var _index = 0;
		while (_index < m_Num)
		{
			new VMouseR_Sub
			{
				var m_Index = _index;		//正在索引
				var m_IndexUI = m_Index;	//显示位置
				var m_Fun = _arrFun[m_Index];	//自定义函数
			
				name = "VMouseR_Sub"+m_Index;
				pos(parent.m_BubPosX,this.height*m_IndexUI + parent.m_OffSet);
				SetData(""+_arr[m_Index]);	//设置显示文字
			
				void OnMouseDownL()
				{
					if (GetState() == 1)
					{
						if (m_Fun != -1 && m_Fun != 0)
							parent.vml(""+m_Fun+"(\""+GetData()+"\");");
						else
							parent.vml("OnClick_Menu"+m_Index+"(\""+GetData()+"\");");
					}
				}
				
				//调整位置
				void AdjustPos()
				{
					m_IndexUI -= 1;
					//printf("m_Index:"+m_Index+",m_IndexUI:"+m_IndexUI);
					pos(parent.m_BubPosX,this.height*m_IndexUI + parent.m_OffSet);
				}
			}
			_index += 1;
		}

		AdjustSize();
	}

	inclass("VMouseR_UI"); //与界面交互
	
	//[功能]调整大小
	void AdjustSize()
	{
		m_SizeY = m_NumUI * m_HeightSub + m_OffSet*2;
		size(m_SizeX,m_SizeY);

		//可以重设位置-调整高度
		InitOk();
	}

	//[功能]使之菜单无效
	//[参数]index：序号 从0开始
	//		state：0不能点 1能点
	void SetState(index,state)
	{
		if (index >= m_Num) return;
		find("VMouseR_Sub"+index).SetState(state);
	}
	
	//[功能]删除其中一个子项
	//[参数]index：序号 从0开始
	void DelBub(index)
	{
		if (index >= m_Num) return;
	
		find("VMouseR_Sub"+index).del();
		var _temp = index + 1;
		//printf("index:"+index+",m_Num:"+m_Num+",_temp:"+_temp);
		while (toint(_temp) < toint(m_Num))
		{
			find("VMouseR_Sub"+_temp).AdjustPos();
			_temp += 1;
		}
		m_NumUI -= 1;
		AdjustSize();
	}

	//[功能]改变其中一个子项的显示内容
	//[参数]index：序号 从0开始
	//		_str:显示的新文字
	void ReSetBubSrc(index,_str)
	{
		if (index >= m_Num) return;
	
		find("VMouseR_Sub"+index).SetData(_str);
	}
};

//===========================================================================
/*右键菜单-全部*/
//私聊			0
//邀请			1
//发送消息		2
//查看信息		3
//加为好友		4
//删除好友		5
//前往房间		6
//加入黑名单	7
//删除黑名单	8
//复制昵称		9

//装备			10
//取消装备		11
//丢弃			12
//观看			13
//删除			14
//放弃			15
//全部放弃		16
//使用			17
//绑定			18
//打开			19
//全部删除		20
class VMouseRAll VMouseR
{
	var _Src = "私聊,邀请,发送消息,查看信息,加为好友,删除好友,前往房间,加入黑名单,删除黑名单,复制昵称,装备,取消装备,丢弃,观看,删除,放弃,全部放弃,使用,绑定,打开";
	var _Fun = "";
	Init(_Src,_Fun);
};

/*人操作-全部*/
//私聊			0
//邀请			1
//发送消息		2
//查看信息		3
//加为好友		4
//删除好友		5
//前往房间		6
//加入黑名单	7
//删除黑名单	8
//复制昵称		9
class VMyMouseRPerson VMouseR
{
	var _Src = "私聊,邀请,发送消息,查看信息,加为好友,删除好友,前往房间,加入黑名单,删除黑名单,复制昵称,献花,邀请加入家族";
	var _Fun = "On_Private,On_Invite,On_SendMsg,On_LookInfo,On_AddFriend,On_DelFriend,On_GotoRoom,On_AddBlacklist,On_DelBlacklist,On_CopyName,On_PresentFlower,On_AskaddFamily";
	Init(_Src,_Fun);

	//编号
	var m_Index_Private			= 0;			//私聊
	var m_Index_Invite			= 1;			//邀请
	var m_Index_SendMsg			= 2;			//发送消息
	var m_Index_LookInfo		= 3;			//查看信息
	var m_Index_AddFriend		= 4;			//加为好友
	var m_Index_DelFriend		= 5;			//删除好友
	var m_Index_GotoRoom		= 6;			//前往房间
	var m_Index_AddBlacklist	= 7;			//加入黑名单
	var m_Index_DelBlacklist	= 8;			//删除黑名单
	var m_Index_CopyName		= 9;			//复制昵称
	var m_Index_PresentFlower	= 10;			//献花
	var m_Index_AskaddFamily	= 11;			//邀请加入家族
};

/*物品操作-全部*/
//装备			0
//取消装备		1
//丢弃			2
//观看			3
//删除			4
//使用			5
//绑定			6
//打开			7
//全部删除		8
class VMyMouseRGoods VMouseR
{
	var _Src = "装备,取消装备,观看,删除,使用,绑定,打开,丢弃,全部删除";
	var _Fun = "On_Equip,On_TakeOff,On_Play,On_Del,On_Use,On_Bind,On_Open,On_Doff,On_DelAll,On_CtinEquip";
	Init(_Src,_Fun);

	//编号
	var m_Index_Equip			= 0;			//装备
	var m_Index_TakeOff			= 1;			//取消装备
	var m_Index_Play			= 2;			//观看
	var m_Index_Del				= 3;			//删除
	var m_Index_Use				= 4;			//使用
	var m_Index_Bind			= 5;			//绑定
	var m_Index_Open			= 6;			//打开
	var m_Index_Doff			= 7;			//丢弃
	var m_Index_DelAll			= 8;			//全部删除
};

/*活动操作-全部*/
//放弃			0
//全部放弃		1
class VMyMouseRActivity VMouseR
{
	var _Src = "放弃,全部放弃";
	var _Fun = "On_GiveUp,On_GiveUpAll";
	Init(_Src,_Fun);

	//编号
	var m_Index_GiveUP			= 0;			//放弃
	var m_Index_GiveUpAll		= 1;			//全部放弃
};

/*邮件-全部*/
class VMyMouseRMail VMouseR
{
	var _Src = "回复,删除,全部删除";
	var _Fun = "On_WriteBack,On_Del,On_DelAll";
	Init(_Src,_Fun);

	//编号
	var m_Index_WriteBack		= 0;			//回复
	var m_Index_Del				= 1;			//删除
	var m_Index_DelAll			= 2;			//全部删除
};
//家族排行榜
class VMyMouseRFamilyTopStar VMouseR
{
	var _Src = "申请加入,查看家族信息";
	var _Fun = "On_Apply,On_Lookup";
	Init(_Src,_Fun);
	
	//编号
	var m_Index_Apply = 0;		//申请加入
	var m_Index_LookUp = 1;		//申请加入
}
//家族成员列表
class VMyMouseRFamilyPeopleList VMouseR
{
	var _Src = "私聊,查看信息,加为好友,前往房间,加入黑名单,复制昵称,献花,任命家族执行官,撤销家族执行官,转让族长权限,屏蔽成员发言,取消屏蔽成员发言,请离家族成员";
	var _Fun = "On_Private,On_LookInfo,On_AddFriend,On_GotoRoom,On_AddBlacklist,On_CopyName,On_PresentFlower,On_BeAssistant,On_RemoveAssistant,On_TransferPotence,On_ShieldTalk,On_CancleShield,On_LetOutFamily";
	Init(_Src,_Fun);

	var m_Index_Private = 0;		//私聊
//	var m_Index_SendMsg = 1;		//发送信息On_SendMsg
//	var m_Index_WriteBack = 2;		//发送邮件On_WriteBack,
	var m_Index_LookInfo = 1;		//查看信息
	var m_Index_AddFriend = 2;		//加为好友
	var m_Index_GotoRoom = 3;		//前往房间
	var m_Index_AddBlacklist = 4;		//加入黑名单
	var m_Index_CopyName = 5;		//复制昵称
	var m_Index_PresentFlower = 6;		//献花
	var m_Index_BeAssistant = 7;		//任命家族管理员
	var m_Index_RemoveAssistant = 8;	//撤销家族管理员
	var m_Index_TransferPotence = 9;	//转让自身权限
	var m_Index_ShieldTalk = 10;		//屏蔽成员发言
	var m_Index_CancleShield = 11;		//取消屏蔽成员发言
	var m_Index_LetOutFamily = 12;		//请离家族成员
}
//===========================================================================================
//社交-全部
class VMyMouseR_Social VMyMouseRPerson
{
	var _Src = "私聊,邀请,发送消息,查看信息,加为好友,删除好友,前往房间,加入黑名单,删除黑名单,复制昵称,献花,邀请加入家族,组成当前搭档,取消当前搭档,添加搭档,删除搭档";
	var _Fun = "On_Private,On_Invite,On_SendMsg,On_LookInfo,On_AddFriend,On_DelFriend,On_GotoRoom,On_AddBlacklist,On_DelBlacklist,On_CopyName,On_PresentFlower,On_AskaddFamily,On_MakePartner,On_CancelCurPartner,On_AddToPartnerList,On_DelPartner";
	var m_Index_MakePartner		= 12;			//组成搭档
	var m_Index_CancelCurPartner= 13;			//取消搭档
	var m_Index_AddToPartnerList= 14;			//添加搭档
	var m_Index_DelPartner		= 15;			//删除搭档

	DelBub(m_Index_Invite);
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_DelBlacklist);
	DelBub(m_Index_AddToPartnerList);

	// 跨服情况下(私聊为灰色)(判断在活动场就不能私聊) 单人撮合赛, 双人撮合赛, 竞技场, 活动场.都是 USER_UISTATE_GAME_ARENA
	if (window.GetMyRaceID() != -1 || window.GetUIGameState() == window.USER_UISTATE_GAME_ARENA)
		SetState(m_Index_Private, 0);
	else 
		SetState(m_Index_Private, 1);

	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

//////////////////////////////////////////////////////////////////////////////////////////

//社交-好友
class VMyMouseR_Friend VMyMouseRPerson
{
	DelBub(m_Index_Invite);
	DelBub(m_Index_AddFriend);
	DelBub(m_Index_DelBlacklist);
	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

///////////////////////////////////////////////////////////////////////////////////////

//社交-黑名单
class VMyMouseR_BlackList VMyMouseRPerson
{
	DelBub(m_Index_Private);
	DelBub(m_Index_Invite);
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_AddBlacklist);
	DelBub(m_Index_PresentFlower);
	DelBub(m_Index_GotoRoom);
	SetState(m_Index_GotoRoom,0);
	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

///////////////////////////////////////////////////////////////////////////////////////

//聊天
class VMyMouseR_Chat VMyMouseRPerson
{
	DelBub(m_Index_Invite);
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_GotoRoom);
	DelBub(m_Index_DelBlacklist);

	// 跨服情况下(私聊为灰色)(判断在活动场就不能私聊) 单人撮合赛, 双人撮合赛, 竞技场, 活动场.都是 USER_UISTATE_GAME_ARENA
	if (window.GetMyRaceID() != -1 || window.GetUIGameState() == window.USER_UISTATE_GAME_ARENA)
		SetState(m_Index_Private, 0);
	else 
		SetState(m_Index_Private, 1);

	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

///////////////////////////////////////////////////////////////////////////////////////

//好友消息 + 排行榜
class VMyMouseR_Msg_TS VMyMouseRPerson
{
	DelBub(m_Index_Private);
	DelBub(m_Index_Invite);
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_LookInfo);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_GotoRoom);
	DelBub(m_Index_DelBlacklist);
	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

//////////////////////////////////////////////////////////////////////////////////////////
//房间-玩家列表
class VMyMouseR_RoomUser VMyMouseR_Chat
{
};

/////////////////////////////////////////////////////////////////////////////////

//邀请-全部
class VMyMouseR_InviteAll VMyMouseRPerson
{
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_GotoRoom);
	DelBub(m_Index_DelBlacklist);
	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

///////////////////////////////////////////////////////////////////////////////////////

//邀请-好友
class VMyMouseR_InviteFriend VMyMouseRPerson
{
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_AddFriend);
	DelBub(m_Index_GotoRoom);
	DelBub(m_Index_DelBlacklist);
	if(window.GetFamilyPotence() != window.FAMILY_POTENCE_HEADER && window.GetFamilyPotence() != window.FAMILY_POTENCE_ASSISTANT)
	{
		DelBub(m_Index_AskaddFamily);
	}
};

///////////////////////////////////////////////////////////////////////////////////////
//服饰-装备、取消装备、丢弃
class VMyMouseR_DressDel VMyMouseRGoods
{
	DelBub(m_Index_Play);
	DelBub(m_Index_Del);
	DelBub(m_Index_Use);
	DelBub(m_Index_Bind);
	DelBub(m_Index_Open);
	DelBub(m_Index_DelAll);
};
///////////////////////////////////////////////////////////////////////////////////////
// 录像显示：观看、删除
class VMyMouseR_VideoDel VMyMouseRGoods
{
	DelBub(m_Index_Equip);
	DelBub(m_Index_TakeOff);
	DelBub(m_Index_Use);
	DelBub(m_Index_Bind);
	DelBub(m_Index_Open);
	DelBub(m_Index_Doff);
	DelBub(m_Index_DelAll);
};
///////////////////////////////////////////////////////////////////////////////////////
//放弃竞技等待
class VMyMouseR_RaceWait VMyMouseRActivity
{
};
///////////////////////////////////////////////////////////////////////////////////////
//道具显示：使用、丢弃
class VMyMouseR_Props VMyMouseRGoods
{
	DelBub(m_Index_Equip);
	DelBub(m_Index_TakeOff);
	DelBub(m_Index_Play);
	DelBub(m_Index_Del);
	DelBub(m_Index_Bind);
	DelBub(m_Index_Open);
	DelBub(m_Index_DelAll);
};

///////////////////////////////////////////////////////////////////////////////////////
//技能显示：绑定、丢弃
class VMyMouseR_Skill VMyMouseRGoods
{
	DelBub(m_Index_Equip);
	DelBub(m_Index_TakeOff);
	DelBub(m_Index_Play);
	DelBub(m_Index_Del);
	DelBub(m_Index_Use);
	DelBub(m_Index_Open);
	DelBub(m_Index_DelAll);
};

///////////////////////////////////////////////////////////////////////////////////////
//礼品显示：打开、丢弃
class VMyMouseR_GiftBox VMyMouseRGoods
{
	DelBub(m_Index_Equip);
	DelBub(m_Index_TakeOff);
	DelBub(m_Index_Play);
	DelBub(m_Index_Del);
	DelBub(m_Index_Use);
	DelBub(m_Index_Bind);
	DelBub(m_Index_DelAll);
};

///////////////////////////////////////////////////////////////////////////////////////
//购物车：删除，全部删除
class VMyMouseR_BuyCar VMyMouseRGoods
{
	DelBub(m_Index_Equip);
	DelBub(m_Index_TakeOff);
	DelBub(m_Index_Play);
	DelBub(m_Index_Use);
	DelBub(m_Index_Bind);
	DelBub(m_Index_Open);
	DelBub(m_Index_Doff);
};
////////////////////////////////////////////////////////////////////////
//家族排行榜：申请加入
class VMyMouseR_FamilyTopStar VMyMouseRFamilyTopStar
{
}
//家族成员列表:族长权限
class VMyMouseR_FamilyPeopleList_Header VMyMouseRFamilyPeopleList
{
}
class VMyMouseR_FamilyPeopleList_Assistant VMyMouseRFamilyPeopleList
{
	DelBub(m_Index_BeAssistant);
	DelBub(m_Index_RemoveAssistant);
}
//家族申请信息
class VMyMouseR_FamilyApplyList VMyMouseRPerson
{
	DelBub(m_Index_Private);
	DelBub(m_Index_Invite);
	DelBub(m_Index_SendMsg);
	DelBub(m_Index_AddFriend);
	DelBub(m_Index_DelFriend);
	DelBub(m_Index_GotoRoom);
	DelBub(m_Index_AddBlacklist);
	DelBub(m_Index_DelBlacklist);
	DelBub(m_Index_CopyName);
	DelBub(m_Index_PresentFlower);
	DelBub(m_Index_AskaddFamily);
}