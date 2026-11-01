//全局变量 + 背包

set window
{
	//[功能]取自己的装备的球拍ID
	void GetEquipRacketID()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _racketid = -1;
			void GetData(gid)
			{
				_racketid = gid;
			}
		};
		var _SQL = "SELECT * FROM playerItems WHERE state=1 AND ownerid="+window.GetMyUID()+" AND num>0 AND packId=105 AND equippos=1";
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		_VNet2DBTable.ReadData("GetData",""+window.M_G_GOODS_PLAYERITEMS_GID );
		var _id = _VNet2DBTable._racketid;
		_VNet2DBTable.del();
		return _id;
	}

	// add by chenjihui
	// 特殊道具事件
	// 2010-12-29
	void Click_PackProps(_enterid,_gid)
	{
		switch (_enterid)
		{
			case 50310:			// 该道具能获得金币外还能释放特效
			{
				window.find("Fireworks_Qualify_Item").springFireworks.startShow();
				window.find("Fireworks_Qualify_Item").springFireworks.delet();
//				var _myqualify = new FireworksQualify{} 
//				_myqualify.showFire();
//
////var _param = ""+_gid+","+_EnterID;
////window.Too_OpenBox(_param);
//				var param = ""+_enterid+",1";
//				window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",param);

				var _param = ""+_gid;
				window.Too_UnPackItem(_param);
				break;
			}
			case 50315:			// 变质糖果
			{
				window.g_Row.InitByBigInt(window.GAME,window.USEODDSITEM,window.GAME_USEODDSITEM_CID,_enterid);
				if (!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					printf("B# error-OnClick_PackGoods:DBname:"+window.GAME+",TBName:"+window.USEODDSITEM+",_gid:"+_gid);
					return;
				}
				var _startID = window.g_Row.GetData(window.GAME_USEODDSITEM_STARTDIALOG);
				window.find("UIController").LoadDLG(toint(_startID));
				window.find("VMB_EateCandyOrNot_Logic").m_EntryID = _enterid;
				window.g_Row.Release();
				break;
			}
			case 50322:		//愚人魔盒
			{
				var _param = ""+_enterid+",1";
				window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_param);
				break;
			}
			default:
			{
				var _param = ""+_gid;
				window.Too_UnPackItem(_param);
			}
		}
		return;
	}

	//[功能]双击了背包里的图标或者右键
	//[参数]_gid:背包ID
	void OnClick_PackGoods(_gid)
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-OnClick_PackGoods:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",_gid:"+_gid);
			return;
		}

		var _PackID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_PACKID);
		var _EnterID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_CID);
		_PackID = toint(_PackID);
		var _EquipPos = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);//装备位置 0卸下 1装上 
		var _EquipRID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_EQUIP);
		
		/*道具*/
		if ( (_PackID / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props) || (_PackID  == window.GOODS_CLASS_DeadProps))
		{
			/*	道具特殊处理
				放在背包里就行，不需要操作的：500	501
				需要双击触发的：502	503	504	505
				待定：506
			*/
			if (_PackID == window.GOODS_CLASS_PropsHave0 || _PackID == window.GOODS_CLASS_PropsHave1)
			{
				window.g_Row.Release();
				return;
			}
			else
			{
				switch (_PackID)
				{
					case 502://晋级大礼包
					{
						//发出消息
						//参数：礼包唯一id
						var _param = ""+_gid;
						window.Too_UnPackItem(_param);
						break;
					}
					case 503://金币兑换券
					{
						//发出消息
						//参数：宝箱唯一id,宝箱id
						var _param = ""+_gid+","+_EnterID;
						window.Too_UnPackItem(_param);
					}
					case 504://点券兑换券
					{
						//发出消息
						//参数：宝箱唯一id,宝箱id
						var _param = ""+_gid+","+_EnterID;
						window.Too_UnPackItem(_param);
					}
					case 505://实物兑换券
					{
						//发出消息
						//参数：礼包唯一id						
						Click_PackProps(_EnterID,_gid);
						break;
					}
					case 506://博彩型[老虎机2 宝箱1]
					{
						var _SubClass = window.GetSubClassByEnterId(_EnterID);
						window.g_TigerOrBox = _SubClass;

						if (_SubClass == 1)
						{
//								window.find("UIController").LoadUI("UI_TREASUREBOX");
//								window.find("TREASUREBOX_LOGIC").SetData(_EnterID);

								//发出消息
								//参数：宝箱唯一id,宝箱id
								var _param = ""+_gid+","+_EnterID;
								window.Too_OpenBox(_param);
								break;
						}
						if (_SubClass == 2)
						{
//							window.find("UIController").LoadUI("UI_TIGERCHOOK");
//							window.find("TIGERCHOOK_LOGIC").SetData(_EnterID);

							//发出消息
							//参数：宝箱唯一id,宝箱id
							var _param = ""+_gid+","+_EnterID;
							window.Too_OpenBox(_param);
							break;
						}
					}
					case 508://改名卡  家族改名卡
					{
						var _Param = "";
						if(_EnterID == 50801)
						{
							window.find("UIController").LoadDLG(807);break;
						}
						if(_EnterID == 50802)
						{
							window.find("UIController").LoadDLG(808);break;
						}
						
					}
//					case 509://幸运卡
//					{
//						var _Param = "";
//						if(_EnterID!=50902)
//						{
//						if (_EquipPos == 1 && _EquipRID == window.GetMyRID())
//						{
//							_Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
//							
//						}
//						else
//						{
//							_Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
//						}
//						printf("C# 幸运卡_Param:"+_Param+"_EnterID="+_EnterID);
//						window.Too_EquipGoods(_Param);break;}
//						break;
//					}
					case 510:
					{
						var _Param = "";
						if (_EquipPos == 1 && _EquipRID == window.GetMyRID())
						{
							_Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
							
						}
						else
						{
							_Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
						}
						printf("C# 510物品_Param:"+_Param);
						window.Too_EquipGoods(_Param);
						break;
					}
					case 520://3D特效
					{
						var _Param = "";
						if (_EquipPos == 1 && _EquipRID == window.GetMyRID())
						{
							_Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
							
						}
						else
						{
							_Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
						}
						printf("C# 520物品_Param:"+_Param);
						window.Too_EquipGoods(_Param);
						break;
					}
					case 521: //2D竖挂件
					{
						var _Param = "";
						if (_EquipPos == 1 && _EquipRID == window.GetMyRID())
						{
							_Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
							
						}
						else
						{
							_Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
						}
						printf("C# 520物品_Param:"+_Param);
						window.Too_EquipGoods(_Param);
						break;
					}
					case 522://2D横挂件
					{
						var _Param = "";
						if (_EquipPos == 1 && _EquipRID == window.GetMyRID())
						{
							_Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
							
						}
						else
						{
							_Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
						}
						printf("C# 520物品_Param:"+_Param);
						window.Too_EquipGoods(_Param);
						break;
					}
					case 540://情侣道具
					{
						//-------------------订婚----------------------------/
							window.find("UIController").LoadDLG(825);
							window.find("VMB_EngagementRing_Logic").SetData(_EnterID);
							break;
					}
					case 9000: //续费道具
					{
						window.find("PACK_LOGIC")._VPack_Logic.m_Class_DeadProps.DeadProps();
//						window.GameCtndeaditems(_EnterID);
					}
					
				}
				window.g_Row.Release();
				return;
			}
		}// end of props

