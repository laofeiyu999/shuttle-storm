//任务内容
//陈晓聪 2009年4月14日

//import("$./ClassDef_Task_TaskFollowPop.gml");
//import("$./../Mall/ClassDef_Mall_Synthetic_Base.gml");

class VTask_TaskContent_UI item
{
	//scroll = "no;lierenscroll";
	size = "345,350";
	staticvar s_pageKind = 0;	//0：个人任务界面，1：为家族任务界面
	
	staticvar s_Taskdes = new VListBG2_UI
	{
		//bgcolor = "#ff0000";
		pos(0,7);
		size = "99%,40%";
	}
	staticvar s_TaskDecIcon = new VTaskDescribe_UI
	{
		left = parent.s_Taskdes.left+5;
		top = parent.s_Taskdes.top + 5;
	}
	//任务描述
	var _centent = new iframe
	{
		//bgcolor = "#FF";
		left = parent.s_TaskDecIcon.left+5;
		top = parent.s_TaskDecIcon.top + parent.s_TaskDecIcon.height +5;
		size = "100%,13%,-14,0";
		scroll = window.SCROLL_NOTENNIS;
		src = "$./lrtask.htm";
		void SetData(_Target1)
		{
				_Target1=window.TransHtmlform(_Target1);
				var _NormalIndex=0;
				var _UnderlineIndex=0;
				var _IDIndex=0;

				var _StrNormalData="";
				var _StrUnderlineData="";
				var _StrIDData="";
				while(true)
				{
					var _pos0=_Target1.Find("@",_UnderlineIndex);
					var _pos1=_Target1.Find("@",_pos0+1);
					if (_pos0<0 ||_pos1<0)
					{
						_StrNormalData=_Target1.Mid(_IDIndex,_Target1.Count-_IDIndex);
						if (_StrNormalData.Count>0)
						{
							//printf("Normal:["+_StrNormalData+"]");
							BODY.appendHtml("<font class=TASK_SMALL>"+_StrNormalData+"</font>");
						}
						break;
					}

					var _pos2=_Target1.Find("|",_IDIndex);
					var _pos3=_Target1.Find("|",_pos2+1);

					_StrNormalData=_Target1.Mid(_IDIndex,_pos0-_IDIndex);
					//printf("Normal:["+_StrNormalData+"]");
					BODY.appendHtml("<font class=TASK_SMALL>"+_StrNormalData+"</font>");

					_StrUnderlineData=_Target1.Mid(_pos0+1,_pos1-_pos0-1);
					//printf("Underline:["+_StrUnderlineData+"]");

					_StrIDData=_Target1.Mid(_pos2+1,_pos3-_pos2-1);
					//printf("ID:["+_StrIDData+"]");
					BODY.appendHtml("<VTarget_UI SetSrc("+_StrUnderlineData+") SetData("+_StrIDData+") SetData1("+_Target1+")></VTarget_UI>");

					_NormalIndex=_pos1+1;
					_UnderlineIndex=_pos1+1;

					_IDIndex=_pos3+1;
				}

				BODY.appendHtml("<br>");
		}
	}
	//任务目标部分
	staticvar s_TaskTargetIcon = new VTaskTarget_UI
	{
		size = "60,15";
		left = parent.s_TaskDecIcon.left;
		top = parent._centent.top + parent._centent.height +5;
	}
	//任务目标
	var _target = new iframe
	{
		left = parent.s_TaskTargetIcon.left + 5;
		top = parent.s_TaskTargetIcon.top + parent.s_TaskTargetIcon.height+3;
		size = "100%,12%,-14,0";
		scroll = window.SCROLL_NOTENNIS;
		src = "$./lrtask.htm";
		
		void SetData1(_Target1)
		{
			BODY.delallchild();
//			if (_Target1 != "" || _Target2 != "")
//			{
//				BODY.appendHtml("<VContentCutLine></VContentCutLine>");
//				BODY.appendHtml("<VTaskTarget_UI></VTaskTarget_UI><br>");
//			}
			if(_Target1 != "")
			{
				BODY.appendHtml("<font class=TASK_SMALL>&nbsp&nbsp</font>");
				var _NormalIndex=0;
				var _UnderlineIndex=0;
				var _IDIndex=0;

				var _StrNormalData="";
				var _StrUnderlineData="";
				var _StrIDData="";
				while(true)
				{
					var _pos0=_Target1.Find("@",_UnderlineIndex);
					var _pos1=_Target1.Find("@",_pos0+1);
					if (_pos0<0 ||_pos1<0)
					{
						_StrNormalData=_Target1.Mid(_IDIndex,_Target1.Count-_IDIndex);
						if (_StrNormalData.Count>0)
						{
							//printf("Normal:["+_StrNormalData+"]");
							BODY.appendHtml("<font class=TASK_SMALL>"+_StrNormalData+"</font>");
						}
						break;
					}

					var _pos2=_Target1.Find("|",_IDIndex);
					var _pos3=_Target1.Find("|",_pos2+1);

					_StrNormalData=_Target1.Mid(_IDIndex,_pos0-_IDIndex);
					//printf("Normal:["+_StrNormalData+"]");
					BODY.appendHtml("<font class=TASK_SMALL>"+_StrNormalData+"</font>");

					_StrUnderlineData=_Target1.Mid(_pos0+1,_pos1-_pos0-1);
					//printf("Underline:["+_StrUnderlineData+"]");

					_StrIDData=_Target1.Mid(_pos2+1,_pos3-_pos2-1);
					//printf("ID:["+_StrIDData+"]");
					BODY.appendHtml("<VTarget_UI SetSrc("+_StrUnderlineData+") SetData("+_StrIDData+") SetData1("+_Target1+")></VTarget_UI>");

					_NormalIndex=_pos1+1;
					_UnderlineIndex=_pos1+1;

					_IDIndex=_pos3+1;
				}
				BODY.appendHtml("<br>");
				//BODY.appendHtml("<font class=TASK_SMALL>&nbsp&nbsp"+_Target1+"</font><br>");
			}
		}
		void SetData2(_Target2)
		{
			//alert("_Target2="+_Target2);	// _Target2=-@猛犸象王@|-1|,@小骨块@|-1|&nbsp0/201
			if(_Target2 != "")
			{
				
				BODY.appendHtml("<font class=TASK_SMALL>&nbsp&nbsp</font>");
				var _NormalIndex=0;
				var _UnderlineIndex=0;
				var _IDIndex=0;

				var _StrNormalData="";
				var _num1 = 0;
				var _num2 = 0;
				var _strTarget = "";
				var _StrUnderlineData="";
				var _StrIDData="";
				while(true)
				{
					var _pos0=_Target2.Find("@",_UnderlineIndex);
					var _pos1=_Target2.Find("@",_pos0+1);
					if (_pos0<0 ||_pos1<0)
					{
						_StrNormalData=_Target2.Mid(_IDIndex,_Target2.Count-_IDIndex);
						if (_StrNormalData.Count>0)
						{
							//alert("0Normal:["+_StrNormalData+"]");
							var _xgPos = _StrNormalData.Find("/",0);
							var _num1Pos = _StrNormalData.Find("&nbsp",0)+5;
							_num1 = _StrNormalData.Mid(_num1Pos,_xgPos-_num1Pos);
							_num2 = _StrNormalData.Mid(_xgPos+1,_StrNormalData.Count-_xgPos-1);
							_strTarget = _StrNormalData.Mid(_IDIndex,_xgPos-_num1.Count);
							if(toint(_num1) > toint(_num2))
							{
								_num1 = _num2;
							}
							BODY.appendHtml("<font class=TASK_SMALL>"+_strTarget+_num1+"/"+_num2+"</font>");
						}
						break;
					}

					var _pos2=_Target2.Find("|",_IDIndex);
					var _pos3=_Target2.Find("|",_pos2+1);

					_StrNormalData=_Target2.Mid(_IDIndex,_pos0-_IDIndex);
					//alert("1Normal:["+_StrNormalData+"]");
					BODY.appendHtml("<font class=TASK_SMALL>"+_StrNormalData+"</font>");

					_StrUnderlineData=_Target2.Mid(_pos0+1,_pos1-_pos0-1);
					//printf("Underline:["+_StrUnderlineData+"]");

					_StrIDData=_Target2.Mid(_pos2+1,_pos3-_pos2-1);
					//printf("ID:["+_StrIDData+"]");
					BODY.appendHtml("<VTarget_UI SetSrc("+_StrUnderlineData+") SetData("+_StrIDData+") SetData1("+_Target1+")></VTarget_UI>");

					_NormalIndex=_pos1+1;
					_UnderlineIndex=_pos1+1;

					_IDIndex=_pos3+1;
				}

				BODY.appendHtml("<br>");
				//BODY.appendHtml("<font class=TASK_SMALL>&nbsp&nbsp"+_Target2+"</font><br>");
			}
		}
	}

