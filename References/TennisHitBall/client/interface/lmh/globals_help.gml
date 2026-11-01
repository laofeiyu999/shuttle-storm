//
//帮助
//2009年9月24日

set window
{
	//[功能]打开帮助
	//[参数]id:帮助的ID GameUI.mdb UIHelp
	//		iscapmouse：是否需要遮罩 0默认不需要 1需要
	void OpenHelp(id)
	{
		if (id <= 0)
		{
			printf("B# 帮助OpenHelp()参数错误 id:"+id);
			return;
		}
		window.find("HELPLAYER").delallchild();
		if (window.g_HelpID != id)
		{
			window.find("UIController").LoadUI("UI_HELP");
			window.find("HELPLAYER").find("HELP_LOGIC").ReadDB(id);
		}
	}

	void DelHelp()//老虎添加，我要单独使用删除的功能
	{
		window.find("HELPLAYER").delallchild();
	}

	//[功能]点击帮助一条数据回调
	//[备注]具体定义见:/interface/Const.gml
	//[参数]posid：当前界面的位置
	//		subindex:所在的2级标签
	void CallBack_Help(posid,subindex)
	{
		printf("B# 帮助CallBack_Help()id:"+posid+",subindex:"+subindex);
		switch (posid)
		{
			case 2:	//频道选择
				window.OpenHelp(1000);break;
			case 10:	//游戏室
				window.OpenHelp(1700);break;
			case 11:	//活动场
				window.OpenHelp(1800);break;
			case 12:	//创建房间
				window.OpenHelp(2400);break;
			case 20:	//排行榜
				window.OpenHelp(1100);break;
			case 21:	//玩家列表
				window.OpenHelp(1400);break;
			case 22:	//背包 0服饰，1技能，2道具，3礼品盒，4录像
				window.OpenHelp(2200);break;
			case 23:	//个人信息 0基础信息，1战绩统计，2装备属性
				window.OpenHelp(2100);break;
			case 24:	//录像
				window.OpenHelp(1900);break;
			case 25:	//邮箱
				window.OpenHelp(2000);break;
			case 28:	//任务
				window.OpenHelp(2700);break;
			case 50:	//好友
				window.OpenHelp(1300);break;
			case 55:	//家族
				window.OpenHelp(1500);break;
			case 65:	//训练
				window.OpenHelp(1600);break;
			case 70:	//商城
				window.OpenHelp(1200);break;
			case 75:	//购物车
				window.OpenHelp(2300);break;
			case 76:	//续费
				window.OpenHelp(2800);break;
			case 80:	//房间
				window.OpenHelp(2000);break;	
			case 81:	//房间-商店 1服饰，2技能，3道具
				window.OpenHelp(1200);break;
			case 83:	//房间-房间设置
				window.OpenHelp(2500);break;
			default:break;
		}
	}

	//[功能]让一个按钮闪
	//[参数]btnname：按钮的名字-字符串 如"btn_name"
	//		param: true false 闪与不闪
	void LMH1_SetBtnFlash(btnname,param)
	{
		window.find(btnname).SetFlicker(param);
	}

	//[功能]强制引导的遮罩
	//[参数]btnname：按钮的名字-字符串 如"btn_name"
	void LMH1_NewCap(btnname)
	{
		set window
		{
			new VGuideCapture
			{
				NewBtn(btnname);
			}
		}
		window.LMH1_DelFucklayer();
	}

	//[功能]删除-强制引导的遮罩
	void LMH1_DelCap()
	{
		window.find("VGuideCapture_Name").del();
	}
}