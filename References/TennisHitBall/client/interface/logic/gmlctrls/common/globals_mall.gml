//全局变量 + 函数>>商城 + 物品

set window
{
	var g_ItemOverdue = 1; //记录物品到期提示次数
	var g_ShopTimeNow = 0;	//商城现在时间
	var g_PopWindTimes = 0; //物品ID
	var g_DeadItemsIDs = ""; // 到期物品ID
	//初始化-商城的变量-每次使用完后须调用
	void InitMallVar()
	{
		printf("B# 初始化-商城的变量：InitMallVar()\n");
		g_Mall_DLG_Type = 0;
	}

	//设置-商城的变量
	//参数:打开窗口类型
	void SetMallVar(type)
	{
		printf("B# 设置-g_Mall_DLG_Type:"+type);
		g_Mall_DLG_Type = type;
	}

	void GetMallDLGType()
	{
		return g_Mall_DLG_Type;
	}

	void CheckCanOpenMallDlg()
	{
		if ( g_Mall_DLG_Type != 0 )
		{
			printf("B# 设置-有对话框已经打开了" + g_Mall_DLG_Type + ",无法打开新的");
			return 0;
		}
		return 1;
	}

	void SetMallBuyCarSelect(sel)
	{
		printf("B# 设置-SetMallBuyCarSelect:"+type);
		g_BuyCar_Select = sel;
	}

	void GetMallBuyCarSelect()
	{
		return g_BuyCar_Select;
	}

	void SetMallBuyCarSendSex(sex)
	{
		printf("B# 设置-SetMallBuyCarSendSex:"+sex);
		g_BuyCar_Send_Sex = sex;
	}

	void GetMallBuyCarSendSex()
	{
		return g_BuyCar_Send_Sex;
	}

	/*
	商城物品的分类：
	其他0:如 1金钱，2点券 3PK点
	服饰
		|_____服装1: 上装0 裙/裤1 手套2 袜3 鞋4 球拍5
		|_____美容2: 头发0 五官1  
		|_____饰品3: 护腕/手链0 项链1 眼镜2 背饰3 附件4
	技能4：上旋0  削球1 扣杀2 放高球3 发球4
	道具5: 辅助道具0,聊天工具1
	属性6: 力量0,技巧1,前场2,后场3,发球4,能量5,体力6
	套装7: 


	换装部件序号
	1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件
	*/
	//根据物品的种类Class取换装的部件位置
	//参数 ；_class 物品的种类
	void GetPartByClass(_class)
	{
		var _part = -1;//部件的类型(1-13)
		switch (_class)
		{
			case 100:{_part = 3;break;}
			case 101:{_part = 4;break;}
			case 102:{_part = 5;break;}
			case 103:{_part = 6;break;}
			case 104:{_part = 7;break;}
			case 105:{_part = 9;break;}
			case 200:{_part = 1;break;}
			case 201:{_part = 2;break;}
			case 300:{_part = 11;break;}
			case 301:{_part = 12;break;}
			case 302:{_part = 10;break;}
			case 303:{_part = 8;break;}
			case 304:{_part = 13;break;}
		}
		return _part;
	}

	//根据物品的种类Class取换装的部件位置的名称
	//参数 ；_class 物品的种类
	void GetPartNameByClass(_class)
	{
		var _partname = "";
		switch (_class)
		{
			case 100:{_partname = "(上装)";break;}
			case 101:{_partname = "(裙/裤)";break;}
			case 102:{_partname = "(手套)";break;}
			case 103:{_partname = "(袜)";break;}
			case 104:{_partname = "(鞋)";break;}
			case 105:{_partname = "(球拍)";break;}
			case 200:{_partname = "(发型)";break;}
			case 201:{_partname = "(容貌)";break;}
			case 300:{_partname = "(护腕/手链)";break;}
			case 301:{_partname = "(项链)";break;}
			case 302:{_partname = "(眼镜)";break;}
			case 303:{_partname = "(背饰)";break;}
			case 304:{_partname = "(附件)";break;}
		}
		return _partname;
	}

	//根据价格类型去价格名称
	//参数 type:1,金币;2,点券;3,Pk点
	void GetPriceNameByType(type)
	{
		var _name = "";
		switch (type)
		{
		case 1:{_name = "金币";break;}
		case 2:{_name = "点券";break;}
		case 3:{_name = "奖券";break;}
		}
		return _name;
	}

	//[功能]商城设置试穿的函数
	//{参数]_entryid:物品ID
	//[返回值]true/false(试穿成功与否-加了过快试穿保护)
	void SetMallTryData(_entryid)
	{
		return window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.Script_SetMallTryData(_entryid);
	}

	//[功能]形象还原
	//[参数]state:0脱下 1穿上
	//			entryid：所操作的物品ID
	void ResetAvatar(state, entryid)
	{
		window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.ResetAvatar(state, entryid);
	}

	//[功能]形象还原-所有
	void ResetAvatarAll()
	{
		window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.ResetAvatarAll();
	}

	//[功能]切换性别
	//{参数]_sex:性别 1男 2女
	void SwitchSex(_sex)
	{
		window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.SwitchSex(_sex);
	}

	//[功能]获取商城试穿的数据
	//{返回值]物品EntryID组合 如:"1000,10002"
	void GetMallTryData()
	{
		return window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.GetMallTryData();
	}

	//根据物品EnterID取物品图片的名称
	//库：m_g_goods.mdb	表：items
	//参数 enterid：物品的EnterID
	//返回值：错误值：-1
	void GetIconNameByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetIconNameByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			return window.DB_ERR;
		}

		var _ItemName = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ITENICON);
		window.g_Row.Release();
		return _ItemName;
	}
	//根据物品DID取物品图片的名称
	//库：m_g_goods.mdb	表：items
	//参数 did：物品的DisplayID
	//返回值：错误值：-1
	void GetIconNameByDID(did)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_DISPLAY,did);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetIconNameByDID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",did:"+did);
			return window.DB_ERR;
		}

		var _ItemName = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ITENICON);//62字段
		window.g_Row.Release();
		return _ItemName;
	}

	//根据技能ID取技能图片的名称
	//库：m_g_goods.mdb	表：items
	//参数 sid：技能ID
	//返回值：错误值：-1
	void GetSIconBySkillID(sid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_SKILLTYPE,sid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSIconBySkillID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",sid:"+sid);
			return window.DB_ERR;
		}

		var _ItemName = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ITENICON);//62字段
		window.g_Row.Release();
		return _ItemName;
	}

	//根据物品的EnterID取DisplayID
	//参数 enterid:物品的EnterID
	//错误值：-1
	void GetDisplayIDByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetDisplayIDByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			}
			return window.DB_ERR;
		}

		var _displayID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_DISPLAY);
		window.g_Row.Release();
		return _displayID;
	}
	
	//根据物品的DisplayID取EnterID
	//参数 did:物品的显示ID
	//错误值：-1
	void GetEnterIDByDisplayID(did)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_DISPLAY,did);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetEnterIDByDisplayID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",did:"+did);
			}
			return window.DB_ERR;
		}

		var _enterID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ENTRY);
		window.g_Row.Release();
		return _enterID;
	}

	//根据物品的EnterID取物品名称
	//参数 enterid:物品的EnterID
	//错误值：-1
	void GetNameByEnterID(enterid)
	{
		if(enterid == 10000)
		{
			return "金币";
		}
		if(enterid == 10001)
		{
			return "奖券";
		}
		if(enterid == 10002)
		{
			return "经验";
		}
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetNameByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			}
			return window.DB_ERR;
		}

		var _name = window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//3字段
		window.g_Row.Release();
		return _name;
	}

	//根据物品的EnterID取物品时间
	//参数 enterid:物品的EnterID
	//错误值：-1
	void GetTimeByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetTimeByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			}
			return window.DB_ERR;
		}

		var _time = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);//61字段
		window.g_Row.Release();
		return _time;
	}

	//根据物品的EnterID取物品价格
	//参数 enterid:物品的EnterID
	//错误值：-1
	void GetAllPriceByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetTimeByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			}
			return window.DB_ERR;
		}

		var _time = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TBUYPRICE);//61字段
		window.g_Row.Release();
		return _time;
	}

	//根据物品的DisplayID取parts_type
	//参数 displayid:物品的DisplayID
	//错误值：-1
	void GetPartsTypeByDisplayID(displayid)
	{
		window.g_Row.InitByInt(window.M_G_CLINET,window.PARTS,window.M_G_CLINET_PARTS_ACTIONID,displayid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetPartsTypeByDisplayID:"+window.M_G_CLINET+",TBName:"+window.PARTS);
			return window.DB_ERR;
		}

		var _partstype = window.g_Row.GetData(window.M_G_CLINET_PARTS_PARTS_TYPE);
		window.g_Row.Release();
		return _partstype;
	}

	//[功能]根据物品EnterID取物品的子ID
	//		库：m_g_goods.mdb	表：items
	//[参数] enterid：物品的EnterID
	//[返回值]：错误(0不是打包物品)
	void GetSubEntryByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSubEntryByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			return window.DB_ERR;
		}

		var _sub = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUBENTRY);
		window.g_Row.Release();
		return _sub;
	}

	//根据enterID取出物品的子类别
	//参数enterID
	void GetSubClassByEnterId(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSubClassByEnterId:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterID:"+enterID);
			return window.DB_ERR;
		}

		var _subclass = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUBCLASS);
		window.g_Row.Release();
		return _subclass;
	}

	//根据enterID取出物品的类别
	//参数enterID
	void GetClassByEnterId(enterID)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetClassByEnterId:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterID:"+enterID);
			return window.DB_ERR;
		}

		var _class = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_CLASS);
		_VNet2DBRow.del();
		return _class;
	}

	//根据物品ID找打包物品数量
	//参数enterID：物品的I
	void GetSubNumByItemID(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTitleByQID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",titleID:"+enterID);
			return window.DB_ERR;
		}

		var _subNum = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUBNUM);
		window.g_Row.Release();
		return _subNum;
	}

	//根据SubEntryID和子物品数量找打包的物品ID
	//参数SubEntryID:打包父类的ID
	//参数num:打包的数量
	void GetItemIdBySubEntryID(subEntryID,num)
	{
		if (subEntryID <= 0)
		{
			return 0;
		}
		var _VNet2DBTable=new VNet2DBTable
		{
			var _id = 0;
			void GetMyData(id){_id = id;}
		};
		var _SQL = "SELECT * FROM items WHERE SubEntry="+subEntryID+" AND SubNum="+num;
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_GOODS_ITEMS_ENTRY);
		return _VNet2DBTable._id;
	}

	//根据技能ID去出物品ID
	//参数skillID：技能ID
	void GetItemIDBySkillID(skillID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_SKILLTYPE,skillID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTitleByQID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",titleID:"+skillID);
			return window.DB_ERR;
		}

		var _ItemID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ENTRY);
		window.g_Row.Release();
		return _ItemID;
	}

	//根据有效期的序号取时间天数
	//参数1 enterID: 物品的ID
	//参数2 index: 0-~
	void GetTimeByIndex(enterID,index)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetTimeByIndex:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _timeStr = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);//61字段
		window.g_Row.Release();

		var _timeNum = window.GetSplitCount(_timeStr,","); //有效期的个数
		var _timeArr = window.SplitStr2(_timeStr,",",_timeNum);//有效期-返回一个数组

		return _timeArr[index];
	}

	//根据价格的序号取价格
	//参数1 enterID: 物品的ID
	//参数2 index: 0-~
	void GetPriceByIndex(enterID,index)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetPriceByIndex:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _priceStr = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TBUYPRICE);//60字段
		window.g_Row.Release();

		var _PriceNum = window.GetSplitCount(_priceStr,","); //价格的个数
		var _PriceArr = window.SplitStr2(_priceStr,",",_PriceNum);//价格-返回一个数组

		return _PriceArr[index];
	}

	//根据物品EnterID取技能图片的等级
	//库：m_g_goods.mdb	表：items
	//参数 enterid：物品的EnterID
	//返回值：错误值：-1
	void GetIconLvByEnterID(enterid)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetIconLvByEnterID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			return window.DB_ERR;
		}

		var _ItemLv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);
		window.g_Row.Release();
		return _ItemLv;
	}
	
	//根据ID取价格类型
	//参数1 enterID: 物品的ID
	void GetPriceTypeByID(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetPriceTypeByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _pricetype = window.g_Row.GetData(window.M_G_GOODS_ITEMS_USEPRICETYPE);//23字段
		window.g_Row.Release();
		return _pricetype;
	}

	//根据ID取物品类型
	//参数1 enterID: 物品的ID
	void GetClassIdByID(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetPriceTypeByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _classid = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);//23字段
		window.g_Row.Release();
		return _classid;
	}
	//根据类别判断是否属于技能或道具
	//参数ItemClass
	void ReturnByItemClass(ItemClass)
	{
		var _temp = toint(ItemClass)/window.GOODS_CLASS_BASE;
		if(_temp == window.GOODS_CLASS_Skill || _temp == window.GOODS_CLASS_Props )
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	//[功能]根据ID取物品的性别
	//[参数]enterID: 物品的ID
	//[返回值]0无性别 1男2女
	void GetItemSexByID(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetItemSexByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _sex = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SEX);
		window.g_Row.Release();
		return _sex;
	}

	//根据enterID取出物品销售状态 0.正常 1.限时 2.限量 3.新品 4.折扣 5.热销
	//参数enterID
	void GetTStateByEnterId(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSubClassByEnterId:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterID:"+enterID);
			return window.DB_ERR;
		}

		var _tstate = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTATE);
		window.g_Row.Release();
		return _tstate;
	}
	
	//根据enterID取出物品打折后的价钱
	//参数enterID
	void GetDISCountByEnterId(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSubClassByEnterId:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterID:"+enterID);
			return window.DB_ERR;
		}

		var _tdiscount = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TDISCOUNT);
		window.g_Row.Release();
		return _tdiscount;
	}
	
	//各种事件===================================================================================
	//[功能]购买完成
	//[参数]entryid:物品ID
	void OnBuySuccess(entryid,_errValue)
	{
		//此处注释(BUGID:0013436)：2010年5月4日 yxf：因永久去掉购买发送邮件到邮箱，故没有必要刷新了
		//window.FlarePresent();

		window.LMH_UserBuySomething(entryid);//引导事件

		window.CheckBugleNum();

		window.PlaySound(102);//购买成功
		var _text = ""+window.GetNameByEnterID(entryid);
		
		window.WriteChat7(301,_text);//购买完成

		printf("OnBuySuccess():entryid:"+entryid+",_errValue:"+_errValue+",window.GetUIGameState():"+window.GetUIGameState());
		//如是在游戏中 + AI 
		if(window.GetUIGameState() >= window.USER_UISTATE_AI_FREETRAIN && window.GetUIGameState() <= window.USER_UISTATE_GAME_ARENA)
		{
			//window.WriteChat7(301,_text);//购买完成
			window.find("VShortBarIcon_All_Logic_NAME").BuyReturn(entryid);
		}
		else
		{
			//window.find("UIController").LoadDLG(_errValue); 
			//window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+_text);
			window.find("BtnName_Hall_Bottom_Pack").SetFlicker(true);
		}
	}

	//[功能]卖出成功
	//[参数]entryid:物品ID
	void OnSellSuccess(entryid)
	{
		window.CheckBugleNum();
		if (tostring(entryid) != "")
		{
			printf("LMH_UserLostSomething-3:"+entryid);
			//type:1礼品盒物品到期,2丢弃了礼品，3背包里丢弃
			window.LMH_UserLostSomething(3,entryid);
		}
	}

	//[功能]更新赠送列表完成
	//[参数]entryid:物品ID
	void OnUpdatePresentFinish(entryid)
	{
		window.CheckBugleNum();
		window.FlarePresent();
		if (window.IsHallHtnOpened(window.G_HALLBTN_MAIL))
		{
			window.find("MAIL_LOGIC")._VMail_Logic.UpDataMail();
		}
		//return;
		if (tostring(entryid) != "" && toint(entryid) > 0)
		{
			printf("LMH_UserLostSomething-1:"+entryid);
			//type:1礼品盒物品到期,2丢弃了礼品，3背包里丢弃
			window.LMH_UserLostSomething(1,entryid);
		}
	}

	//[功能]设置邮件状态成功
	//[参数]entryid:物品ID
	void OnSetPresentSuccess(entryid)
	{
		//发出得到接受赠送物品的列表消息:参数不清楚是什么（这里是NULL）
		//window.Too_GetNewPresent("");

		window.FlarePresent();//丢弃
		if (tostring(entryid) != "" && toint(entryid) > 0)
		{
			printf("LMH_UserLostSomething(OnSetPresentSuccess)-2:"+entryid);

			//type:1礼品盒物品到期,2丢弃了礼品，3背包里丢弃
			window.LMH_UserLostSomething(2,entryid);
		}
	}

	//[功能]装备完成
	//[参数]_state:1绑定 0或其他取消绑定
	//		entryid:物品ID
	void OnEquipFinish(_state,entryid)
	{
		window.ResetAvatar(_state, entryid);

		window.PlaySound(116);//装备服饰时
		window.find("NAME_GCMap").find("Action").SETBODYID(window.GetMyRID());//房间里的人
		
		var _PackID = window.GetClassByEnterId(entryid);
		if (_state == 1 && toint(_PackID) == window.GOODS_CLASS_Racket)
		{
			window.LMH_EquipedTheRacket();
		}
		if (_state == 1 && toint(_PackID) / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Attribute)
		{
			window.LMH_OperateAtt();
		}
	}

	//[功能]使用完成
	//[参数]entryid:物品ID
	void OnUseFinish(entryid)
	{
		window.find("VShortBarIcon_All_Logic_NAME").UseReturn(entryid);//物品消费后数量设置
	}
	
	//[功能]绑定成功
	//[参数]_state:1绑定 0或其他取消绑定
	//		_entryid:物品ID
	void OnBindSuccess(_state,_entryid)
	{
		printf("B# [技能]OnBindSuccess:_state:"+_state+",_entryid:"+_entryid+",g_SkillGID:"+window.g_SkillGID+",g_SkillLastEnterID:"+window.g_SkillLastEnterID);
		window.SetSkillBindState(window.g_SkillGID,_state);
		//if (_state == 1 && window.g_SkillLastEnterID >0)
		if (_state == 1)
		{
			if (window.g_SkillLastEnterID >0)
			{
				window.SetPackSkillStateAll(window.g_SkillLastEnterID,0);
			}
			
			window.LMH_BindSkill(0);//引导事件
		}
	}

	//[功能]获得赠送完成
	//[参数]_entryid:物品ID
	void OnGetGiftFinish(_entryid)
	{
		window.FlarePresent();//接受
		window.CheckBugleNum();
		window.LMH_UserAcceptSomething(_entryid);//引导事件
	}

	//[功能]获取当前所处商城的标签页	夏洋洋添加于2009-12-21
	//[参数值]无
	//[返回值]返回标签的classID
	void GetCurClassID()
	{
		return window.find("VMall_Shopping_Logic").GetClassID();
	}

	//[功能]获取打折卡折扣
	//[参数值]_entryID:物品ID
	//[返回值]返回折扣
	void GetItemAgio(_entryID)
	{
		var _agio = 100;
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_entryID);
		if(_VNet2DBRow.IsReady())
		{
			_agio = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TAGIO);
		}
		_VNet2DBRow.del();
		return _agio;
	}

	//[功能]获取打折卡类型
	//[参数值]_entryID:物品ID
	//[返回值]返回折扣类型 0为非折扣类卡，1为幸运卡，2为折扣卡
	void GetItemAgioType(_entryID)
	{	
		var _agioType = 0;
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_entryID);
		if(_VNet2DBRow.IsReady())
		{
			_agioType = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TAGIOTYPE);
		}
		_VNet2DBRow.del();
		return _agioType;
	}
	
	//限时物品到期消息：物品识别ID（"1,2,3....."）
	void OnClearItems(enterID)
	{
		printf("B# 限时物品到期消息:"+enterID);
		//window.SplitStr(enterID,";",this,0);
		var _pos = window.GetUIPos();
		if(_pos == window.POS_PROPCONTINUE)
		{
			printf("B# 限时物品到期消息_pos:"+_pos);
			return;
		}
		var _itemIds = "";
		var _deadItems = "";
		var _count = window.GetSplitCount(enterID,";");
		var _arr = window.SplitStr2(enterID,";",_count);
		var _index = 0;

		var _RealNum = 0;	//实际的数量 2010年9月10日 22:17
		
		_count = toint(_count);
		printf("B# 限时物品到期消息_count:"+_count);
		while ( 1 )
		{
			if(_index >= _count) 
				break;

			//排除无效ID
			if ( toint(_arr[_index]) <= 0 )
			{
				printf("C# 物品到期(无效):_index:"+_index+"，itemsID:"+_arr[_index]);
				_index += 1;
				continue;
			}

			//排除一些不需要续费的物品 2010年9月9日 yxf 
			
			if ( window.IsDebarContinueItems( toint(_arr[_index]) ) )
			{
				printf("C# 物品到期(不续费):_index:"+_index+"，itemsID:"+_arr[_index]);
				_index += 1;
				continue;
			}

			var _findState = _itemIds.Find(""+_arr[_index]);
			if(toint(_findState) == -1)
			{
				if(_itemIds == "")
				{
					_itemIds += _arr[_index];
				}
				else
				{
					_itemIds += ","+ _arr[_index];
				}
				var _name = window.GetNameByEnterID(_arr[_index]);
				if(_deadItems == "")
				{
					_deadItems += _name;
				}
				else
				{
					_deadItems += ","+ _name;
				}
			}
			_index += 1;
			_RealNum += 1;
		}
		
		printf("C# 物品到期:_itemIds:"+_itemIds+" , _deadItems:"+_deadItems+",_RealNum:"+_RealNum);

		if(_RealNum <= 0)
		{
			return;
		}

		g_DeadItemsIDs = _itemIds;//alert("gDeadItems="+_itemIds);
//		window.find("UIController").LoadDLG(691);//已到期
//		window.find("VMB_PropContinue_Logic").SetItemIds(0,0,0,_itemIds);
//		var _content = window.findGClassbyCID(_itemIds);
//		window.find("VMB_PropContinue_Logic").ReplaceData(_content);
	}

	//[功能]根据ID取物品是否支持续费
	//[参数]enterID: 物品的ID
	//[返回值]0否 1是
	void GetItemReletByID(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMLIMIT,window.M_G_GOODS_ITEMLIMIT_ENTRYID,enterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetItemReletByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMLIMIT+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}

		var _relet = window.g_Row.GetData(window.M_G_GOODS_ITEMLIMIT_RELET);
		window.g_Row.Release();
		return _relet;
	}

	//[功能]排除不需要续费的物品
	//[参数]_itemid:物品ID
	//[返回值]true 需要排除 false不需要排除
	void IsDebarContinueItems(_itemid)
	{
		var _res = window.GetItemReletByID(_itemid);
		if (toint(_res) == 0)
		{
			printf("C# 物品到期:IsDebarContinueItems-排除的续费物品,_itemid:"+_itemid+",_res:"+_res);
			return true;
		}
		else
		{
			printf("C# 物品到期:IsDebarContinueItems-不排除的续费物品,_itemid:"+_itemid+",_res:"+_res);
			return false;
		}
	}
}
//通过商城CID查询统计物品类别
void findGClassbyCID(_CID)
{
//	var _num =window.GetSplitCount(_CID,",");
//	var _timeupItem = ""+"现在共有"+_num+"件物品";
	var _timeupItem = ""+"现在有物品";
	return _timeupItem;
//	var _CItemID ="";
//	var _ClassNUM = 0;
//	var _DressNum=0;
//	var _DressSH  =0;
//	var _DressQK =0;
//	var _DressSHT =0;
//	var _DressW =0;
//	var _DressQP =0;
//	var _DressX =0;
//	var _FaceTF =0;
//	var _accoutermentHS=0;
//	var _accoutermentXL=0;
//	var _accoutermentYJ=0;
//	var _accoutermentBSH=0;
//	var _attribute=0;
//	var _effect3D = 0;
//	var  _effect2DH = 0;
//	var  _effect2DSH = 0;
//
//
//
//	
//	var _VNet2DBRow = new VNet2DBRow{}		
//	var _num =window.GetSplitCount(_CID,",");
//	if(_num<=0){return;};
//	var _array = window.SplitStr2(_CID,",",_num);
//	var _index = 0;
//	
//	var m_isLoop = true;
////	while (_index<_num)
////	{
//		
//		_CID =toint(_array[_index]);
//		_index+=1;
//
//		_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_CID);
//		if (!_VNet2DBRow.IsReady())
//		{
//			_VNet2DBRow.Release();
//			return;			
//		}
//		var _Class= _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_CLASS);
//		_VNet2DBRow.Release();
//		var _mainClass = toint(toint(_Class)/100);
//		var _subClass = toint(toint(_Class)%100);
//		//服装1: 上装0 裙/裤1 手套2 袜3 鞋4 球拍5；美容2: 头发0 五官1 ；饰品3: 护腕/手链0 项链1 眼镜2 背饰3 附件4）
//		printf("www_CID="+_CID+","+"_Class="+_Class);
//		if (_mainClass==1)
//		{
//			if(_subClass==0)
//			{
//				_DressSH+=1;
//			}
//			if(_subClass==1)
//			{
//				_DressQK+=1;
//			}
//			if(_subClass==2)
//			{
//				_DressSHT+=1;
//			}
//			if(_subClass==3)
//			{
//				_DressW+=1;
//			}
//			if(_subClass==4)
//			{
//				_DressX+=1;
//			}
//			if(_subClass==5)
//			{
//				_DressQP+=1;
//			}
//		}
//		if (_mainClass==2)
//		{
//			if(_subClass==0)
//			{
//				_FaceTF+=1;
//			}
//			if(_subClass==1)
//			{
//				_FaceWG+=1;
//			}
//		}
//		if (_mainClass==3)
//		{
//			if(_subClass==0)
//			{
//				_accoutermentHS+=1;
//			}
//			if(_subClass==1)
//			{
//				_accoutermentXL+=1;
//			}
//			if(_subClass==2)
//			{
//				_accoutermentYJ+=1;
//			}
//			if(_subClass==3)
//			{
//				_accoutermentBSH+=1;
//			}
//		}		
//		//3D特效2D动画特效
//		if (_mainClass==5)
//		{
//			if(_subClass==20)
//			{
//				_effect3D+=1;
//			}
//			if(_subClass==21)
//			{
//				_effect2DSH+=1;
//			}
//			if(_subClass==22)
//			{
//				_effect2DH+=1;
//			}
//		}
//		//属性卡
//		if (_mainClass==6)
//		{
//			_attribute+=1;
//		}
//		
//	}
//
//	var _timeupstr = "";
//	if(_DressSH!=0)
//	{
//		_timeupstr = ""+_DressSH+"件上装";
//	}
//	if(_DressQK!=0)
//	{
//		_timeupstr =","+_DressQK+"件下装"
//	}
//	_VNet2DBRow.del();
}

