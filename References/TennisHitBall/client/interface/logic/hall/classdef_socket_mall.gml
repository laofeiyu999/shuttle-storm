//
//网球-大厅界面的IO类定义 - 商城部分
//

//商城信息反馈
//参数 state：0:商城已关闭 1:商城开启
void ShopState(state)
{
	if (!window.g_WantToOpenMall){return;}//已取消打开商城
	window.killtimer("OpenMallErr_Name");//停止倒计时
	window.LoadInfoBoard(356);	//正在刷新物品数据……
	if( state == 0 )
	{
		window.find("UIController").LoadDLG(400);	//商城已关闭的信息
//			window.g_IsOpenMalling = false;
	}
	else
	{
		window.find("UIController").LoadUI("UI_MALL"); //商城每次载入
		//发出获得商城时间的消息：NULL
		window.Too_GetShopTime();
	}
}

//商城相关-反馈
//参数 :角色id,返回值 >0成功 <0失败,特殊用
//FourParam：购买完成后传来物品的EnterID
void ActionState(iUserId,returnid,ThirdParam,FourParam)
{
	var _errValue = -1;	//错误值
	var _errType = 1;	//提示类型：1提示条 2提示框 3聊天框里
	var _text = "";		//自定义的时候，需要赋值
	//////////////////////////////////////////////////////////////////////////
	// 物品通用部分代碼
	//////////////////////////////////////////////////////////////////////////
	//成功的
	if (returnid == 1010001){printf("B# 物品等级升级!");VNETLOG(1131,"物品等级升级\n");return;}
	if (returnid == 1010002){printf("B# 物品属性升级!");VNETLOG(1131,"物品属性升级\n");return;}
	if (returnid == 1010003){printf("B# 物品耐久度过少!");VNETLOG(1131,"物品耐久度过少\n");return;}
	if (returnid == 1010004){printf("B# 物品耐久度为0!");VNETLOG(1131,"物品耐久度为0\n");return;}
	//错误的
	if (returnid == -1010001)
		{printf("B# 物品未定义!");VNETLOG(1131,"物品未定义\n");_errValue = 64;_errType = 2;}
	if (returnid == -1010002)
		{printf("B# 指定物品未找到!");VNETLOG(1131,"指定物品未找到\n");_errValue = 65;_errType = 2;}
	if (returnid == -1010003)
		{printf("B# 物品拥有者不匹配!");VNETLOG(1131,"物品拥有者不匹配\n");_errValue = 66;_errType = 2;}
	if (returnid == -1010004)
		{printf("B# 物品限制未定义!");VNETLOG(1131,"物品限制未定义\n");_errValue = 67;_errType = 2;}
	if (returnid == -1010005)
		{printf("B# 物品添加时该物已存在，并且为唯一物品!");VNETLOG(1131,"物品添加时该物已存在，并且为唯一物品\n");_errValue = 68;_errType = 2;}
	if (returnid == -1010006)
		{printf("B# 物品数量已满!");VNETLOG(1131,"物品数量已满\n");_errValue = 69;_errType = 2;}
	if (returnid == -1010007)
		{printf("B# 物品添加时添加数量过多!");VNETLOG(1131,"物品添加时添加数量过多\n");_errValue = 325;}
	if (returnid == -1010008)
		{printf("B# 物品减少时减少数量过多!");VNETLOG(1131,"物品减少时减少数量过多\n");_errValue = 326;}
	if (returnid == -1010009){printf("B# 创建唯一物品id时失败!");VNETLOG(1131,"创建唯一物品id时失败\n");return;}
	if (returnid == -1010010){printf("B# 废弃唯一物品id时失败!");VNETLOG(1131,"废弃唯一物品id时失败\n");return;}
	if (returnid == -1010011)
		{printf("B# 背包已满!");VNETLOG(1131,"背包已满\n");_errValue = 327;}
	if (returnid == -1010012)
		{printf("B# 物品激活失败!");VNETLOG(1131,"物品激活失败\n");_errValue = 328;}
	if (returnid == -1010013){printf("B# 分割数量不足!");VNETLOG(1131,"分割数量不足\n");return;}
	if (returnid == -1010014){printf("B# 不可分割!");VNETLOG(1131,"不可分割\n");return;}
	if (returnid == -1010015)
		{printf("B# 初始化新物品失败!");VNETLOG(1131,"初始化新物品失败\n");_errValue = 329;}
	if (returnid == -1010016)
		{printf("B# 用户未找到!");VNETLOG(1131,"用户未找到\n");_errValue = 316;}
	if (returnid == -1010017)
		{printf("B# 背包位置无效!");VNETLOG(1131,"背包位置无效\n");_errValue = 330;}
	if (returnid == -1010018)
		{printf("B# 数量无效!");VNETLOG(1131,"数量无效\n");_errValue = 531;}
	if (returnid == -1010019)
		{printf("B# 背包id无效!");VNETLOG(1131,"背包id无效\n");_errValue = 532;}
	if (returnid == -1010020)
		{printf("B# 物品等级升级表未找到!");VNETLOG(1131,"物品等级升级表未找到\n");_errValue = 533;}
	if (returnid == -1010021)
		{printf("B# 物品属性升级表未找到!");VNETLOG(1131,"物品属性升级表未找到\n");_errValue = 334;}
	if (returnid == -1010022)
		{printf("B# 物品不能增加经验!");VNETLOG(1131,"物品不能增加经验\n");_errValue = 335;}
	if (returnid == -1010023)
		{printf("B# 物品定义不合法!");VNETLOG(1131,"物品定义不合法\n");_errValue = 336;}
	if (returnid == -1010024)
		{printf("B# 物品超出有效时间,即将删除!");VNETLOG(1131,"物品超出有效时间,即将删除\n");_errValue = 368;}

	//赠送
	if (returnid == -1020001)
		{printf("B# 赠送失败!");VNETLOG(1131,"赠送失败\n");_errValue = 337;}
	if (returnid == -1020002)
	{
		printf("B# 没有找到要赠送的玩家!");VNETLOG(1131,"没有找到要赠送的玩家\n");
		//_errValue = 338;
		return;
	}
	if (returnid == -1020003)
		{printf("B# 不正确的赠送物品接受人!");VNETLOG(1131,"不正确的赠送物品接受人\n");_errValue = 339;}
	if (returnid == -1020004)
		{printf("B# 赠送已过期!");VNETLOG(1131,"赠送已过期\n");_errValue = 340;}
	if (returnid == -1020005)
		{printf("B# 赠送物品绑定!");VNETLOG(1131,"赠送物品绑定\n");_errValue = 341;}
	if (returnid == -1020006)
		{printf("B# 赠送物品受限无法赠送!");VNETLOG(1131,"赠送物品受限无法赠送\n");_errValue = 342;}
	if (returnid == -1020007)
		{printf("B# 赠送物品未找到!");VNETLOG(1131,"赠送物品未找到\n");_errValue = 343;}
	if (returnid == -1020008)
		{printf("B# 不能赠送给自己!");VNETLOG(1131,"不能赠送给自己\n");_errValue = 344;}
	if (returnid == -1020009)
		{printf("B# 无法获得赠送的物品!");VNETLOG(1131,"无法获得赠送的物品\n");_errValue = 345;}
	if (returnid == -1020010)
		{printf("B# 无效的赠送信息!");VNETLOG(1131,"无效的赠送信息\n");_errValue = 346;}
	if (returnid == -1020011)
		{printf("B# 赠送无法送达自己!");VNETLOG(1131,"赠送无法送达自己\n");_errValue = 347;}
	if (returnid == -1020012)
		{printf("B# 无法找到要赠送的物品!");VNETLOG(1131,"无法找到要赠送的物品\n");_errValue = 348;}
	if(returnid == -2010036)
	{
		printf("B# 要赠送的玩家已经离线");VNETLOG(1131,"要赠送的玩家已经离线\n");_errValue = 387;_errType = 3;
	}
	if(returnid == -2010037)
	{
		printf("B# 送花的玩家已经离线");VNETLOG(1131,"送花的玩家已经离线\n");_errValue = 388;_errType = 3;
	}
	if(returnid == -2010038)
	{
		printf("B# 赠送的玩家不是好友");VNETLOG(1131,"赠送的玩家不是好友\n");_errValue = 390;_errType = 3;
	}
	if(returnid == -2010039)
	{
		printf("B# 限量物品已卖空");VNETLOG(1131,"限量物品已卖空\n");_errValue = 391;_errType = 3;
	}
	if(returnid == -2010040)
	{
		printf("B# 开始售卖");VNETLOG(1131,"开始售卖\n");_errValue = 392;_errType = 3;
	}
	if(returnid == -2010041)
	{
		printf("B# 物品已过售卖期限");VNETLOG(1131,"物品已过售卖期限\n");_errValue = 393;_errType = 3;
	}
	if(returnid == -2010042)
	{
		printf("B# 此物品您已经有了永久期限，无需购买.");VNETLOG(1131,"此物品您已经有了永久期限，无需购买\n");_errValue = 829;_errType = 2;
	}
	if (returnid == -1030001){printf("B# 来源物品未找到!");VNETLOG(1131,"来源物品未找到\n");_errValue = 700;_errType = 2;}
	if (returnid == -1030002){printf("B# 目标物品未找到!");VNETLOG(1131,"目标物品未找到\n");_errValue = 701;_errType = 2;}
	if (returnid == -1030003){printf("B# 合并物品类别不同一!");VNETLOG(1131,"合并物品类别不同一\n");_errValue = 702;_errType = 2;}
	
	if (returnid == -1040001){printf("B# 金币改变超出底线!");VNETLOG(1131,"金币改变超出底线\n");_errValue = 703;_errType = 2;}
	if (returnid == -1040002){printf("B# 金币改变超出上线!");VNETLOG(1131,"金币改变超出上线\n");_errValue = 704;_errType = 2;}
	
	//////////////////////////////////////////////////////////////////////////
	// 物品掉落
	//////////////////////////////////////////////////////////////////////////
	// 成功代码
	if (returnid == 1050001){printf("B# 掉落成功!");VNETLOG(1131,"掉落成功\n");return;}
	// 失败代码
	if (returnid == -1050001){printf("B# 掉落失败!");VNETLOG(1131,"掉落失败\n");return;}
	if (returnid == -1050002){printf("B# 掉落id未找到!");VNETLOG(1131,"掉落id未找到\n");return;}
	if (returnid == -1050003){printf("B# NPC等级区域未找到!");VNETLOG(1131,"NPC等级区域未找到\n");return;}
	if (returnid == -1050004){printf("B# 掉落等级区域信息未找到!");VNETLOG(1131,"掉落等级区域信息未找到\n");return;}
	if (returnid == -1050005){printf("B# 随机掉落物品集合失败!");VNETLOG(1131,"随机掉落物品集合失败\n");return;}
	if (returnid == -1050006){printf("B# 掉落物品集合未找到!");VNETLOG(1131,"掉落物品集合未找到\n");return;}
	if (returnid == -1050007){printf("B# 随机掉落物品列表失败!");VNETLOG(1131,"随机掉落物品列表失败\n");return;}
	if (returnid == -1050008){printf("B# 掉落几率超出!");VNETLOG(1131,"掉落几率超出\n");return;}

	//////////////////////////////////////////////////////////////////////////
	// 商城返回值
	//////////////////////////////////////////////////////////////////////////
	// 成功代码
	if (returnid == 2010001)
	{
		printf("B# 买入完成!");VNETLOG(1131,"买入完成\n");//_errValue = 601;
		window.OnBuySuccess(toint(FourParam),_errValue);
		window.g_LuckyCardAgio = 0;
		//window.find("Item_LuckyCard_Logic").del();
		return;
	}
	if (returnid == 2010002)
	{
		printf("B# 卖出完成!");VNETLOG(1131,"卖出完成\n");_errValue = 354;//销毁成功
		window.OnSellSuccess(toint(FourParam));
	}
	if (returnid == 2010003){printf("B# 修理完成!");VNETLOG(1131,"修理完成\n");return;}
	if (returnid == 2010004)
	{
		printf("B# 更新赠送列表完成!");VNETLOG(1131,"更新赠送列表完成\n");//_errValue = 304;
		window.OnUpdatePresentFinish(toint(FourParam));
	}
	if (returnid == 2010005)
	{
		printf("B# 赠送完成!");VNETLOG(1131,"赠送完成\n");_errValue = 603;
		window.g_LuckyCardAgio = 0;
		//window.find("Item_LuckyCard_Logic").del();
	}
	if (returnid == 2011005)
		{printf("B# 寄送完成!");VNETLOG(1131,"寄送完成\n");_errValue = 410;}
	if (returnid == 2010006){printf("B# 开宝箱免费!");VNETLOG(1131,"开宝箱免费\n");return;}
	if (returnid == 2010007)
	{
		printf("B# 开宝箱完成!");VNETLOG(1131,"开宝箱完成\n");
		return;
	}
	if (returnid == 2010008)//hfz-创建角色
	{
		printf("B# 招募角色完成!");VNETLOG(1131,"招募角色完成\n");
		window.CreateRoleToHall();//创建角色->大厅
		return;
	}
	if (returnid == 2010009){printf("B# 解雇角色完成!");VNETLOG(1131,"解雇角色完成\n");return;}
	if (returnid == 2010010)
	{
		printf("B# 领奖完成(领奖信息提交完成,不用接)!");VNETLOG(1131,"领奖完成(领奖信息提交完成,不用接)\n");
		_errValue = 378;
		window.find("CHANGE_LOGIC").del();
		//return;
	}
	if (returnid == 2010011)
		{printf("B# 领奖完成(真正的领奖完成)!");VNETLOG(1131,"领奖完成(真正的领奖完成)\n");_errValue = 305;}
	if (returnid == 2010012)
		{printf("B# 更新领奖列表完成!");VNETLOG(1131,"更新领奖列表完成\n");_errValue = 306;}
	if (returnid == 2010013){printf("B# 改变所选角色完成!");VNETLOG(1131,"改变所选角色完成\n");return;}
	if (returnid == 2010014){printf("B# 交换角色位置完成!");VNETLOG(1131,"交换角色位置完成\n");return;}
	if (returnid == 2010015)
		{printf("B# 装备物品完成!");VNETLOG(1131,"装备物品完成\n");_errValue = 307;}
	if (returnid == 2010016){printf("B# 合成锻造完成!");VNETLOG(1131,"合成锻造完成\n");return;}
	if (returnid == 2010017){printf("B# 合成制造完成!");VNETLOG(1131,"合成制造完成\n");return;}
	if (returnid == 2010018){printf("B# 移动物品完成!");VNETLOG(1131,"移动物品完成\n");return;}
	if (returnid == 2010019)
	{
		printf("B# 更新物品列表完成!");VNETLOG(1131,"更新物品列表完成\n");return;
	}
	if (returnid == 2010020)
	{
		printf("B# 更新角色信息完成(其他人)!");VNETLOG(1131,"更新角色信息完成(其他人)\n");
		return;
	}
	if (returnid == 2010021){printf("B# 更新角色信息完成(自己)!");VNETLOG(1131,"更新角色信息完成(自己)\n");return;}
	if (returnid == 2010022){printf("B# 快捷栏改变成功!");VNETLOG(1131,"快捷栏改变成功\n");return;}
	if (returnid == 2010023){printf("B# 快捷栏删除成功!");VNETLOG(1131,"快捷栏删除成功\n");return;}
	if (returnid == 2010024)
	{
		printf("B# 获得角色已装备物品!");VNETLOG(1131,"获得角色已装备物品\n");
		window.IoSynchSelfInfo_Ok(ThirdParam);
		return;
	}
	if (returnid == 2010025){printf("B# 重置限制购买信息!");VNETLOG(1131,"重置限制购买信息\n");return;}
	if (returnid == 2010026)
	{
		printf("B# 获得赠送完成!");VNETLOG(1131,"获得赠送完成\n");_errValue = 360;_errType = 3;
		window.OnGetGiftFinish(toint(FourParam));
	}
	if (returnid == 2010027){printf("B# 更新限制物品记录完成!");VNETLOG(1131,"更新限制物品记录完成\n");return;}
	if (returnid == 2010028)
	{
		printf("B# 设定赠送记录状态完成!");VNETLOG(1131,"设定赠送记录状态完成\n");
		window.OnSetPresentSuccess(toint(FourParam));
		return;
	}
	if (returnid == 2010029){printf("B# 分解物品完成!");VNETLOG(1131,"分解物品完成\n");return;}
	if (returnid == 2010030){printf("B# 拆分物品完成!");VNETLOG(1131,"拆分物品完成\n");return;}
	if (returnid == 2010031){printf("B# 合并物品完成!");VNETLOG(1131,"合并物品完成\n");return;}
	if (returnid == 2010032){printf("B# 上线成功!");VNETLOG(1131,"上线成功\n");return;}
	if (returnid == 2010033){printf("B# 上线完成!");VNETLOG(1131,"上线完成\n");return;}
	if (returnid == 2010034){printf("B# 下线完成!");VNETLOG(1131,"下线完成\n");return;}
	if (returnid == 2010035){printf("B# 锁定完成!");VNETLOG(1131,"锁定完成\n");return;}
	if (returnid == 2010036){printf("B# 解锁完成!");VNETLOG(1131,"解锁完成\n");return;}
	if (returnid == 2010037){printf("B# 点券锁定完成!");VNETLOG(1131,"点券锁定完成\n");return;}
	if (returnid == 2010038)
	{
		printf("B# 镶嵌完成!");VNETLOG(1131,"镶嵌完成\n");
//			if (FourParam == 1) //邦
//			{
//				_errValue = 384;
//			}
//			else//取消邦
//			{
//				_errValue = 385;
//			}
		var _arr = window.SplitStr2(FourParam,"|");
		window.OnBindSuccess(toint(_arr[0]),toint(_arr[1]));
	}
	if (returnid == 2010039){printf("B# 获取领奖信息完成!");VNETLOG(1131,"获取领奖信息完成\n");return;}
	if(returnid == 2010042)
	{
		printf("B# 送花完成");VNETLOG(1131,"送花完成\n");_errValue = 389;_errType = 3;
	}
	if(returnid == 2010043)
	{
		printf("B# 套装拆解完成");VNETLOG(1131,"套装拆解完成\n");_errValue = 394;_errType = 3;
	}
	if(returnid == 2010044)
	{
		printf("B# 兑换券兑换完成");VNETLOG(1131,"兑换券兑换完成\n");_errValue = 395;_errType = 3;
	}
	if(returnid == 2010045)
	{
		printf("B# 购买时使用其他物品");VNETLOG(1131,"购买时使用其他物品\n");
		if(FourParam == window.g_luckyEntry_ID)
		{
			_errValue = 396;_errType = 3;
			window.g_LuckyCardAgio = 0;
			//window.find("Item_LuckyCard_Logic").del();
		}
	}

	// 错误代码
	if (returnid == -2010001)
		{printf("B# 商城尚未初始化!");VNETLOG(1131,"商城尚未初始化\n");_errValue = 308;}
	if (returnid == -2010002)
		{printf("B# 商城繁忙!");VNETLOG(1131,"商城繁忙\n");_errValue = 309;}
	if (returnid == -2010003)
		{printf("B# 商城未启动!");VNETLOG(1131,"商城未启动\n");_errValue = 310;}
	if (returnid == -2010004)
	{
		printf("B# 锁定余额失败!");VNETLOG(1131,"锁定余额失败\n");_errValue = 350;
		window.PlaySound(113);//所需要的金额不够时
	}
	if (returnid == -2010005)
		{printf("B# 不能卖出!");VNETLOG(1131,"不能卖出\n");_errValue = 311;}
	if (returnid == -2010006)
		{printf("B# 不能买入!");VNETLOG(1131,"不能买入\n");_errValue = 312;}
	if (returnid == -2010007)
		{printf("B# 不能赠与!");VNETLOG(1131,"不能赠与\n");_errValue = 313;}
	if (returnid == -2010008){printf("B# 不能修复!");VNETLOG(1131,"不能修复\n");return;}
	if (returnid == -2010013)
		{printf("B# 玩家无法购买该物品!");VNETLOG(1131,"玩家无法购买该物品\n");_errValue = 41;_errType = 2;}
	if (returnid == -2010014){printf("B# 没有找到修理工具!");VNETLOG(1131,"没有找到修理工具\n");return;}
	if (returnid == -2010015)
		{printf("B# 没有找到要赠送的玩家!");VNETLOG(1131,"没有找到要赠送的玩家\n");_errValue = 42;_errType = 2;}
	if (returnid == -2011015)
		{printf("B# 没有找到寄送的玩家!");VNETLOG(1131,"没有找到寄送的玩家\n");_errValue = 417;}
	if (returnid == -2010017){printf("B# 耐久已满无法修理!");VNETLOG(1131,"耐久已满无法修理\n");return;}
	if (returnid == -2010023)
		{printf("B# 玩家达到限制无法购买该物品!");VNETLOG(1131,"玩家达到限制无法购买该物品\n");_errValue = 43;_errType = 2;}
	if (returnid == -2010024)
		{printf("B# 购买时数量过少!");VNETLOG(1131,"购买时数量过少\n");_errValue = 314;}
	if (returnid == -2010028)
		{printf("B# 购买时数量过多!");VNETLOG(1131,"购买时数量过多\n");_errValue = 315;}
	if (returnid == -2010029)
		{printf("B# 购买时无效的有效时间索引!");VNETLOG(1131,"购买时无效的有效时间索引\n");_errValue = 44;_errType = 2;}
	if (returnid == -2010030){printf("B# 用户上线失败!");VNETLOG(1131,"用户上线失败\n");return;}
	if (returnid == -2010031){printf("B# 锁定信息已存在!");VNETLOG(1131,"锁定信息已存在\n");return;}
	if (returnid == -2010032){printf("B# 锁定信息未找到!");VNETLOG(1131,"锁定信息未找到\n");return;}
	if (returnid == -2010033){printf("B# 锁定超时!");VNETLOG(1131,"锁定超时\n");return;}
	if (returnid == -2010034){printf("B# 价格类型无效!");VNETLOG(1131,"价格类型无效\n");return;}
	if (returnid == -2010035)
		{printf("B# 性别不匹配!");VNETLOG(1131,"性别不匹配\n");_errValue = 349;}
	if (returnid == -2010099)
		{printf("B# 用户未找到!");VNETLOG(1131,"用户未找到\n");_errValue = 316;}
	if (returnid == -3020003)	// 物品使用太快
		{printf("B# 物品使用太快!");VNETLOG(1131,"物品使用太快\n");_errValue = 688;_errType = 2;}
	if (returnid == -3020004)	// 目前无法使用,一般情况下因为太多人同时使用了
	{printf("B# 目前无法使用!");VNETLOG(1131," 目前无法使用,一般情况下因为太多人同时使用\n");_errValue = 809;_errType = 2;}
	
	//宝箱
	if (returnid == -2030001){printf("B# 宝箱信息未找到!");VNETLOG(1131,"宝箱信息未找到\n");return;}
	if (returnid == -2030002){printf("B# 宝箱扣除失败!");VNETLOG(1131,"宝箱扣除失败\n");return;}
	if (returnid == -2030003){printf("B# 宝箱钥匙扣除失败!");VNETLOG(1131,"宝箱钥匙扣除失败\n");return;}
	if (returnid == -2030004){printf("B# 宝箱人品区域无法确定!");VNETLOG(1131,"宝箱人品区域无法确定\n");return;}
	if (returnid == -2030005){printf("B# 宝箱人品值区域定义!");VNETLOG(1131,"宝箱人品值区域定义\n");return;}
	if (returnid == -2030006){printf("B# 宝箱随机物品集合定义!");VNETLOG(1131,"宝箱随机物品集合定义\n");return;}
	if (returnid == -2030007){printf("B# 宝箱物品集合定义!");VNETLOG(1131,"宝箱物品集合定义\n");return;}
	if (returnid == -2030008){printf("B# 宝箱没有找到物品集合定义!");VNETLOG(1131,"宝箱没有找到物品集合定义\n");return;}
	
	//创建角色
	//如果在创建角色界面
	if (window.IsUIPos(window.POS_CREATEROLE))
	{
		window.find("TOPLAYER").delallchild();
	}
	if (returnid == -2040001)
		{printf("B# 玩家角色未找到!");VNETLOG(1131,"玩家角色未找到\n");_errValue = 45;_errType = 2;}
	if (returnid == -2040002)
		{printf("B# 招募中等待!");VNETLOG(1131,"招募中等待\n");_errValue = 317;}
	if (returnid == -2040003)
		{printf("B# 玩家角色数据未找到!");VNETLOG(1131,"玩家角色数据未找到\n");_errValue = 46;_errType = 2;}
	if (returnid == -2040004)
		{printf("B# 玩家角色数据创建失败!");VNETLOG(1131,"玩家角色数据创建失败\n");_errValue = 47;_errType = 2;}
	if (returnid == -2040005)
		{printf("B# 角色信息未找到!");VNETLOG(1131,"角色信息未找到\n");_errValue = 48;_errType = 2;}
	if (returnid == -2040006)
		{printf("B# 创建的角色未找到!");VNETLOG(1131,"创建的角色未找到\n");_errValue = 49;_errType = 2;}
	if (returnid == -2040007)
	{
		printf("B# 角色升级信息未找到!");VNETLOG(1131,"角色升级信息未找到\n");
		if (window.g_DEBUG){alert("角色升级信息未找到!");}return;
	}
	if (returnid == -2040008)
	{
		printf("B# 角色所属不对!");VNETLOG(1131,"角色所属不对\n");
		if (window.g_DEBUG){alert("角色所属不对!");}return;
	}
	if (returnid == -2040009)
	{
		printf("B# 删除的角色id失败!");VNETLOG(1131,"删除的角色id失败\n");
		if (window.g_DEBUG){alert("删除的角色id失败!");}return;
	}
	if (returnid == -2040010)
	{
		printf("B# 招募角色的Awtor信息数量不对!");VNETLOG(1131,"招募角色的Awtor信息数量不对\n");
		if (window.g_DEBUG){alert("招募角色的Awtor信息数量不对!");}return;
	}
	if (returnid == -2040011)
	{
		printf("B# 招募角色的Awtor错误位置!");VNETLOG(1131,"招募角色的Awtor错误位置\n");
		if (window.g_DEBUG){alert("招募角色的Awtor错误位置!");}return;
	}
	if (returnid == -2040012)
	{
		printf("B# 招募角色的昵称重复!");VNETLOG(1131,"招募角色的昵称重复\n");
		window.find("UIController").LoadDLG(5);//昵称与别人的重复！
		return;
	}
	if (returnid == -2040013)
	{
		printf("B# 招募角色的写入昵称失败!");VNETLOG(1131,"招募角色的写入昵称失败\n");
		if (window.g_DEBUG){alert("招募角色的写入昵称失败!");}return;
	}
	
	//合成
	if (returnid == -2050001){printf("B# 合成失败!");VNETLOG(1131,"合成失败\n");return;}
	if (returnid == -2050002){printf("B# 无法完成合成!");VNETLOG(1131,"无法完成合成\n");return;}
	if (returnid == -2050003){printf("B# 没有关键素材!");VNETLOG(1131,"没有关键素材\n");return;}
	if (returnid == -2050004){printf("B# 关键物品素材数量不够!");VNETLOG(1131,"关键物品素材数量不够\n");return;}
	if (returnid == -2050005){printf("B# 没有找到合成公式!");VNETLOG(1131,"没有找到合成公式\n");return;}
	if (returnid == -2050006){printf("B# 素材数量不够!");VNETLOG(1131,"素材数量不够\n");return;}
	if (returnid == -2050007){printf("B# 附加素材数量不够!");VNETLOG(1131,"附加素材数量不够\n");return;}
	if (returnid == -2050008){printf("B# 附加素材有误!");VNETLOG(1131,"附加素材有误\n");return;}
	if (returnid == -2050009){printf("B# 附加素材有误-等级区域不正确!");VNETLOG(1131,"附加素材有误-等级区域不正确\n");return;}
	if (returnid == -2050010){printf("B# 附加素材数量超出限制!");VNETLOG(1131,"附加素材数量超出限制\n");return;}

	//道具栏
	if (returnid == -2060001){printf("B# 道具失败!");VNETLOG(1131,"道具失败\n");return;}
	if (returnid == -2060002){printf("B# 超出道具栏!");VNETLOG(1131,"超出道具栏\n");return;}
	if (returnid == -2060003){printf("B# 超出栏位!");VNETLOG(1131,"超出栏位\n");return;}
	if (returnid == -2060004){printf("B# 创建道具栏数据失败!");VNETLOG(1131,"创建道具栏数据失败\n");return;}
	if (returnid == -2060005){printf("B# 道具栏未找到!");VNETLOG(1131,"道具栏未找到\n");return;}
	if (returnid == -2060006){printf("B# 物品无法放入道具栏!");VNETLOG(1131,"物品无法放入道具栏\n");return;}

	//分解
	if (returnid == -2070001){printf("B# 分解物品失败!");VNETLOG(1131,"分解物品失败\n");return;}
	if (returnid == -2070002){printf("B# 分解物品公式未找到!");VNETLOG(1131,"分解物品公式未找到\n");return;}
	if (returnid == -2070003){printf("B# 分解物品关键素材未找到!");VNETLOG(1131,"分解物品关键素材未找到\n");return;}
	if (returnid == -2070004){printf("B# 分解物品工具未找到!");VNETLOG(1131,"分解物品工具未找到\n");return;}
	if (returnid == -2070005){printf("B# 分解物品关键/工具无法使用!");VNETLOG(1131,"分解物品关键/工具无法使用\n");return;}
	if (returnid == -2070006){printf("B# 分解物品关键素材品质不正确!");VNETLOG(1131,"分解物品关键素材品质不正确\n");return;}
	if (returnid == -2070007){printf("B# 分解物品公式有误!");VNETLOG(1131,"分解物品公式有误\n");return;}
	
	//镶嵌
	if (returnid == -2090001)
		{printf("B# 镶嵌物品失败!");VNETLOG(1131,"镶嵌物品失败\n");_errValue = 50;_errType = 2;}
	if (returnid == -2090002)
		{printf("B# 镶嵌位置不正确!");VNETLOG(1131,"镶嵌位置不正确\n");_errValue = 318;}
	if (returnid == -2090003)
		{printf("B# 镶嵌物品镶嵌槽不符!");VNETLOG(1131,"镶嵌物品镶嵌槽不符\n");_errValue = 319;}
	if (returnid == -2090004)
		{printf("B# 被镶嵌物品未找到!");VNETLOG(1131,"被镶嵌物品未找到\n");_errValue = 51;_errType = 2;}
	if (returnid == -2090005)
		{printf("B# 镶嵌物品未找到!");VNETLOG(1131,"镶嵌物品未找到\n");_errValue = 52;_errType = 2;}
	if (returnid == -2090006)
		{printf("B# 被镶嵌物品不能镶嵌!");VNETLOG(1131,"被镶嵌物品不能镶嵌\n");_errValue = 53;_errType = 2;}
	if (returnid == -2090007)
		{printf("B# 镶嵌物品不能被镶嵌!");VNETLOG(1131,"镶嵌物品不能被镶嵌\n");_errValue = 54;_errType = 2;}
	if (returnid == -2090008)
		{printf("B# 镶嵌物品等级不符!");VNETLOG(1131,"镶嵌物品等级不符\n");_errValue = 320;}
	if (returnid == -2090009)
		{printf("B# 镶嵌物品品质不符!");VNETLOG(1131,"镶嵌物品品质不符\n");_errValue = 621;}
	if (returnid == -2090010)
		{printf("B# 镶嵌物品角色等级不符!");VNETLOG(1131,"镶嵌物品角色等级不符\n");_errValue = 322;}
	if (returnid == -2090011)
		{printf("B# 镶嵌物品角色称号不符!");VNETLOG(1131,"镶嵌物品角色称号不符\n");_errValue = 323;}
	if (returnid == -2090012)
		{printf("B# 镶嵌物品添加失败!");VNETLOG(1131,"镶嵌物品添加失败\n");_errValue = 55;_errType = 2;}
	if (returnid == -2090013)
		{printf("B# 镶嵌物品减少失败!");VNETLOG(1131,"镶嵌物品减少失败\n");_errValue = 56;_errType = 2;}
	if (returnid == -2090014)
		{printf("B# 被镶嵌物品正在装备中!");VNETLOG(1131,"被镶嵌物品正在装备中\n");_errValue = 362;}
	if (returnid == -2090015)
		{printf("B# 镶嵌物品的技能错误!");VNETLOG(1131,"镶嵌物品的技能错误\n");_errValue = 363;}
	if (returnid == -2090016){printf("B# 镶嵌物品不能!");VNETLOG(1131,"镶嵌物品不能\n");return;}
	if (returnid == -2090017){printf("B# 没有足够的镶嵌槽可以镶嵌!");VNETLOG(1131,"没有足够的镶嵌槽可以镶嵌\n");return;}
	if (returnid == -2090018)
	{
		printf("B# 镶嵌重复!");VNETLOG(1131,"镶嵌重复\n");return;
	}

	//第三方
	if (returnid == -2100000){printf("B# 第三方上线函数未找到!");VNETLOG(1131,"第三方上线函数未找到\n");return;}
	if (returnid == -2100001){printf("B# 第三方上线函数调用失败!");VNETLOG(1131,"第三方上线函数调用失败\n");return;}
	if (returnid == -2100002){printf("B# 第三方下线函数未找到!");VNETLOG(1131,"第三方下线函数未找到\n");return;}
	if (returnid == -2100003){printf("B# 第三方下线函数调用失败!");VNETLOG(1131,"第三方下线函数调用失败\n");return;}
	if (returnid == -2100004){printf("B# 第三方锁定函数未找到!");VNETLOG(1131,"第三方锁定函数未找到\n");return;}
	if (returnid == -2100005){printf("B# 第三方锁定函数调用失败!");VNETLOG(1131,"第三方锁定函数调用失败\n");return;}
	if (returnid == -2100006){printf("B# 第三方解锁函数未找到!");VNETLOG(1131,"第三方解锁函数未找到\n");return;}
	if (returnid == -2100007){printf("B# 第三方解锁函数调用失败!");VNETLOG(1131,"第三方解锁函数调用失败\n");return;}
	if (returnid == -2100008){printf("B# 第三方领奖函数未找到!");VNETLOG(1131,"第三方领奖函数未找到\n");return;}
	if (returnid == -2100009){printf("B# 第三方领奖函数调用失败!");VNETLOG(1131,"第三方领奖函数调用失败\n");return;}
	if (returnid == -2100010){printf("B# 第三方领奖完成函数未找到!");VNETLOG(1131,"第三方领奖完成函数未找到\n");return;}
	if (returnid == -2100011){printf("B# 第三方领奖完成函数调用失败!");VNETLOG(1131,"第三方领奖完成函数调用失败\n");return;}

	if (returnid == -100000){printf("B# 绑定用户未找到错误!");VNETLOG(1131,"绑定用户未找到错误\n");return;}
	if (returnid == -105507){printf("B# 绑定用户检查错误!");VNETLOG(1131,"绑定用户检查错误\n");return;}
	if (returnid == -105509){printf("B# 有效期限不对!");VNETLOG(1131,"有效期限不对\n");return;}
	if (returnid == -105510){printf("B# 已领过奖!");VNETLOG(1131,"已领过奖\n");return;}
	if (returnid == -105512){printf("B# 没有找到相应的coupon号!");VNETLOG(1131,"没有找到相应的coupon号\n");return;}

	//////////////////////////////////////////////////////////////////////////
	// 物品装备
	//////////////////////////////////////////////////////////////////////////
	// 成功返回值
	//if (returnid == 3010001){printf("B# 装备角色全部装备完成!");VNETLOG(1131,"装备角色全部装备完成\n");return;}
	if (returnid == 3010002)
	{
		printf("B# 装备完成!");VNETLOG(1131,"装备完成\n");
		/*
		if (FourParam == 0)//0脱下 1穿上
		{
			_errValue = 364;
		}
		else
		{
			//_errValue = 324;
		}
		*/
		var _arr = window.SplitStr2(FourParam,"|");
		window.OnEquipFinish(toint(_arr[0]),toint(_arr[1]));
		return;
	}
	if (returnid == 3020003)
	{
		printf("B# 物品使用完成!");VNETLOG(1131,"物品使用完成\n");
		printf("B# 物品使用完成:ThirdParam:"+ThirdParam+",FourParam:"+FourParam);
		window.OnUseFinish();
		return;
	}
	// 错误代码
	if (returnid == -3010001){printf("B# 物品装备插件未找到!");VNETLOG(1131,"物品装备插件未找到\n");return;}
	if (returnid == -3010001)
		{printf("B# 装备失败!");VNETLOG(1131,"装备失败\n");_errValue = 57;_errType = 2;}
	if (returnid == -3010002)
		{printf("B# 无法装备该物品!");VNETLOG(1131,"无法装备该物品\n");_errValue = 58;_errType = 2;}
	if (returnid == -3010007)
		{printf("B# 操作失败!");VNETLOG(1131,"操作失败\n");_errValue = 59;_errType = 2;}
	if (returnid == -3010008)
		{printf("B# 没有找到角色!");VNETLOG(1131,"没有找到角色\n");_errValue = 60;_errType = 2;}
	if (returnid == -3010009)
		{printf("B# 没有找到角色数据!");VNETLOG(1131,"没有找到角色数据\n");_errValue = 61;_errType = 2;}
	if (returnid == -3010010)
		{printf("B# 装备该角色失败!");VNETLOG(1131,"装备该角色失败\n");_errValue = 62;_errType = 2;}
	if (returnid == -3010011)
		{printf("B# 装备需求等级失败!");VNETLOG(1131,"装备需求等级失败\n");_errValue = 63;_errType = 2;}
	
	//大礼包
	if (returnid == 2010040)
	{
		printf("B# 礼品包打开完成!");VNETLOG(1131,"礼品包打开完成\n");_errValue = 389;_errType = 2;
		if (tostring(FourParam) != "" && tostring(FourParam) != 0)
		{
			var _count = window.GetSplitCount(FourParam,"|");
			var _arr = window.SplitStr2(FourParam,"|",_count);
			var _itemsInfo = "";
			var _index = 0;
			var _itemEntryID = 0;
			var _itemName = "";
			var _itemNum = 0;
			while(_index < _count)
			{
				_itemEntryID = toint(_arr[_index]);
				_itemNum = toint(_arr[_index+1]);
				_itemName = window.GetNameByEnterID(_itemEntryID);
				//printf("xiayy:_itemName:"+_itemName+",_itemNum:"+_itemNum);
				if(_itemsInfo == "")
				{
					_itemsInfo+=_itemName+"x"+_itemNum;
				}
				else
				{
					_itemsInfo += ","+_itemName+"x"+_itemNum;
				}
				_index += 2;
			}
			var _tipInfo = "您获得了："+_itemsInfo;
			window.WriteChat(7,_tipInfo);
		}
		
	}
	
	//邮件
	if (returnid == -1021001){printf("B# 赠送失败!");VNETLOG(1131,"赠送失败\n");_errValue = 418;}
	if (returnid == -1021002){printf("B# 没有找到要寄送的玩家!");VNETLOG(1131,"没有找到要寄送的玩家\n");_errValue = 419;}
	if (returnid == -1021003){printf("B# 不正确的寄送物品接受人!");VNETLOG(1131,"不正确的寄送物品接受人\n");_errValue = 420;}
	if (returnid == -1021004){printf("B# 寄送已过期!");VNETLOG(1131,"寄送已过期\n");_errValue = 421;}
	if (returnid == -1021005){printf("B# 寄送物品绑定!");VNETLOG(1131,"寄送物品绑定\n");_errValue = 422;}
	if (returnid == -1021006){printf("B# 寄送物品受限无法寄送!");VNETLOG(1131,"寄送物品受限无法寄送\n");_errValue = 423;}
	if (returnid == -1021007){printf("B# 寄送物品未找到!");VNETLOG(1131,"寄送物品未找到\n");_errValue = 424;}
	if (returnid == -1021008){printf("B# 不能寄送给自己!");VNETLOG(1131,"不能寄送给自己\n");_errValue = 425;}
	if (returnid == -1021009){printf("B# 无法获得寄送的物品!");VNETLOG(1131,"无法获得寄送的物品\n");_errValue = 426;}
	if (returnid == -1021010){printf("B# 无效的寄送信息!");VNETLOG(1131,"无效的寄送信息\n");_errValue = 427;}
	if (returnid == -1021011){printf("B# 寄送无法送达自己!");VNETLOG(1131,"寄送无法送达自己\n");_errValue = 428;}
	if (returnid == -1021012){printf("B# 无法找到要寄送的物品!");VNETLOG(1131,"无法找到要寄送的物品\n");_errValue = 429;}

	//弹出提示信息
	if( _errValue != - 1 ) 
	{
		if( _errType == 3 ) 
		{ 
			window.WriteChat7(_errValue,_text);
			return;
		}
		else
		{
			window.find("UIController").LoadDLG(_errValue); 
		}
	}
}

