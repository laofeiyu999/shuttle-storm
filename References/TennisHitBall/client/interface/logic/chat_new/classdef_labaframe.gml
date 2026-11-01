import("$./ClassDef_ChatFrame.gml");
import("$./../../UI/Chat_New/ClassDef_LabaFrame.gml");

//class LabaFram_BTN_Logic item
//{
//	void Init()
//	{
//		staticvar _add = new VMyButton{pos="330,0";Init("加");};
//		staticvar _sub = new VMyButton{pos="330,40";Init("减");};
//	}
//	inclass("LabaFram_BTN_UI");
//	Init();
//	void SetEvent()
//	{
//		set _add
//		{
//			void OnPressed()
//			{
//				parent.parent.ChangeLine(true);
//			}
//		}
//		set _sub
//		{
//			void OnPressed()
//			{
//				parent.parent.ChangeLine(false);
//			}
//		}
//	}
//	SetEvent();
//};

class LabaFram_Logic CSystemAffiche
{
	SetNkName(window.GetMyName());//设置自己的昵称
	capturemouse = true;show = false;
	pos(0,0);size(360,100);bgcolor = "#FF00";alpha = 50;
	//显示重载
	void Init()
	{
		
	}
	inclass("LabaFram_UI");
	Init();
	//小喇叭
	var _bugle = new ChatFrame_NoScroll_Logic{}

	//[功能]程序调用-有小喇叭要显示
	//[参数]content:内容
	//		_name:玩家昵称
	//		data:其他数据(消息序号,标记类型,发送者UID.....)
	void OnDisplayMsg(content,_name,data)
	{
		printf("B# 小喇叭 OnDisplayMsg:content:"+content+",data:"+data+",_name:"+_name);
		
		var _Arr = window.SplitStr2(data,",");//消息数据-返回一个数组
		_bugle.ChatType9(_Arr[0],_Arr[1],_name,content,_Arr[2]);
		_bugle.HideLaba();
		window.find("CHAT_LOGIC").zindex = "top";
	}

	//[功能]程序调用-有多少条需要等待显示
	//[参数]waitnum:前面等的数量
	void OnDisplayTimer(waitnum)
	{
		waitnum = toint(waitnum);
		printf("B# 小喇叭 OnDisplayTimer:waitnum:"+waitnum);
		if (waitnum < 0) return;
		if (waitnum == 0)
		{
			window.WriteChat7(1005);//下一条将显示您的小喇叭，请注意查看！
			return;
		}
		window.WriteChat7(1006,""+waitnum+","+toint(waitnum)*(window.MSGQUEUE_BUGLE/1000));//前面有%0条信息等待显示!需要%1秒。
	}

	//没有消息了
	void OnUnDisplayMsg()
	{
		_bugle.HideFunc();
		IamFree();//我有空(程序函数)
	}
};