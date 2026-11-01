//
//训练结算界面的类定义:逻辑
//
importex("$./../../UI/TrainOver/ClassDef.gml");
importex("$./ClassDef_QList.gml");

class VTrainOver_Logic CTrianLogic
{
	size = "100%,100%";
	//===================================与显示交互部分========================================
	void Init()
	{
		//训练完成说明
		//参数2 data2:说明
		staticvar s_Explain = new VMyText{pos = "1,50";}
		
		//奖励-物品
		//参数1 data2:格式："物品ID1,数量,有效期;物品ID2,数量,有效期"
		staticvar s_AwardGoods = new VMyText{pos = "1,200";}

		//奖励-金币
		//参数2 data2:
		staticvar s_Award_Gold = new VMyText{pos = "200,400";}

		//奖励-经验
		//参数2 data2:
		staticvar s_Award_Exp = new VMyText{pos = "300,400";}
	}
	//界面显示类
	inclass("VTrainOver_UI");
	//=======================================function==========================================
	Init();

	//从数据库中取相关数据 
	void GetDataFromDB()
	{	
		printf("B# [训练结算]:GetDataFromDB:window.g_TrainID:"+window.g_TrainID);
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,window.g_TrainID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-[训练结算]:DBname:"+window.TENNIS_GAME+",TBName:"+window.TRAIN);
			return;
		}
		s_Explain.SetData("完成说明:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_FINISH),"");//完成说明
	
		var _State = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_STATE);//状态 0未通过 1通过
		if (_State == 0)
		{
			s_Award_Gold.SetData("金币:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_GOLD),"");//奖励-金币
			s_Award_Exp.SetData("经验:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_EXP),"");//奖励-经验
			var _Item = "";//物品ID,有效期
			if (window.GetMySex() == 1)//男性物品
			{
				_Item = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_ITEM1);//物品ID,有效期
			}
			else
			{
				_Item = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_ITEM2);//物品ID,有效期
			}
			s_AwardGoods.SetData(_Item,"","");
		}
		else
		{
			s_Award_Gold.SetData("金币:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_GOLD2),"");//奖励-金币
			s_Award_Exp.SetData("经验:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_EXP2),"");//奖励-经验
			_VNet2DBRow.del();
			SetTrainOver();//显示的函数
		}
		
		var _TActID1 = 11;	//玩家1整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		switch (parent._User1.GetCharacter())
		{
			case 1:{_TActID1 = 11;break;}
			case 2:{_TActID1 = 12;break;}
			case 3:{_TActID1 = 13;break;}
		}
		s_Model.SetData(window.GetMySex(),window.GetMyRID(),_TActID1);

		var _SQL = "SELECT * FROM "+window.TRAIN+" WHERE Type="+window.GetTrianTypeByID(window.g_TrainID)+" AND ForceTrain=0 AND style=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_QList_CourseList_Logic",window.TENNIS_GAME,_SQL);
	}
	//==================LIST======================================================
	var _QList = new VQ_CourseList_Logic
	{
		name = "QList_CourseList_Logic_NAME";
		left = parent.s_Explain.left + parent.s_Explain.width + 30;
		top = parent.s_Explain.top;
		
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.TRAIN,"Bind_QList_CourseList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定
	}

	GetDataFromDB();
};