	//任务奖励
	staticvar s_TaskPremium = new VPic9_BK2_UI
	{
		//bgcolor = "#ff0000";
		left = parent.s_Taskdes.left;
		top = parent.s_Taskdes.top + parent.s_Taskdes.height + 5;
		size = "99%,56%";
	}
	//任务奖励 字
	staticvar s_TaskPremiumIcon = new VTaskPrize_UI
	{
		size = "60,15";
		left = parent.s_TaskPremium.left+7;
		top = parent.s_TaskPremium.top+7;
	}
	//亲密度奖励 字
	staticvar s_PrizeQingMi = new VPrizeQingMi_UI
	{
		left = parent.s_TaskPremiumIcon.left;
		top = parent.s_TaskPremiumIcon.top + parent.s_TaskPremiumIcon.height +7;
	}
	//亲密度奖励 内容
	staticvar s_PrizeQingMiText = new s_PrizeQingMiText
	{show = false;
		left = parent.s_PrizeQingMi.left + parent.s_PrizeQingMi.width+3;
		top = parent.s_PrizeQingMi.top;
	}
	//金钱奖励 字
	staticvar s_PrizeMoney = new VPrizeMoney_UI
	{
		left = parent.s_TaskPremiumIcon.left;
		top = parent.s_TaskPremiumIcon.top + parent.s_TaskPremiumIcon.height +7;
	}
	//金钱奖励 内容
	staticvar s_PrizeMoneyText = new s_PrizeMoneyText
	{
		left = parent.s_PrizeMoney.left + parent.s_PrizeMoney.width+3;
		top = parent.s_PrizeMoney.top;
	}
	//点券奖励
	staticvar s_PrizeDJ = new VPrizeDJ_UI
	{
		show = false;
		left = parent.s_TaskPremiumIcon.left;
		top = parent.s_TaskPremiumIcon.top + parent.s_TaskPremiumIcon.height +7;
	}
	staticvar s_PrizeDJText = new s_PrizeDJText
	{
		show = false;
		left = parent.s_PrizeDJ.left + parent.s_PrizeDJ.width+3;
		top = parent.s_PrizeDJ.top;
	}
	//经验奖励
	staticvar s_PrizeExp = new VPrizeExp_UI
	{
		left = parent.s_PrizeMoneyText.left + parent.s_PrizeMoneyText.width + 3;;
		top = parent.s_PrizeMoneyText.top;
		
	}
	staticvar s_PrizeExpText = new s_PrizeExpText
	{
		left = parent.s_PrizeExp.left + parent.s_PrizeExp.width+3;
		top = parent.s_PrizeExp.top;
	}
	//贡献点奖励
	staticvar s_PrizeContribute = new VTaskContribute_UI
	{
		show = false;
		left = parent.s_TaskPremiumIcon.left;
		top = parent.s_TaskPremiumIcon.top + parent.s_TaskPremiumIcon.height +7;
	}
	staticvar s_PrizeContributeText = new TaskContributeText
	{
		show = false;
		left = parent.s_PrizeContribute.left + parent.s_PrizeContribute.width+3;
		top = parent.s_PrizeContribute.top;
	}
	//物品奖励
	staticvar s_TaskPre1 = new VIconMgr_Logic
	{
		name="s_TaskPre1";show = false;
		size = "119,145";
		left = parent.s_PrizeMoney.left-3;
		top = parent.s_PrizeMoney.top+parent.s_PrizeMoney.height+5;
		SetHangType(ICON_DEFAUIT);
	}
	staticvar s_TaskPre2 = new VIconMgr_Logic
	{
		name="s_TaskPre2";show = false;
		size =  "119,145";
		left = parent.s_TaskPre1.left+parent.s_TaskPre1.width-5;
//				width = parent.s_TaskPremium.width/3-3;
		top = parent.s_PrizeMoney.top+parent.s_PrizeMoney.height+5;
		SetHangType(ICON_DEFAUIT);
	}
	staticvar s_TaskPre3 = new VIconMgr_Logic
	{
		name="s_TaskPre3";show = false;
		size =  "119,145";
		left = parent.s_TaskPre2.left+parent.s_TaskPre2.width-7;
		top = parent.s_PrizeMoney.top+parent.s_PrizeMoney.height+5;
//				width = parent.s_TaskPremium.width/3-3;
		SetHangType(ICON_DEFAUIT);
	}
	
