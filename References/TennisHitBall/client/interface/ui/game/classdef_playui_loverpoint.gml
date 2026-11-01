//情侣比赛比分
//WWB 2011/1/5

import("$./ClassDef_FightInfo_New.gml");

class VGame_LoverBaseTipInfo_Num item
{
	size = "100,35";//bgcolor= "#fffff";
	void Init(UID)
	{	
		staticvar L_UID = UID;
		staticvar s_LoverPoint = new VOneFightInfoNum_Normal  //所得的比分
		{
			halign(15,0);
			valign(1,0);
		}
		staticvar xg = new img							//斜杠
		{
			size = "24,28";
			left = parent.s_LoverPoint.left+parent.s_LoverPoint.width+20;
			top = parent.s_LoverPoint.top+2;
			src = "$./imgs/gxgP"+parent.L_UID+".tga";
		}
		staticvar pmaxnum_2 = new VN2NumShow			//总共的比分
		{
			left = parent.xg.left+parent.xg.width;
			top = parent.xg.top-2;	
			src="$./imgs/pointP"+parent.L_UID+".tga";
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					clipani(30,35,1,10);
					aniindex=num;
					left=index*15;
					size(23,33);
				}
			}
		}
	}
	void Init2()
	{
		staticvar s_LoverPoint = new VOneFightInfoNum_Normal  //所得的比分
		{
			halign(15,0);
			valign(1,0);
		}
	}
	
};
	
class VGame_PlayUI_LoverPoint item
{//bgcolor = "#ffccc";
	size = "550,130";
	halign(100,0);
	valign(1,0);
	staticvar m_UID = 2;  //自己决定用的底图颜色，1为蓝，2为红
	void Init(UID)
	{  
		new img{size = "550,120";halign(50,0);valign(1,0);src = "$./imgs/yxzbg.tga";};
		staticvar s_LBallKinds = new item
		{
			size = "550,130";
			halign(100,0);
			valign(0,0);
			new img{size = "100,30";halign(14,0);valign(2,0);src = "$./imgs/ghq-text.tga";};
			new img{size = "100,30";halign(35,0);valign(2,0);src = "$./imgs/gkq-text.tga";};
			new img{size = "100,30";halign(55,0);valign(2,0);src = "$./imgs/gfgq-text.tga";};
			new img{size = "100,30";halign(77,0);valign(2,0);src = "$./imgs/gxq-text.tga";};
			new img{size = "100,30";halign(97,0);valign(2,0);src = "$./imgs/gjjq-text.tga";};
		}
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}
//		alert("window.GetTeamByUID(UID)="+window.GetTeamByUID(UID)+",window.GetTeamByUID(window.GetMyUID())="+window.GetTeamByUID(window.GetMyUID()));
//		if (window.GetTeamByUID(UID) == 1)
//		{
			staticvar P1_hqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(14,0);valign(59,0);
				Init(parent.m_UID);
			};
			staticvar P1_hqnumFinish = new img{halign(14,0);valign(59,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P1_kqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(35,0);valign(59,0);
				Init(parent.m_UID);
			};
			staticvar P1_kqnumFinish = new img{halign(35,0);valign(59,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;}; //完成字体
			staticvar P1_fgqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(56,0);valign(59,0);
				Init(parent.m_UID);
			};
			staticvar P1_fgqnumFinish = new img{halign(55,0);valign(59,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P1_xqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(77,0);valign(59,0);
				Init(parent.m_UID);
			};
			staticvar P1_xqnumFinish = new img{halign(77,0);valign(59,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P1_jjqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(98,0);valign(59,0);
				Init(parent.m_UID);
			};
			staticvar P1_jjqnumFinish = new img{halign(97,0);valign(59,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
//		}
//		else
//		{
			if (m_UID ==1)
				m_UID = 2;
			else
				m_UID =1;

			staticvar P2_hqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(14,0);valign(89,0);
				Init(parent.m_UID);
			};
			staticvar P2_hqnumFinish = new img{halign(14,0);valign(89,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_kqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(35,0);valign(89,0);
				Init(parent.m_UID);
			};
			staticvar P2_kqnumFinish = new img{halign(35,0);valign(89,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_fgqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(56,0);valign(89,0);
				Init(parent.m_UID);
			};
			staticvar P2_fgqnumFinish = new img{halign(55,0);valign(89,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_xqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(77,0);valign(89,0);
				Init(parent.m_UID);
			};
			staticvar P2_xqnumFinish = new img{halign(77,0);valign(89,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_jjqnum = new VGame_LoverBaseTipInfo_Num
			{
				halign(98,0);valign(89,0);
				Init(parent.m_UID);
			};	
			staticvar P2_jjqnumFinish = new img{halign(97,0);valign(89,0); size = "100,35";src = "$./imgs/wcsmallP"+parent.m_UID+"-text.tga";show = false;};
//		}
	}
};