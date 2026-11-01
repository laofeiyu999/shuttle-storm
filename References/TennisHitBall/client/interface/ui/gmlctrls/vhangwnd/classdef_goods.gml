//
//物品和技能悬停类定义-显示
//夏洋洋 修改
//2009-11-19
importex("$./../VPopWnd/ClassDef.gml");

class VGoodHangWnd_UI item
{
	var _explain = "";bgcolor = -1;alpha = 0;
	var _count = 0;//用来计算行数
	
	void Init()
	{
		size(200,400);
		
		//所有内容的容器
		//参数1 _name :物品的名称
		//参数2 lv :物品的等级
		//参数3_AttValue ：物品的属性，负数(-) 0(不显示) 正数(+)，按顺序包括：力量，技巧，前场，后场，发球，能量
		//参数4 equipLv	 :物品的装备所需等级
		//参数5 explain :物品的说明
		//参数6 opt	 :物品的操作,-1为不操作
		//参数7 FrontEnergy	:技能进攻所需能量（0不显示此项 - 技能图标才有）
		//参数8 BackEnergy		:技能防守所需能量（0不显示此项 - 技能图标才有）
		//参数9 TimeAll		:物品总有效期 （0永久有效 -1不显示 礼品盒里有效期）
		//参数10 TimeLeft		:物品剩余时间（-2不显示 -1永久有效 0小于1天 背包里剩余时间，单位秒）
		//参数11 quarter		:已镶嵌的上旋技能名称（""不显示此项）
		//参数12 Chip			:已镶嵌的削球技能名称（""不显示此项）
		//参数13 Kill_shot		:已镶嵌的扣杀技能名称（""不显示此项）
		//参数14 HighBall		:已镶嵌的放高球技能名称（""不显示此项）
		//参数15 _Serve			:已镶嵌的发球技能名称（""不显示此项）
		//参数16 _skillClasss	:技能操作说明(类型索引)
		//参数17 _strengthLv :力量型选手所需等级			夏洋洋添加 于2009-11-19
		//参数18 _agilityLv :敏捷型选手所需登记 			夏洋洋添加 于2009-11-19
		//参数19 _BuyPrice :购买服装、美容、饰品、球拍所需的各个状态下的点券数			夏洋洋添加于2009-11-20
		//参数20 _SkillSubNum ：技能数量（0不显示此项 - 技能图标才有）
		//参数21 _BuyDays ：购买服装、美容、饰品、球拍的天数
		//参数22 _VipBuyAgio : vip折扣
		//参数23 _ShowTime; 需要显示的时间
		//参数24 _ShowNum  显示物品剩余数量(限量物品), -1:不用此参数 0:物品已停止售卖, >0:显示数量
		//参数25 _arrDayVIP VIP物品时长数组, 永久, 7天 15天
		//参数26 _arrSize  VIP的价格数组长度
		//参数27 _arrPriceVIP 显示VIP价格数组与参数25对应 
		//参数28 _TPriceTypeVIP 价格类型
		//参数29 _BuyPriceType 普通玩家价格类型
		staticvar s_html = new html
		{
			//鼠标悬停背景
			var _hangBK = new VPic9_HandWnd_UI
			{
				SetSize(200,300);
			}
			var _body = new body{}
			
			void SetData(_name,lv,_AttValue,equipLv,explain,opt
				FrontEnergy,BackEnergy,TimeAll,TimeLeft,quarter,Chip,Kill_shot,HighBall,_Serve,
				_skillClass,_strengthLv,_agilityLv,_BuyPrice,_SkillSubNum,_BuyDays,_VipBuyAgio, 
				_ShowTime, _ShowNum, _arrDayVIP, _arrSize, _arrPriceVIP, _TPriceTypeVIP, _BuyPriceType)
			{
				parent._explain = explain;
				
				printf("Html:_name:"+_name+",lv:"+lv+",strength:"+strength+",skill:"+skill
					+",front:"+front+",behind:"+behind+",serve:"+serve+",energy:"+energy
					+",equipLv:"+equipLv+",explain:"+explain+",opt:"+opt
					+",FrontEnergy:"+FrontEnergy+",BackEnergy："+BackEnergy+",TimeAll:"+TimeAll+",TimeLeft:"+TimeLeft
					+",quarter:"+quarter+",Chip:"+Chip+",Kill_shot:"+Kill_shot+",HighBall:"+HighBall+",_Serve:"+_Serve
					+",skillClass:"+_skillClass);
		
				
//				if(toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill)
//				{
//					_body.appendHtml("<font color=#fffc00 size=12px>"+_name+"<br><br></font>");
//					parent._count=parent._count+2;
//				}
//				else
//				{
//					_body.appendHtml("<font color=#fffc00 size=12px>"+_name+"<br><br></font>");
//					parent._count=parent._count+2;
//				}
				_body.appendHtml("<font color=#000000 size=12px>"+_name+"<br><br></font>");
				parent._count=parent._count+2;

				// 显示物品期限, (段晓彤)
				if (_ShowTime != "")// 如果有显示信息
				{
					_body.appendHtml("<font color=#000000 size=12px>" + _ShowTime + "<br></font>");
		
					// 物品剩余数量(段晓彤);
					if (_ShowNum != -1)
					{
						_body.appendHtml("<font color=#000000 size=12px>剩余数量:" + _ShowNum + "<br></font>");
						parent._count=parent._count+1;
					}
					_body.appendHtml("<font color=#000000 size=12px><br></font>");
					parent._count=parent._count+2;
				}
				
				//属性卡的属性说明
				var _allAttValue = window.SplitStr2(_AttValue,',');
				//alert(""+_allAttValue[0]);
				if(toint(_allAttValue[0]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[0]+"力量<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[0]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[0]+"力量<br><br></font>");
					parent._count=parent._count+2;
				}

				if(toint(_allAttValue[1]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[1]+"技巧<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[1]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[1]+"技巧<br><br></font>");
					parent._count=parent._count+2;
				}

				if(toint(_allAttValue[2]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[2]+"前场<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[2]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[2]+"前场<br><br></font>");
					parent._count=parent._count+2;
				}

				if(toint(_allAttValue[3]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[3]+"后场<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[3]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[3]+"后场<br><br></font>");
					parent._count=parent._count+2;
				}

				if(toint(_allAttValue[4]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[4]+"发球<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[4]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[4]+"发球<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[5]) > 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>+"+_allAttValue[5]+"能量<br><br></font>");
					parent._count=parent._count+2;
				}
				if(toint(_allAttValue[5]) < 0)
				{
					_body.appendHtml("<font color=#23C005 size=12px>-"+_allAttValue[5]+"能量<br><br></font>");
					parent._count=parent._count+2;
				}

				if(_BuyPrice != 0 && window.GetUIPos()!=window.POS_TASK)//在商城中
				{
					//在购买套装、服装、美容、饰品、球拍、属性卡所需的 
					if(_skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Suit ||_skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Dress || _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Hairdressing ||  _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Jewelry || _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Racket || _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Attribute )
					{
						// (段晓彤修改2010-6-7)
						var _size = window.GetSplitCount(_BuyPrice,",");
						var _buyPrice = window.SplitStr2(_BuyPrice,",");
						var _buyDays = window.SplitStr2(_BuyDays,",");
						var i = 0;
						_body.appendHtml("<font color=#000000 size=12px>普通售价<br></font>");
						parent._count=parent._count+1;
						while (toint(i) < toint(_size))
						{
							var _txt = "";
							switch (_BuyPriceType)
							{
							case 1:// 金币
								_txt = "金币";
								break;
							case 2:// 点券
								_txt = "点券";
								break;
							case 3:// 奖券
								_txt = "奖券";
								break;
							}
							if (toint(_buyDays[i]) == 0)
							_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp永久有效:" + _buyPrice[i]+_txt+"<br></font>");
							
							else
							_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp"+_buyDays[i] + "天:" + _buyPrice[i]+_txt+"<br></font>");
							
							i = i + 1;
							parent._count=parent._count+1;
						}
						//_body.appendHtml("<font color=#000000 size=12px>"+_buyDays[0] + "天" + _buyPrice[0]+"奖券<br></font>");
						//_body.appendHtml("<font color=#000000 size=12px>"+_buyDays[1] + "天" + _buyPrice[1]+"点券<br></font>");
						//_body.appendHtml("<font color=#000000 size=12px>"+_buyDays[2] + "天" + _buyPrice[2]+"点券<br><br></font>");
						parent._count=parent._count+1;
					}

					if (_skillClass == window.GOODS_CLASS_PropaLCard)
					{
						var _size = window.GetSplitCount(_BuyPrice,",");
						var _buyPrice = window.SplitStr2(_BuyPrice,",");
						var _buyDays = window.SplitStr2(_BuyDays,",");
						var i = 0;
						_body.appendHtml("<font color=#000000 size=12px>普通售价<br></font>");
						parent._count=parent._count+1;
						while (toint(i) < toint(_size))
						{
							var _txt = "";
							switch (_BuyPriceType)
							{
							case 1:// 金币
								_txt = "金币";
								break;
							case 2:// 点券
								_txt = "点券";
								break;
							case 3:// 奖券
								_txt = "奖券";
								break;
							}
							if (toint(_buyDays[i]) == 0)
							_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp永久有效:" + _buyPrice[i]+_txt+"<br></font>");
							
							else
							_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp"+ _buyPrice[i]+_txt+"&nbsp"+_buyDays[i] + "天" +"<br></font>");
							
							i = i + 1;
							parent._count=parent._count+1;
						}
					}
					//是否为永久有效(段晓彤修改)
					if(TimeAll != -1)
					{
						if(TimeAll==0)
						{
							if(toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill  || toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
							{
								var _txtNormal = "";
								switch (_BuyPriceType)
								{
								case 1:// 金币
									_txtNormal = "金币";
									break;
								case 2:// 点券
									_txtNormal = "点券";
									break;
								case 3:// 奖券
									_txtNormal = "奖券";
									break;
								}
								_body.appendHtml("<font color=#000000 size=12px>普通售价<br></font>");
								_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp"+_BuyPrice+_txtNormal+"&nbsp永久有效<br></font>");
								parent._count=parent._count+2;
							}
						}
	//					else
	//					{
	//						_body.appendHtml("<font color=#000000 size=12px>有效期"+TimeAll+"天<br><br></font>");
	//						parent._count=parent._count+2;
	//					}
						//parent._count=parent._count+2;
					}
				}


				// VIP显示优惠价(段晓彤)
				// _arrDayVIP, _arrSize, _arrPriceVIP, _TPriceTypeVIP
				// 永久有效的物品
//				if (_arrSize >= 0)
//				{
//					if (toint(_arrDayVIP[i]) == 0)
//					{
//						var _txt = "";
//						switch (_TPriceTypeVIP)
//						{
//						case 1:// 奖券
//							_txt = "金币";
//							break;
//						case 2:
//							_txt = "点券";
//							break;
//						case 3:
//							_txt = "奖券";
//							break;
//						}
//						_body.appendHtml("<font color=#000000 size=12px>VIP优惠价<br></font>");
//						_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp"+_arrPriceVIP[i] + _txt +"&nbsp永久有效<br></font>");
//						parent._count=parent._count+2;
//					}
//					else
//					{
//						var i = 0;
//						_body.appendHtml("<font color=#000000 size=12px>VIP优惠价<br></font>");
//						parent._count=parent._count+1;
//						while(i < _arrSize)
//						{
//							var _txt = "";
//							switch (_TPriceTypeVIP)
//							{
//							case 1:// 奖券
//								_txt = "金币";
//								break;
//							case 2:
//								_txt = "点券";
//								break;
//							case 3:
//								_txt = "奖券";
//								break;
//							}
//							if	(toint(_arrDayVIP[i]) == 0)
//								_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp永久有效:" + _arrPriceVIP[i] + _txt + "<br></font>");
//							else
//								_body.appendHtml("<font color=#000000 size=12px>&nbsp&nbsp&nbsp" + _arrDayVIP[i] + "天:" + _arrPriceVIP[i] + _txt + "<br></font>");
//							i = i + 1;
//							parent._count=parent._count+1;
//						}
//					}
//				}

//				_body.appendHtml("<br>");
//				parent._count=parent._count+1;

//				if(toint(equipLv) <= window.GetLvByUID(window.GetMyUID()))
//				{
//					_body.appendHtml("<font color=#000000 size=12px>所需等级："+equipLv+"<br><br></font>");
//					parent._count=parent._count+2;
//				}
//				if(toint(equipLv) > window.GetLvByUID(window.GetMyUID()))
//				{
//					_body.appendHtml("<font color=#ff size=12px>所需等级："+equipLv+"<br><br></font>");
//					parent._count=parent._count+2;
//				}
				
				var _ClassTemp = toint(_skillClass)/window.GOODS_CLASS_BASE;
				//技能卡数量 夏洋洋 添加于2009-11-20
				if(_ClassTemp == window.GOODS_CLASS_Skill || _ClassTemp == window.GOODS_CLASS_Props)
				{
					printf("123456_SkillSubNum:"+_SkillSubNum);
					if(_SkillSubNum != 0)
					{
						_body.appendHtml("<font color=#000000 size=12px><br></font>");
						if(window.g_HangType == 1)
						{
							_body.appendHtml("<font color=#000000 size=12px>剩余数量："+_SkillSubNum+"<br><br></font>");
						}
						else
						{
							_body.appendHtml("<font color=#000000 size=12px>打包购买数量："+_SkillSubNum+"<br><br></font>");
						}
						
						parent._count=parent._count+1;
					}
				}
		
				//modify by chenjihui
				//增加等级颜色显示
				//2011-3-29
				if(_skillClass == window.GOODS_CLASS_PropsGoods || _skillClass == window.GOODS_CLASS_PropsRand || _SubClass == 99)
				{
					var _equipLvColor = "#000000";
					if(window.GetLVByUID() < equipLv)
					{
						_equipLvColor = "#F81B0B";
					}
					_body.appendHtml("<font color=color=#000000 size=12px>角色所需等级：</font><font color="+_equipLvColor+" size=12px>"+equipLv+"<br><br></font>");
					parent._count=parent._count+3;
				}

				
				//用颜色来表示力量型选手或敏捷型选手是否满足技能所需等级 夏洋洋 添加于2009-11-20
				if(_ClassTemp == window.GOODS_CLASS_Skill)
				{
					var _strColor = "";
					var _strLvColor = "";
					var _agiColor = "";
					var _agiLvColor = "";
					if(window.GetRoleTypeByUID()==window.ROLE_TYPE_B_S || window.GetRoleTypeByUID()==window.ROLE_TYPE_E_S)
					{
						_strColor = "#000000";
						_agiColor = "#7A7A79";
						_agiLvColor = _agiColor;
						if(window.GetLVByUID() >= _strengthLv)
						{
							_strLvColor = _strColor;
							
						}
						else
						{
							_strLvColor = "#F81B0B";
						}
					}
					else
					{
						_strColor = "#7A7A79";
						_agiColor = "#000000";
						_strLvColor = _strColor;
						if(window.GetLVByUID() >= _agilityLv)
						{
							_agiLvColor = _agiColor;
						}
						else
						{
							_agiLvColor = "#F81B0B";
						}
					}
					//alert(""+window.GetRoleTypeLvByUID()+","+_agilityLv);
					_body.appendHtml("<font color="+_strColor+" size=12px>力量型选手所需等级："+"</font><font color="+_strLvColor+" size=12px>"+_strengthLv+"<br></font>");
					_body.appendHtml("<font color="+_agiColor+" size=12px>技巧型选手所需等级："+"</font><font color="+_agiLvColor+" size=12px>"+_agilityLv+"<br><br></font>");
					parent._count=parent._count+3;
					
				}
				//防守和进攻所需能量
				if(FrontEnergy != 0)
				{
					_body.appendHtml("<font color=#000000 size=12px>防守所需能量："+FrontEnergy+"<br></font>");
					parent._count=parent._count+1;
				}
				if(BackEnergy != 0)
				{
					_body.appendHtml("<font color=#000000 size=12px>进攻所需能量："+BackEnergy+"<br></font>");
					parent._count=parent._count+1;
				}
				if(FrontEnergy != 0 || BackEnergy != 0)
				{
					_body.appendHtml("<br>");
					parent._count=parent._count+1;
				}


				if(TimeLeft != -2)
				{
					if(TimeLeft == -1)
					{
						_body.appendHtml("<font color=#000000 size=12px>永久有效<br><br></font>");
						parent._count=parent._count+2;
					}
					else if (TimeLeft == 0)
					{
						_body.appendHtml("<font color=#000000 size=12px>已到期<br><br></font>");
						parent._count=parent._count+2;
					}
					else
					{
						var _timeDHM = ""+toint(TimeLeft)/86400+"天"+(toint(TimeLeft)%86400/3600)+"时"+(toint(TimeLeft)%86400%3600/60)+"分";
						_body.appendHtml("<font color=#000000 size=12px>剩余:"+_timeDHM+"<br><br></font>");
						parent._count=parent._count+2;
					}
					//parent._count=parent._count+2;
				}
//				//在商城中显示Vip会员打折 夏洋洋 添加于2009-11-20
//				if(_VipBuyAgio != 0)
//				{
//					_body.appendHtml("<font color=#FFA800 size=12px>Vip会员"+_VipBuyAgio+"折<br><br></font>");
//					parent._count=parent._count+2;
//				}

				
				//物品说明 夏洋洋修改于2009-11-23
				if(toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill || toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Attribute || toint(_skillClass)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
				{
//					_body.appendHtml("<font color=#000000 size=12px><br></font>");
//					parent._count=parent._count+1;
					_body.appendHtml("<font color=#028DBE size=12px>&nbsp&nbsp&nbsp&nbsp"+explain+"<br><br></font>");
					
					var _rowNum = 0;
					if((toint(parent._explain.Count)+4)%22 == 0)
					{
						_rowNum = (toint(parent._explain.Count)+4)/22;
					}
					else
					{
						_rowNum = (toint(parent._explain.Count)+4)/22+1;
					}
					parent._count = parent._count + _rowNum+3;
//					if((toint(parent._explain.Count)+4)/22 != 0 && (toint(parent._explain.Count)+4)%22 == 0)
//					{
//						_body.appendHtml("<font color=#028DBE size=12px>&nbsp&nbsp&nbsp&nbsp"+explain+"<br><br></font>");
//						parent._count=parent._count+2;
//					}
//					else
//					{
//						_body.appendHtml("<font color=#028DBE size=12px>&nbsp&nbsp&nbsp&nbsp"+explain+"<br><br></font>");
//						parent._count=parent._count+2;
//					}
					// (段晓彤)加
//					_body.appendHtml("<font color=#000000 size=12px><br><br></font>");
//					parent._count=parent._count+2;
				}

				//增加家族改名卡的说明
				//add by zyy 2011-5-26
				if (_name =="家族改名卡")
				{
					_body.appendHtml("<font color= #F81B0B size=12px>&nbsp&nbsp&nbsp&nbsp修改家族名称游戏客户端会关闭，请重启并登录游戏来查看家族名称的变化<br><br></font>");
					parent._count=parent._count+3;
				}
				if (_name =="改名卡")
				{
					_body.appendHtml("<font color= #F81B0B size=12px>&nbsp&nbsp&nbsp&nbsp修改昵称游戏客户端会关闭，请重启并登录游戏来查看昵称的变化<br><br></font>");
					parent._count=parent._count+3;
				}


				//parent._count=parent._count+1;
				//alert(quarter);
				if(tostring(quarter) != "")
				{
					
					_body.appendHtml("<font color=#000000 size=12px>"+quarter+"<br></font>");
					parent._count=parent._count+1;
				}
				if(tostring(Chip) != "")
				{
					_body.appendHtml("<font color=#000000 size=12px>"+Chip+"<br></font>");
					parent._count=parent._count+1;
				}
				if(tostring(Kill_shot) != "")
				{
					_body.appendHtml("<font color=#000000 size=12px>"+Kill_shot+"<br></font>");
					parent._count=parent._count+1;
				}
				if(tostring(HighBall) != "")
				{
					_body.appendHtml("<font color=#000000 size=12px>"+HighBall+"<br></font>");
					parent._count=parent._count+1;
				}
				if(tostring(_Serve) != "")
				{
					_body.appendHtml("<font color=#000000 size=12px>"+_Serve+"<br></font>");
					parent._count=parent._count+1;
					//parent._count += 1;
				}
				if(tostring(quarter)=="" && tostring(Chip)=="" && tostring(Kill_shot)=="" && tostring(HighBall)==""
				&& tostring(_Serve)=="" && opt==-1)
				{
					parent._count=parent._count-1;
				}
				if(tostring(quarter)!=""||tostring(Chip)!=""||tostring(Kill_shot)!=""||tostring(HighBall)!=""||tostring(_Serve)!="")
				{
					if(opt!=-1)
					{
						_body.appendHtml("<br>");
						parent._count=parent._count+1;
					}
				}
				
				if(toint(_skillClass)/400==1 && toint(_skillClass)%400==0)
				{
					_body.appendHtml("<font color=#000000 size=12px>操作："+window.GetKeyByID(6)+"+"+window.GetKeyByID(4)+"<br><br></font>");
					if((toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(4).Count)+7)>22)
					{
						parent._count=parent._count+3;
					}
					else
					{
						parent._count=parent._count+2;
					}
				}
				if(toint(_skillClass)/400==1 && toint(_skillClass)%400==1)
				{
					_body.appendHtml("<font color=#000000 size=12px>操作："+window.GetKeyByID(6)+"+"+window.GetKeyByID(1)+"+"+window.GetKeyByID(5)+"<br><br></font>");
					if((toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(1).Count)+toint(window.GetKeyByID(5).Count)+8)>22)
					{
						parent._count=parent._count+3;
					}
					else
					{
						parent._count=parent._count+2;
					}
				}
				if(toint(_skillClass)/400==1 && toint(_skillClass)%400==2)
				{
					_body.appendHtml("<font color=#000000 size=12px>操作："+window.GetKeyByID(6)+"+"+window.GetKeyByID(4)+"/"+window.GetKeyByID(6)+"+"+window.GetKeyByID(5)+"<br><br></font>");
					if((toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(4).Count)+toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(5).Count)+9)>22)
					{
						parent._count=parent._count+3;
					}
					else
					{
						parent._count=parent._count+2;
					}
				}
				if(toint(_skillClass)/400==1 && toint(_skillClass)%400==3)
				{
					_body.appendHtml("<font color=#000000 size=12px>操作："+window.GetKeyByID(6)+"+"+window.GetKeyByID(5)+"<br></font>");
					if((toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(5).Count)+7)>22)
					{
						parent._count=parent._count+3;
					}
					else
					{
						parent._count=parent._count+2;
					}
				}
				if(toint(_skillClass)/400==1 && toint(_skillClass)%400==4)
				{
					_body.appendHtml("<font color=#000000 size=12px>操作："+window.GetKeyByID(6)+"+"+window.GetKeyByID(4)+"/"+window.GetKeyByID(6)+"+"+window.GetKeyByID(5)+"<br><br></font>");
					if((toint(window.GetKeyByID(6).Count)+toint(window.GetKeyByID(4).Count)+toint(window.GetKeyByID(4).Count)+toint(window.GetKeyByID(4).Count)+9)>22)
					{
						parent._count=parent._count+3;
					}
					else
					{
						parent._count=parent._count+2;
					}
				}
				
				/*操作序号枚举
				-1	无操作
				0	点击试穿
				1	双击装备物品
				2	双击取消装备
				3	双击绑定
				4	双击接收礼品
				5	双击购买
				6	双击赠送
				7	双击取消绑定
				*/
				if(opt != -1)
				{
					if(opt == 0)
					{
						_body.appendHtml("<font color=#000000 size=12px>点击试穿<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 1)
					{
						if(_skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Dress || 
						   _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Hairdressing ||  
						   _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Jewelry || 
						   _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Racket || 
						   _skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Attribute ||
						   _skillClass == window.GOODS_CLASS_KBRemindProp)
						{
							_body.appendHtml("<font color=#000000 size=12px>双击使用/双击取消使用<br><br></font>");
							parent._count=parent._count+2;
						}
						if(_skillClass/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill)
						{
							_body.appendHtml("<font color=#000000 size=12px>双击使技能与当前球拍绑定/双击取消技能与当前球拍绑定<br><br></font>");
							parent._count=parent._count+2;
						}
					}
					if(opt == 2)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击取消装备<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 3)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击绑定<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 4)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击接收礼品<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 5)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击购买<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 6)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击赠送<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 7)
					{
						_body.appendHtml("<font color=#000000 size=12px>双击取消绑定<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 8)
					{
						_body.appendHtml("<font color=#000000 size=12px>单击快速购买<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 9)
					{
						_body.appendHtml("<font color=#000000 size=12px>单击关闭能量球功能<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 10)
					{
						_body.appendHtml("<font color=#000000 size=12px>单击开启能量球功能<br><br></font>");
						parent._count=parent._count+2;
					}
					if(opt == 11)
					{
						_body.appendHtml("<font color=#000000 size=12px>单击可购买能量球<br><br></font>");
						parent._count=parent._count+2;
					}
				}
				

				//计算悬停框大小
//				if((toint(parent._explain.Count)+4)/22 == 0)
//				{
//					//alert(1);
//					var _sizeY = (parent._count+1)*17+17;
//					_hangBK.SetSize(200,_sizeY);
//					size(200,_sizeY);
//				}
//				if((toint(parent._explain.Count)+4)/22 != 0 && (toint(parent._explain.Count)+4)%22 == 0)
//				{
//					//alert(2);
//					var _sizeY = (parent._count+((toint(parent._explain.Count)+4)/22))*17+17;
//					_hangBK.SetSize(200,_sizeY);
//					size(200,_sizeY);
//				}
//				else
//				{
					//alert(3);
					//var _sizeY = (parent._count+((toint(parent._explain.Count)+4)/22)+1)*17+17;
					//alert(parent._count);
					var _sizeY = (parent._count+2)*13;
					//alert(_sizeY);
					_hangBK.SetSize(200,_sizeY);
					size(200,_sizeY);
				//}

//				while(1)
//				{
					//悬停窗口位置设定
					parent.pos(window.mousex+30,window.mousey+30);
					if(window.mousex+200 > window.width && window.mousey+_sizeY > window.height)
					{
						parent.pos(window.mousex-200,window.mousey-_sizeY);
					}
					else if(window.mousex+200 > window.width)
					{
						parent.pos(window.mousex-200,window.mousey);
					}
					else if(window.mousey+_sizeY > window.height)
					{
						parent.pos(window.mousex,window.mousey-_sizeY);
					}
//					sleep(1000);
//				}
			}//end SetData()
		}//end s_html
	}//end init()
};