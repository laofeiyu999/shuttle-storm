//游戏内界面的部分类定义->蓄力槽（单打+双打+训练通用）

class VGame_StorePower_UI item
{
	size = "175,100";show = false;//enableUpdate(1);//bgcolor = "#FFFF";
	valign(90,0);halign(50,0);
	//底图 
	new img{src = "$./imgs"+window.g_Sex+"/BoxStrength.tga";pos = "18,18";}
	new img{src = "$./imgs"+window.g_Sex+"/StrengthYellow.tga";pos = "23,20";}
	var _Green = new img{src = "$./imgs"+window.g_Sex+"/StrengthGreen.tga";pos = "23,20";}
	var _Grey = new img{src = "$./imgs"+window.g_Sex+"/StrengthBlock.tga";pos = "23,20";}
	//var _BallSpeed = 0;
	staticvar _BallSpeed = new text
	{
		font = "宋体,-1,16";
		color = "#ffff00";
		bold =true;
		halign(80,0); valign(55,0);

		//src = "球速：120km/h";
		void SetData(param)
		{
			if ( window.GetUIPos() != window.POS_VIDEOING )
			{
				src = "球速："+param+"km/h";
			}
			
		}
	}

	var _Begin = false;	//开始开关
	var _LastTime = 0;	//上次的时间
	var m_RID = -1;		//RoleID
	void OnMyUpDate()
	{
		staticvar _sizeY = 0;
		staticvar _alpha = 0;
		staticvar _BSpeed = 0;
		while (_Begin)
		{
			var _Now_time = currentTimeMillis-_LastTime;
			var _temp = window.Fun_ServeSpeed(_Now_time,m_RID);
			if (_Now_time > window.FA_QIU_MAX_TIME){return;}
			_sizeY = 78-tofloat(_temp)*78/0.5;
			_alpha = tofloat(_temp)*100/0.5;
			_Grey.size(12,_sizeY);
			_Green.alpha = _alpha;
			_BSpeed = tofloat(_temp)*125/0.5+60;
			_BallSpeed.SetData(toint(_BSpeed));
			sleep(3);
		}
	}
	//外部接口传值
	//1:开始发球 2:发球结束 3准备发球 4蓄力条暂停 5蓄力条消失 6显示满蓄力 7删除满蓄力
	void SetData(param,param2,rid)
	{
		m_RID = rid;
		//printf("B# 蓄力条param："+param+",param2:"+param2+",rid:"+rid);
		if (param == 1)
		{
			show = true;
			_LastTime = currentTimeMillis;
			_Begin = true;
			OnMyUpDate();
		}
		if (param == 2)
		{
			_Begin = false;

			if(toint(param2) > 0)
			{
				//printf("B# 蓄力条-真正蓄力的时间:"+param2);
				var _temp = window.Fun_ServeSpeed(param2,m_RID);
				//if (param2 > window.FA_QIU_MAX_TIME){return;}
				_sizeY = 78-tofloat(_temp)*78/0.5;
				//printf("B# 蓄力条-蓄力槽的高度:"+_sizeY+"_temp:"+_temp);
				_alpha = tofloat(_temp)*100/0.5;
				if (_sizeY > 0)
				{
					_Grey.size(12,_sizeY);
				}
				_Green.alpha = _alpha;
				
				
				//printf("B# 蓄力条-判断是否为满蓄力:"+window.CheXin_FullServe(param2,m_RID));
				//var _time = currentTimeMillis-_LastTime;//蓄力时间
				if (window.CheXin_FullServe(param2,m_RID) == 1)//是否为满蓄力
				{
					new img
					{
						src = "$./imgs"+window.g_Sex+"/FullPower.tga";
						clipani(55,100,5,1);anispeed = 8;
						delaydel(800);
					}
					_BallSpeed.SetData(200);//满蓄力球速200
				}
				else
				{
					_BSpeed = tofloat(_temp)*125/0.5+60;
					_BallSpeed.SetData(toint(_BSpeed));
				}
			}
			timer(800,"show=false");
		}
		if(param == 4)
		{
			_Begin = false;
		}
		if(param == 5)
		{
			show = false;
		}
		if(param == 6)
		{
			staticvar tempFullPower = new img
			{
				src = "$./imgs"+window.g_Sex+"/FullPower.tga";
				clipani(55,100,5,1);anispeed = 8;
			}
			_BallSpeed.SetData(200);//满蓄力球速200
		}
		if(param == 7)
		{
			show=false;
			tempFullPower.del();
		}
	}
};