//打开续费车准备充值
void PropContinue(_itemIds,_items,_Type,_entryId)
{	
	if ( window.CheckCanOpenMallDlg() == 0 ) return;
//	if ( window.find("ChargeCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM )
//	{
//		window.find("UIController").LoadDLG(641);
//		return;
//	}

//	window.ToBuyCarRecord(_itemIds,_items,_Type,_entryId);
//	window.SetMallVar(window.MALL_OPT_BUY);
//	window.find("UIController").LoadUI("UI_MALL_BUYCAR");
//	if(_entryId>0)
//	{
//		window.find("MALL_BUY_LOGIC")._BuyCar.m_BuycarState = 1;
//	}
//	else
//	{
//		window.find("MALL_BUY_LOGIC")._BuyCar.m_BuycarState = 2;
		window.ToChargeCarRecord(_itemIds,_items,_Type,_entryId);
		window.SetMallVar(window.MALL_OPT_PROPCONTINUE);
		window.find("UIController").LoadUI("UI_MALL_CHARGECAR");	// add by chenjihui  2011-1-5
	//	alert("enterID="+_entryId+",itemids="+_itemIds+",items="+_items+",type="+_Type+",enterid="+_entryId);
		if(_entryId>0)
		{
			window.find("MALL_Charge_LOGIC")._ChargeCar.m_BuycarState = 1;
		}
		else
		{
			window.find("MALL_Charge_LOGIC")._ChargeCar.m_BuycarState = 2;
		}
//	window.find("MALL_BUY_LOGIC")._BuyCar.SetPropContinueItemList(_itemIds,_items,_Type);
}
//向购物车中添加物品
void ToBuyCarRecord(_itemIds,_items,_Type,_MallentryId)
{
	//alert("_itemIds="+_itemIds+","+"_items="+_items+","+"_Type="+_Type+","+"_MallentryId="+_MallentryId);
	var _VNet2DBTable = new VNet2DBTable{}
	if(toint(_MallentryId)>0)
	{
		window.find("BuyCarRecord").ClearSelect();
		var _num = window.GetSplitCount(_MallentryId,",");
		var _items = window.SplitStr2(_MallentryId,",",_num);
		var index = 0;
		var _VNet2DBRow=new VNet2DBRow{}
		while(index<toint(_num))
		{
			_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_items[index]);
			if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
			{
				window.find("BuyCarRecord").AddSelect(_items[index],0,1,1);
			}
			else
			{
				var _sql = "SELECT * FROM "+window.BUYCARSELECT+" WHERE "+window.GAMEUI_BUYCARSELECT_CID_STR+"="+_items[index]+" AND "+window.GAMEUI_BUYCARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_BUYCARSELECT_TYPE_STR+"=0";
				_VNet2DBTable.Select(window.GAMEUI,_sql);
				if(_VNet2DBTable.GetSize()==0)//购物车里有这个就不加进购物车了
				{
					window.find("BuyCarRecord").AddSelect(_items[index],0,1,1);
				}
			}
			index +=1;
		}
		_VNet2DBRow.del();
	}
	else
	{
		var _itemIDs = window.SplitStr2(_itemIds,",");
		var _items = window.SplitStr2(_items,",");
		var _num = window.GetSplitCount(_itemIds,",");
		var index = 0;
		var _VNet2DBRow = new VNet2DBRow{}
		while(index<toint(_num))		//把快到期物品分别放入购物车
		{
			_VNet2DBRow.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_itemIDs[index]);
			var _entryID=0;
			if (_VNet2DBRow.IsReady())
			{
				_entryID = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_CID);
			}
			var _sql = "SELECT * FROM "+window.BUYCARSELECT+" WHERE "+window.GAMEUI_BUYCARSELECT_CID_STR+"="+_entryID+" AND "+window.GAMEUI_BUYCARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_BUYCARSELECT_TYPE_STR+"=0";
			_VNet2DBTable.Select(window.GAMEUI,_sql);
			if(_VNet2DBTable.GetSize()==0)//购物车里有这个就不加进购物车了
			{
				window.find("BuyCarRecord").AddSelect(_entryID,0,1,1);
			}
			index += 1;
		}
		_VNet2DBRow.del();
	}
	_VNet2DBTable.del();
}
// chenjihui 2011-1-14
// 清除表中原有的将到期物品，以保证ChargeCarSelect表里的数据为最新
void delByid()
{
	staticvar _VNet2DBTable2 = new VNet2DBTable
	{
		var m_deadItemIds = "";
		void getDeadItems(itemsIds)
		{
			if (m_deadItemIds=="")
			{
				m_deadItemIds =""+itemsIds;
			}else
			{
				m_deadItemIds = m_deadItemIds+","+itemsIds;
			}
		}
	};
	var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0 AND "+window.GAMEUI_CHARGECARSELECT_TEMP_STR+"=1";
	_VNet2DBTable2.Select( window.GAMEUI,sql2);
	if (_VNet2DBTable2.GetSize() != 0)
	{
		var idCount = toint(_VNet2DBTable2.GetSize());
		_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_ID);
		var ids = _VNet2DBTable2.m_deadItemIds;
		var arr = window.SplitStr2(ids,",",idCount);
		var i = 0;
		while (i < idCount)
		{
			window.find("ChargeCarRecord").Del(arr[i]);
			i += 1;
		}
	}
	_VNet2DBTable2.del();
}
// chenjihui 2011-1-14
// 退出频道时清除表ChargeCarSelect表里的数据
void delChargCarSelect()
{
	staticvar _VNet2DBTable2 = new VNet2DBTable
	{
		var m_deadItemIds = "";
		void getDeadItems(itemsIds)
		{
			if (m_deadItemIds=="")
			{
				m_deadItemIds =""+itemsIds;
			}else
			{
				m_deadItemIds = m_deadItemIds+","+itemsIds;
			}
		}
	};
	var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
	_VNet2DBTable2.Select( window.GAMEUI,sql2);
	if (_VNet2DBTable2.GetSize() != 0)
	{
		var idCount = toint(_VNet2DBTable2.GetSize());
		_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_ID);
		var ids = _VNet2DBTable2.m_deadItemIds;
		var arr = window.SplitStr2(ids,",",idCount);
		var i = 0;
		while (i < idCount)
		{
			window.find("ChargeCarRecord").Del(arr[i]);
			i += 1;
		}
	}
	_VNet2DBTable2.del();
}

