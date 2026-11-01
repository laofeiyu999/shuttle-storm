//个人信息基础信息显示类定义
	
class VSelfInfo_BaseInfo_UI item
{
	/*
	*modify:	chenjihui
	*author:	
	*data:		2010-12-16
	*/
	size = "95%,100%";bgcolor = -1;alpha = 0;
	
	void Init()
	{
		
		new VPic9_BK2_UI{pos="286,58";size="285,480";}
		// 昵称
		new img{pos="320,72";src="$./imgs"+window.g_Sex+"/new/nc-text.tga";}
		staticvar s_UserName = new BKText { pos = "389,71"; size = "146,18";}

		// 性别
		new img{pos="320,94";src="$./imgs"+window.g_Sex+"/new/xb-text.tga";}
		staticvar s_UserSex = new BKText
		{
			pos="389,93";size="146,18";
			
			var _img = new img{valign(50,0);halign(50,0);size = "18,18";}
			void SetData(data)
			{
				if(data == window.USER_SEX_MAN)
				{
					_img.src = "$./imgs"+window.g_Sex+"/boy.tga";
					return;
				}
				if(data == window.USER_SEX_WOMAN)
				{
					_img.src = "$./imgs"+window.g_Sex+"/girl.tga";
					return;
				}
			}
		}

		// 等级
		new img{pos="320,116";src="$./imgs"+window.g_Sex+"/new/dj-text.tga";}
		staticvar s_UserLevel = new BKText{pos="389,115";size="146,18";}

		// 称号
		new img{pos="320,138";src="$./imgs"+window.g_Sex+"/new/ch-text.tga";}
		staticvar s_Title = new BKText
		{
			pos="389,137";size="146,18";xcenter = true;ycenter = true;
			void SetData(data)
			{
				src = window.GetChannelType(data)+"选手";
			}
		}

		// 技术类型
		new img{pos="305,161";src="$./imgs"+window.g_Sex+"/new/jslx-text.tga";}
		staticvar s_TechnicType = new BKText
		{
			pos="389,159";size="146,18";
			void SetData(data)
			{
				src = window.GetTechnicByType(data);
			}
		}

		// 经验
		new img{pos="320,182";src="$./imgs"+window.g_Sex+"/new/jy-text.tga";}
		staticvar s_Exp = new VExpLine_UI{pos="389,182";SetWidth(146);InitText();}

		// 金币
		new img{pos="320,202";src="$./imgs"+window.g_Sex+"/new/jb-text.tga";}
		staticvar s_UserGold=new BKText{pos="389,200";size="146,18";}

		// 奖券
		new img{pos = "320,224"; src = "$./imgs"+window.g_Sex+"/new/jq-text.tga";}
		staticvar s_UserLottery = new BKText{pos = "389,222";size = "146,18";}

		// 点券
		new img{pos="320,246";src="$./imgs"+window.g_Sex+"/new/dq-text.tga";}
		staticvar s_UserMoney = new BKText{pos="389,244";size="146,18";}

		//人气
		new img{pos = "320,268";src = "$./imgs"+window.g_Sex+"/new/rq-text.tga";}
		staticvar s_RQ = new BKText{pos="389,266";size="105,18";}
		staticvar s_XianHua = new VBTN_43_New{pos="475,266";InitText("献花");}

		// 属性
		new img{pos="305,294";src="$./imgs"+window.g_Sex+"/new/zysx-text.tga";}

		//综合指数
		new img{pos="305,329";src="$./imgs"+window.g_Sex+"/new/zhzs-text.tga";staticvar _btnhover = new VBTN_HOVER{};_btnhover.SetHangID(58);}
		staticvar s_ZongHe=new BKText
		{
			pos="389,327";size="83,20";
			void SetData(data,data1,data2,data3,data4)
			{
				if (data==1){src=""+toint (data1);}
				if (data==2){src=""+toint (data2);}
				if (data==3){src=""+toint (data3);}
				if (data==4){src=""+toint (data4);}				
			}
			staticvar _btnhover = new VBTN_HOVER{};
			_btnhover.SetHangID(58);
			
		}

		// 力量
		new img{pos="305,352";src="$./imgs"+window.g_Sex+"/new/ll-text.tga";}
		staticvar s_LiLiang=new VExpline1_UI{pos="345,352";SetWidth(146);InitText();}//BKText{pos="345,315";size="83,20";}
		staticvar s_TStrength = new VAttributeEx_Sub{pos = "470,352";SetHangSrc(_src);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		// 技术
		new img{pos="305,375";src="$./imgs"+window.g_Sex+"/new/jqiao-text.tga";}
		staticvar s_JiShu=new VExpline1_UI{pos="345,375";SetWidth(146);InitText();}//BKText{pos="345,384";size="83,20";}
		staticvar s_TSkill = new VAttributeEx_Sub{pos = "470,375";SetHangSrc(_src);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		// 前场
		new img{pos="305,398";src="$./imgs"+window.g_Sex+"/new/qc-text.tga";}
		staticvar s_QianChang=new VExpline1_UI{pos="345,398";SetWidth(146);InitText();}//BKText{pos="345,338";size="83,20";}
		staticvar s_TForceHand = new VAttributeEx_Sub{pos = "470,398";SetHangSrc(_src);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		// 后场
		new img{pos="305,421";src="$./imgs"+window.g_Sex+"/new/hc-text.tga";}
		staticvar s_HouChang=new VExpline1_UI{pos="345,421";SetWidth(146);InitText();}//BKText{pos="345,361";size="83,20";}
		staticvar s_TBackHand = new VAttributeEx_Sub{pos = "470,421";SetHangSrc(_src);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}
		
		// 发球
		new img{pos="305,444";src="$./imgs"+window.g_Sex+"/new/fq-text.tga";}
		staticvar s_FaQiu=new VExpline1_UI{pos="345,444";SetWidth(146);InitText();}//BKText{pos="475,315";size="83,20";}
		staticvar s_TServe = new VAttributeEx_Sub{pos = "470,444";SetHangSrc(_src);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		// 能量
		new img{pos="305,467";src="$./imgs"+window.g_Sex+"/new/nl-text.tga";}
		staticvar s_NengLiang=new VExpline1_UI{pos="345,467";SetWidth(146);SetHangID(8);InitText();}//BKText{pos="475,338";size="83,20";}
		staticvar s_TEnergy = new VAttributeEx_Sub{pos = "470,467";SetHangID(8);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		// 体力
		new img{pos="305,490";src="$./imgs"+window.g_Sex+"/new/tl-text.tga";}
		staticvar s_TiLi=new VExpline1_UI{pos="345,490";SetWidth(146);SetHangID(34);InitText();}//BKText{pos="475,361";size="83,20";}
		staticvar s_Thew = new VAttributeEx_Sub{pos = "470,490";SetHangID(34);_num.color ="#0";_num.txtborder ="#FFFFFF";_addnum.color ="#0";_addnum.txtborder ="#FFFFFF";SetDataEx(data1,data2);}

		//new VPic9_BK2_UI{pos="286,422";size="285,118";}

/*		//家族
		staticvar s_FamilyPic = new img
		{
			pos="330,467";src="$./imgs"+window.g_Sex+"/new/jz-text.tga";
			void SetPos1(){pos="330,467";}
			void SetPos2(){pos="330,407";}
		}
		staticvar s_Family = new BKText
		{
			pos="378,467";size="146,19";
			void SetPos1(){pos="378,465";}
			void SetPos2(){pos="378,405";}

			void SetData(data)
			{
				if(data == -1)
				{
					color = "#929292";
					src = "未加入";
				}
				else
				{
					color = "#000000";
					src = data;
				}
				
			}
		};
		
		// 情侣
		staticvar s_QingLvPic = new img{pos="330,437";src="$./imgs"+window.g_Sex+"/new/ql-text.tga";}
		staticvar s_QingLv=new BKText{pos="378,435";size="146,19";}
*/
		
	}
};

