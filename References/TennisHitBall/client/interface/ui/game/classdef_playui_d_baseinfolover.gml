//情侣模式比赛的比分显示
//wwb 2010.12.30


var m__p1num_1left = 0;
var m__p1num_1top  = 0;

class VRole_LoverBaseTipInfo_Num item
{
	size = "100,35";//bgcolor= "#fffff";
	void Init(UID)
	{	
		staticvar L_UID = UID;
		staticvar _pnum = new VN2NumShow			//个位自己的比分
		{
			halign(4,0);
			valign(1,0);
			src="$./imgs/pointP"+parent.L_UID+".tga";
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					clipani(25,35,1,10);
					aniindex=num;
					left=index*15;
					size(25,35);
				}
			}
		}
		staticvar _xg = new img							//斜杠
		{
			size = "25,35";
			left = parent._pnum.left+parent._pnum.width+21;
			top = parent._pnum.top+2;
			src = "$./imgs/xgP"+parent.L_UID+".tga";
		}
		staticvar _pmaxnum_2 = new VN2NumShow			//个位自己的比分
		{
			left = parent._xg.left+parent._xg.width;
			top = parent._xg.top-2;	
			src="$./imgs/pointP"+parent.L_UID+".tga";
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					clipani(25,35,1,10);
					aniindex=num;
					left=index*15;
					size(25,35);
				}
			}
		}
	}
};

//一球结束后的提示
class VRole_LoverBaseTipInfo_UIText item
{
	size = "840,300";//bgcolor= "#f00fff";
	halign(50,0);valign(50,0)
	staticvar m_UID = 2;  //自己决定用的底图颜色，1为蓝，2为红
	//背景图片
	new img {halign(40,0);valign(0,0);size = "840,200";src = "$./imgs/gcdhbg.tga";}
	void Init(UID)
	{
		//坏球
		new img {halign(20,0);valign(15,0);size = "110,35";src = "$./imgs/hq-text.tga";}
		//扣球
		new img {halign(37,0);valign(15,0);size = "110,35";src = "$./imgs/kq-text.tga";}
		//放高球
		new img {halign(54,0);valign(15,0);size = "110,35";src = "$./imgs/fgq-text.tga";}
		//削球
		new img {halign(71,0);valign(15,0);size = "110,35";src = "$./imgs/xq-text.tga";}
		//截击球
		new img {halign(88,0);valign(15,0);size = "110,35";src = "$./imgs/jjq-text.tga";}
		
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}
		staticvar s_Point = new item
		{
			size = "640,135";//bgcolor= "#ff00";
			halign(60,0);
			valign(45,0);
//			left = 384;top = 371;
//			parent.parent.m__p1num_1left = left ; 
//			parent.parent.m__p1num_1top =  top ;
		}
//		alert("window.GetTeamByUID(UID)="+window.GetTeamByUID(UID)+",window.GetTeamByUID(window.GetMyUID())="+window.GetTeamByUID(window.GetMyUID()));
//		if (window.GetTeamByUID(UID) == 1)
//		{
			staticvar P1_hqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(22,0);valign(30,0);
				Init(parent.m_UID);
			};
			staticvar P1_hqnumFinish = new img{halign(20,0);valign(29,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};//完成字体
			staticvar P1_kqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(39,0);valign(30,0);
				Init(parent.m_UID);
			};
			staticvar P1_kqnumFinish = new img{halign(38,0);valign(29,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;}; 
		staticvar P1_fgqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(55,0);valign(30,0);
				Init(parent.m_UID);
			};
			staticvar P1_fgqnumFinish = new img{halign(54,0);valign(29,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P1_xqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(72,0);valign(30,0);
				Init(parent.m_UID);
			};
			staticvar P1_xqnumFinish = new img{halign(71,0);valign(29,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P1_jjqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(89,0);valign(30,0);
				Init(parent.m_UID);
			};
			staticvar P1_jjqnumFinish = new img{halign(88,0);valign(29,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
//		}
//		else
//		{
			if (m_UID ==1)
				m_UID = 2;
			else
				m_UID =1;
			staticvar P2_hqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(22,0);valign(45,0);
				Init(parent.m_UID);
			};
			staticvar P2_hqnumFinish = new img{halign(20,0);valign(45,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_kqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(39,0);valign(45,0);
				Init(parent.m_UID);
			};
			staticvar P2_kqnumFinish = new img{halign(38,0);valign(45,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_fgqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(55,0);valign(45,0);
				Init(parent.m_UID);
			};
			staticvar P2_fgqnumFinish = new img{halign(54,0);valign(45,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_xqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(72,0);valign(45,0);
				Init(parent.m_UID);
			};
			staticvar P2_xqnumFinish = new img{halign(71,0);valign(45,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
			staticvar P2_jjqnum = new VRole_LoverBaseTipInfo_Num
			{
				halign(89,0);valign(45,0);
				Init(parent.m_UID);
			};	
			staticvar P2_jjqnumFinish = new img{halign(88,0);valign(45,0); size = "110,55";src = "$./imgs/wcbigP"+parent.m_UID+"-text.tga";show = false;};
//		}
	}
};