//		var _EquipPos = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);//装备位置 0卸下 1装上 
//		var _EquipRID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_EQUIP);
		
		window.g_Row.Release();
		
		/*技能*/
		if (toint(_PackID) / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill)
		{
			var _racketid = window.GetEquipRacketID();
			if (_racketid <= 0)
			{
				window.LMH_BindSkill(1);//引导事件
				window.find("UIController").LoadDLG(365);//目前您没有已装备的球拍，不能使用技能！
				return;
			}
			window.SkillBindRacket(_racketid,_EnterID,_gid);
			return;
		}

		/*装备*/
		if (_EquipPos == 1 && _EquipRID == window.GetMyRID())//装备的脱下
		{
			//发出脱下物品的消息
			//参数：物品唯一id(-1)，物品识别id,装备位置(0卸下 1装上),角色唯一id,角色索引
			var _Param = ""+_gid+","+_EnterID+",0,"+window.GetMyRID();
			window.Too_EquipGoods(_Param);
			return;
		}
		
		//发出装备物品的消息
		//参数：物品唯一id(-1)，物品识别id,装备位置(0卸下 1装上),角色唯一id,角色索引
		var _Param = ""+_gid+","+_EnterID+",1,"+window.GetMyRID();
		window.Too_EquipGoods(_Param);
	}

	//[功能]技能绑定统一接口(发消息)
	//[参数]racketid：球拍ID
	//		skillid:技能ID
	//		skillgid:技能的背包ID
	void SkillBindRacket(racketid,skillid,skillgid)
	{
		printf("B# [技能]:SkillBindRacket:racketid:"+racketid+",skillid:"+skillid+",skillgid:"+skillgid);

		window.g_CurrSelectRackeGID = racketid;
		window.g_SkillEnterID = skillid;
		window.g_SkillGID	= skillgid;
		window.g_SkillLastEnterID = 0;

		//[返回值]已绑定且不等为已绑EntryID,没有为-3,错误值-2(参数错误),-1(数据库错误) 已绑定(返回序号0~4)
		var _res = window.GetBindByGID(racketid,skillid);
		printf("B# [技能]:SkillBindRacket:GetBindByGID()_res:"+_res);
		if (_res > window.GOODS_CLASS_BASE) //大于100才算正确的ID
		{
			window.g_SkillLastEnterID = _res;
			var _param = ""+window.GetNameByEnterID(skillid)+","+window.GetNameByEnterID(_res);
			window.find("UIController").LoadDLG(26);//确定要将技能X1替换成技能X2吗？
			window.find("VMB_SkillMosaic_Logic").ReplaceData(_param);
			return;
		}

		if (_res >= 0)
		{
			//window.find("UIController").LoadDLG(386);//该技能已绑定到当前球拍！
			//判断该绑定的技能是否为点击的技能(使用物品ID)
			var _tempgid = window.GetSkillGIDByEntryID(skillid);
			printf("B# [技能]:SkillBindRacket:GetSkillGIDByEntryID()_tempgid:"+_tempgid);
			if (_tempgid == skillgid)
			{
				//发卸载镶嵌的消息
				//参数：被镶嵌物品唯一id,镶嵌物品唯一id(可叠加物品-1)，镶嵌物品识别id(-1),镶嵌位置
				var _param = ""+racketid+",-1,-1,"+_res;
				window.Too_InlayItem(_param);
			}
			else
			{
				window.WriteChat7(997);//相同的技能任意绑定一个即可！
				window.SetSkillBindState(_tempgid,0);
				window.SetSkillBindState(skillgid,1);

				//发出镶嵌物品的消息 
				//参数：被镶嵌物品唯一id,镶嵌物品唯一id(可叠加物品-1)，镶嵌物品识别id,镶嵌位置(-1为默认位置)
				//var _Param = ""+racketid+",-1,"+skillid+",-1";
				//window.Too_InlayItem(_Param);
			}
			return;
		}

		if (_res == -3)
		{
			//发出镶嵌物品的消息 
			//参数：被镶嵌物品唯一id,镶嵌物品唯一id(可叠加物品-1)，镶嵌物品识别id,镶嵌位置(-1为默认位置)
			var _Param = ""+racketid+",-1,"+skillid+",-1";
			window.Too_InlayItem(_Param);
			return;
		}
	}

	//[功能]根据球拍GID查找此球拍是否绑定有此种技能
	//[参数]_gid:球拍的背包中唯一ID
	//		_skillentryID:技能的物品ID
	//[返回值]已绑定且不等为已绑EntryID,没有为-3,错误值-2(参数错误),-1(数据库错误) 已绑定(返回序号0~4)
	void GetBindByGID(_gid,_skillentryID)
	{
		if (_gid < 0){return -2;}
		var _classBase = window.GetClassByEnterId(_skillentryID);
		if (_classBase < 0)
		{
			printf("B# [技能]:GetBindByGID-错误的技能物品id:"+_skillentryID);
			return -2;
		}
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# [技能]:error-GetBindByGID:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",_gid:"+_gid);
			return window.DB_ERR;
		}
		var _Slot1 = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT1);//技能栏1
		if (_Slot1 > 0)
		{
			if (_classBase == window.GetClassByEnterId(_Slot1))
			{
				window.g_Row.Release();
				if(_skillentryID != _Slot1)
				{
					return _Slot1;
				}
				else
				{
					return 0;
				}
			}
		}

		var _Slot2 = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT2);//技能栏2
		if (_Slot2 > 0)
		{
			if (_classBase == window.GetClassByEnterId(_Slot2))
			{
				window.g_Row.Release();
				if(_skillentryID != _Slot2)
				{
					return _Slot2;
				}
				else
				{
					return 1;
				}
			}
		}

		var _Slot3 = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT3);//技能栏3
		if (_Slot3 > 0)
		{
			if (_classBase == window.GetClassByEnterId(_Slot3))
			{
				window.g_Row.Release();
				if(_skillentryID != _Slot3)
				{
					return _Slot3;
				}
				else
				{
					return 2;
				}
			}
		}

		var _Slot4 = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT4);//技能栏4
		if (_Slot4 > 0)
		{
			if (_classBase == window.GetClassByEnterId(_Slot4))
			{
				window.g_Row.Release();
				if(_skillentryID != _Slot4)
				{
					return _Slot4;
				}
				else
				{
					return 3;
				}
			}
		}

		var _Slot5 = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT5);//技能栏5
		if (_Slot5 > 0)
		{
			if (_classBase == window.GetClassByEnterId(_Slot5))
			{
				window.g_Row.Release();
				if(_skillentryID != _Slot5)
				{
					return _Slot5;
				}
				else
				{
					return 4;
				}
			}
		}

		window.g_Row.Release();
		return -3;
	}

	//[功能]切换到背包技能标签时设定技能绑定状态
	void OnClick_PackSkill_SetState()
	{
		window.SetPackSkillStateAll(-1,0);

		var _racketid = window.GetEquipRacketID();
		printf("B# [技能]OnClick_PackSkill_SetState:_racketid:"+_racketid);
		if (_racketid > 0)
		{
			var _VNet2DBRow = new VNet2DBRow{}
			_VNet2DBRow.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_racketid);
			if (!_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.del();
				printf("B# error[技能]-OnClick_PackSkill_SetState:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",_racketid:"+_racketid);
				return;
			}
			var _Slot1 = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT1);//技能栏1
			if (_Slot1 > 0)
				window.SetPackSkillStateAll(_Slot1,1,1);
	
			var _Slot2 = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT2);//技能栏2
			if (_Slot2 > 0)
				window.SetPackSkillStateAll(_Slot2,1,2);

			var _Slot3 = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT3);//技能栏3
			if (_Slot3 > 0)
				window.SetPackSkillStateAll(_Slot3,1,3);

			var _Slot4 = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT4);//技能栏4
			if (_Slot4 > 0)
				window.SetPackSkillStateAll(_Slot4,1,4);

			var _Slot5 = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT5);//技能栏5
			if (_Slot5 > 0)
				window.SetPackSkillStateAll(_Slot5,1,5);

			_VNet2DBRow.del();
			return;
		}
	}

	//[功能]设置背包一批技能的状态
	//[参数]_skillentryid: 为0时为设置所有
	//		_state:状态 1使用 0未使用
	//		_index:索引
	void SetPackSkillStateAll(_skillentryid,_state,_index)
	{
		printf("B# [技能]SetPackSkillStateAll:_skillentryid:"+_skillentryid+",_state:"+_state+",_index:"+_index);
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_State = _state;
			var m_Num = 0;	//目前设定只改变其中一个
			void GetData(gid)
			{
				if (m_Num < 1)
				{
					m_Num += 1;
					window.SetSkillBindState(gid,m_State);
				}
			}
		};

		var _SQL = "SELECT * FROM playerItems WHERE AND ownerid="+window.GetMyUID()+" AND state=1 AND packId>=400 AND packId<=404";
		if (_skillentryid > 0)
		{
			_SQL += " AND cid="+_skillentryid;
		}
		
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		printf("B# [技能]SetPackSkillStateAll-SQL:"+_SQL+",Size:"+_VNet2DBTable.GetSize());

		if (_skillentryid <= 0)
		{
			_VNet2DBTable.SetIntAllData(window.M_G_GOODS_PLAYERITEMS_EQUIPPOS,_state,true);
		}
		else
		{
			_VNet2DBTable.ReadData("GetData",""+window.M_G_GOODS_PLAYERITEMS_GID);
		}

		_VNet2DBTable.del();
	}

	//[功能]设置某个技能的绑定状态
	//[参数]_gid: 技能ID
	//		_state: 1绑定 0不绑定
	void SetSkillBindState(_gid,_state)
	{
		printf("B# [技能]SetSkillBindState:_gid:"+_gid+",_state:"+_state);

		window.g_Row.InitByBigInt( window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_gid);
		if(!window.g_Row.IsReady() )
		{
			window.g_Row.Release();
			printf("B# error[技能]-SetSkillBindState:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",_gid:"+_gid);
			return;
		}
		window.g_Row.SetInt(window.M_G_GOODS_PLAYERITEMS_EQUIPPOS,_state);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//[功能]在背包里 根据背包唯一ID取物品ID
	//		库：m_g_goods.mdb	playerItems
	//[参数] gid：背包GID
	//[返回值]：物品ID
	void GetPackEntryIDByGID(gid)
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetPackRntryIDByGID:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",gid:"+gid);
			return window.DB_ERR;
		}

		var _entryid = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_CID);
		window.g_Row.Release();
		return _entryid;
	}

	//[功能]看看背包里有没有未装备的球拍
	void HasUnequipRacket()
	{
		var _SQL = "SELECT * FROM playerItems WHERE state=1 AND ownerid="+window.GetMyUID()+" AND num>0 AND packId=105 AND equip=0";
		window.g_Table.Select( window.M_G_GOODS,_SQL );
		var _size = window.g_Table.GetSize();
		window.g_Table.Release();
		printf("C# 球拍数量 = " + _size);
		return _size;
	}

	//[功能]看看背包里有没有的技能
	void HasPackSkill_Topspin()
	{
//		var _SQL = "SELECT * FROM playerItems WHERE state=1 AND ownerid="+window.GetMyUID()+" AND num>0 AND packId>=400 AND packId<=404";
		var _SQL = "SELECT * FROM playerItems WHERE state=1 AND ownerid="+window.GetMyUID()+" AND num>0 AND packId=400";
		window.g_Table.Select( window.M_G_GOODS,_SQL );
		var _size = window.g_Table.GetSize();
		window.g_Table.Release();
//		printf("C# HasPackSkill()技能数量 = " + _size);
		printf("C# HasPackSkill_Topspin()上旋技能数量 = " + _size);
		return _size;
	}

	//[功能]根据entryid查找背包中这种物品的所有数量
	//[参数]enterid:物品ID
	//[返回值]参数错误或没有(0);否则为物品数量
	void GetItemNumByEnterID(enterid)
	{
		if (enterid <= 0)
		{
			return 0;
		}
		var _VNet2DBTable=new VNet2DBTable
		{
			var _num = 0;
			void GetMyData(num){_num += num;}
		};
		var _SQL = "SELECT * FROM playerItems WHERE cid="+enterid+" AND ownerid="+window.GetMyUID()+" AND state=1 AND num>0";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_NUM);
		var num = toint(_VNet2DBTable._num);
		_VNet2DBTable.del();
		return num;
	}

	//[功能]根据entryid查找背包中这种物品的等级
	//[参数]enterid:物品ID
	//[返回值]_lv：为0则这种物品没有等级，否则返回该物品的等级
	void GetPackIconLvByEnterID(enterid)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_CID,enterid);
		if(!_VNet2DBRow)
		{
			_VNet2DBRow.del();
			return 0;
		}
		var _lv = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_QUALITY);
		_VNet2DBRow.del();
		return _lv;
	}

	//根据packID查找背包中这种物品的GID
	//返回值 ：-1即没有找到
	void GetGIDByPackID(packid)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _GID = -1;
			void GetMyData(gid){_GID = gid;}
		};
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()+" AND state=1 AND num>0 AND packId="+packid+" AND equip="+window.GetMyRID();
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_GID);
		var _id = _VNet2DBTable._GID;
		_VNet2DBTable.del();
		return _id;
	}

	//根据packID查找背包中这种物品的CID
	//返回值 ：-1即没有找到
	void GetCIDByPackID(packid)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _CID = -1;
			void GetMyData(cid){_CID = cid;}
		};
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()+" AND state=1 AND num>0 AND packId="+packid+" AND equip="+window.GetMyRID();
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_CID);
		var _id = _VNet2DBTable._CID;
		_VNet2DBTable.del();
		return _id;
	}

	//[功能]根据物品ID查找背包中技能的GID(已绑定)
	//[参数]entryid:物品ID
	//[返回值]-1即没有找到 正确(物品的背包ID)
	void GetSkillGIDByEntryID(entryid)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _GID = -1;
			void GetMyData(gid){_GID = gid;}
		};
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()+" AND cid="+entryid+" AND state=1 AND num>0 AND equippos=1";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_GID);
		var _id = _VNet2DBTable._GID;
		_VNet2DBTable.del();
		return _id;
	}

	//[功能]在礼品盒里 根据礼品盒唯一ID取物品ID
	//		库：m_g_goods.mdb	itemPresent
	//[参数] gid：礼品盒GID
	//[返回值]：物品ID
	void GetGiftEntryIDByGID(gid)
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetPackRntryIDByGID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMPRESENT+",gid:"+gid);
			return window.DB_ERR;
		}

		var _entryid = window.g_Row.GetData(window.M_G_GOODS_ITEMPRESENT_ITEMENTRYID);
		window.g_Row.Release();
		return _entryid;
	}

	//[功能]通过PACKID判断背包中物品是否到期
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] gid：
	//[返回值]：当此物品到期了返回false 没到期或者快到期就返回true
	void CheckPackItemDeadLine(_packId)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _DEADLINE = -1;
			void GetMyData(deadline)
			{
				if(deadline==0){_DEADLINE=1;return;}
				if(window.g_MallTool.GetDeadLine(deadline)>0){_DEADLINE=1;}
			}
		}
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_PACKID_STR+"="+_packId+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0";

		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);

		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_DEADLINE);
		var _deadlineTime = _VNet2DBTable._DEADLINE;
		_VNet2DBTable.del();
		if (_deadlineTime<=0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	//[功能]通过CID判断背包中物品是否到期
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] cid：
	//[返回值]：当此物品到期了返回0 没到期或者快到期就返回1
	void CheckCIDItemDeadLine(_cid)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _DEADLINE = -1;
			void GetMyData(deadline)
			{
				if(deadline==0){_DEADLINE=1;return;}
				if(window.g_MallTool.GetDeadLine(deadline)>0){_DEADLINE=1;}
			}
		}
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_cid+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0";

		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);

		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_DEADLINE);
		var _deadlineTime = _VNet2DBTable._DEADLINE;
		_VNet2DBTable.del();
		if (_deadlineTime<=0)
		{
			return 0;
		}
		else
		{
			return 1;
		}
	}

	//[功能]通过_CID判断背包中物品是否到期
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] gid：
	//[返回值]：当此物品到期了返回-1 没到期或者快到期就返回1  返回0为没有找到此物品
	// modify by chenjihui 2011-1-19
	void CheckPackItemDeadLineByEntryID(_CID)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _DEADLINE = -1;
			var m_gid = 0;
			void GetMyData(deadline,_gid)
			{
				var _time = window.g_MallTool.GetDeadLine(deadline);
				if(_time>=0)
				{
					_DEADLINE = _time;
					m_gid=_gid;
				}
			}
		}
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_CID+" and "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0";
		// 查询到期的物品
		var _SQL2 = "SELECT * FROM playerItems WHERE "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_CID+" and "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=2";

		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);

		if(_VNet2DBTable.GetSize() ==0)
		{
			_VNet2DBTable.Select(window.M_G_GOODS,_SQL2);
			if (_VNet2DBTable.GetSize() ==0)
			{
				_VNet2DBTable.del();
				return 0;
			}
			_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_DEADLINE+","+window.M_G_GOODS_PLAYERITEMS_GID);
		
			var _deadlineTime = _VNet2DBTable._DEADLINE;
			var _GID = _VNet2DBTable.m_gid;
			_VNet2DBTable.del();
			return _GID;
		}

		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_DEADLINE+","+window.M_G_GOODS_PLAYERITEMS_GID);
		
		var _deadlineTime = _VNet2DBTable._DEADLINE;
		var _GID = _VNet2DBTable.m_gid; 
		_VNet2DBTable.del();

		if (_deadlineTime < window.g_MyItemTellDead && _deadlineTime >=0)
		{
			return _GID;
		}
		if (_deadlineTime <0)
		{
			return -1;
		}
		if(_deadlineTime > window.g_MyItemTellDead)
		{
			return 1;
		}

	}

	//[功能]通过_CID判断背包中物品是否是永久有效
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] gid：
	//[返回值]：永久有效返回1 否则返回0
	void CheckPackItemForeverByEntryID(_CID)
	{
		var _VNet2DBTable=new VNet2DBTable{};
		var _SQL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_CID+" and "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0 AND "+
			window.M_G_GOODS_PLAYERITEMS_DEADLINE_STR+"=0";

		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		if(_VNet2DBTable.GetSize() ==0)
		{
			_VNet2DBTable.del();
			return 0;
		}
		else
			return 1;
		_VNet2DBTable.del();
	}

	//[功能]判断背包中是否有折扣卡或者幸运卡
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] gid：
	//[返回值]：当有折扣卡是返回1，当有幸运卡是返回2,当两种卡都有时返回3,无卡时返回0
	void CheckPackCard() 
	{
		var _VNet2DBTable=new VNet2DBTable{}
		var _SQLA = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+window.g_agioEntry_ID+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQLA);
		var _agio=_VNet2DBTable.GetSize();

		var _SQLL = "SELECT * FROM playerItems WHERE ownerid="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+window.g_luckyEntry_ID+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND num>0";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQLL);
		var _lucky=_VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		if(_agio==0&&_lucky==0)
		{
			return 0;
		}
		if(_agio!=0&&_lucky==0)
		{
			return 1;
		}
		if(_agio==0&&_lucky!=0)
		{
			return 2;
		}
		if(_agio!=0&&_lucky!=0)
		{
			return 3;
		}
	}
	//[功能]获得背包中幸运卡数量
	//		库：m_g_goods.mdb	PLAYERITEMS_DEADLINE
	//[参数] gid：
	//[返回值]：当有时返回数量,没有返回0
	void GetPackLuckCardNum()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _LUCKYCARDNUM = 0;
			void GetMyData(cardnum){ _LUCKYCARDNUM += cardnum;}			
		}
		var _SQLLuky = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_OWNERID_STR+"="+window.GetMyUID()
		+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1"
		+" AND "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+window.g_luckyEntry_ID+" AND num>0";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQLLuky);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_PLAYERITEMS_NUM);

		var _Num= _VNet2DBTable._LUCKYCARDNUM;

		_VNet2DBTable.del();

		return toint(_Num);
	}

	//[功能]在背包中双击改名卡 家族改名卡
	//[参数]_cardtype卡的类型 nkname:要修改的昵称
	void DclickChangeName(_cardtype,nkname)
	{
		
			var _param = ""+_cardtype+",1"+","+nkname;
			window.Too_ChangeName(_param);
		
	}
	//[功能]获得playeritems表中的的packid
	//[参数]enterid
	void GetPackIDbyCIDInPack( _enterid )
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_CID,_enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-OnClick_PackGoods:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",_gid:"+_gid);
			return;
		}
		var _PackID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_PACKID);
		return _PackID;
		window.g_Row.Release();
	}

	//[功能]判断是否使用某项道具
	//[参数]_entryID:物品ID
	//[返回值]0为未使用，1为使用
	//void GetPropItemEquipState(_CID)
	//{
	//	var _VNet2DBTable = new VNet2DBTable
	//	{
	//		var _equipState = 0;
	//		void GetData(_equipPos)
	//		{
	//			if(_equipPos == 1)
	//			{
	//				_equipState = 1;
	//			}
	//		}
	//	}
	//	var _SQL = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_CID_STR+"="+_CID;
	//	_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
	//	var _count = _VNet2DBTable.GetSize();
	//	if(_count == 0)
	//	{
	//		_VNet2DBTable.del();
	//		return 0;
	//	}
	//	_VNet2DBTable.ReadData("GetData",window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);
	//	var _equip = _VNet2DBTable._equipState;
	//	_VNet2DBTable.del();
	//	return _equip;
	//}
}
	//[功能]通过ID区分横幅或竖挂件
	//		库：GameUI.mdb	ui2d_effect
	//[参数] eid：特效ID
	//[返回值]：1竖挂件 2横幅  -1未找到
//	void Get2dEffectTypeByID(eid)
//	{
//		window.g_Row.InitByBigInt(window.GAMEUI,window.UI2D_EFFECT,window.GAMEUI_UI2D_EFFECT_ID,eid);
//
//		if (!window.g_Row.IsReady())
//		{
//			window.g_Row.Release();
//			printf("B# error-Get2dEffectTypeByID:DBname:"+window.GAMEUI+",TBName:"+window.UI2D_EFFECT+",eid:"+eid);
//			return window.DB_ERR;
//		}
//
//		var _type = window.g_Row.GetData(window.GAMEUI_UI2D_EFFECT_TYPE);
//		window.g_Row.Release();
//		return _type;
//	}
//}