	staticvar _oritemmgr = new VPrizeMgr_UI{};
//	//任务奖励
//	var _prize = new iframe
//	{
//		left = parent.s_TaskPremiumIcon.left +5;
//		top = parent.s_TaskPremiumIcon.top + parent.s_TaskPremiumIcon.height + 5;
//		src = "$./lrtask.htm";size = "100%,108";//bgcolor = "#FF0000";alpha = 50;
//		void SetData(_Money,_Exp,_AndItemStr,_OrItemStr)
//		{
//			//alert(_AndItemStr+","+_OrItemStr);
//			BODY.delallchild();
//			BODY.appendHtml("<VContentCutLine></VContentCutLine>");
//			BODY.appendHtml("<VTaskPrize_UI></VTaskPrize_UI><br>");
//			BODY.appendHtml("<VPrizeMoney_UI SetData("+_Money+")></VPrizeMoney_UI>");
//			BODY.appendHtml("<font class=TASK_SMALL>&nbsp&nbsp经验奖励：</font>");
//			BODY.appendHtml("<font class=TASK_SMALL_BORDER>"+_Exp+"</font><br>");
//			BODY.appendHtml("<VPrizeMgr_UI SetSelectState(0) SetRowNum(3) SetData("+_AndItemStr+")></VPrizeMgr_UI>");//物品奖励类
//			BODY.appendHtml("<VPrizeMgr_UI SetSelectState(1) SetRowNum(3) SetData("+_OrItemStr+")></VPrizeMgr_UI>");//可选物品奖励类
//			BODY.starttypeset();
//			var _height = BODY.DocumentHeight;
//			size = "100%,"+_height;
//		}
//		void SetSelect(data)
//		{
//			parent.SetSelect(data);
//		}
//	}

