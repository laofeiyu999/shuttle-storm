//结算界面-显示-数据类（个人的数据）
//yxf 2008年11月20日
//老虎修改2009-4-21

class VGameOver_BG item
{
	size = "800,486";// pos = "132,123"; 
	//bgcolor = "#ff";
	halign(50,0);valign(40,0);
	//InitBG("");
//	InitClose();
	//InitHelp();
	//InitBtnBG();
	new img{pos = "36,0";size = "100%,100%"; src="$./imgs" + window.g_Sex+ "/gameOver_bg.tga"; show = true; }

	//new BaseText{ src = "总得分"; pos = "36,81";}
	new img{pos = "36,81"; src="$./imgs" + window.g_Sex+ "/totalScore_text.tga"; show = true;}

	//new BaseText{ src = "使用技能次数"; pos = "36,110";}
	new img{pos = "36,115"; src="$./imgs" + window.g_Sex+ "/useSkill-text.tga"; show = true;}

	//new BaseText{ src = "一击得分数"; pos = "36,138";}
	new img{pos = "36,150"; src="$./imgs" + window.g_Sex+ "/ACEBall-text.tga"; show = true;}

	//new BaseText{ src = "受迫球次数"; pos = "36,166";}
	new img{pos = "36,180"; src="$./imgs" + window.g_Sex+ "/badBall-text.tga"; show = true;}

	//new BaseText{ src = "蓄满力次数"; pos = "36,194";}
	new img{pos = "36,214"; src="$./imgs" + window.g_Sex+ "/fullStoreBall-text.tga"; show = true;}

	//分隔条
	new img{pos((parent.width-467)/2+36,257); src="$./imgs" + window.g_Sex+ "/partition.tga"; show = true; xcenter = true;}


	//new BaseText{ src = "经验"; pos = "36,236";}
	new img{pos = "36,280"; src="$./imgs" + window.g_Sex+ "/exp-text.tga"; show = true;}

	//new BaseText{ src = "金币"; pos = "36,264";}
	new img{pos = "36,312"; src="$./imgs" + window.g_Sex+ "/money-text.tga"; show = true;}

	//new BaseText{ src = "挑战金(点券)"; pos = "36,316";}
	new img{pos = "36,345"; src="$./imgs" + window.g_Sex+ "/wagerTaken-text.tga"; show = true;}

	//new BaseText{ src = "挑战金(金币)"; pos = "36,290";}
	new img{pos = "36,378"; src="$./imgs" + window.g_Sex+ "/wagerMoney-text.tga"; show = true;}
	
	//默契度
	var m_ImgPartner = new img{pos = "36,411"; src="$./imgs" + window.g_Sex+ "/intimateScore-text.tga"; show = false;}

	//new BaseText{ src = "系统评价"; pos = "38,367";}
	new img{pos = "400,453"; src="$./imgs" + window.g_Sex+ "/appraise-text.tga"; show = true;}

	//new BaseText{ src = "比赛耗时"; pos = "317,367";}
	new img{pos = "36,452"; src="$./imgs" + window.g_Sex+ "/time-text.tga"; show = true;}

	//new item{ size = "182,23"; pos = "94,362"; bgcolor = "#FFFFFF";alpha = 20; }
	//new item{ size = "182,23"; pos = "377,362"; bgcolor = "#FFFFFF";alpha = 20; }
};

class VGameOver_BG_LovMode item
{
	size = "800,486";// pos = "132,123"; 
	//bgcolor = "#ff";
	halign(50,0);valign(40,0);
	//InitBG("");
//	InitClose();
	//InitHelp();
	//InitBtnBG();
	new img{pos = "36,0";size = "100%,100%"; src="$./imgs" + window.g_Sex+ "/gameOver_bg.tga"; show = true; }

	//new BaseText{ src = "总得分"; pos = "36,81";}
	new img{pos = "36,81"; src="$./imgs" + window.g_Sex+ "/kq-text.tga"; show = true;}

	//new BaseText{ src = "使用技能次数"; pos = "36,110";}
	new img{pos = "36,115"; src="$./imgs" + window.g_Sex+ "/hq-text.tga"; show = true;}

	//new BaseText{ src = "一击得分数"; pos = "36,138";}
	new img{pos = "36,150"; src="$./imgs" + window.g_Sex+ "/fgq-text.tga"; show = true;}

	//new BaseText{ src = "受迫球次数"; pos = "36,166";}
	new img{pos = "36,180"; src="$./imgs" + window.g_Sex+ "/xq-text.tga"; show = true;}

	//new BaseText{ src = "蓄满力次数"; pos = "36,194";}
	new img{pos = "36,214"; src="$./imgs" + window.g_Sex+ "/jjq-text.tga"; show = true;}

	//分隔条
	new img{pos((parent.width-467)/2+36,257); src="$./imgs" + window.g_Sex+ "/partition.tga"; show = true; xcenter = true;}


