//Logic
//房间内人物悬停基本信息
//张洋 2010年9月19号
importex("$./../../UI/Room/ClassDef_HangMsg.gml");
class VRoleHang_Logic item
{
	size="160,105";bgcolor="#FF";
	name="VRoleHang_Logic";

	staticvar s_html = new html;
	var m_canShow = true;
	
	inclass("VRoleHang_UI");

	//[功能]取数据库的数据
	//[参数]_uid:玩家ID
	void ReadDataFromDB(_uid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_uid);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error:-个人信息-基础信息-DBname:"+window.M_G_SERVER+",TBName1:"+window.USERDT+",UID:"+_uid);
			window.find("UIController").LoadDLG(147);//玩家已离线，基础信息错误！
			return;
		}

		var _userID = window.g_Row.GetData(window.M_G_SERVER_USERDT_UID);
		var _userName = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME);//昵称
		var _userLv = window.g_Row.GetData(window.M_G_SERVER_USERDT_CULEVEL);//等级
		var _userTitleID = window.g_Row.GetData(window.M_G_SERVER_USERDT_RECEIVEQUALIFY);//称号ID
		var _userQ = window.GetChannelType(_userTitleID)+"选手";
		var _userTypeID = window.g_Row.GetData(window.M_G_SERVER_USERDT_TROLETYPE);//技术类型ID
		var _userType = window.GetTechnicByType(_userTypeID);//技术类型
		var _isSelf = 0;
		if(_userID == window.GetMyUID())
		{
			_isSelf = 1;
		}

		window.g_Row.Release();

		//[参数]_isSelf: 是否自己， _userName: 玩家昵称 ，_userLv: 玩家等级， _userQ: 玩家称号， _userType: 技术类型
		s_html.SetData(_isSelf,_userName,_userLv,_userQ,_userType);
	
	}

	void OnCreated()
	{
		//ReadDataFromDB();
	}


	//==========================快捷键===================================
	window.find("gameinput").AddExclusiveShortcutUser(this);
	void OnDelete()
	{
		window.g_MouseROnly = false;
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
	//===============================================================
	//bgcolor = "#FF";movetocursor(1,1);//size = "100,180";
	setFocus = "true";capturemouse="true";

//	void OnLostFocus()
//	{
////		if(m_canShow == true) return;
//		
//			if (updatecount>1)
//				del();
//			else 
//				setFocus = "true";
//	
//	}
	
//	void OnMouseDownL()
//	{
//		alert("ML");
//		m_canShow = true;
//	}
//	void OnMouseDownR(){
//		alert("MR");
//		m_canShow =false;
////		del();
//		}
//	void OnMouseDownL(){del();}
};

<END>
new fmodel{}
bgcolor="#FFffff";
import("$./../Init.gml");
new VRoleHang_Logic{}

//void OnMouseOver()
//{
//	set window
//	{
//		window.find("VRoleHang_Logic").del();
//		new VRoleHang_Logic{}
//	}
//}
//void OnMouseOut()
//{
//	window.find("VRoleHang_Logic").del();
//}