	void SetPageKind(data)
	{
		s_pageKind = data;
		if(s_pageKind == 2)
		{
			s_PrizeContribute.show = false;
			s_PrizeContributeText.show = false;
			s_PrizeQingMi.show = true;
			s_PrizeQingMiText.show = true;
			s_PrizeMoney.show = false;
			s_PrizeMoneyText.show = false;
			s_PrizeDJ.show = false;
			s_PrizeDJText.show = false;
			s_PrizeExp.show = false;
			s_PrizeExpText.show = false;			
		}
		if(s_pageKind == 1)
		{
			s_PrizeContribute.show = true;
			s_PrizeContributeText.show = true;
			s_PrizeQingMi.show = false;
			s_PrizeQingMiText.show = false;
			s_PrizeMoney.show = false;
			s_PrizeMoneyText.show = false;
			s_PrizeDJ.show = false;
			s_PrizeDJText.show = false;
			s_PrizeExp.show = false;
			s_PrizeExpText.show = false;
			
		}
		if(s_pageKind == 0)
		{
			s_PrizeContribute.show = false;
			s_PrizeContributeText.show = false;
			s_PrizeQingMi.show = false;
			s_PrizeQingMiText.show = false;
			s_PrizeMoney.show = true;
			s_PrizeMoneyText.show = true;
			s_PrizeDJ.show = false;
			s_PrizeDJText.show = false;
			s_PrizeExp.show = true;
			s_PrizeExpText.show = true;
		}
	}

