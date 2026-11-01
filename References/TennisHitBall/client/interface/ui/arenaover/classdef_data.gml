//活动场-结算界面-显示-数据类（个人的数据）
//安峰册 2009-11-24

class VArenaOver_BG item
{
	size = "785,533";// pos = "132,123";// bgcolor = "#FFFFFF";
	halign(50,0);valign(50,0);
	//InitBG("");
//	InitClose();
	//InitHelp();	
	//InitBtnBG();
	var showNumInGroup = 4;		//需要自动调整的显示内容：奖券,活动点,积分,贡献点
	new img{pos = "36,0";size = "100%,100%"; src="$./imgs" + window.g_Sex+ "/arenaOver_bg.tga"; show = true; }

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

	//new BaseText{ src = "奖券"; pos = "36,290";}
	var m_Quan = new img{pos = "36,345"; src="$./imgs" + window.g_Sex+ "/lottery-text.tga"; show = true;}

	//活动点
	var m_ArenaPoint = new img{pos = "36,375"; src="$./imgs" + window.g_Sex+ "/arenaPoint-text.tga"; show = true;}

	//积分
	var m_Integral = new img{pos = "36,405"; src="$./imgs" + window.g_Sex+ "/integral-text.tga"; show = true;}
	
	//贡献点
	var m_ContributePoint = new img{pos = "36,435"; src = "$./imgs"+window.g_Sex+"/gxd-text.tga";show = true;}
	
	//默契度
	var m_ImgPartner = new img{pos = "36,465"; src = "$./imgs"+window.g_Sex+"/intimateScore-text.tga";show = false;}

	//奖券,活动点,积分,贡献点的显示
	//_stateArray:奖券,活动点,积分,贡献点的状态，0为没有，1为有
	void ShowContent(_stateArray)
	{
		printf("xiayy_BK:0:"+_stateArray[0]+",1:"+_stateArray[1]+",2:"+_stateArray[2]+",3:"+_stateArray[3]+",4:"+_stateArray[4]);
		var _index = 0;
		if(toint(_stateArray[0]) == 1)
		{
			m_Quan.pos = "36,"+(345+_index*30);
			m_Quan.show = true;
			_index += 1;
		}
		else
		{
			m_Quan.show = false;
		}

		if(toint(_stateArray[1]) == 1)
		{
			m_ArenaPoint.pos = "36,"+(345+_index*30);
			m_ArenaPoint.show = true;
			_index += 1;
		}
		else
		{
			m_ArenaPoint.show = false;
		}

		if(toint(_stateArray[2]) == 1)
		{
			m_Integral.pos = "36,"+(345+_index*30);
			m_Integral.show = true;
			_index += 1;
		}
		else
		{
			m_Integral.show = false;
		}

		if(toint(_stateArray[3]) == 1)
		{
			m_ContributePoint.pos = "36,"+(345+_index*30);
			m_ContributePoint.show = true;
			_index += 1;
		}
		else
		{
			m_ContributePoint.show = false;
		}
		
		if(toint(_stateArray[4]) == 1)
		{
			m_ImgPartner.pos = "36,"+(345+_index*30);
			m_ImgPartner.show = true;
			_index += 1;
		}
		else
		{
			m_ImgPartner.show = false;
		}
	}
};

class ArenaOver_Text item
{
	size = "119,25";
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
};



class VArena_Over_Data_UI item
{
	
	size = "150,460";alpha = 70;//bgcolor = "#FF0000";
	
	void Init()
	{
		//昵称
		//参数 data2
		staticvar s_NkName = new ArenaOver_Text
		{
			font = "宋体,-1,16";pos = "0,6";
			size = "119,25";//bgcolor = "#FF";
			xcenter = true;ycenter = true;
			void SetData(data1,data2){_text.src = data2;}
		}
		//总得分
		//参数 data2:总得分
		staticvar s_TotalScore = new ArenaOver_Text{pos = "0,45";}
		//使用技能次数
		//参数 data2:使用技能次数
		staticvar s_UseSkill = new ArenaOver_Text{pos = "0,82";}
		//一击得分数
		//参数 data2：一击得分数
		staticvar s_ACEBall = new ArenaOver_Text{pos = "0,117";}
		//受迫球次数
		//参数 data2：受迫球次数
		staticvar s_BadBall = new ArenaOver_Text{pos = "0,150";}
		//满蓄力次数
		//参数 data2：满蓄力次数
		staticvar s_FullStoreBall = new ArenaOver_Text{pos = "0,185";}
		//经验
		//参数 data2
		staticvar s_Exp = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,253";
			size = "85,25";
			xcenter = true;ycenter = true;
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}