	//new BaseText{ src = "经验"; pos = "36,236";}
	new img{pos = "36,280"; src="$./imgs" + window.g_Sex+ "/exp-text.tga"; show = true;}

	//new BaseText{ src = "金币"; pos = "36,264";}
	new img{pos = "36,312"; src="$./imgs" + window.g_Sex+ "/money-text.tga"; show = true;}

	//new BaseText{ src = "挑战金(点券)"; pos = "36,316";}
	new img{pos = "36,345"; src="$./imgs" + window.g_Sex+ "/wagerTaken-text.tga"; show = true;}

	//new BaseText{ src = "挑战金(金币)"; pos = "36,290";}
	new img{pos = "36,378"; src="$./imgs" + window.g_Sex+ "/wagerMoney-text.tga"; show = true;}
	
	//默契度
	var m_ImgPartner = new img{pos = "36,411"; src="$./imgs" + window.g_Sex+ "/intimateScore-text.tga"; show = false;}

	//new BaseText{ src = "系统评价"; pos = "38,367";}
	new img{pos = "400,453"; src="$./imgs" + window.g_Sex+ "/appraise-text.tga"; show = true;}

	//new BaseText{ src = "比赛耗时"; pos = "317,367";}
	new img{pos = "36,452"; src="$./imgs" + window.g_Sex+ "/time-text.tga"; show = true;}

	//new item{ size = "182,23"; pos = "94,362"; bgcolor = "#FFFFFF";alpha = 20; }
	//new item{ size = "182,23"; pos = "377,362"; bgcolor = "#FFFFFF";alpha = 20; }
};


class GameOver_Text item
{
	size = "119,25";
	var m_IsNB = false; //是否最强
	show = false;
	//bgcolor = "#FFFFFF";alpha = 30;
	var _text = new BaseText{size = "115,25";xcenter = true;ycenter = true;}//SetBorder(2);}
	void SetData(data1,data2){_text.src = data2;_text.show = false;}
	void SetOhterText()
	{
		font = "宋体,-1,20";
		color = "#FFFFFF";bold = true;
		xcenter = true;ycenter = true;
	}
	void SetMyBorder( data )
	{
		_text.SetBorder(data);
	}
	void ShowOrHide(param)
	{
		show = param;
		_text.show = param;
	}
	void SetNB(isNB)
	{
		m_IsNB = isNB;
	}
};

class VGameOver_TextImg_UI item
{
	size = "114,35";
	var m_IsNB = false; //是否最强
	//数字
	var _text = new text
	{
		font = "宋体,-1,20";
		size = "114,35";color = "#FFFFFF";bold = true;
		xcenter = true;ycenter = true;show = false;
	}
	//最强图片
	var _img = new img
	{
		pos(27,1);//halign(50,0);
		src = "$./imgs/zuiqiang.tga";
		size = "0,0";
	}
	void SetData(data1,data2){_text.src = data2;}
	void SetNB(isNB)
	{
		m_IsNB = isNB;
	}
	void ShowImg()
	{
		if (m_IsNB)
		{
			_img.setParamTimer("size","80,40","60,33",100,0,"maxtomin");
		}
	}
	void ShowOrHide(param)
	{
		_text.show = param;
	}
};

class VGame_Over_Data_UI item
{

	size = "150,456";alpha = 70;//bgcolor = "#FF0000";

	void Init()
	{
		//昵称
		//参数 data2
		staticvar s_NkName = new GameOver_Text
		{
			font = "宋体,-1,16";pos = "0,6";
			size = "119,25";//bgcolor = "#FF";
			xcenter = true;ycenter = true;
			void SetData(data1,data2){_text.src = data2;}
		}
		//总得分
		//参数 data2:总得分
		staticvar s_TotalScore = new GameOver_Text{pos = "0,45";}
		//使用技能次数
		//参数 data2:使用技能次数
		staticvar s_UseSkill = new GameOver_Text{pos = "0,82";}
		//一击得分数
		//参数 data2：一击得分数
		staticvar s_ACEBall = new GameOver_Text{pos = "0,117";}
		//受迫球次数
		//参数 data2：受迫球次数
		staticvar s_BadBall = new GameOver_Text{pos = "0,150";}
		//满蓄力次数
		//参数 data2：满蓄力次数
		staticvar s_FullStoreBall = new GameOver_Text{pos = "0,185";}
		//经验
		//参数 data2
		staticvar s_Exp = new GameOver_Text
		{
			SetOhterText();
			pos = "0,253";
			size = "85,25";
			xcenter = true;ycenter = true;
			void SetData(data1,data2)
			{
				_text.src = toint(data2);
			}
		}
		//经验加成
		staticvar s_Expadd = new GameOver_Text
		{
			SetOhterText();
			left = parent.s_Exp.left+parent.s_Exp.width;
			top	= parent.s_Exp.top;
			ycenter = true;
			void SetData(data1,data2)
			{
				if ( toint(data2) != 0)
				{
					_text.src = "(+"+data2+"%)";
				}
				else
					_text.src = "";
				_text.xcenter = false;
			}
		}

		//金币
		//参数 data2
		staticvar s_Money = new GameOver_Text
		{
			SetOhterText();
			pos = "0,283";
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}

		//挑战金点券
		//参数 data2：挑战金点券
		staticvar s_WagerTaken = new GameOver_Text
		{
			SetOhterText();
			pos = "0,318";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
//				if (toint(data2) > 0)
//				{
//					m_IsColored = true;
//					_text.color = "#b20606";
//				}
			}
		}

