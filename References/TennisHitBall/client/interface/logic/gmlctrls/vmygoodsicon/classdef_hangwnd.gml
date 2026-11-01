//
//悬停框的类定义-逻辑
//yxf 2008年12月27日
//夏洋洋 修改于2009-11-19

importex("$./../../../UI/GmlCtrls/VHangWnd/ClassDef_Goods.gml");

class VGoodHangWnd_Logic item
{
	name = "VGoodHangWnd_Logic";
	size = "220,400";//alpha = 30;bgcolor = "#FF";
	//======================与显示交互部分=========================================
	void Init()
	{
		//所有内容的容器
		//参数1 _name :物品的名称
		//参数2 lv :物品的等级
		//参数3 strength :物品的属性-力量 负数(-) 0(不显示) 正数(+) 
		//参数4 skill	 :物品的属性-技巧 负数(-) 0(不显示) 正数(+) 
		//参数5 front	 :物品的属性-前场 负数(-) 0(不显示) 正数(+) 
		//参数6 behind   :物品的属性-后场 负数(-) 0(不显示) 正数(+) 
		//参数7 serve	 :物品的属性-发球 负数(-) 0(不显示) 正数(+) 
		//参数8 energy	 :物品的属性-能量 负数(-) 0(不显示) 正数(+) 
		//参数9 equipLv	 :物品的装备所需等级
		//参数10 explain :物品的说明
		//参数11 opt	 :物品的操作
		//参数12 FrontEnergy	:技能进攻所需能量（0不显示此项 - 技能图标才有）
		//参数13 BackEnergy		:技能防守所需能量（0不显示此项 - 技能图标才有）
		//参数14 TimeAll		:物品总有效期 （-1不显示 0永久有效 礼品盒里有效期）
		//参数15 TimeLeft		:物品剩余时间（-2不显示 -1永久有效 0小于1天 背包里剩余时间，单位秒）
		//参数16 quarter		:已镶嵌的上旋技能名称（-1不显示此项）
		//参数17 Chip			:已镶嵌的削球技能名称（-1不显示此项）
		//参数18 Kill_shot		:已镶嵌的扣杀技能名称（-1不显示此项）
		//参数19 HighBall		:已镶嵌的放高球技能名称（-1不显示此项）
		//参数20 Serve			:已镶嵌的发球技能名称（-1不显示此项）
		//参数21 _skillClass	:技能操作说明(类型索引)
		staticvar s_html = new html
		{
			var _body = new body{}

			void SetData(_name,lv,strength,skill,front,behind,serve,energy,equipLv,explain,opt,
				FrontEnergy,BackEnergy,TimeAll,TimeLeft,quarter,Chip,Kill_shot,HighBall,Serve,_skillClass)
			{
				printf("B# 悬停框Html:_name:"+_name+",lv:"+lv+",strength:"+strength+",skill:"+skill
					+",front:"+front+",behind:"+behind+",serve:"+serve+",energy:"+energy
					+",equipLv:"+equipLv+",explain:"+explain+",opt:"+opt
					+",FrontEnergy:"+FrontEnergy+",BackEnergy："+BackEnergy+",TimeAll:"+TimeAll+",TimeLeft:"+TimeLeft
					+",quarter:"+quarter+",Chip:"+Chip+",Kill_shot:"+Kill_shot+",HighBall:"+HighBall+",Serve:"+Serve
					+",skillClass:"+_skillClass);

				_body.appendHtml("<font color=#FFFF>"+_name+"&nbsp;"+lv+"<br></font>");
				_body.appendHtml("<font>"+strength+"力量<br></font>");
				_body.appendHtml("<font>"+skill+"技巧<br></font>");
				_body.appendHtml("<font>"+front+"前场<br></font>");
				_body.appendHtml("<font>"+behind+"后场<br></font>");
				_body.appendHtml("<font>"+serve+"发球<br></font>");
				_body.appendHtml("<font>"+energy+"能量<br></font>");
				_body.appendHtml("<font>所需等级："+equipLv+"<br></font>");
				_body.appendHtml("<font>说明："+explain+"<br></font>");
				_body.appendHtml("<font>操作："+opt+"<br></font>");
				_body.appendHtml("<font>进攻所需能量："+FrontEnergy+"<br></font>");
				_body.appendHtml("<font>防守所需能量："+BackEnergy+"<br></font>");
				_body.appendHtml("<font>有效期："+TimeAll+"<br></font>");
				_body.appendHtml("<font>剩余时间："+TimeLeft+"<br></font>");
				_body.appendHtml("<font>上旋技能："+quarter+"<br></font>");
				_body.appendHtml("<font>削球技能："+Chip+"<br></font>");
				_body.appendHtml("<font>扣杀技能："+Kill_shot+"<br></font>");
				_body.appendHtml("<font>放高球技能："+HighBall+"<br></font>");
				_body.appendHtml("<font>发球技能："+Serve+"<br></font>");
				_body.appendHtml("<font>操作："+_skillClass+"<br></font>");

				parent.pos(window.mousex,window.mousey);
			}
		}
	}
	inclass("VGoodHangWnd_UI");
	Init();
	//======================================快捷键============================================	
	window.find("gameinput").AddExclusiveShortcutUser(this);
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();break;
			}
		}
	}
	//=========================================================================================
	setFocus = "true";
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			del();
		}
		else setFocus = "true";
	}
	//=========================================================================================
	//设置类型0物品的数据
	//参数 enterid：物品识别ID
	//参数 index:	操作序号
	void SetGoodsData_0(enterid,index)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_0:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			del();
		}

		var _Name = window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//名称
		var _Lv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);//等级

		//购买的天数
		var _BuyDays = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
		//购买所需的点券数 夏洋洋 添加于2009-11-20
		var _BuyPrice = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TBUYPRICE);
		//用来判断物品的有效期（0为永久有效，-1不显示）
		var _LimitBuyTime = -1;

		var _AttValue = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ATTVALUE);//属性
		//var _arr = window.SplitStr2(_AttValue,",");//属性拆分-返回一个数组 夏洋洋 修改于2009-11-20
		var _EquipLv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_REQUIREDLEVEL);//所需等级
		var _explain = window.g_Row.GetData(window.M_G_GOODS_ITEMS_DESCRIBE);//说明
		
		var _SkillSubNum = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUBNUM);;	//技能数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20
		var _PropNum = 0; ////道具数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20
		var _FrontEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		var _BackEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）

		//是否为技能
		var _Class = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);//类别
		if (toint(_Class)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill || toint(_Class)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
		{
			//用来判断技能的有效期是否永久有效
			_LimitBuyTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
			//alert(_LimitBuyTime);
			
			var _SkillID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SKILLTYPE);//技能ID
			window.g_Row.Release();
			
			window.g_Row.InitByInt(window.A001USER,window.SKILL,window.A001USER_SKILL_SKILLID,_SkillID);

			if (!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				printf("B# error-VGoodHangWnd_Logic-SetGoodsData_0:DBname:"+window.A001USER+",TBName:"+window.SKILL+",Skill:"+_SkillID);
				_FrontEnergy = 0;
				_BackEnergy = 0;
			}
			_FrontEnergy = window.g_Row.GetData(window.A001USER_SKILL_IFRONTNEEDENERGY);//前场（进攻）能量
			_BackEnergy = window.g_Row.GetData(window.A001USER_SKILL_IBACKNEEDENERGY);//后场（防守）能量
			window.g_Row.Release();
		}	
		window.g_Row.Release();
		//力量型选手和敏捷型选手的技能使用等级 夏洋洋 添加 于2009-11-19
		window.g_Row.InitByInt(window.M_G_GOODS,window.INLAYITEM,window.M_G_GOODS_INLAYITEM_ENTRYID,enterid);
		var _strengthLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE1);
		var _agilityLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE3);

		window.g_Row.Release();
		//vip折扣