	void ClearData()
	{
		_centent.BODY.delallchild();
		_target.BODY.delallchild();
		//_prize.BODY.delallchild();
		s_PrizeQingMiText.show = false;
		s_PrizeMoneyText.show = false;
		s_PrizeDJText.show = false;
		s_PrizeExpText.show = false;
		s_TaskPre1.SetTaskIconEx(-1,0,0);
		s_TaskPre2.SetTaskIconEx(-1,0,0);
		s_TaskPre3.SetTaskIconEx(-1,0,0);
	}
	//_AndItemStr:同时获得的物品 _OrItemStr:需要选择获得的物品
	void SetData(_TaskName,_Content,_Target1,_Target2,_Money,_Exp,_AndItemStr,_OrItemStr,_quan,_contributePoint,_lover)//
	{
		show = false;
		printf("_TaskName:"+_TaskName+",_Content:"+_Content+",_Target1:"+_Target1+",_Target2:"+_Target2+",_Money:"+_Money+",_Exp:"+_Exp+",_AndItemStr:"+_AndItemStr+",_OrItemStr:"+_OrItemStr+",_quan:"+_quan+",_contributePoint:"+_contributePoint);
		ClearData();
		scrollto(0,0);
		//=============================任务描述===================================
		_centent.SetData(_Content);
		//=============================任务目标==================================
		_target.SetData1(_Target1);
		//_target.SetData2(_Target2);
		window.g_CTennisUIInit._target(_target,_Target2);
		//=============================任务奖励==================================
		//_prize.SetData(_Money,_Exp,_AndItemStr,_OrItemStr);
		if(s_pageKind == 2)
		{
			s_PrizeContribute.show = false;
			s_PrizeContributeText.show = false;
			s_PrizeQingMi.show = true;			//add by chenjihui:亲密度UI
			s_PrizeQingMiText.show = true;		//add by chenjihui:亲密度值显示
			s_PrizeMoney.show = false;
			s_PrizeMoneyText.show = false;
			s_PrizeDJ.show = false;
			s_PrizeDJText.show = false;
			s_PrizeExp.show = false;
			s_PrizeExpText.show = false;
			s_PrizeQingMiText.SetData(_lover);	//add by chenjihui:
		}
		if(s_pageKind == 1)
		{
			s_PrizeContribute.show = true;
			s_PrizeContributeText.show = true;
			s_PrizeContributeText.SetData(_contributePoint);
			s_PrizeMoney.show = false;
			s_PrizeMoneyText.show = false;
			s_PrizeDJ.show = false;
			s_PrizeDJText.show = false;
			s_PrizeExp.show = false;
			s_PrizeExpText.show = false;
			
		}
		if(s_pageKind == 0)
		{
			s_PrizeContribute.show = false;
			s_PrizeContributeText.show = false;
			if (_quan != 0 && _quan != "" && _Money!= 0 && _Money!= "")
			{
				s_PrizeExp.show = false;
				s_PrizeExpText.show = false;
				s_PrizeMoney.show = true;
				s_PrizeMoneyText.show = true;
				s_PrizeMoneyText.SetData(_Money);
				s_PrizeDJ.show = true;
				s_PrizeDJText.show = true;
				s_PrizeDJ.left = s_PrizeMoneyText.left + s_PrizeMoneyText.width+3;
				s_PrizeDJ.top = s_PrizeMoneyText.top;
				s_PrizeDJText.left = s_PrizeDJ.left + s_PrizeDJ.width+3;
				s_PrizeDJText.top = s_PrizeDJ.top;
				s_PrizeDJText.SetData(_quan);
			}
			else
			{
				if(_quan != 0 && _quan != "")
				{
					s_PrizeMoney.show = false;
					s_PrizeMoneyText.show = false;
					s_PrizeDJ.show = true;
					s_PrizeDJText.show = true;
					s_PrizeDJText.SetData(_quan);
				}
				else
				{
					s_PrizeDJ.show = false;
					s_PrizeDJText.show = false;
					s_PrizeMoney.show = true;
					s_PrizeMoneyText.show = true;
					s_PrizeMoneyText.SetData(_Money);
				}
				s_PrizeExp.show = true;
				s_PrizeExpText.show = true;
				s_PrizeExpText.SetData(_Exp);
			}
		}
		

		s_TaskPre1.show = false;
		s_TaskPre2.show = false;
		s_TaskPre3.show = false;
		if(_AndItemStr != "" && _AndItemStr != 0)
		{
			_centent.left = s_TaskDecIcon.left+5;
			_centent.top = s_TaskDecIcon.top + s_TaskDecIcon.height+5;
			s_TaskTargetIcon.left = s_TaskDecIcon.left;
			s_TaskTargetIcon.top = _centent.top + _centent.height +3;
			_target.left = s_TaskTargetIcon.left + 5;
			_target.top = s_TaskTargetIcon.top + s_TaskTargetIcon.height + 5;
			s_TaskPremium.left = s_Taskdes.left;
			s_TaskPremium.top = s_Taskdes.top + s_Taskdes.height + 5;
			s_TaskPremiumIcon.left = s_TaskPremium.left+7;
			s_TaskPremiumIcon.top = s_TaskPremium.top+7;
			s_PrizeMoney.left = s_TaskPremiumIcon.left;
			s_PrizeMoney.top = s_TaskPremiumIcon.top + s_TaskPremiumIcon.height +7;
			s_PrizeMoneyText.left = s_PrizeMoney.left + s_PrizeMoney.width+3;
			s_PrizeMoneyText.top = s_PrizeMoney.top;
			s_PrizeDJ.left = s_TaskPremiumIcon.left;
			s_PrizeDJ.top = s_TaskPremiumIcon.top + s_TaskPremiumIcon.height +7;
			s_PrizeDJText.left = s_PrizeMoney.left + s_PrizeMoney.width+3;
			s_PrizeDJText.top = s_PrizeMoney.top;
			s_PrizeExp.left = s_PrizeMoneyText.left + s_PrizeMoneyText.width + 3;;
			s_PrizeExp.top = s_PrizeMoneyText.top;
			s_PrizeExpText.left = s_PrizeExp.left + s_PrizeExp.width+3;
			s_PrizeExpText.top = s_PrizeExp.top;
			//s_TaskPre1.show = true;
			s_TaskPre1.left = s_PrizeMoney.left-3;
			s_TaskPre1.top = s_PrizeMoney.top+s_PrizeMoney.height+3;
			//s_TaskPre2.show = true;
			s_TaskPre2.left = s_TaskPre1.left+s_TaskPre1.width-5;
			s_TaskPre2.top = s_PrizeMoney.top+s_PrizeMoney.height+3;
			//s_TaskPre3.show = true;
			s_TaskPre3.left = s_TaskPre2.left+s_TaskPre2.width-7;
			s_TaskPre3.top = s_PrizeMoney.top+s_PrizeMoney.height+3;
			_oritemmgr.SetData(_AndItemStr);
		}
		show = true;
	}
};



//任务奖励 字
class VTaskPrize_UI imgm
{
	src = "$./imgs"+window.g_Sex+"/rwjl-text.tga";
};

//任务目标 字
class VTaskTarget_UI imgm
{
	src = "$./imgs"+window.g_Sex+"/rwmb-text.tga";
};

//任务描述 字
class VTaskDescribe_UI imgm
{
	size = "64,15";
	src = "$./imgs"+window.g_Sex+"/rwms-text.tga";
};

