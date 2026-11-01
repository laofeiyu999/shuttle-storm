import("$./ClassDef_Sub.gml");
import("$./../game/RenderTextureA.gml");
import("$./../../UI/Chat_New/ClassDef_Chat_SenceBugle.gml");

class VSenceBugle_Action_Logic item
{
	size = "130, 210";show = false;
	inclass("VSenceBugle_Action_UI");
	
	var _img = new img3d{pos = "-145, -20";size = "400, 300";capturemouse=false;}
	var _rta = new rtexture
	{
		bgcolor = "#0";
		size = "0%,0%";
		size = "400,300";

		void ScriptInit( _str)
		{
			map.del();
			staticvar map = new RenderMap{};
			map.ScriptInit(_str);
		}
	};

	new item
	{
		pos = "5,10";size = "120,190";
		void OnMouseOver()
		{
			drag = "parent";parent.valign(0,0);parent.halign(0,0);
		}
		void OnMouseOut()
		{
			drag = "";
		}
	}
	void SetData(_str)
	{
		if( window.GetUIGameState() == window.USER_UISTATE_TRAIN_FORCE)
			return;

		show = false;
		_rta.ScriptInit( _str);
//		_rta.map.ScriptInit(_str);
		_img.src=_rta.UITexture;
		show = true;
	}
	void OnDrag()
	{
		var _x = left;
		var _y = top;
		if(left+width>window.width){_x = window.width-width;}
		if(left<0){_x = 0;}
		if(top+height>window.height){_y = window.height-height;}
		if(top < 0 ){_y = 0;}
		pos(_x,_y);
		OnDragFunc();
	}
};

class VSenceBugle_Froth_Logic item
{
	inclass("VSenceBugle_Froth_UI");
}

class VSenceBugle_Mgr_Logic CSystemAffiche
{
	size = "100%,100%";name = "VSenceBugle_Mgr_Logic_Name";show = false;
	
	//SetNkName(window.GetMyName());//设置自己的昵称

	void ReSetPos()
	{
		_Action.pos(window.width-_Action.width,window.height-_Action.height);
		_Action.OnDragFunc();
	}

	//模型和动作
	staticvar _Action = new VSenceBugle_Action_Logic
	{
		pos(window.width-width,window.height-height);
		void OnDragFunc()
		{
			parent._Froth.ResetPos();//拖拽时通知泡泡
		}
	}

	//文字内容-泡泡
	staticvar _Froth = new VSenceBugle_Froth_Logic{show = true;}
	
	//[功能]外部传来消息
	//[参数]pMsg:动作ID,Ava1,...,Ava13;说话内容
	//		pName:发送者昵称
	//		pSenderJid:发送者UID
	void SetData(pMsg,pName,pSenderJid)
	{
		if (window.GetUIPos() <= window.POS_CHANNELCHOOSE)
		{
			return;
		}
		if (window.GetUIGameState() == window.USER_UISTATE_TRAIN_FORCE)
		{
			return;
		}

		var _arr = window.SplitStr2(pMsg,";",2);
		//AddMsg(_arr[1],pName,_arr[0]);//程序函数
		OnDisplayMsg(_arr[1],pName,_arr[0]);
	}

	//[功能]程序调用-有小喇叭要显示
	//[参数]content:内容
	//		_name:玩家昵称
	//		data:其他数据(消息序号,标记类型,发送者UID.....)
	void OnDisplayMsg(content,_name,data)
	{
		printf("B# 动作喇叭 OnDisplayMsg:content:"+content+",data:"+data+",_name:"+_name);
		if (window.GetUIPos() <= window.POS_CHANNELCHOOSE)
		{
			OnUnDisplayMsg();
			return;
		}

		killtimer("DelTimer");
		content=toNormalHtml(content);
		_Action.SetData(data);
		_Froth.SetData(_name,content);
		
		show = true;
		setTimer(window.MSGQUEUE_ACTIONBUGLE,"OnUnDisplayMsg","DelTimer");
	}

	//[功能]程序调用-有多少条需要等待显示
	//[参数]waitnum:前面等的数量
	void OnDisplayTimer(waitnum)
	{
		waitnum = toint(waitnum);
		printf("B# 动作喇叭 OnDisplayTimer:waitnum:"+waitnum);
		if (waitnum < 0) return;
		if (waitnum == 0)
		{
			window.WriteChat7(998);//下一条将显示您的动作喇叭，请注意查看！
			return;
		}
		window.WriteChat7(1006,""+waitnum+","+toint(waitnum)*(window.MSGQUEUE_ACTIONBUGLE/1000));//前面有%0条信息等待显示!需要%1秒。
	}

	//没有消息了
	void OnUnDisplayMsg()
	{
		show = false;
		_Action.show=false;
		_Froth.show=false;

		IamFree();//我有空(程序函数)
	}

	//不该显示了-退出大厅了
	void MustHide()
	{
		show = false;
		ClearAll();
	}
}