//打开宝箱
//参数：角色id，物品列表 (物品id,数量,有效时间,...);
void OpenBoxFinish(iUserId,szItemList)
{
	printf("B# 宝箱打开完成!");VNETLOG(1131,"宝箱打开完成\n");
	if (tostring(szItemList) != "" && tostring(szItemList) != 0)
	{
		var _count = window.GetSplitCount(szItemList,"|");
		var _arr = window.SplitStr2(szItemList,"|",_count);
		var _itemsInfo = "";
		var _index = 0;
		var _itemEntryID = 0;
		var _itemName = "";
		var _itemNum = 0;
		while(_index < _count-1)
		{
			_itemEntryID = toint(_arr[_index]);
			_itemNum = toint(_arr[_index+1]);
			_itemName = window.GetNameByEnterID(_itemEntryID);
			//printf("xiayy:_itemName:"+_itemName+",_itemNum:"+_itemNum);
			if(_itemsInfo == "")
			{
				_itemsInfo+=_itemName+"x"+_itemNum;
			}
			else
			{
				_itemsInfo += ","+_itemName+"x"+_itemNum;
			}
			_index += 2;
		}
		var _tipInfo = "您获得了："+_itemsInfo;
		window.WriteChat(7,_tipInfo);
	}
	//持有就行0 宝箱1 老虎机2 点券金币兑换券3 实物兑换券4
	if (toint(iUserId) != window.GetMyUID()) return;
	if (window.g_TigerOrBox == 3)
	{
		alert("点券金币兑换券3"+szItemList);
		return;
	}
	if (window.g_TigerOrBox == 2)
	{
		window.find("TIGERCHOOK_LOGIC").SetResult(szItemList);
		return;
	}
	if (window.g_TigerOrBox == 1)
	{
		window.find("TREASUREBOX_LOGIC").SetResult(szItemList);
		return;
	}
}

