//全局变量 + 函数>>邮件礼品

set window
{
	//刷新礼物按钮是否显示有新物品
	void FlarePresent()
	{
		var _VNet2DBTable=new VNet2DBTable{};
		//新礼品
		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND State=0";
		//所有礼品
		//var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND Number>0 AND State=0 OR UserId="+window.GetMyUID()+"AND Number>0 AND State=1";
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		var _Size = _VNet2DBTable.GetSize();
		printf("B# FlarePresent-SQL:"+_SQL+",_Size:"+_Size);
		var _HasNew = false;	//是否有新礼品
		if (_Size > 0)
		{
			_HasNew = true;
			window.LMH1_GetPresent();//引导事件
		}
		_VNet2DBTable.del();
		window.find("Hall_Show_Present").ShowFlare(_HasNew);
	}

	//清除有新物品显示所需要的数据
	void ClearPresentFlareData()
	{
		var _VNet2DBTable=new VNet2DBTable{};
		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND Number>0 AND State=0";
		printf("B# ClearPresentFlareData-SQL:"+_SQL);
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		_VNet2DBTable.SetIntAllData(window.M_G_GOODS_ITEMPRESENT_STATE,window.MAIL_READED,true);
		_VNet2DBTable.del();
		
		//发出设置赠送物品记录状态的消息：NULL
		window.Too_SetPresentState("-1");
	}

	//[功能]删除邮件-客户端作假
	//[参数]_gid: 为0时为删除所有
	//		_state:状态 1选中 0不选中
	void DelMail(_gid,_state)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_State = _state;
			void GetData(entryid,itementryid,state)
			{
				printf("DelMail-LMH_UserLostSomething(GetData)-2:itementryid:"+itementryid+",m_State:"+m_State+",state:"+state);
				if (toint(state) == window.MAIL_DEL)
				{
					return;
				}
				var _Param = ""+entryid+","+window.MAIL_DEL;
				//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
				window.Too_SetPresentState(_Param);	

				// 56行发送消息后, 得到服务器反馈后会自动调用window.LMH_UserLostSomething(2,itementryid); 所以这里不用再调了.
				//type:1礼品盒物品到期,2丢弃了礼品，3背包里丢弃
				//window.LMH_UserLostSomething(2,itementryid);
			}
		};

		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND State<="+window.MAIL_READED;
		if (_gid > 0)
		{
			_SQL += " AND EntryId="+_gid;
//
//			var _Param = ""+_gid+","+window.MAIL_DEL;
//			//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
//			window.Too_SetPresentState(_Param);
		}
