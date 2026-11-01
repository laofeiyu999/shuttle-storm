//游戏的局数输赢
//

//单个球
class VGame_Num item
{
	size(29,29);
	var _game_bk = new img
	{
		src="$./imgs"+window.g_Sex+"/game_bk.tga";
	}
	var _lost_win = new img
	{
		src="$./imgs/game_lost.tga";show=false;
	}
	
	//参数 winorlost:输赢 1表示输 2表示赢
	void WinOrLost(winorlost)
	{
		switch (winorlost)
		{
		case 0:{_lost_win.show = false;_lost_win.src = "";break;}
		case 1:{_lost_win.show = true;_lost_win.src = "$./imgs/game_lost.tga";break;}
		case 2:{_lost_win.show = true;_lost_win.src = "$./imgs/game_win.tga";break;}
		default:{_lost_win.show = false;_lost_win.src = "";break;}
		}
	}
};

//所有球
class VPlay_Game_Num item
{
	size(150,30);
	var _isFirst = true;
	
	//初始化
	//参数 gamenum:总局数 1,2,3
	void Init(gamenum)
	{
		gamenum = window.GetGameNumByIndex(gamenum);
		if(gamenum == 3)
		{
			staticvar _game3 = new VGame_Num{pos(120,0);}
			staticvar _game2 = new VGame_Num{pos(90,0);}
			staticvar _game1 = new VGame_Num{pos(60,0);}
		}
		if(gamenum == 5)
		{
			staticvar _game5 = new VGame_Num{pos(120,0);}
			staticvar _game4 = new VGame_Num{pos(90,0);}
			staticvar _game3 = new VGame_Num{pos(60,0);}
			staticvar _game2 = new VGame_Num{pos(30,0);}
			staticvar _game1 = new VGame_Num{}
		}
	}

	//局分情况显示
	//参数 gamenum:总局数 1-n
	//参数 currnum:当前局 1-n,0为初始值(2,3,4,5,99)
	//参数 winorlost:输赢 1表示输 2表示赢
	void SetShow(gamenum,currnum,winorlost)
	{
		//alert("局分情况显示:gamenum:"+gamenum+",currnum:"+currnum+",winorlost:"+winorlost);
		if (gamenum == 1)return;	//一局制不显示
		if (_isFirst){Init(gamenum);_isFirst = false;return;}
		
		var _temp = toint(currnum)-1;
		switch (_temp)
		{
		case 1:{_game1.WinOrLost(winorlost);break;}
		case 2:{_game2.WinOrLost(winorlost);break;}
		case 3:{_game3.WinOrLost(winorlost);break;}
		case 4:{_game4.WinOrLost(winorlost);break;}
		case 5:{_game5.WinOrLost(winorlost);break;}
		case 98:
		{
			if (gamenum == 2)//三局制
			{
				_game2.WinOrLost(winorlost);break;
			}
			else
			{
				_game4.WinOrLost(winorlost);break;
			}
		}
		}
	}
};