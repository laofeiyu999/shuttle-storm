//家族大厅界面
//夏洋洋 2010-3-3

importex("$./ClassDef_FamilyPeople_Tip.gml");

class VFamilyHall_UI item
{
	size = "91%,56%";//bgcolor= "#ff";
	pos = "30,97";
	void Init()
	{
		//家族名称及家族签名
		staticvar s_Text_FamilyInfo = new BKText
		{
			size = "100%,20";
		}
		//家族公告
		staticvar s_FamilyAffiche = new VListBG2_UI
		{
			size = "30%,150";
			left = parent.s_Text_FamilyInfo.left;
			top = parent.s_Text_FamilyInfo.top + parent.s_Text_FamilyInfo.height + 3;
			
			//家族徽章
			var m_FamilyBadge = new item
			{
				size = "50,50";//bgcolor = "#ff";
				halign(100,0);

				//徽章显示框
				var s_Badge_Frame = new img
				{
					size = "100%,100%";
					src = "$./pop/imgs"+window.g_Sex+"/k01.tga";
				}
				var m_BadgeOut = new img
				{
					valign(50,0);halign(50,0);
				}
				var m_BadgeIn = new img
				{
					valign(50,0);halign(50,0);
				}
				//[功能]显示徽章图
				//[参数]data1：外框图；data2：中心图
				//[返回值]无
				void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
				{
					m_BadgeOut.src = "$./imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
					m_BadgeIn.src = "$./imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
				}
			}
			//家族公告提示 字
			var m_AfficheTip = new BaseText
			{
				size = "50%,20";
				left = parent.left + 55;
				top = parent.m_FamilyBadge.top + parent.m_FamilyBadge.height - 20;
				SetData("家族公告");
			}
			//家族公告内容
			var m_FamilyAffiche = new BaseText
			{
				size = "70%,150";
				top = parent.m_AfficheTip.top + parent.m_AfficheTip.height + 3;
				left = parent.m_AfficheTip.left - 30;
				autoenter = true;
				maxsize = 120;
			}
			
			//[功能]设置徽章图
			//[参数]data1：外框图；data2：中心图
			//[返回值]无
			void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
			{
				m_FamilyBadge.SetFamilyBadge(data1,data2,data3,data4,data5,data6);
			}
			//[功能]设置家族公告内容
			//[参数]data：家族公告内容
			//[返回值]无
			void SetFamilyAffiche(data)
			{
				m_FamilyAffiche.SetData(data);
			}
		}
		//我的信息
		staticvar s_MyInfo = new VListBG2_UI
		{
			width = parent.s_FamilyAffiche.width;
			height = 90;
			left = parent.s_FamilyAffiche.left;
			top = parent.s_FamilyAffiche.top + parent.s_FamilyAffiche.height + 3;
			//我的信息提示 字
			var m_MyInfoTip = new BaseText
			{
				SetData("我的信息");
				left = parent.left + 55;
				top = 10;
			}
			//职位提示 字
			var m_MyPos = new BaseText
			{
				top = parent.m_MyInfoTip.top + parent.m_MyInfoTip.height + 10;
				left = parent.m_MyInfoTip.left - 30;
				SetData("职位：");
			}
			//职位信息
			var m_MyPosInfo = new BaseText
			{
				top = parent.m_MyPos.top;
				left = parent.m_MyPos.left + parent.m_MyPos.width + 3;
			}
			//贡献度提示 字
			var m_MyOffer = new BaseText
			{
				top = parent.m_MyPos.top + parent.m_MyPos.height + 3;
				left = parent.m_MyInfoTip.left - 30;
				SetData("贡献度：");
			}
			//贡献度
			var m_MyOfferInfo = new BaseText
			{
				top = parent.m_MyOffer.top;
				left = parent.m_MyOffer.left + parent.m_MyOffer.width + 3;
			}
			//贡献度排行提示 字
			var m_MyOfferStar = new BaseText
			{
				top = parent.m_MyOffer.top + parent.m_MyOffer.height + 3;
				left = parent.m_MyInfoTip.left - 30;
				SetData("贡献度排行：");
			}
			//贡献度排行
			var m_MyOfferStarInfo = new BaseText
			{
				top = parent.m_MyOfferStar.top;
				left = parent.m_MyOfferStar.left + parent.m_MyOfferStar.width + 3;
			}

			//[功能]设置我的信息
			//[参数]data1：职位信息；data2：贡献度；data3：贡献度排行
			//[返回值]无
			void SetMyInfo(data1,data2,data3)
			{
				m_MyPosInfo.SetData(data1);
				SeMytOfferInfo(data2);
				SetMyOfferStarInfo(data3);
			}
			//设置贡献度排行
			void SetMyOfferStarInfo(data)
			{
				m_MyOfferStarInfo.SetData(data);
			}
			//设置贡献点
			void SeMytOfferInfo(data)
			{
				m_MyOfferInfo.SetData(data);
			}
		}
		//家族成员列表
		staticvar s_Family_PeopleList = new VFamily_PeopleList
		{
			size = "70%,255";//bgcolor = "#ff";
			left = parent.s_FamilyAffiche.left + parent.s_FamilyAffiche.width + 3;
			top = parent.s_FamilyAffiche.top;
		}
		
		//邀请加入
		staticvar s_apply = new VBTN_A_New
		{
			InitText("邀请加入");
			valign(98,0);halign(70,0);show=false;
		}
		//在线人数
		staticvar s_Text_OnlineNum = new item//BaseText
		{
			//valign(98,0);halign(50,0);
			size = "150,20";//bgcolor = "#ff";
			left = parent.s_apply.left + parent.s_apply.width + 30;
			top = parent.s_apply.top +3;
			
			var _tip = new BaseText
			{
				src = "当前在线:";
				valign(50,0);
			}
			var _onlineNum = new BaseText
			{
				valign(50,0);color = "#1B921B";
				//left = parent._tip.left + parent._tip.width + 3;
			}
			var _bias = new BaseText
			{
				valign(50,0);
				src = "/";
				//left = parent._onlineNum.left + parent._onlineNum.width + 3;
			}
			var _allNum = new BaseText
			{
				valign(50,0);
				//left = parent._bias.left + parent._bias.width + 3;
			}

			void SetData(data1,data2)
			{
				_onlineNum.src = ""+data1;
				_allNum.src = ""+data2;
				ReSetPos();
			}

			void ReSetPos()
			{
				_onlineNum.left = _tip.left + _tip.width + 3;
				_bias.left = _onlineNum.left + _onlineNum.width + 3;
				_allNum.left = _bias.left + _bias.width + 3;
			}
		}
		//排列方式
		staticvar s_topStar = new VMyDropMenu_UI
		{
		}
	}

