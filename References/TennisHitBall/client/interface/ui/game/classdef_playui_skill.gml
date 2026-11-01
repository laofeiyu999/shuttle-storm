//游戏内界面的部分类定义->技能+道具
//吴楠

//快捷栏的图标：显示
class VShortBarIcon_UI VShortBar_Bk_UI
{
	size = "53,53";bgcolor = -1;

	void Init()
	{
		//技能
		staticvar s_Skill_Icon = new item
		{
			var m_IsOpen = false;	//是否打开了悬停
			
			size = "53,53";
			var _Skill = new img{size = "45,45";pos(4,4);}

			//技能名，data2:技能ID,data3:状态(0灰,1亮)
			void SetData(data1,data2,data3)
			{
				printf("B# 快捷栏-s_Skill_Icon-:data1:"+data1+",data2:"+data2+",data3:"+data3);
				
				if (toint(data2) <= 0)
				{
					return;
				}

				parent.m_SkillState = toint(data3);
				parent.m_ItemEnterID = data2;
				if(parent._isFirst)
				{
					parent.s_SkillNum.SetData(parent.m_ItemEnterID);
					parent._isFirst=false;
				}
				var _iconname = window.GetIconNameByEnterID(parent.m_ItemEnterID);
				var _iconLv = window.GetIconLvByEnterID(parent.m_ItemEnterID);
				_SkillLvFlag.SetSkillLvSrc(_iconLv);
				parent.m_SkillNum = window.GetItemNumByEnterID(parent.m_ItemEnterID);
				
				if (parent.m_SkillNum.__Long__ <= 0)
				{
					_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+"_0.tga";
					return;
				}
				var _isfaqiu = window.find("GAME_LOGIC")._User1._faqiu;
				var _skillkind = (parent.m_ItemEnterID.__Long__)/100;
				ChangeStateGrey(parent.m_ItemEnterID,_skillkind);		//技能按键字变灰
				
				if(parent.m_SkillState == 0)
				{
					_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+"_0.tga";
					if(parent.parent.PowerReturn())
					{
						if (_iconLv > 0 && toint(_isfaqiu) >0 && toint(_skillkind) == 404)
						{
							ChangeStateLight(parent.m_ItemEnterID,toint(_skillkind));		//技能按键字变亮
							_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+_iconLv+".tga";
						}
						else if (_iconLv > 0 && toint(_isfaqiu)==0 && toint(_skillkind) != 404)
						{
							ChangeStateLight(parent.m_ItemEnterID,toint(_skillkind));		//技能按键字变亮
							_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+_iconLv+".tga";
						}
						else if (_iconLv > 0)
						{
							_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+"_0.tga";
						}
						else
						{
							_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+".tga";
						}
					}
					return;
				}
				if(parent.m_SkillState == 1)
				{
					if (_iconLv > 0)
					{
						ChangeStateLight(parent.m_ItemEnterID,toint(_skillkind));		//变亮
						_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+_iconLv+".tga";
					}
					else
					{
						_Skill.src = "$./../PublicImage/GoodsIcon/"+_iconname+".tga";
					}
					return;
				}
			}
			//技能球按键字显灰
			//add by chenjihui
			void ChangeStateGrey(enterid,skillIndex)
			{
				switch (toint(skillIndex))
				{
				case 400:
					parent.parent.s_Skill1Key.SetState(enterid,0);
					break;
				case 401:
					parent.parent.s_Skill2Key.SetState(enterid,0);
					break;
				case 402:
					parent.parent.s_Skill4Key.SetState(enterid,0);    //由于放高扣杀反了，这里暂时这样
					break;
				case 403:
					parent.parent.s_Skill3Key.SetState(enterid,0);    //由于放高扣杀反了，这里暂时这样
					break;
				case 404:
					parent.parent.s_Skill5Key.SetState(enterid,0);
					break;
				}
			}
			
			//技能球按键字显亮
			//add by chenjihui
			void ChangeStateLight(enterid,skillIndex)
			{
				switch (toint(skillIndex))
				{
				case 400:
					parent.parent.s_Skill1Key.SetState(enterid,1);
					break;
				case 401:
					parent.parent.s_Skill2Key.SetState(enterid,1);
					break;
				case 402:
					parent.parent.s_Skill4Key.SetState(enterid,1);
					break;
				case 403:
					parent.parent.s_Skill3Key.SetState(enterid,1);
					break;
				case 404:
					parent.parent.s_Skill5Key.SetState(enterid,1);
					break;
				}
			}

			//延迟悬停
			void CallByMouseMsg()
			{
				m_IsOpen = true;
				set window.find("TOPLAYER")
				{
					new VGoodHangWnd_Logic{}
				}
				window.find("TOPLAYER").find("VGoodHangWnd_Logic").SetGoodsData_0(parent.m_ItemEnterID,parent.m_OptIndex);
			}
			//鼠标悬停-New
			void OnMouseOver()
			{
				if (parent.m_ItemEnterID <= 0) return;
				timer(500,"CallByMouseMsg","CallByMouseMsg_Name");
			}
			//鼠标悬停-Del
			void OnMouseOut()
			{
				killtimer("CallByMouseMsg_Name").del();
				if (m_IsOpen)
				{
					window.find("TOPLAYER").find("VGoodHangWnd_Logic").del();
				}
			}
		}
		//技能个数
		//data：EnterID
		staticvar s_SkillNum = new VN2NumShow
		{
			show=false;valign(100,0);halign(50,0);pos(22,35);

			void NEWNUM(){new img;}
			void NUMSET(objname,index,num)
			{
				//printf("B# 快捷栏-s_SkillNum-NUMSET:objname:"+objname+",index:"+index+",num:"+num);
				set find(objname)
				{
					src="$./imgs/Num.tga";
					src="$./../PublicImage/num/game_skill.tga";
					clipani(16,20,1,10);
					aniindex=num;
					left=index*13;
				}
			}
			void SetData(data)
			{
				parent.m_SkillNum = window.GetItemNumByEnterID(data);
				printf("B# 快捷栏-s_SkillNum-SetData():"+data+",m_SkillNum:"+parent.m_SkillNum);

				if(toint(data)>0)
				{
					show=true;
					if(toint(parent.m_SkillNum)>999)
					{
						SetFinalNum(999,data);
					}
					else
					{
						SetFinalNum(parent.m_SkillNum,data);
					}
				}
			}
			//老虎修改它
			void SetMyNum(num,enterID)
			{
				printf("B# 快捷栏-s_SkillNum-SetMyNum(老虎修改它):num:"+num+",enterID:"+enterID);
				if (toint(num) > 999){num = 999;}
				SetFinalNum(num,enterID);
				
				if(num.__Long__ == 0)
				{
					parent.fastBuy();
				}
			}
			//最终设置数量调的函数
			void SetFinalNum(num,enterID)
			{
				printf("B# 快捷栏-s_SkillNum-SetFinalNum()num:"+num+",enterID:"+enterID+",window.POWERBALL_ID:"+window.POWERBALL_ID);
				parent.m_SkillNum = num;

				//var _iconLv = window.GetPackIconLvByEnterID(parent.m_ItemEnterID);	// 这个不对
				var _iconLv = window.GetIconLvByEnterID(parent.m_ItemEnterID);
				if(parent.m_SkillState == 1 || parent.parent.PowerReturn() == true)
				{
					var _classKind = window.GetClassByEnterId(enterID);
					if(toint(_classKind)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill)
					{
						parent.s_Skill_Icon._Skill.src = "$./../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(enterID)+_iconLv+".tga";
					}
					else
					{
						parent.s_Skill_Icon._Skill.src = "$./../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(enterID)+".tga";
					}
				}

				if(num == 0)
				{
					parent.s_Skill_Icon._Skill.src ="$./../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(enterID)+"_0.tga";
				}

				if (parent.m_ItemEnterID == window.POWERBALL_ID)//是能量球
				{
					parent.parent.s_Skill1.OnClick_PropCall();
					parent.parent.s_Skill2.OnClick_PropCall();
					parent.parent.s_Skill3.OnClick_PropCall();
					parent.parent.s_Skill4.OnClick_PropCall();
					parent.parent.s_Skill5.OnClick_PropCall();

					if (num.__Long__ > 0)
					{
						parent.m_OptIndex = window.ICON_OPRT_CLOSE_SKILL;	//操作索引 见文件头
					}
					else
					{
						parent.m_OptIndex = window.ICON_OPRT_BUY_SKILL;	//操作索引 见文件头
					}
				}

				setNum(num);
			}
		}
		//是否使用能量球
		staticvar s_PowerUse = new img
		{
			size(53,53);
			src="$./imgs/NO.tga";show=false;
			void SetData(param)
			{
				if(param)
				{
					parent.m_OptIndex = window.ICON_OPRT_OPEN_SKILL;	//操作索引 见文件头
					show = true;
					parent.m_CanUse = false;
				}
				else
				{
					parent.m_OptIndex = window.ICON_OPRT_CLOSE_SKILL;	//操作索引 见文件头
					show = false;
					parent.m_CanUse = true;
				}
			}
		}
	}
};