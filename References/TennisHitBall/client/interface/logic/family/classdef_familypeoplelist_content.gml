//家族玩家列表
//夏洋洋 2010-3-8

importex("$./../../UI/Family/ClassDef_FamilyPeopleList_Content.gml");

//一行内容	排序+名字+等级+性别+技术类型+贡献度
class VFamilyPeopleList_Content_Logic item
{
	var m_UserID = 0;	//用户id
	var m_SortIndex = 0;	//贡献度排序
	//==================================
	void Init()
	{
		//排序
		staticvar m__FamilySort = new BaseText
		{}
		//职务符号
		staticvar m_FamilyPotence = new img
		{}
		//屏蔽发言
		staticvar m_CanChatState = new img
		{}
		//名字
		staticvar m_Name = new BaseText
		{}
		//等级
		staticvar m_Lev = new BaseText
		{}
		//性别
		staticvar m_Sex = new img
		{}
		//技术类型
		staticvar m_SkillType = new BaseText
		{}
		//贡献度
		staticvar m_Point = new BaseText
		{}
	}
	inclass("VFamilyPeopleList_Content_UI");
	Init();
	//===========================================
	void OnSelect(){OnMySelect();parent.parent.SaveSelectUserID(m_UserID);};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		m_UserID = toint(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_USERNAME));
		if(parent.parent.m_SelectName == window.GAMEUI_JIVECONSORTIA_POINT_STR)
		{
			m_SortIndex = toint(iRow)+1;
		}
		else
		{
			m_SortIndex = "";
		}
		m__FamilySort.SetData(m_SortIndex);
		if(m_UserID == window.GetMyUID() && m_SortIndex != "")
		{
			parent.parent.m_SortIndex = m_SortIndex;
			parent.parent.SetMyOfferStarInfo(parent.parent.m_SortIndex);
		}
		m_FamilyPotence.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_POTENCE));
		m_CanChatState.SetCanChatState(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_CHAT));
		m_Name.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_USERNICK));
		var _onlineState = toint(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_ONLINE));
		if(_onlineState == 0)
		{
			isOnline(false);
		}
		else
		{
			isOnline(true);
		}
		var _lev = window.GetLVByUIDInFamily(m_UserID);
		if(_lev != window.DB_ERR)
		{
			m_Lev.SetData(_lev);
		}
		else
		{
			m_Lev.SetData("- -");
		}
		var _sex = toint(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_SEX));
		m_Sex.SetData(_sex);

		var _skillType = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_TROLETYPE);
		m_SkillType.SetData(window.GetTechnicByType(_skillType));
		parent.parent.SetOnlinePeopleNum();
		var _point = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIA_POINT);
		m_Point.SetData(_point);
		if(m_UserID == window.GetMyUID())
		{
			parent.parent.SeMytOfferInfo(_point);
		}
	}
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_FamilyPeopleList_Header
			{
				var _list = window.find("VFamilyPeopleList_Content_All_Logic_NAME");
				var _RoleRow = _list.curselectrow();
				var _UserPotence = toint(_list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIA_POTENCE)); 
				var _UserCanChat = _list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIA_CHAT);
				var _UserName = _list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIA_USERNICK);
				var _UserID = toint(_list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIA_USERNAME));
				var _onlineState = toint(_list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIA_ONLINE));
				if(_onlineState == 0)
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_LookInfo,0);
				}
				if(_UserID == window.GetMyUID())
				{
					DelBub(m_Index_Private);
//					DelBub(m_Index_SendMsg);
//					DelBub(m_Index_WriteBack);
					DelBub(m_Index_AddFriend);
					DelBub(m_Index_GotoRoom);
					DelBub(m_Index_AddBlacklist);
					DelBub(m_Index_PresentFlower);
					DelBub(m_Index_BeAssistant);
					DelBub(m_Index_RemoveAssistant);
					DelBub(m_Index_LetOutFamily);
					DelBub(m_Index_TransferPotence);
					DelBub(m_Index_ShieldTalk);
					DelBub(m_Index_CancleShield);
				}
				else
				{
					//族长权限
					if(window.GetFamilyPotence() == window.FAMILY_POTENCE_HEADER)
					{
						if(_UserPotence != window.FAMILY_POTENCE_NORMAL)
						{
							DelBub(m_Index_BeAssistant);
						}
						else
						{
							DelBub(m_Index_RemoveAssistant);
						}
						if(_UserCanChat)
						{
							DelBub(m_Index_CancleShield);
						}
						else
						{
							DelBub(m_Index_ShieldTalk);
						}
					}
					//管理员权限
					if(window.GetFamilyPotence() == window.FAMILY_POTENCE_ASSISTANT)
					{
						DelBub(m_Index_BeAssistant);
						DelBub(m_Index_RemoveAssistant);
						DelBub(m_Index_TransferPotence);
						if(_UserPotence == window.FAMILY_POTENCE_HEADER || _UserPotence == window.FAMILY_POTENCE_ASSISTANT)
						{
							DelBub(m_Index_LetOutFamily);
							DelBub(m_Index_ShieldTalk);
							DelBub(m_Index_CancleShield);
						}
						else
						{
							if(_UserCanChat)
							{
								DelBub(m_Index_CancleShield);
							}
							else
							{
								DelBub(m_Index_ShieldTalk);
							}
						}
						
					}
					if(window.GetFamilyPotence() == window.FAMILY_POTENCE_NORMAL)
					{
						DelBub(m_Index_BeAssistant);
						DelBub(m_Index_RemoveAssistant);
						DelBub(m_Index_LetOutFamily);
						DelBub(m_Index_TransferPotence);
						DelBub(m_Index_ShieldTalk);
						DelBub(m_Index_CancleShield);
					}
//					if(!window.GetIsFriendState(_UserName))
//					{
//						DelBub(m_Index_SendMsg);
//						DelBub(m_Index_WriteBack);
//					}
					if(window.GetStateByUID(_UserID) != 2)
					{
						DelBub(m_Index_GotoRoom);
					}
				}
				var _relation = window.find("friendsys").CheckRelation(_UserName);//alert(_relation);
				if (toint(_relation) == window.FRIEND_BLACKLIST)      //如果是在黑名单里的玩家献花为灰色，zyy
				{
				         SetState(m_Index_Private,0);
					     SetState(m_Index_AddBlacklist,0);
					     SetState(m_Index_PresentFlower,0);
				 }
				

				//私聊
				void On_Private()
				{
					window.OnClick_PrivateChat(_UserName);
				}