	//[功能]显示家族名称及家族签名
	//[参数]data1：家族名称；data2：家族签名
	//[返回值]无
	void SetFamilyInfo(data1,data2)
	{
		s_Text_FamilyInfo.src = ""+data1+" 家族签名："+data2;
	}
	//[功能]设置徽章图
	//[参数]data1：外框图；data2：中心图
	//[返回值]无
	void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
	{
		s_FamilyAffiche.SetFamilyBadge(data1,data2,data3,data4,data5,data6);
	}
	//[功能]设置家族公告
	//[参数]data：家族公告
	//[返回值]无
	void SetFamilyAffiche(data)
	{
		s_FamilyAffiche.SetFamilyAffiche(data);
	}
	//[功能]设置我的信息
	//[参数]data1：职位信息；data2：贡献度；data3：贡献度排行
	//[返回值]无
	void SetMyInfo(data1,data2,data3)
	{
		s_MyInfo.SetMyInfo(data1,data2,data3);
	}
	//[功能]设置在线人数
	//[参数]data1:在线人数；data2：总人数
	//[返回值]无
	void SetOnlineNum(data1,data2)
	{
		s_Text_OnlineNum.SetData(data1,data2);
	}
	//设置贡献度排行
	void SetMyOfferStarInfo(data)
	{
		s_MyInfo.SetMyOfferStarInfo(data);
	}
	//设置贡献点
	void SeMytOfferInfo(data)
	{
		s_MyInfo.SeMytOfferInfo(data);
	}
}