//		else
//		{
//			var _Param = "-1,"+window.MAIL_DEL;
//			//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
//			window.Too_SetPresentState(_Param);	
//		}

		if (toint(_state) >= window.MAIL_SELECT)
		{
			_SQL += " AND isCheck="+_state;
		}
		printf("B# DelMail-SQL:"+_SQL);
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		_VNet2DBTable.ReadData("GetData",""+window.M_G_GOODS_ITEMPRESENT_ENTRYID+","+window.M_G_GOODS_ITEMPRESENT_ITEMENTRYID+","+window.M_G_GOODS_ITEMPRESENT_STATE);
		_VNet2DBTable.SetIntAllData(window.M_G_GOODS_ITEMPRESENT_STATE,window.MAIL_DEL,true);
		_VNet2DBTable.del();

		if (window.GetSelectSize(window.MAIL_READED) > 0)
		{
			window.find("MAIL_LOGIC")._VMail_Logic.s_Btn_Del.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			window.find("MAIL_LOGIC")._VMail_Logic.s_Btn_Del.SetState(window.BTN_STATE_GREY);
			window.find("MAIL_LOGIC")._VMail_Logic.s_CHK_AllChoose.UnCheck();
		}
	}

	//[功能]选中邮件与否-单个
	//[参数]_gid: 邮件ID
	//		_state: 1选中 0不选中
	void SelectMail(_gid,_state)
	{
		window.g_Row.InitByBigInt( window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,_gid);
		if(!window.g_Row.IsReady() )
		{
			window.g_Row.Release();
			printf("B# error-SelectMail:"+window.M_G_GOODS+",TBName:"+window.ITEMPRESENT+",_gid:"+_gid);
		}
		window.g_Row.SetInt(window.M_G_GOODS_ITEMPRESENT_ISCHECK,_state);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//[功能]选中邮件与否 - 全部
	//[参数]_gid: 为0时为选中所有
	//		_state: 1选中 0不选中
	void SelectMailAll(_gid,_state)
	{
		var _VNet2DBTable=new VNet2DBTable{};//此处必须是新New的
		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND State<="+window.MAIL_READED;
		if (_gid > 0)
		{
			_SQL += " AND EntryId="+_gid;
		}
		printf("B# SelectMailAll-SQL:"+_SQL);
		_VNet2DBTable.Select( window.M_G_GOODS,_SQL );
		_VNet2DBTable.SetIntAllData(window.M_G_GOODS_ITEMPRESENT_ISCHECK,_state,true);
		_VNet2DBTable.del();
	}

	//[功能]设置邮件已读(界面用)
	//[参数]_gid: 邮件ID
	//		_state: 1已读 0未读
	void SetMailRead_UI(_gid,_state)
	{
		window.g_Row.InitByBigInt( window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,_gid);
		if(!window.g_Row.IsReady() )
		{
			window.g_Row.Release();
			printf("B# error-SetMailRead_UI:"+window.M_G_GOODS+",TBName:"+window.ITEMPRESENT+",_gid:"+_gid);
		}
		window.g_Row.SetInt(window.M_G_GOODS_ITEMPRESENT_ISREAD,_state);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//[功能]得到选中的未删除的邮件数量
	//[参数]_state: 1选中 0不选中
	void GetSelectSize(_state)
	{
		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND State<="+window.MAIL_READED+" AND isCheck="+_state;
		window.g_Table.Select( window.M_G_GOODS,_SQL );
		var _size = window.g_Table.GetSize();
		printf("B# GetSelectSize-SQL:"+_SQL+",_size:"+_size);
		window.g_Table.Release();
		return _size;
	}

	//[功能]看看数否有物品未接受
	//[参数]_gid:物品ID
	//		_state: 1选中 0不选中
	void GetUnReceiveGoodsNum(_gid,_state)
	{
		var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND State<="+window.MAIL_READED+" AND ItemEntryId>0";
		if (_gid > 0)
		{
			_SQL += " AND EntryId="+_gid;
		}
		if (_state >= window.MAIL_SELECT)
		{
			_SQL += " AND isCheck="+_state;
		}
		window.g_Table.Select( window.M_G_GOODS,_SQL );
		var _size = window.g_Table.GetSize();
		printf("B# GetUnReceiveGoodsNum-SQL:"+_SQL+",_size:"+_size);
		window.g_Table.Release();
		return _size;
	}

	//[功能]已读邮件
	void SetMailRead()
	{
		printf("SetMailRead:window.g_MailReadGIDStr:"+window.g_MailReadGIDStr);
		if (window.g_MailReadGIDStr == "")
		{
			return;
		}
		
		var _num = window.GetSplitCount(window.g_MailReadGIDStr,",");
		printf("SetMailRead:_num:"+_num);
		if (_num <= 0)
		{
			return;
		}
		var _arr = window.SplitStr2(window.g_MailReadGIDStr,",",_num);
		
		var _i = 0;
		while (_i < _num)
		{
			var _gid = _arr[_i];
			printf("SetMailRead:_i:"+_i+",_gid:"+_gid);
			if (toint(_gid) > 0)
			{
				window.g_Row.InitByBigInt( window.M_G_GOODS,window.ITEMPRESENT,window.M_G_GOODS_ITEMPRESENT_ENTRYID,_gid);
				if(window.g_Row.IsReady())
				{
					var _currState = window.g_Row.GetData(window.M_G_GOODS_ITEMPRESENT_STATE);
					if (_currState == window.MAIL_INIT)
					{
						window.g_Row.SetInt(window.M_G_GOODS_ITEMPRESENT_STATE,window.MAIL_READED);
						window.g_Row.UpdateEnd();
						window.g_Row.Release();

						var _Param = ""+_gid+","+window.MAIL_READED;
						//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
						window.Too_SetPresentState(_Param);	
					}
				}
			}
			_i += 1;
		}//while

		window.g_MailReadGIDStr = "";
	}
}