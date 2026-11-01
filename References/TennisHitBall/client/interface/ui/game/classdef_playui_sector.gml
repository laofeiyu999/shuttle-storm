
//new fmodel{};
//wndsize = "800,600";
//bgcolor = "#000";
class VGame_Sector item
{
	name = "VGame_Sector";
	size = "86,86";//bgcolor = "#fffff";
	var m_radius = 33;//圆的半径
	var m_circularh = 0;		//画半圆的的item的高
	var m_tria_x = 0;  //画三角形的item的宽高
	var m_tria_y = 0; 
	//var m_angle = 0;
	new img
	{
		valign (50,0);halign (50,0);
		size = "85,85";
		src = "$./imgs/bkyuan.tga";
	}

	//new text
	//{
		//font = "黑体,-1,14";
		////pos (2,15);
		//halign (5,0);valign (55,0);
		//color = "#ffff00";;
		//src = "0°";
	//}
	
		staticvar jiaodu = new text
	{
		font = "黑体,-1,14";
		//pos (2,15);
		halign (74,0);valign (59,0);
		color = "#ffff00";
		void Setdata(data)
		{
			src = ""+data+"°";
		}
	}
	//new text
	//{
		//font = "黑体,-1,14";
		////pos (2,15);
		//halign (100,0);valign (55,0);
		//color = "#ffff00";;
		//src = "180°";
	//}
	
	var triangle = new img
	{
		show = false;
		//bgcolor ="#654123";
		size = "23,17";
		halign (50,1);//valign (15,0);
		top = 0;
		src = "$./imgs/sanjiao.tga";
	}

	
	var h_circular = new item
	{
		show = false;
		size = "71,7";
		pos = "10,11";//alpha = 30;
		new img
		{
			size = "66,66";
			src = "$./imgs/shbanyuan.tga";
		}
	}

	void Comp_Angle(angle)
	{
		//var tstatic = new T_ScriptFun{};
		var _jiaodu = 2*angle/window.PI*180;

		jiaodu.Setdata(window.GetDotSecPos(tostring(_jiaodu)));
		triangle.show = true;
		h_circular.show = true;
		//m_angle =angle/2;
		m_tria_x = 2*m_radius*window.g_CBallAngle.sin(angle);
		m_tria_y = m_radius*window.g_CBallAngle.cos(angle);
		triangle.size(toint(m_tria_x)+2,toint(m_tria_y)+1);		
		
		m_circularh = 1+m_radius-m_tria_y;//半圆高度
		h_circular.size(98,m_circularh);
		triangle.top = 11+m_circularh;//三角形位置

		//printf("wwwwwww m_tria_x="+m_tria_x+2+",m_tria_y="+m_tria_y+1+",m_circularh="+m_circularh+",angle="+angle+",_jiaodu="+_jiaodu);
	}
	
}

class VGame_SectorTime item
{
	name = "VGame_SectorTime";
	size = "133,68";
	new img = {	src = "$./imgs/PowerStore.tga";size = "133,68";clipani(215,109,1,10);aniindex = 0;}	
	void SetData(data1,data2)
	{
		new img
		{
			src = "$./imgs/PowerStore.tga";
			size = "133,68";
			clipani(215,109,1,10);	
			void _show_index(index)
			  { 
				 var i=0;
				while (i<= index)
				{
					aniindex = i;
					sleep(50);
					i += 1;
				}
			  }
			if ((tofloat (data1)/tofloat (data2)) ==0){aniindex = 0;}
		else if ((tofloat (data1)/tofloat (data2)) <=0.125){_show_index(1);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.25){_show_index(2);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.375){_show_index(3);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.5){_show_index(4);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.625){_show_index(5);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.75){_show_index(6);}
		else if ((tofloat (data1)/tofloat (data2)) <=0.875){_show_index(7);}
		else if ((tofloat (data1)/tofloat (data2)) <1.0){_show_index(8);}	
		   else ((tofloat (data1)/tofloat (data2)) ==1.0){_show_index(9);}		  
	    }
	}
	
}


class VGame_MaxSpeed item
{	
	name = "VGame_MaxSpeed";
	size = "80,20";
	
	//当前等级的最大球速
	staticvar s_MaxSectorSpeed = new text
	{
		font = "宋体,-1,14";
		color = "#ffff00";
		bold =true;
		halign (100,0);valign (0,0);
		void SetData(param)
		{
		   src = ""+param+"km/h ";
		}
	}
};