//				//发送信息
//				void On_SendMsg()
//				{
//					var __name = _UserName;
//					var __jid = _UserID;
//					window.find("UIController").LoadUI("UI_SENDMSG");
//					var _SQL = "SELECT * FROM MsgChatReceive WHERE senderName="+__name+" AND reciveUID="+window.GetMyUID()+" ORDER BY id ASC";
//					window.find("SENDMSG_LOGIC")._SendMsg_Logic.UpAcceptName(__name,_SQL,__jid);
//				}
//				//发送邮件 
//				void On_WriteBack()
//				{
//					window.find("UIController").LoadUI("UI_WRITEMAIL");
//					window.find("WRITEMAIL_LOGIC")._VWriteMail_Logic.SetNameOnly(_UserName);
//				}
				//查看信息        
				void On_LookInfo()
				{
					var _RoleID = window.GetRIDByUID(_UserID);
					//设置要查看的个人信息数据-打开个人信息界面前必须调用
					//参数：UID,昵称，RoleID
					window.SetSelfInfoData(_UserID,_UserName,_RoleID);
				}
				//加为好友        
				void On_AddFriend()
				{
					window.AddFriend(_UserName);
				}
				//前往房间        
				void On_GotoRoom()
				{
					window.Too_GetUserDid(""+_UserName);
				}
				//加入黑名单      
				void On_AddBlacklist()
				{
					window.AddBlacklist(_UserName);
				}
				//复制昵称        
				void On_CopyName()
				{
					window.setClipBoardData(_UserName);
				}
				//献花            
				void On_PresentFlower()
				{
					window.GamePresentFlower(_UserName);
				}
				//任命家族管理员  
				void On_BeAssistant()
				{
					window.FamilyBeAssistantFlag = window.FAMILY_UPTOASSISTANT;
					window.FamilyBeAssistantName = _UserName;
					window.find("UIController").LoadDLG(667);
					window.find("DLGLAYER").find("VMB_FamilyAssisant_Logic").ReplaceData("任命");
				}
				//撤销家族管理员  
				void On_RemoveAssistant()
				{
					window.FamilyBeAssistantFlag = window.FAMILY_TOBENORMALPEOPLE;
					window.FamilyBeAssistantName = _UserName;
					window.find("UIController").LoadDLG(667);
					window.find("DLGLAYER").find("VMB_FamilyAssisant_Logic").ReplaceData("撤销");
				}
				//请离家族成员    
				void On_LetOutFamily()
				{
					window.FamilyKickUID = _UserID;
					window.find("UIController").LoadDLG(668);
				}
				//转让自身权限    
				void On_TransferPotence()
				{
					window.FamilyTransferName = _UserName;
					window.find("UIController").LoadDLG(669);
				}
				//屏蔽成员发言    
				void On_ShieldTalk()
				{
					window.F_Family_ShieldTalk(_UserID,window.FAMILY_SHIELDTALK);
				}
				//取消屏蔽成员发言
				void On_CancleShield()
				{
					window.F_Family_ShieldTalk(_UserID,window.FAMILY_CANCLESHIELD);
				}
			}
		}
	}
}
//总的类
class VFamilyPeopleList_Content_All_Logic VN2ListCtrl
{
	//需要显示时改变
	valign(15,0);halign(15,0);size="600,200";
	selecttype="1";colfilter="0";//simpleshowmode="1,3";
	alpha = 70;bgcolor = "#FF0000";
	scroll = window.SCROLL_NOTENNIS;

	inclass("VFamilyPeopleList_Content_All_UI");//bgcolor="#ff";
	columclass="0,VFamilyPeopleList_Content_Logic"; //识别id
}