load("$./DBDebug.gml");
load("$./../../init.gml");
import("$./ClassDef_ChatMgr.gml");
import("$./ClassDef_ChatSend.gml");
import("$./ClassDef_Chat_ChannelSet.gml");
wndborder = "no";
wndsize="1024,768";
size="1024,768";
bkcolor="#999999";

set window
{
	void GetMyName()
	{
		return "逗你玩";
	}
	void OnMouseDownR()
	{
		aa.show = true;
	}
}

var aa = new ChatMgr_Logic
{
	_send.SetDebug(1);
};

new VChat_ChannelSet_Logic{};
//var _send = new ChatSend_Logic{};
//
//new VMyButton
//{
//	pos = "0,665";Init("填充1");
//	void OnPressed()
//	{
//		var _VNet2DBRow = new VNet2DBRow{};
//		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
//		if (_VNet2DBRow.IsReady())
//		{
//			//alert(1);
//			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 7);
////			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 0);
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~wecan/aiq%$#@[1*10000*3*33]");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "");
//			//_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
//			_VNet2DBRow.UpdateEnd();
//		}
//	}
//}
//
//new VMyButton
//{
//	pos = "100,665";Init("填充2");
//	void OnPressed()
//	{
//		var _VNet2DBRow = new VNet2DBRow{};
//		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
//		if (_VNet2DBRow.IsReady())
//		{
//			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 2);
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~~wecanwocan/h");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#BD3B3B");
//			_VNet2DBRow.UpdateEnd();
//		}
//	}
//}
//
////new VMyButton
////{
////	pos = "200,665";Init("填充3");cursor="chat.ani";
////	void OnPressed()
////	{
////		var _VNet2DBRow = new VNet2DBRow{};
////		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
////		if (_VNet2DBRow.IsReady())
////		{
////			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 3);
////			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~wecanwocan");
////			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
////			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
////			_VNet2DBRow.UpdateEnd();
////		}
////	}
////}
////
//new VMyButton
//{
//	pos = "300,665";Init("填充4");cursor="input.ani";
//	void OnPressed()
//	{
//		var _VNet2DBRow = new VNet2DBRow{};
//		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
//		if (_VNet2DBRow.IsReady())
//		{
//			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 5);
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "xxfdsfjlkl");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
//			_VNet2DBRow.UpdateEnd();
//		}
//	}
//}
//
//new VMyButton
//{
//	pos = "400,665";Init("填充5");cursor="pick.ani";
//	void OnPressed()
//	{
//		var _VNet2DBRow = new VNet2DBRow{};
//		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
//		if (_VNet2DBRow.IsReady())
//		{
//			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 9);
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~wecanwocan");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
//			_VNet2DBRow.UpdateEnd();
//		}
//	}
//}

//
//new VMyButton
//{
//	pos = "500,665";Init("填充6");cursor="zoom.ani";
//	void OnPressed()
//	{
//		var _VNet2DBRow = new VNet2DBRow{};
//		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
//		if (_VNet2DBRow.IsReady())
//		{
//			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 6);
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~wecanwocan");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
//			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
//			_VNet2DBRow.UpdateEnd();
//		}
//	}
//}
//
new VMyButton
{
	pos = "600,665";Init("填充7");
	void OnPressed()
	{
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.CHATRECEIVE,window.M_G_SERVER_CHATRECEIVE_ID,1,1);
		if (_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.SetInt(window.M_G_SERVER_CHATRECEIVE_TYPE , 7);
			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_CONTENT , "~[浩叶]同意加入队伍");
			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_SENDERNAME , "someone");
			_VNet2DBRow.SetString(window.M_G_SERVER_CHATRECEIVE_COLOR , "#ffff");
			_VNet2DBRow.UpdateEnd();
		}
		_VNet2DBRow.del();
	}
}

new VMyButton
{
	pos = "600,715";Init("获得焦点");
	void OnPressed()
	{
		window.aa._send._input.setFocus(true);
	}
}