//author:  chenjihui
//data:    2010-12-16

//亲密度奖励
class VPrizeQingMi_UI imgm
{
	//size = "60,15";
	src = "$./imgs"+window.g_Sex+"/qmjl-text.tga";
	var _lover = new item{};
	void SetData(data)
	{
		_lover.SetData(data);
	}
};
//亲密度奖励 字
class s_PrizeQingMiText text
{
	size = "100,15";
	void SetData(data)
	{
		src = ""+data;
	}
};
//金钱奖励
class VPrizeMoney_UI imgm
{
	//size = "60,15";
	src = "$./imgs"+window.g_Sex+"/jbjl-test.tga";
	var _money = new item{};//VMoneyCtrlEx_UI{pos="77,0";}
	void SetData(data)
	{
		_money.SetData(data);
	}
};
//金钱奖励 字
class s_PrizeMoneyText text
{
	size = "100,15";
	void SetData(data)
	{
		src = ""+data;
	}
};

//点卷奖励
class VPrizeDJ_UI imgm
{
	//size = "60,15";
	src = "$./imgs"+window.g_Sex+"/dqjl-text.tga";
	var _money = new item{};//VMoneyCtrlEx_UI{pos="77,0";}
	void SetData(data)
	{
		_money.SetData(data);
	}
};
//点卷奖励 字
class s_PrizeDJText text
{
	size = "100,15";
	void SetData(data)
	{
		src = ""+data;
	}
};

//经验奖励
class VPrizeExp_UI imgm
{
	//size = "60,15";
	src = "$./imgs"+window.g_Sex+"/jyjl-text.tga";
	var _money = new item{};//VMoneyCtrlEx_UI{pos="77,0";}
	void SetData(data)
	{
		_money.SetData(data);
	}
};
//经验奖励 字
class s_PrizeExpText text
{
	size = "100,15";
	void SetData(data)
	{
		src = ""+data;
	}
};

//贡献点
class VTaskContribute_UI imgm
{
	//size = "60,15";
	src = "$./imgs"+window.g_Sex+"/gxd-text.tga";
}
//贡献点 字
class TaskContributeText text
{
	size = "100,15";
	void SetData(data)
	{
		src = ""+data;
	}
};

