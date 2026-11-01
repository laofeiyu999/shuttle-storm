//商城-索要消息框类定义
//yxf 2008年10月20日

importex("$./ClassDef_RequestMsg_DBList.gml");
importex("$./../../../UI/Mall/Pop/ClassDef_RequestMsg.gml");

class VMall_RequestMsg_Logic item
{
	size = "100%,100%";bgcolor = "#FFFFFF";
	var m_Init = false;
	var m_Jid = "";
	var m_SQL = "";
//	var _DeadORLive = window.CheckPackItemDeadLine(window.GOODS_CLASS_PropaLCard);
	var m_HaveCard1=0;
	var m_HaveCard2=0;
	var m_LukyCardNum =window.GetPackLuckCardNum();//幸运卡数量
	var m_CardState = window.CheckPackCard();//记录背包中是否有卡
	var m_CanSelectNum = 0; //剩余的幸运卡数量
	//购物车辅助类
	var m_Record = new CBuyCarRecord
	{
		name = "MsgRequestSelect";
		SetTBInit("MsgRequestSelect");
	}
	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_TotalPrice = new VMyText{pos = "40,260";src = "总价格:";}

		//索要者昵称
		//参数 data1:
		staticvar s_NkName = new VMyText
		{
			pos = "300,350";src = "玩家姓名";
		}

		//留言
		//参数 data1:
		staticvar s_LeaveWord = new edit{pos = "100,350";src ="留言测试!!!!!!!!"}
		//拥有金币
		//参数 data1:
		staticvar s_MyGold = new VMyText{src = "拥有金币:";pos = "50,400";}
		//我的奖券
		staticvar s_MyLottery = new BaseText{}

		//拥有点券
		//参数 data1:
		staticvar s_MyMoney = new VMyText{src = "拥有点券:";pos = "350,400";}

		//确定购买:按钮
		staticvar s_Btn_Enter = new VMyButton
		{
			Init("确定");pos = "50,450";
		}
		//取消:按钮
		staticvar s_Btn_Esc = new VMyButton
		{
			Init("取消");pos = "350,450";
		}

		//帮助:按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("?");halign(90,0);
		}
		//关闭:按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);
		}
	}
	inclass("VMall_RequestMsg_UI");//界面显示类
	Init();
	//==============================function=========================================
	//点击了取消-和关闭
	void OnClick_BtnEsc()
	{
		m_Record.DelByType(0);
		parent.del();
	}
	//点击了确定
	void OnClick_BtnConfirm()
	{
		if(window.g_LuckyCardAgio>0)
		{
			window.find("UIController").LoadUI("UI_Item_LuckyCard");
			//window.find("Item_LuckyCard_Logic")._LuckyCard.Reflash(m_SQL,3,s_NkName.src);
			//parent.del();
			return;
		}
		_MallRequestList.scriptprcallsub("SendItem",s_NkName.src);
		m_Record.DelByType(0);
		parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		//确定:按钮
		set s_Btn_Enter{void OnPressed(){parent.OnClick_BtnConfirm();}}
		//取消:按钮
		set s_Btn_Esc{void OnPressed(){parent.OnClick_BtnEsc();}}
		//帮助:按钮
		//set s_Btn_Help{void OnPressed(){window.CallBack_Help(window.POS_REQUEST_MSG);}}
		//关闭:按钮
		set s_Btn_Close{void OnPressed(){parent.OnClick_BtnEsc();}}
	}
	//================================DBList=========================================
	var _MallRequestList = new VMall_RequestMsg_Logic_List
	{
		name = "VMall_RequestMsg_Logic_NAME";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,"MsgRequestSelect","Bind_VMall_RequestMsg_Logic");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 商城-购物-服饰物品列表，PageviewEnd\n");
		}
	}
	//================================DB-Opt=========================================
	//从数据库中取相关数据 
	void GetDataFromDB()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-购买框:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return;
		}
		s_MyGold.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALMONEY));//拥有金币
		s_MyLottery.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOKENMONEY));//拥有奖券
