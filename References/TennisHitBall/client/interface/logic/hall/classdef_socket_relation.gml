//
//关系系统的网络反馈
//2010年9月28日 yxf

//[功能]邀请变成某种关系返回
//[参数]iType:邀请类型,1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣 5:使用金币的取消情侣
//		iInviteid:被邀请的用户id
//		iReturnID:返回值
//		szNick:被邀请的用户昵称,由对方返回的消息时有
void __RelationInvite(iType,iReturnID,szNick)
{
//	alert("__RelationInvite iType="+iType+",iInviteid="+iInviteid+",iReturnID="+iReturnID+",szNick="+szNick);
	var _str = "";
	switch (iType)
	{
//		case 1:_str = "成为搭档";break;
//		case 2:_str = "成为当前搭档";break;
//		case 3:_str = "成为密友";break;
		case 4:_str = "订婚成功";break;
		case 5:_str = "分手";break;
	}
	
	if (iReturnID == -1001)//无法找到用户
	{
		window.find("UIController").LoadDLG(785);//对方与你不在同一服务器！
		return;
	}
//	if (iReturnId == -1002)
//	{
//		//window.find("UIController").LoadDLG(506);//
//		return;
//	}
	if (iReturnId == -1003)
	{
		window.find("UIController").LoadDLG(507);//没有找到用户
		return;
	}
	if (iReturnID == 2020)//不同意
	{
		window.find("UIController").LoadDLG(745);//[%0]不同意%1！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+szNick+","+_str);
		if(iType >2)
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		return;
	}
	if (iReturnID == 2021)//成功
	{
		window.SocketCall_BeRelationSuccess(iType,iReturnID,szNick);

		window.find("UIController").LoadDLG(746);//与[%0]%1成功！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+szNick+","+_str);
		if(iType >2)
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		return;
	}
	if (iReturnID == 2025)//被邀请成功
	{
		window.SocketCall_BeRelationSuccess(iType,iReturnID,szNick);

		window.find("UIController").LoadDLG(746);//与[%0]%1成功！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+szNick+","+_str);
		if(iType >2)
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		return;
	}
	if (iReturnID == 2026)//邀请发送成功
	{
		window.find("UIController").LoadDLG(787);//邀请发送成功！
		return;
	}
	if (iReturnID == -2020)//数据库错误
	{
		window.find("UIController").LoadDLG(3);//数据库错误！
		return;
	}
	if (iReturnID == 2028)//被添加成功
	{
		window.SocketCall_BeRelationSuccess(iType,iReturnID,szNick);

		window.find("UIController").LoadDLG(746);//与[%0]%1成功！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+szNick+","+_str);
//		if(iType >2)
//			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		return;
	}
	if (iReturnID == -2000)//搭档已满
	{
		window.find("UIController").LoadDLG(747);//搭档已满！
		return;
	}
	if (iReturnID == -2001)//已经是搭档
	{
		window.find("UIController").LoadDLG(748);//已经是你的搭档！
		return;
	}
	if (iReturnID == -2003)//当前搭档已满
	{
		window.find("UIController").LoadDLG(804);//当前搭档已满
		return;
	}
	if (iReturnID == -2021)//等级不够
	{
		window.find("UIController").LoadDLG(749);//等级不够！
		return;
	}
	if (iReturnID == -2022)//被邀请方等级不够
	{
		window.find("UIController").LoadDLG(750);//[%0]等级不够！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -2023)//被邀请方搭档已满
	{
		window.find("UIController").LoadDLG(751);//[%0]搭档已满！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -2024)//被邀请方在忙
	{
		window.find("UIController").LoadDLG(744);//[%0]正在忙！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -2002)//不是搭档,无法操作
	{
		window.find("UIController").LoadDLG(756);//不是搭档,无法操作！
		return;
	}
	if (iReturnID == -2030)//已经是当前搭档
	{
		window.find("UIController").LoadDLG(753);//已经是你的当前搭档！
		return;
	}
	if (iReturnID == -2031)//不是当前搭档,无法取消
	{
		window.find("UIController").LoadDLG(754);//[%0]不是当前搭档,无法取消！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -2032)//被邀请方在忙
	{
		window.find("UIController").LoadDLG(744);//[%0]正在忙！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -2033)//被邀请方当前搭档已满
	{
		window.find("UIController").LoadDLG(803);//被邀请方当前搭档已满
		return;
	}
	if (iReturnID == -2029)///
	{
		window.find("UIController").LoadDLG(765);//[%0]已经是你的情侣！
		return;
	}
	if (iReturnID == 2029)///<对方客户端没有反馈
	{
		window.find("UIController").LoadDLG(820);//对方客户端没有反馈
		return;
	}
	if (iReturnID == -3001)//已经是情侣
	{
		window.find("UIController").LoadDLG(765);//[%0]已经是你的情侣！
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -3002)//不是情侣,无法操作
	{
		window.find("UIController").LoadDLG(766);//不是情侣,无法操作
		return;
	}
//	if (iReturnID == -3003)//不是密友,无法操作
//	{
//		window.find("UIController").LoadDLG(767);//不是密友,无法操作
//		return;
//	}
	if (iReturnID == -3004)//好感度不足
	{
		window.find("UIController").LoadDLG(768);//[%0]好感度不足
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
	if (iReturnID == -3025)//性别不符
	{
		window.find("UIController").LoadDLG(498);//性别不符
		return;
	}
	if (iReturnID == -3006)//物品不对
	{
		window.find("UIController").LoadDLG(770);//物品不对
		return;
	}
	if (iReturnID == -3007)//错误的物品
	{
		window.find("UIController").LoadDLG(771);//错误的物品
		return;
	}
	if (iReturnID == -3020)//已经有情侣了
	{
		window.find("UIController").LoadDLG(780);//已经有情侣了
		return;
	}
	if (iReturnID == -3021)//被邀请方已经有情侣
	{
		window.find("UIController").LoadDLG(772);//被邀请方已经有情侣
		return;
	}
//	if (iReturnID == -3022)//好感度不足
//	{
//		window.find("UIController").LoadDLG(773);//好感度不足
//		return;
//	}
	if (iReturnID == -3023)//对方已经有情侣
	{
		window.find("UIController").LoadDLG(779);//对方已经有情侣
		return;
	}
	if (iReturnID == -3024)//被邀请方在忙
	{
		window.find("UIController").LoadDLG(833);//被邀请方在忙
		return;
	}
	if (iReturnID == -3026)//邀请信息已经发送,请稍候
	{
		window.find("UIController").LoadDLG(826);//邀请信息已经发送,请稍候
		return;
	}
	if (iReturnID == -3027)//发出的邀请已经失效
	{
		window.find("UIController").LoadDLG(834);//发出的邀请已经失效
		return;
	}
//	if (iReturnID == -4001)//已经是密友 
//	{
//		window.find("UIController").LoadDLG(774);//已经是密友 
//		return;
//	}
//	if (iReturnID == -4002)//不是密友，无法操作
//	{
//		window.find("UIController").LoadDLG(775);//不是密友，无法操作
//		return;
//	}
//	if (iReturnID == -4021)//被邀请方密友满
//	{
//		window.find("UIController").LoadDLG(776);//被邀请方密友满
//		return;
//	}
//	if (iReturnID == -4022)//被邀请方忙
//	{
//		window.find("UIController").LoadDLG(777);//被邀请方忙
//		return;
//	}
//	if (iReturnID == -4020)//邀请方密友满
//	{
//		window.find("UIController").LoadDLG(778);//被邀请方密友满
//		return;
//	}
}

//[功能]收到成为某种关系的邀请
//[参数]invitetype:邀请类型,1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣 5:使用金币的取消情侣
//		askid:邀请的用户id
//		nk:邀请者的昵称
//		exdata:额外数据 情侣时是物品id
//		randomid:一个验证数据,在用户点接收或者不接收后返回给服务器用
void __ReceiveRelationInvite(invitetype,nk,exdata,randomid)
{
//	alert("__ReceiveRelationInvite askid="+askid+",nk="+nk+",exdata="+exdata);
	if (invitetype == 1)//1:邀请成为搭档
	{
		window.BeAddPartnerList(askid,nk,exdata);
		return;
	}
	if (invitetype == 2)//2:邀请成为当前搭档
	{
		window.BeAddCurPartner(askid,nk,exdata);
		return;
	}
	if (invitetype == 3)//3:邀请成为密友
	{
		window.OnCall_ToBeBuddy(nk,askid,exdata);
		return;
	}
	if (invitetype == 4)//4:邀请成为情侣
	{
		window.OnCall_ToBeLover(nk,exdata,randomid);
		return;
	}
	if (invitetype == 5)//5:使用金币的取消情侣
	{
		window.OnCall_PartLover(nk,askid,exdata);
		return;
	}
}

//[功能]取消某种关系的返回
//[参数]iType:类型,1:搭档 2:密友 3:情侣
//		iInviteid:邀请的用户id
//		iReturnID:返回值
//		szNick:邀请者的昵称
void __CancelRelation(iType,iReturnID,iReturnUID)
{
	var _param = "";
	switch (iType)
	{
//		case 1:_param = "搭档";break;
//		case 2:_param = "密友";break;
		case 3:_param = "情侣";break;
	}

	if (iReturnID == 2022)//成功
	{
		if (iType == 3) 
		{
//			window.SocketCall_BeRelationSuccess_Lover(3);
			window.SocketCall_BeRelationSuccess_Lover(window.RELATION_UNMARRY,3,iReturnUID);
		}
		window.find("VSelfInfo_Sociality_Logic").s_Btn_RelieveEngagement.SetState(window.BTN_STATE_GREY);//解除情侣按钮为灰色
		
		if (iType == 1) 
		{
			window.g_OnConfirm_QuitWait(window.GetMyRaceID());
			window.OnDismissTeamRaceSuccess(window.GetMyRaceID());
		}

		window.find("UIController").LoadDLG(742);//与[%0]解除%1成功！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+window.GetCurrLoverNkName()+","+_param);

		if(iType >2)
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		
		window.WriteChat7(3023,_param);

		return;
	}
	if (iReturnID == 2024)//被清理关系成功
	{
		if(iType >2)
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		if (iType == 3)
		{
			window.SocketCall_BeRelationSuccess_Lover(window.RELATION_UNMARRY,3,iReturnUID);
			window.find("UIController").LoadDLG(720);//你已与[%0]分手
			window.find("VMyMessageBox_1_Logic").ReplaceData(""+window.GetCurrLoverNkName());
			window.find("VSelfInfo_Sociality_Logic").s_Btn_RelieveEngagement.SetState(window.BTN_STATE_GREY);//解除情侣按钮为灰色
			return;
		}
		window.find("UIController").LoadDLG(791);//[%0]已经将你从%1列表中删除！
		window.find("VMyMessageBox_1_Logic").ReplaceData(""+window.GetCurrLoverNkName()+","+_param);
		
		return;
	}

//	if (iReturnID == -2002)//不是搭档,无法操作
//	{
//		window.find("UIController").LoadDLG(743);//不是搭档,无法解除！
//		return;
//	}
	if (iReturnID == -3002)//不是情侣,无法操作
	{
		window.find("UIController").LoadDLG(766);//[%0]不是情侣,无法操作
		window.find("VMyMessageBox_1_Logic").ReplaceData(szNick);
		return;
	}
//	if (iReturnID == -3007)//错误的物品
//	{
//		window.find("UIController").LoadDLG(771);//错误的物品
//		return;
//	}
//	if (iReturnID == -4002)//不是密友，无法操作
//	{
//		window.find("UIController").LoadDLG(775);//不是密友，无法操作
//		return;
//	}
}

//[功能]取消当前搭档为搭档的返回
//[参数]iInviteid:邀请的用户id
//		iReturnID:返回值
//void __CancelCurrentPartner(iInviteid,iReturnID)
//{
//	if (iReturnID == 2030)//取消当前搭档成功
//	{
//		window.SocketCall_BeRelationSuccess_Partner(2,"");
//		window.g_OnConfirm_QuitWait(window.GetMyRaceID());
//		window.OnDismissTeamRaceSuccess(window.GetMyRaceID());
//
//		window.find("UIController").LoadDLG(755);//取消当前搭档成功！
//		return;
//	}
//	if (iReturnID == -2002)//不是搭档,无法操作
//	{
//		window.find("UIController").LoadDLG(756);//不是搭档,无法操作！
//		return;
//	}
//	if (iReturnID == -2031)//不是当前搭档,无法取消
//	{
//		window.find("UIController").LoadDLG(757);//不是当前搭档,无法取消！
//		return;
//	}
//}

//[功能]转换搭档的队长的返回
//[参数]iTransid:被转换的用户id
//		iReturnID:返回值
//void __TransLeader(iTransid,iReturnID)
//{
//	if (iReturnID == 2040)//转换成功
//	{
//		window.find("UIController").LoadDLG(758);//转换搭档的队长成功！
//		return;
//	}
//	if (iReturnID == -2002)//不是搭档,无法操作
//	{
//		window.find("UIController").LoadDLG(756);//不是搭档,无法操作！
//		return;
//	}
//	if (iReturnID == -2031)//不是当前搭档,无法取消
//	{
//		window.find("UIController").LoadDLG(757);//不是当前搭档,无法取消！
//		return;
//	}
//	if (iReturnID == -2040)//被转换人是队长
//	{
//		window.find("UIController").LoadDLG(759);//被转换人是队长！
//		return;
//	}
//}

////搭档列表中能打开的条数
//void __CanPartnerNum(iReturnID)
//{
//	window.g_CanOpenPartnerNum=iReturnID;
//	window.find("FRIEND_LOGIC")._VRelation_Logic.s_Class_Partner.SetLeavingNum(window.g_CanOpenPartnerNum);
//}

//[功能]上线提示
//[ 参数]iType:类型 0:数据同步完成 3:情侣
//		szNkName:昵称
//		iValue: 1:上线 0:下线
void __OnLineRemind(iType,szNkName,iValue)
{
	var _str = "";
	switch (iType)
	{
		case 0:
			window.SocketCall_BeRelationSuccess(6,0,0,"");
			return;
//		case 1: _str = "搭档";break;
//		case 2: _str = "密友";break;
		case 3: _str = "情侣";break;
	}
	var _v="";
	switch (iValue)
	{
	case 1:_v="上线";break;
	case 0:_v="下线";break;
	}
	var _param = ""+_str+"[,"+szNkName+"]"+","+_v;
	window.WriteChat7(34012,_param);
}

////使用物品提升情侣的等级
//void __UpgradeLoverLev(iCid,iReturnID)
//{
//	if (iReturnID == 2050)//提示成功
//	{
//		window.SocketCall_UpLvLoverSuccess();
//		window.find("UIController").LoadDLG(789);//情侣升级成功！//此提示取消
//		return;
//	}
//	if (iReturnID == -3002)//不是情侣,无法操作
//	{
//		window.find("UIController").LoadDLG(766);//不是情侣,无法操作
//		return;
//	}
//	if (iReturnID == -3030)//没有到升级的点数
//	{
//		window.find("UIController").LoadDLG(782);//没有到升级的点数
//		return;
//	}
//	if (iReturnID == -3031)//使用错误的物品
//	{
//		window.find("UIController").LoadDLG(783);//没有到升级的点数
//		return;
//	}
//	if (iReturnID == -3032)//情侣数据错误
//	{
//		window.find("UIController").LoadDLG(784);//情侣数据错误
//		return;
//	}
//}

////增加搭档上限
//void __AddPartnerMaxNum(iNum,iReturnID)
//{
//	window.g_CanOpenPartnerNum=toint(iNum);
//	window.find("FRIEND_LOGIC")._VRelation_Logic.s_Class_Partner.SetLeavingNum(window.g_CanOpenPartnerNum);
//	if (iReturnID == -2020)//数据错误
//	{
//		printf("增加搭档上限时数据错误")//数据错误
//		return;
//	}
//	if (iReturnID == -2060)//搭档列表满了
//	{
//		window.find("UIController").LoadDLG(786);//搭档列表满了
//		return;
//	}
//	if (iReturnID == -2061)//错误的物品
//	{
//		printf("增加搭档上限时使用物品错误")//错误的物品
//		return;
//	}
//}

//[功能]增加好感度,爱情指数,默契度的反馈函数
//[参数]iType:类型 1:搭档 2:密友 3:情侣
//		iExData:额外数据 例如物品  ,非使用物品情况下为0
//		iReturnID:返回值
void __ReturnForRelationPoint(iType,iExData,iReturnID,nk)
{
	var _str = "";
	switch (iType)
	{
//		case 1: _str = "增加默契度";break;
//		case 2: _str = "增加好感度";break;
		case 3: _str = "提升了亲密度";break;
	}
	if (iReturnID == 2023)
	{
		window.SocketCall_AddRelationPointSuccess(iType);
		if (window.POS_GAMEOVER == window.g_probablyPos)
		{
			window.find("UIController").LoadDLG(788);//%0成功！
			window.find("VMyMessageBox_1_Logic").ReplaceData(_str);
		}
		return;
	}
	if (iReturnID==2027)
	{
		window.SocketCall_AddRelationPointSuccess(iType);
		var _str1 = "";
		switch (iType)
		{
			case 1: return;//_str1 = "默契度";break;
//			case 2: _str1 = "好感度";break;
			case 3: _str1 = "爱情指数";break;
		}
		//window.find("UIController").LoadDLG(801);//%0增加了与你的%1值！
		//window.find("VMyMessageBox_1_Logic").ReplaceData(""+nk+","+_str1);
		var selflover = window.GetCurrLoverNkName();
		window.WriteChat7(3034,""+selflover+","+_str1);		
		return;
	}
//	if (iReturnID == -4002)//不是密友，无法操作
//	{
//		window.find("UIController").LoadDLG(775);//不是密友，无法操作
//		return;
//	}
	if (iReturnID == -3002)//不是情侣,无法操作
	{
		window.find("UIController").LoadDLG(766);//不是情侣,无法操作
		return;
	}
}

//[功能]查询情侣返回值
//[参数]iuserid
void __GetLoverInfo(iuserid)
{
//	printf("www 被查询的用户ID iuserid="+iuserid);
	window.g_LoverSearchResult = iuserid; 
	window.SocketCall_BeRelationSuccess_Lover(iuserid);
}