		//经验加成
		staticvar s_Expadd = new ArenaOver_Text
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
		staticvar s_Money = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,283";
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}

		//奖券
		//参数 data2：奖券
		staticvar s_Lottery = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,318";
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}
		
		//活动点
		//参数 data2：活动点
		staticvar s_ArenaPoint = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,350";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}

		//积分
		//参数 data2：积分
		staticvar s_Integral= new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,380";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}
		//贡献点
		staticvar s_ContributePoint = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,410";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}
		
		//默契度
		staticvar s_Partner = new ArenaOver_Text
		{
			SetOhterText();
			pos = "0,430";
			var m_IsColored = false;
			void SetData(data1,data2)
			{
				_text.src = data2;
			}
		}

//		//vip显示
//		staticvar s_vip = new VFlicker_Vip_A_UI
//		{
//			pos(parent.width-70,365); show = false;
//			/**
//			*[作用]查看是否是vip用户
//			*[参数]0不是Vip >1是Vip 错误值：-1
//			*/
//			
//			void setShow(data1)
//			{
//				//alert(data1);
//				if(data1>=1)
//				{
//					SetState(window.FLICKER_FLICKER);
//				}
//			}
//		}
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
			s_WagerTaken._text.color = _Color1;
			s_Lottery._text.color = _Color1;
			s_ArenaPoint._text.color = _Color1;
			s_Integral._text.color = _Color1;
			s_ContributePoint._text.color = _Color1;
			s_Partner._text.color = _Color1;
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
			s_WagerTaken._text.color = _Color2;
			s_Lottery._text.color = _Color2;
			s_ArenaPoint._text.color = _Color2;
			s_Integral._text.color = _Color2;
			s_ContributePoint._text.color = _Color2;
			s_Partner._text.color = _Color2;
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
		s_Expadd.timer(700,"show=true");
		s_Money.timer(800,"show=true");
		s_WagerTaken.timer(900,"show=true");
		s_Lottery.timer(1000,"show=true");
		s_ArenaPoint.timer(1100,"show=true");
		s_Integral.timer(1200,"show=true");
		s_ContributePoint.timer(1300,"show=true");
		s_Partner.timer(1400,"show=true");

//		s_TotalScore.timer(2000,"ShowImg");
//		s_UseSkill.timer(2100,"ShowImg");
//		s_ACEBall.timer(2200,"ShowImg");
//		s_FullStoreBall.timer(2300,"ShowImg");

		SetMyColor(type);
	}
	//奖券,活动点,积分,贡献点的显示
	//_stateArray:奖券,活动点,积分,贡献点,默契度的状态，0为没有，1为有
	void ShowContent(_stateArray)
	{
		var _index = 0;
		if(toint(_stateArray[0]) == 1)
		{
			s_Lottery.pos = "0,"+(318+_index*30);
			s_Lottery._text.show = true;
			_index += 1;
		}
		else
		{
			s_Lottery._text.show = false;
		}
		if(toint(_stateArray[1]) == 1)
		{
			s_ArenaPoint.pos = "0,"+(318+_index*30);
			s_ArenaPoint._text.show = true;
			_index += 1;
		}
		else
		{
			s_ArenaPoint.show = false;
		}
		if(toint(_stateArray[2]) == 1)
		{
			s_Integral.pos = "0,"+(318+_index*30);
			s_Integral._text.show = true;
			_index += 1;
		}
		else
		{
			s_Integral._text.show = false;
		}
		if(toint(_stateArray[3]) == 1)
		{
			s_ContributePoint.pos = "0,"+(318+_index*30);
			s_ContributePoint._text.show = true;
			_index += 1;
		}
		else
		{
			s_ContributePoint._text.show = false;
		}
		
		if(toint(_stateArray[4]) == 1)
		{
			s_Partner.pos = "0,"+(318+_index*30);
			s_Partner._text.show = true;
			_index += 1;
		}
		else
		{
			s_Partner._text.show = false;
		}
	}
};