//		s_MyMoney.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));//拥有点券
		s_MyMoney.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));//临时措施-代金券
		window.g_Row.Release();
	}

	//有新的索要消息来
	//参数 id:索要消息的ID
	void NewMsgSelect(id)
	{
		printf("B# 索要信息: NewMsgSelect:"+id);
		var _tempID = 0;
		var _tempJID = 0;
		var _tempREQUESTNAME = "";
		var _tempMSG = "";
		var _tempENTERID = "";
		var _tempDATA = "";
		var _VNet2DBTable = new VNet2DBTable	
		{
			var m_tempID = 0;
			var m_tempJID = 0;
			var m_tempREQUESTNAME = "";
			var m_tempMSG = "";
			var m_tempENTERID = "";
			var m_tempDATA = "";
			void OnAddData(id,jid,requestName,msg,enterID,data)
			{
				//parent.SetNewMsg(id,jid,requestName,msg,enterID,data);
				m_tempID = id;
				m_tempJID = jid;
				m_tempREQUESTNAME = requestName;
				m_tempMSG = msg;
				m_tempENTERID = enterID;
				m_tempDATA += data;
				window.find("friendsys").DelMsgRequestRow(m_tempID);
			}
		}
		_VNet2DBTable.Select(window.GAMEUI,"SELECT * FROM MsgRequestNew WHERE "+window.GAMEUI_MSGREQUESTNEW_JID_STR+"="+id);
		_VNet2DBTable.ReadData("OnAddData","0,1,2,3,4,5");

		_tempID = _VNet2DBTable.m_tempID;;
		_tempJID = _VNet2DBTable.m_tempJID;;
		_tempREQUESTNAME = _VNet2DBTable.m_tempREQUESTNAME;;
		_tempMSG = _VNet2DBTable.m_tempMSG;;
		_tempENTERID = _VNet2DBTable.m_tempENTERID;;
		_tempDATA = _VNet2DBTable.m_tempDATA;;

		_VNet2DBTable.Release();
		SetNewMsg(_tempID,_tempJID,_tempREQUESTNAME,_tempMSG,_tempENTERID,_tempDATA);
	}
	//从数据库中取相关数据 
	void SetNewMsg(id,jid,requestName,msg,enterID,data)
	{
		printf("B# 索要信息:id"+id+",JId:"+jid+",requestName:"+requestName +",data:"+data+",enterID:"+enterID+",msg:"+msg);
		
		m_JId = jid;
		s_NkName.src = requestName;
		s_LeaveWord.src = msg;

		var num = window.GetSplitCount(data,";"); //个数
		var arr = window.SplitStr2(data,";",num);//价格-返回一个数组

		var index = 0;
		while (index<num)
		{
			var n1 = window.GetSplitCount(arr[index],".");
			var data = arr[index];
			index += 1;
			
			if ( n1 != 2 )
			{
				printf("B# 索要信息出错,无法拆分:"+arr[index]);
				continue;
			}
			var arr1 = window.SplitStr2(data,".",2);
			var cid = toint(arr1[0]);
			var limittm = toint(arr1[1]);
			m_Record.AddTmSelect(cid,limittm,1);

			printf("AddTmSelect:"+cid+" limittm:"+limittm)
		}

		parent.RefreshTotalMoney();
	}
	void GetLuckyCardNum()
	{
		if (m_CardState == 0)
			return ;
//		_MallRequestList.SetMyMenu();
		m_CanSelectNum=m_LukyCardNum;
		m_HaveCard1=0;
		m_HaveCard2=0;
		_MallRequestList.scriptprcallsub("CheckLuckyCardNum");
		SetBuycarPos(m_HaveCard1,m_HaveCard2);
		if(m_CanSelectNum<1){_MallRequestList.scriptprcallsub("GreyMyMenu");return;}
		if(m_CanSelectNum==1){_MallRequestList.scriptprcallsub("LightMyMenu");return;}
	}

	void Inited()
	{
		var _SQL = "SELECT * FROM MsgRequestSelect WHERE state=1";
		printf("B# 商城购物车:_SQL："+_SQL);
		m_SQL = _SQL;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_RequestMsg_Logic",window.GAMEUI,_SQL);
		m_Init = true;
		_MallRequestList.scriptprcallsub("SetBuycarListPos",m_CardState);
		_MallRequestList.scriptprcallsub("SetPriceByTime");
		parent.RefreshTotalMoney();
		GetLuckyCardNum();
	}

	void OnCreated()
	{
		SetEvent();
		GetDataFromDB();
//		SetNewMsg(1953629,1000015,"ddoq2","留言",1,"1100007.0");
		timer(200,"Inited");
		if(m_CardState==1 || m_CardState==3)
		{
			SetBuycarPos(1,0);
		}
		else
		{
			SetBuycarPos(0,0);
		}
	}
};