//		var _vipValue = window.GetVipTypeByUID();
//		var _vipButAgio = 0;
//		if(_vipValue>0)	
//		{
//			_vipButAgio = window.GetVipBuyAgio(_vipValue);
//			var _temp = tostring(_vipButAgio*10);
//			var _src = _temp.Mid(0,3);
//			_vipButAgio = _src;
//		}
		s_html.SetData(_Name,_Lv,_AttValue,_EquipLv,_explain,index,_FrontEnergy,_BackEnergy,_LimitBuyTime,-2,"","","","","",_Class,_strengthLv,_agilityLv,_BuyPrice,_SkillSubNum,_BuyDays,0);
		//alert(""+_buyPrice[0]+" "+_buyPrice[1]+" "+_buyPrice[2]);
	}
	//end SetGoodsData_0
	//=========================================================================================
	//设置类型1物品的数据
	//参数 gid：	物品GID
	//参数 index:	操作序号
	void SetGoodsData_1(gid,index)
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.PLAYERITEMS,window.M_G_GOODS_PLAYERITEMS_GID,gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_1:DBname:"+window.M_G_GOODS+",TBName:"+window.PLAYERITEMS+",gid:"+gid);
			del();
		}
		var _EnterID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_CID);//物品EnterID
		var _SkillNum = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_NUM);//技能数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20

		//用以保存球拍已镶嵌的技能iD
		var _ArrSkill = sysarray(5);
		var _i;
		while (_i < 5)
		{
			_ArrSkill[_i] = -1;
			_i += 1;
		}
		var _packID = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_PACKID);//物品背包ID
		if (_packID == 105)//如果是球拍
		{
			_ArrSkill[0] = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT1);//已镶嵌第一个技能
			_ArrSkill[1] = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT2);//已镶嵌第二个技能
			_ArrSkill[2] = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT3);//已镶嵌第三个技能
			_ArrSkill[3] = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT4);//已镶嵌第四个技能
			_ArrSkill[4] = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_GEMSLOT5);//已镶嵌第五个技能
		}
		var _Deadline = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_DEADLINE);//物品有效时间

		if (_Deadline == 0 || _Deadline == "")
		{
			_Deadline = -1;//永久有效
		}
		else
		{
			_Deadline = window.g_MallTool.GetDeadLine(_Deadline); //剩余秒数
		}
		window.g_Row.Release();
		
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_EnterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_1:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+_EnterID);
			del();
		}
		var _Name = window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//名称
		var _Lv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);//等级

		var _AttValue = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ATTVALUE);//属性
		//var _arr = window.SplitStr2(_AttValue,",",6);//属性拆分-返回一个数组
		var _EquipLv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_REQUIREDLEVEL);//所需等级
		var _explain = window.g_Row.GetData(window.M_G_GOODS_ITEMS_DESCRIBE);//说明
		
		
		var _FrontEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		var _BackEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		
		var _Class = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);//类别
		if (toint(_Class)/100 == 4)//如果是技能
		{
			var _SkillID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SKILLTYPE);//技能ID
			window.g_Row.Release();
			
			window.g_Row.InitByInt(window.A001USER,window.SKILL,window.A001USER_SKILL_SKILLID,_SkillID);

			if (!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				printf("B# error-VGoodHangWnd_Logic-SetGoodsData_0:DBname:"+window.A001USER+",TBName:"+window.SKILL+",Skill:"+_SkillID);
				_FrontEnergy = 0;
				_BackEnergy = 0;
			}
			_FrontEnergy = window.g_Row.GetData(window.A001USER_SKILL_IFRONTNEEDENERGY);//前场（进攻）能量
			_BackEnergy = window.g_Row.GetData(window.A001USER_SKILL_IBACKNEEDENERGY);//后场（防守）能量
			window.g_Row.Release();
		}
		window.g_Row.Release();
		_i = 0;
		while (_i < 5)
		{
			if (toint(_ArrSkill[_i]) > 0)
			{
				window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_ArrSkill[_i]);

				if (!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					printf("B# error-VGoodHangWnd_Logic-SetGoodsData_1:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+_ArrSkill[_i]);
					del();
				}
				_ArrSkill[_i] = ""+window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//名称
				window.g_Row.Release();
			}
			else
			{
				_ArrSkill[_i] = "";
			}
			_i += 1;
		}
		
		window.g_Row.Release();

		//力量型选手和敏捷型选手的技能使用等级 夏洋洋 添加 于2009-11-19
		window.g_Row.InitByInt(window.M_G_GOODS,window.INLAYITEM,window.M_G_GOODS_INLAYITEM_ENTRYID,_EnterID);
		var _strengthLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE1);
		var _agilityLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE3);
		window.g_Row.Release();
		s_html.SetData(_Name,_Lv,_AttValue,_EquipLv,_explain,index,_FrontEnergy,_BackEnergy,-1,_Deadline,_ArrSkill[0],_ArrSkill[1],_ArrSkill[2],_ArrSkill[3],_ArrSkill[4],_Class,_strengthLv,_agilityLv,0,_SkillNum,0,0);
	}//end SetGoodsData_1
	//=========================================================================================
	//设置类型2物品的数据
	//参数 gid：赠送ID
	//参数 index:	操作序号
	void SetGoodsData_2(gid,index)
	{
		window.g_Row.InitByBigInt(window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,gid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_2:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMPRESENT+",gid:"+gid);
			del();
		}
		var _EnterID = window.g_Row.GetData(window.M_G_GOODS_ITEMPRESENT_ITEMENTRYID);//物品EnterID
		var _Deadline = window.g_Row.GetData(window.M_G_GOODS_ITEMPRESENT_ITEMGOODSID);//物品的有效期
		var _SkillNum = window.g_Row.GetData(window.M_G_GOODS_PLAYERITEMS_NUM);//技能数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20
		if (toint(_Deadline)<0)
		{
			_Deadline = -toint(_Deadline);
		}
		//_Deadline = window.g_MallTool.GetDeadLineDay(_Deadline); //剩余天数
		window.g_Row.Release();

		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_EnterID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_2:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			del();
		}
		
		var _Name = window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//名称
		var _Lv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);//等级

		var _AttValue = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ATTVALUE);//属性
		//var _arr = window.SplitStr2(_AttValue,",",6);//属性拆分-返回一个数组
		var _EquipLv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_REQUIREDLEVEL);//所需等级
		var _explain = window.g_Row.GetData(window.M_G_GOODS_ITEMS_DESCRIBE);//说明
		
		var _FrontEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		var _BackEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		//是否为技能
		var _Class = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);//类别
		if (toint(_Class)/100 == 4)
		{
			var _SkillID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SKILLTYPE);//技能ID
			window.g_Row.Release();
			
			window.g_Row.InitByInt(window.A001USER,window.SKILL,window.A001USER_SKILL_SKILLID,_SkillID);

			if (!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				printf("B# error-VGoodHangWnd_Logic-SetGoodsData_2:DBname:"+window.A001USER+",TBName:"+window.SKILL+",Skill:"+_SkillID);
				_FrontEnergy = 0;
				_BackEnergy = 0;
			}
			_FrontEnergy = window.g_Row.GetData(window.A001USER_SKILL_IFRONTNEEDENERGY);//前场（进攻）能量
			_BackEnergy = window.g_Row.GetData(window.A001USER_SKILL_IBACKNEEDENERGY);//后场（防守）能量
			window.g_Row.Release();
		}	
		window.g_Row.Release();

		//力量型选手和敏捷型选手的技能使用等级 夏洋洋 添加 于2009-11-19
		window.g_Row.InitByInt(window.M_G_GOODS,window.INLAYITEM,window.M_G_GOODS_INLAYITEM_ENTRYID,_EnterID);
		var _strengthLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE1);
		var _agilityLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE3);
		window.g_Row.Release();
		
		s_html.SetData(_Name,_Lv,_AttValue,_EquipLv,_explain,index,_FrontEnergy,_BackEnergy,_Deadline,-2,"","","","","",_Class,_strengthLv,_agilityLv,-1,_SkillNum,0,0);
	}//end SetGoodsData_2
	//=========================================================================================
	//设置类型3物品的数据
	//参数 gid：	物品GID
	//参数 index:	操作序号
	void SetGoodsData_3(enterid,index)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VGoodHangWnd_Logic-SetGoodsData_0:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterid);
			del();
		}
		
		var _Name = window.g_Row.GetData(window.M_G_GOODS_ITEMS_NAME);//名称
		var _Lv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);//等级

		//购买的天数
		var _BuyDays = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
		//购买所需的点券数 夏洋洋 添加于2009-11-20
		var _BuyPrice = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TBUYPRICE);
		// 普通用户价格
		var _userPriceType = window.g_Row.GetData(window.M_G_GOODS_ITEMS_USEPRICETYPE);
		//用来判断物品的有效期（0为永久有效，-1不显示）
		var _LimitBuyTime = -1;

		var _AttValue = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ATTVALUE);//属性
		//var _arr = window.SplitStr2(_AttValue,",");//属性拆分-返回一个数组 夏洋洋 修改于2009-11-20
		var _EquipLv = window.g_Row.GetData(window.M_G_GOODS_ITEMS_REQUIREDLEVEL);//所需等级
		var _explain = window.g_Row.GetData(window.M_G_GOODS_ITEMS_DESCRIBE);//说明
		
		var _SkillSubNum = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUBNUM);;	//技能数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20
		var _PropNum = 0; ////道具数量（0不显示此项 - 技能图标才有） 夏洋洋 添加于2009-11-20
		var _FrontEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）
		var _BackEnergy = 0;	//技能进攻所需能量（0不显示此项 - 技能图标才有）

		//是否为技能
		var _Class = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);//类别
		if (toint(_Class)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill || toint(_Class)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
		{
			//用来判断技能的有效期是否永久有效
			_LimitBuyTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
			//alert(_LimitBuyTime);
			
			var _SkillID = window.g_Row.GetData(window.M_G_GOODS_ITEMS_SKILLTYPE);//技能ID
			window.g_Row.Release();
			
			window.g_Row.InitByInt(window.A001USER,window.SKILL,window.A001USER_SKILL_SKILLID,_SkillID);

			if (!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				printf("B# error-VGoodHangWnd_Logic-SetGoodsData_0:DBname:"+window.A001USER+",TBName:"+window.SKILL+",Skill:"+_SkillID);
				_FrontEnergy = 0;
				_BackEnergy = 0;
			}
			_FrontEnergy = window.g_Row.GetData(window.A001USER_SKILL_IFRONTNEEDENERGY);//前场（进攻）能量
			_BackEnergy = window.g_Row.GetData(window.A001USER_SKILL_IBACKNEEDENERGY);//后场（防守）能量
			window.g_Row.Release();
		}	
		window.g_Row.Release();
		//力量型选手和敏捷型选手的技能使用等级 夏洋洋 添加 于2009-11-19
		window.g_Row.InitByInt(window.M_G_GOODS,window.INLAYITEM,window.M_G_GOODS_INLAYITEM_ENTRYID,enterid);
		var _strengthLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE1);
		var _agilityLv = window.g_Row.GetData(window.M_G_GOODS_INLAYITEM_LVTYPE3);
		window.g_Row.Release();
		//vip折扣
		var _vipValue = window.GetVipTypeByUID();
		var _vipButAgio = 0;
		if(_vipValue != -1)
		{
			_vipButAgio = window.GetVipBuyAgio(_vipValue);
			var _temp = tostring(_vipButAgio*10);
			var _src = _temp.Mid(0,3);
			_vipButAgio = _src;
		}

		// 限时, 限量物品(段晓彤)
		var _CurrTime = window.g_ShopTimeNow;// 当前时间, 从洋洋那里得到
		var _StartTime = window.find("CMallGoods").GetGoodsBeginTime(enterid);	 // 开始时间
		var _EndTime = window.find("CMallGoods").GetGoodsEndTime(enterid);	// 结束时间
		var _ShowTime = ""; // 需要显示的时间
		var _ShowNum = -1;	// 显示物品剩余数量(限量物品), -1:不用此参数 0:物品已停止售卖, >0:显示数量
		var _TState = 0;//68 网球：0.正常 1.限时 2.限量 3.新品 4.折扣 5.热销
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);
		if (window.g_Row.IsReady())
		{
			_TState = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTATE);
			if (_TState == 1 || _TState == 2)
			{
				if (toint(_CurrTime) < toint(_StartTime))// 如果未到开始时间, 则显示开始时间
				{
					_ShowTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTARTTIME) + " 开始售卖";
				}
				if (toint(_CurrTime) >= toint(_StartTime) && toint(_CurrTime) <= toint(_EndTime))
					_ShowTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TENDTIME) + " 停止售卖";
				if (toint(_CurrTime) >= toint(_EndTime))
					_ShowTime = " 已停止售卖";
				if (_TState == 2)	// 如果是"限量"的话, 还需要显示物品剩余数量
				{
					// LimitTimeItem表
					var _NumTemp = 0;
					var _LimitItemDBRow = new VNet2DBRow{};
					_LimitItemDBRow.InitByInt(window.M_G_GOODS, window.LIMITTIMEITEM, window.M_G_GOODS_LIMITTIMEITEM_ENTRYID, toint(enterid));
					if (_LimitItemDBRow.IsReady())
					{
						_NumTemp = _LimitItemDBRow.GetData(window.M_G_GOODS_LIMITTIMEITEM_NUM);// 得已卖物品数量
						_LimitItemDBRow.del();// 释放LimitTimeItem表对象
					}
					else
					{
						_LimitItemDBRow.del();// 释放LimitTimeItem表对象
					}
					 _ShowNum = window.g_Row.GetData(window.M_G_GOODS_ITEMS_LIMITBUYTIMECOUNT) - _NumTemp;// 得到剩余物品数量
					if (_ShowNum <= 0)
						_ShowNum = "已售罄";
					if (toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))// 售卖期外, 不显示物品剩余数量
						_ShowNum = -1;
				}
			}
			window.g_Row.Release();
		}
		else
		{
			window.g_Row.Release();
		}

		// 新品
		if (_TState == 3)
		{
			window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);
			if (window.g_Row.IsReady())
			{
				if (toint(_CurrTime) < toint(_StartTime))//如果未开始售卖
				{
					_ShowTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTARTTIME) + " 开始销售";
					window.g_Row.Release();
				}
			}
			else
			{
				window.g_Row.Release();
			}
		}

		// 打折时间显示
		if (_TState == 4)
		{
			window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);
			if (window.g_Row.IsReady())
			{
				if (toint(_CurrTime) - toint(_StartTime) < 0)	//如果未开始售卖
					_ShowTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTARTTIME) + " 开始打折";
				if (toint(_CurrTime) >= toint(_StartTime) && toint(_CurrTime) <= toint(_EndTime))
					_ShowTime = "打折销售中";
				if (_CurrTime > _EndTime)
					_ShowTime = "已停止打折";
				window.g_Row.Release();
			}
			else
			{
				window.g_Row.Release();
			}
		}

		// VIP显示优惠价
		var _LimitBuyTime = 0;// 61 网球：物品有效期 -1永久有效 0(7天) 1(15天) 2(30天):格式："7,15,30"
		var _arrDayVIP = 0;
		var _arrSize = 0;

		var _TPriceVIP = 0; //72 网球：VIP价格 格式："700,1500,3000"
		var _arrPriceVIP = 0;

		var _TPriceTypeVIP = 0;//73 网球：VIP价格类型
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterid);
		if (window.g_Row.IsReady())
		{
			_LimitBuyTime = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);// 61 网球：物品有效期 -1永久有效 0(7天) 1(15天) 2(30天):格式："7,15,30"
			_arrDayVIP = window.SplitStr2(_LimitBuyTime,',');
			_arrSize = window.GetSplitCount(_LimitBuyTime,',');

			_TPriceVIP = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TPRICEVIP);
			_arrPriceVIP = window.SplitStr2(_TPriceVIP,',');

			_TPriceTypeVIP = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TPRICETYPEVIP);
			window.g_Row.Release();
		}
		else
		{
			window.g_Row.Release();
		}

		s_html.SetData(_Name,_Lv,_AttValue,_EquipLv,_explain,-1,_FrontEnergy,_BackEnergy,_LimitBuyTime,-2,"","","","","",_Class,_strengthLv,_agilityLv,_BuyPrice,_SkillSubNum,_BuyDays,_vipButAgio, _ShowTime, _ShowNum, _arrDayVIP, _arrSize, _arrPriceVIP, _TPriceTypeVIP, _userPriceType);
		//alert(""+_buyPrice[0]+" "+_buyPrice[1]+" "+_buyPrice[2]);
	}
};