//分解物品
//参数：角色id，分解列表(格式:物品id;数量;)
void ResolveList(iUserId,szItemList)
{
}

//获得商城时间
//参数 当前时间(单位:秒)
void SetShopTime(time)
{
	window.g_MallTool.SetShopTime(time);
	window.find("VMall_Logic").m_shoppingTime.SetData(time);
	window.find("ChargeCarRecord").setservertime(time);
	window.find("BuyCarRecord").setservertime(time);
}

//到期物品拆分
void OnSplitStr(id)
{
	//var _Text = "["+window.GetNameByEnterID(id)+"]"+window.GetPartNameByClass(window.GetClassByEnterId(id));
//		window.find("UIController").LoadDLG(367);//[%0]已到期！
//		window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+_Text);
	//window.WriteChat(7,_Text);
}
//限时物品到期消息：物品识别ID（"1,2,3....."）
void LimitTimeClear(enterID)
{
	printf("B# 限时物品到期消息:"+enterID);
	//window.SplitStr(enterID,";",this,0);
//	var _pos = window.GetUIPos();
//	if(_pos == window.POS_PROPCONTINUE)
//	{
//		return;
//	}
//	var _itemIds = "";
//	var _deadItems = "";
//	var _count = window.GetSplitCount(enterID,";");
//	var _arr = window.SplitStr2(enterID,";",_count);
//	var _index = 0;
//	while(_index<_count)
//	{
//		if(_itemIds == "")
//		{
//			_itemIds += _arr[_index];
//		}
//		else
//		{
//			_itemIds += ","+ _arr[_index];
//		}
//		var _name = window.GetNameByEnterID(_arr[_index]);
//		if(_deadItems == "")
//		{
//			_deadItems += _name;
//		}
//		else
//		{
//			_deadItems += ","+ _name;
//		}
//		_index += 1;
//	}
//
//	printf("C# _itemIds:"+_itemIds+"&_deadItems:"+_deadItems);
//	window.find("UIController").LoadDLG(691);
//	window.find("VMB_PropContinue_Logic").SetItemIds(_itemIds,_deadItems,2);
//	var _content = _deadItems.Replace(",","，");
//	window.find("VMB_PropContinue_Logic").ReplaceData(_content);
	
//	if (window.GetRoleModelOpenState() && !window.IsHallHtnOpened(window.G_HALLBTN_MALL))
//	{
//		window.ResetAvatarAll();
//	}
//	window.find("NAME_GCMap").find("Action").SETBODYID(window.GetMyRID());//房间里的人
}