// 向续费车中添加物品
// chenjihui 2011-1-7
void ToChargeCarRecord(_itemIds,_items,_Type,_MallentryId)
{
		printf("ToChargeCarRecord  000");
//	alert("_itemIds="+_itemIds+","+"_items="+_items+","+"_Type="+_Type+","+"_MallentryId="+_MallentryId);
	if ( window.find("ChargeCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM )  // 续费物品满的情况下不再加入续费车
	{
		return;
	}
	var _VNet2DBTable = new VNet2DBTable{}
	if(toint(_MallentryId)>0)
	{
		printf("ToChargeCarRecord  111");
//		window.find("ChargeCarRecord").ClearSelect();
		var _num = window.GetSplitCount(_MallentryId,",");
		var _items = window.SplitStr2(_MallentryId,",",_num);
		var index = 0;
		var _VNet2DBRow=new VNet2DBRow{}
		while(index<toint(_num))
		{
			_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_items[index]);
			if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
			{
				var _packid =window.GetPackIDbyCIDInPack(_items[index]);
				if (  _packid != window.g_DeadPropsPackID)
				{
					window.find("ChargeCarRecord").AddSelect(_items[index],0,1,1);
				}
				
			}
			else
			{
				var _sql = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_CID_STR+"="+_items[index]+" AND "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
				_VNet2DBTable.Select(window.GAMEUI,_sql);
				if(_VNet2DBTable.GetSize()==0)//续费车里有这个就不加进了
				{
					var _packid =window.GetPackIDbyCIDInPack(_items[index]);
					if (  _packid != window.g_DeadPropsPackID)
					{
						window.find("ChargeCarRecord").AddSelect(_items[index],0,0,1);
					}
				}
			}
			index +=1;
		}
		_VNet2DBRow.del();
	}
	else
	{
		window.delByid();
		printf("ToChargeCarRecord  222");
		var _itemIDs = window.SplitStr2(_itemIds,",");
		var _items = window.SplitStr2(_items,",");
		var _num = window.GetSplitCount(_itemIds,",");
		var index = 0;
		var _VNet2DBRow = new VNet2DBRow{}
		while(index<toint(_num))		//把快到期物品分别放入续费车
		{
			_VNet2DBRow.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,_itemIDs[index]);
			var _entryID=0;
			if (_VNet2DBRow.IsReady())
			{
				_entryID = _VNet2DBRow.GetData(window.M_G_GOODS_PLAYERITEMS_CID);
			}
			var _sql = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_CID_STR+"="+_entryID+" AND "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0 AND "+window.GAMEUI_CHARGECARSELECT_TEMP_STR+"=1";
			_VNet2DBTable.Select(window.GAMEUI,_sql);
			if(_VNet2DBTable.GetSize()==0)//续费车里有这个就不加进了
			{
				var _packid =window.GetPackIDbyCIDInPack(_items[index]);
				if (  _packid != window.g_DeadPropsPackID)
				{
					window.find("ChargeCarRecord").AddSelect(_entryID,0,1,1);
				}
			}
			index += 1;
		}
		_VNet2DBRow.del();
	}
	_VNet2DBTable.del();
}