
import("$./../../UI/Chat_New/ClassDef_ChatCtrl.gml");

class VChatCtrl_Logic item
{
	valign(100,-73);size = "12,21";
	var _state = 0;//false不显示状态 true显示状态
	void Init()
	{
		//显示聊天按钮
		staticvar s_b_ChatShow = new VBTN_Chat_Show{}
	}
	inclass("VChatCtrl_UI");
	Init();
	void SetEvent()
	{
		set s_b_ChatShow
		{
			void OnPressed()
			{
				parent.SetShow(false);
				parent.parent._chatmgr.show = true;
			}
		}
	}
	SetEvent();

	void SetShow(data)
	{
		show = data;
		_state = data;
	}

	//需要隐藏时隐藏，需要显示时先看状态
	void SetViewState(data)
	{
		if(data==false){show = false;}
		else{SetVisible();}
	}

	//根据自己的状态来决定是显示还是隐藏
	void SetVisible()
	{
		if(_state == true){show = true;}
		else{show = false;}
	}
};