//物品奖励字
class VItemPrizeText_UI text
{
	pos = "15,0";size = "80,16";InitColorType(2);src = "物品奖励：";ycenter = true;font="宋体,-1,12";
	void SetData(data)
	{
		if(data==0){src = "物品奖励：";}
		else{src = "可选物品奖励：";}
	}
};
//物品奖励 一个物品
/*class VItemPrize_UI VMaterialIconBG_UI
{
	size = "151,44";
	var _icon = new VTaskPrizeIcon{size = "44,44";}
	var _Name = new bordertext
	{
		size = "104,100%";pos = "45,0";color="#a39274";xcenter = true;ycenter = true;
		//valign(0,0);halign(0,100);
		void SetData(ID)
		{
			src = ID;
		}
	}
	void SetNum(data)
	{
		_icon.SetPrizeNum(data);
	}
	void SetId(data)
	{
		_icon.SetId(data);
		_Name.src = _icon.s_Name.src;
	}
};
//可选物品奖励
class VItemPrize_Select_UI VItemPrize_UI
{
	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_bk.src = "$./../PublicRes/UI/bk_itemSelected.tga";}
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_bk.src = "$./../PublicRes/UI/bk_Item2.tga";}
	}
	void OnMouseDownL()
	{
		parent.scriptprcallsub("OnMyUnSelect");
		OnMySelect();
		parent.parent.parent.parent.SetSelect(GetId());
	}
	//选择的效果
	void OnMySelect()
	{
		_bk.src = "$./../PublicRes/UI/bk_itemSelected.tga";
		_SelectState = true;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		_bk.src = "$./../PublicRes/UI/bk_Item2.tga";
		_SelectState = false;
	}
	void GetId()
	{
		return _icon.m_EntryID;
	}
};*/
//奖励物品管理类
class VPrizeMgr_UI item
{
	var m_OneRowNum = 1;//一行显示的物品数量
	var m_bCanSelect = 0;//是否可选 1是 0否
	void SetSelectState(data)//设置是否可选
	{
//		alert("SetSelectState");
		m_bCanSelect = toint(data);
	}
	void GetOneItemWidth(){return 151;}//一个物品宽度+间隔
	void GetOneItemheight(){return 46;}//一个物品高度+间隔
	void SetRowNum(data)//设置一行显示的物品数
	{
		m_OneRowNum = toint(data);
	}
	void SetData(_ItemStr)
	{
		parent.find("s_TaskPre1").SetTaskIconEx(-1,0,0);
		parent.find("s_TaskPre2").SetTaskIconEx(-1,0,0);
		parent.find("s_TaskPre3").SetTaskIconEx(-1,0,0);

		var _strNum = window.GetSplitCount(_ItemStr,":");//alert(_strNum);
		if(_strNum>=2)
		{
			var _itemArr = window.SplitStr2(_ItemStr,":",_strNum);
			var _index = 0;
			//至少一个物品
			if(toint(_strNum)>1)
			{
				//staticvar s_text = new VItemPrizeText_UI{}//字
				var _widthIndex = 0;
				var _heightIndex = 0;
				var _szVML;
				var i=1;
				while(_strNum>0)
				{
					parent.find("s_TaskPre"+i).show=true;
					parent.find("s_TaskPre"+i).SetTaskIconEx(_itemArr[_index],1,_itemArr[_index+1]);
					i+=1;
					_strNum-=2;
					_index+=2;
					/*if(m_bCanSelect==1){_szVML ="new VItemPrize_Select_UI{";s_text.SetData(1);}
					else{_szVML ="new VItemPrize_UI{";s_text.SetData(0);}
					_szVML = _szVML + "SetNum("+_itemArr[_index+1]+");";
					_szVML = _szVML + "SetId("+_itemArr[_index]+");";
					_widthIndex = toint((_index/2)%m_OneRowNum);	//得到横着第几个
					_heightIndex = toint((_index/2)/m_OneRowNum);	//得到竖着第几个
//					alert(""+_widthIndex+","+_heightIndex);
					_szVML = _szVML + "pos("+(_widthIndex*GetOneItemWidth()+15)+","+(_heightIndex*GetOneItemheight()+16)+");";
					_szVML = _szVML + "};";
					vml(_szVML);
					_strNum-=2;
					_index+=2;*/
				}
				size(m_OneRowNum*GetOneItemWidth()+15,(_heightIndex+1)*GetOneItemheight()+16);
			}
		}
	}
};
//可点的text类
class VTarget_UI text
{
//	capturemouse = true;
	size = "250,16";color = "#FF0000";ycenter = true;drawstarty=1;txtunderline=1;font="宋体,-1,12";
//	bgcolor = "#FF0000";alpha = 50;
	var _id = 0;
	var _TargetDes;
	var _pop = 0;
	void SetSrc(data)
	{
		src = data;size(src.Count*6,16);
	}
	void OnMouseOver()
	{
		color = "#9E2527";cursor = "click.ani";
	}
	void OnMouseOut()
	{
		color = "#FF0000";cursor = "cursor.ani";
	}
	void OnMouseDownL()
	{
		color = "#9E2527";
		MouseLDownFunc();
	}
	void OnLBDClick()
	{
		color = "#9E2527";
		MouseLDownFunc();
	}
	void OnMouseDownR()
	{
		color = "#9E2527";
		MouseRDownFunc();
	}
	void SetData(data)
	{
		_id = data;
	}
	void SetData1(TargetDes)
	{
		_TargetDes=TargetDes;
	}
	void SetPop(pop)
	{
		_pop = pop;
	}
	//在下面干事情
	//左键点
	void MouseLDownFunc()
	{
		/*if (_id<0)
		{
			if(toint(_pop)==1)
			{
				//弹出小框
				set window.find("HANGMSGLAYER")
				{
					find("TaskFollowPop").del();
					//new TaskFollowPop{};
				}
			}
			window.find("TaskFollowPop").Init(_TargetDes , window.mousex , window.mousey);
			return;
		}
		if (_id.Mid(0,1)=="m")
		{
			window.AutoOpenFB(_id.Mid(1,_id.Count-1));
			return;
		}
		if( _id.Mid(0,1)=="p" )
		{
			var _pos = _id.Mid(1,_id.Count-1);
			var _arr = window.SplitStr2(_pos,"#",3);
			window.AutoPath( _arr[0], _arr[1], _arr[2] );
			return;
		}
		window.AutoPathFNpc(_id);*/
		if(0>_id)
		{
			return;
		}
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.GAMEUI,window.TASKSCRIPT,window.GAMEUI_TASKSCRIPT_ID,_id);
		if (_VNet2DBRow.IsReady())
		{
			vml(_VNet2DBRow.GetData(window.GAMEUI_TASKSCRIPT_CONTENT));
		}
		_VNet2DBRow.del();
		//vml(_id);

	}
	//右键点
	void MouseRDownFunc()
	{
		
	}
};

class VContentCutLine imgm
{
	src = "$./imgs/DivideLine.tga";size = "500,6";
};