		//挑战金金币
		//参数 data2：挑战金金币
		staticvar s_WagerMoney = new GameOver_Text
		{
			SetOhterText();
			pos = "0,351";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
//				if (toint(data2) > 0)
//				{
//					m_IsColored = true;
//					_text.color = "#b20606";
//				}
			}
		}
		//默契度
		//参数 data2：默契度
		staticvar s_Partner = new GameOver_Text
		{
			SetOhterText();
			pos = "0,381";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				if (data2 == "")
					data2 = "0";

				_text.src = data2;
//				if (toint(data2) > 0)
//				{
//					m_IsColored = true;
//					_text.color = "#b20606";
//				}
			}
		}

		//vip显示
		staticvar s_vip = new item
		{
			pos = "0,0";size = "100%,100%";
			var _ExpVip = new img
			{

				pos(parent.parent.width-70,246); show = false;
				src = "$./imgs"+window.g_Sex+"/vip_A1.tga";
			}

			var _MoneyVip = new img
			{
				pos(parent.parent.width-70,280); show = false;
				src = "$./imgs"+window.g_Sex+"/vip_A1.tga";
			}
			/**
			*[作用]查看是否是vip用户
			*[参数]0不是Vip >1是Vip 错误值：-1
			*/
			void setShow(data1)
			{
				//alert(data1);
				if(data1>=1)
				{
					_ExpVip.show =true;_ExpVip.clipani(70,28,1,2);_ExpVip.anispeed = 4;

					_MoneyVip.show =true;_MoneyVip.clipani(70,28,1,2);_MoneyVip.anispeed = 4;
				}
			}

//			//鼠标按下事件
//			void OnMouseDownL()
//			{
//				window.Tos_VipPresent();
//			}
		}
	}
	//设置字体的颜色
	//参数1：白色   参数2：黑色
	void SetMyColor(id)
	{
		var _Color1 = "#9F0437";	//自己的
		var _Color2 = "#000000";	//别人的
		if(id==1)
		{
			s_NkName._text.color = _Color1;
			s_TotalScore._text.color = _Color1;
			s_UseSkill._text.color = _Color1;
			s_ACEBall._text.color = _Color1;
			s_BadBall._text.color = _Color1;
			s_FullStoreBall._text.color = _Color1;
			s_Exp._text.color = _Color1;
			s_Expadd._text.color = _Color1;
			s_Money._text.color = _Color1;
			if (!s_WagerTaken.m_IsColored)s_WagerTaken._text.color = _Color1;
			if (!s_WagerMoney.m_IsColored)s_WagerMoney._text.color = _Color1;
			if (!s_Partner.m_IsColored)s_Partner._text.color = _Color1;
		}
		if(id==2)
		{
			s_NkName._text.color = _Color2;
			s_TotalScore._text.color = _Color2;
			s_UseSkill._text.color = _Color2;
			s_ACEBall._text.color = _Color2;
			s_BadBall._text.color = _Color2;
			s_FullStoreBall._text.color = _Color2;
			s_Exp._text.color = _Color2;
			s_Expadd._text.color = _Color2;
			s_Money._text.color = _Color2;
			if (!s_WagerTaken.m_IsColored)s_WagerTaken._text.color = _Color2;
			if (!s_WagerMoney.m_IsColored)s_WagerMoney._text.color = _Color2;
			if (!s_Partner.m_IsColored)s_Partner._text.color = _Color2;
		}
	}

	void ShowData(type)
	{
		s_NkName.timer(100,"show=true");
		s_TotalScore.timer(200,"ShowOrHide(true)");
		s_UseSkill.timer(300,"ShowOrHide(true)");
		s_ACEBall.timer(400,"ShowOrHide(true)");
		s_BadBall.timer(500,"ShowOrHide(true)");
		s_FullStoreBall.timer(600,"ShowOrHide(true)");
		s_Exp.timer(700,"show=true");
		s_Expadd.timer(750,"show=true");
		s_Money.timer(800,"show=true");
		s_WagerTaken.timer(900,"show=true");
		s_WagerMoney.timer(1000,"show=true");
		s_Partner.timer(1100,"show=true");

		s_TotalScore.timer(2000,"ShowImg");
		s_UseSkill.timer(2100,"ShowImg");
		s_ACEBall.timer(2200,"ShowImg");
		s_FullStoreBall.timer(2300,"ShowImg");

		SetMyColor(type);
	}
};