<END>
/*
class VTask_TaskContent_UI iframe
{
	scroll = "no;lierenscroll";
	src = "$./lrtask.htm";
	void ClearData()
	{
		BODY.delallchild();
	}
	//_AndItemStr:同时获得的物品 _OrItemStr:需要选择获得的物品
	void SetData(_TaskName,_Content,_Target1,_Target2,_Money,_Exp,_AndItemStr)//,_OrItemStr
	{
	//	alert("_TaskName:"+_TaskName+",_Content:"+_Content+",_Target1:"+_Target1+",_Target2:"+_Target2+",_Money:"+_Money+",_Exp:"+_Exp+",_AndItemStr:"+_AndItemStr);
		BODY.delallchild();
		BODY.scrollto(0,0);
		BODY.appendHtml("<VText_Big SetData("+_TaskName+")></VText_Big><br>");
//		BODY.appendHtml("<VTask_Text SetData("+_Content+","+_Width+")></VTask_Text><br>");
		BODY.appendHtml("<VTask_Text SetData("+_Content+")></VTask_Text><br>");
		if (_Target1 != "" || _Target2 != ""){BODY.appendHtml("<VText_Middle_B SetData(任务目标)></VText_Middle_B><br>");}
//		BODY.appendHtml("<VTask_Text SetData("+_Target+","+_Width+")></VTask_Text><br>");
		if(_Target1 != ""){BODY.appendHtml("<VTask_Text SetData("+_Target1+")></VTask_Text><br>");}
		if(_Target2 != ""){BODY.appendHtml("<VTask_Text SetData("+_Target2+")></VTask_Text><br>");}
		BODY.appendHtml("<VText_Middle_B SetData(任务奖励)></VText_Middle_B><br>");
		BODY.appendHtml("<VText_Middle_A SetData(金钱：)></VText_Middle_A>");
		BODY.appendHtml("<VMoneyCtrl_UI SetData("+_Money+")></VMoneyCtrl_UI><br>");
		BODY.appendHtml("<VText_Middle_A SetData(经验：)></VText_Middle_A>");
		BODY.appendHtml("<VText_Middle_A SetData("+_Exp+")></VText_Middle_A><br>");
		var _AndStrNum = 0;
		_AndStrNum = window.GetSplitCount(_AndItemStr,":");
//		alert("_AndItemStr="+_AndItemStr+" , _AndStrNum="+_AndStrNum);
		if(_AndStrNum<2){return;}//没有物品就return
		//有一个物品
		BODY.appendHtml("<VText_Middle_A SetData(奖励：)></VText_Middle_A><br>");
		var _arr1 = window.SplitStr2(_AndItemStr,":",_AndStrNum);
//		alert("_arr[0]:"+_arr[0]+",_arr[1]:"+_arr[1])
		BODY.appendHtml("<VTaskPrizeIcon SetNum("+_arr1[1]+") SetId("+_arr1[0]+")></VTaskPrizeIcon>");
//		BODY.appendHtml("<VTaskPrizeIcon SetNum("+5+") SetId("+1010002+")></VTaskPrizeIcon>");
		var _index = 2;
		//大于一个物品
		if(toint(_AndStrNum)>3)
		{
			_AndStrNum -= 2;
			while(_AndStrNum>0)
			{
//				alert("_AndStrNum:"+_AndStrNum);
				BODY.appendHtml("<VText_Small SetData(和)></VText_Small>");
//				alert("_arr[_index]:"+_arr[_index]+",arr[_index+1]:"+_arr[_index+1]);
				BODY.appendHtml("<VTaskPrizeIcon SetNum("+_arr1[_index+1]+") SetId("+_arr1[_index]+")></VTaskPrizeIcon>");
//				BODY.appendHtml("<VTaskPrizeIcon SetNum("+5+") SetId("+1010002+")></VTaskPrizeIcon>");
				_AndStrNum-=2;
				_index+=2;
			}
		}
	}
};


class VText_Big text
{
//	size="100%,18";bgcolor = "#FF";
	font= ",-1,18";color = "#804020";bold = true;yspace=4;
	void SetData(data)
	{
		src = data;
	}
};
class VText_Middle_A text
{
//	size="100%,16";
//	bgcolor = "#FFFF";
	font= ",-1,16";color = "#804020";yspace=3;
	void SetData(data)
	{
		src = data;
	}
};
class VText_Middle_B text
{
//	size="100%,16";
//	bgcolor = "#FFFF";
	font= ",-1,16";color = "#804020";bold = true;yspace=3;
	void SetData(data)
	{
		src = data;
	}
};
class VText_Small text
{
//	size="100%,14";
//	bgcolor = "#FFFFFF";
	font= ",-1,14";color = "#804020";yspace=3;
	void SetData(data)
	{
		src = data;
	}
};

class VTask_Text VText_Small
{
//	bgcolor = "#FF";
	size(268,14);
	autoenter = true;
	autoheight=true;
//	void SetData(data,_width)
//	{
//		src = data;alert("data:"+data+",_width:"+_width);
//	}
	void SetData(data)
	{
		src = data;
	}
};
*/