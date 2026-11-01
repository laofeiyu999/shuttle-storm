//消息的iframe的类定义
//yxf 2008年10月22日

importex("$./../../../UI/Friend/Pop/ClassDef_Msgiframe.gml");
import("$./ClassDef_Sub.gml");
import("$./../../Chat/ClassDef_Sub.gml");

//所有的消息-容器
class VFriendMsgiframe_Logic iframe
{
	scroll = window.SCROLL_NOTENNIS;
	src = "msg.htm";
	size="400,200";
	pos = "0,50";
	name = "VFriendMsgiframe_Logic";
	group = 1;
	bgcolor = "#FFF";
	
	inclass("VFriendMsgiframe_UI");//界面显示类
	
	var _MsgNum = 0;//标记第及条聊天记录：例如最多保存100条

	//敏感字符过滤
	void StrFilter(_str)
	{
		_str = _str.Replace("(","（");
		_str = _str.Replace(")","）");
		_str = _str.Replace("\"","“");
		return _str;
	}

	//消息：你说/谁说
	void ReceiveMsgData(sendername,content)
	{
		printf("B# 消息：sendername:"+sendername+",content:"+content);
		_MsgNum += 1;

		content=toNormalHtml(content);
		content = window.g_DirtyFilter_Chat.Trans(content);//脏话过滤
		content = window.ParseFace(content);//解析表情
		content = StrFilter(content);		//敏感字过滤

		set BODY
		{
			var _class="MSG_OTHERSAY";
			var _user="MsgCharUser";

			//GM工具判断
			if (group.parent.m_GMID > 0)
			{
				_user = "CharSelf";
			}

			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_class = "MSG_ISAY";
				_user = "CharSelf";
			}
			
			appendHtml("<VOneChatMsg_Friend class="+_class+" + NameChatMsg("+group._MsgNum+")><"+_user+" username("+sendername+")/>说："+content+"<br></VOneChatMsg_Friend>");

			starttypeset();
		}
		timer(10,"scrolltoend","scrolltoend");
	}
	void scrolltoend()
	{
		group.BODY.scrollto(0,99999999);
	}

	//清楚记录
	void ClearAll()
	{
		BODY.delallchild();
	}
	
	//有新消息来，传来相应的select语句
	void NewMsgSelect(SQL)
	{
		//alert("NewMsgSelect="+SQL);
		var _VNet2DBTable = new VNet2DBTable	
		{
			void OnAddData(id,content,senderName,reciveUID,JId)
			{
				//alert(""+id+","+content+","+senderName+","+reciveUID+","+JId);
				parent.ReceiveMsgData(senderName,content);
				window.find("friendsys").DelMsgChatReceiveRow(id);
				//window.find("Hall_Show_Msg").ShowOver();
				window.g_FriendMsgID += ""+id+",";
			}
			//void OnDelete()
			//{
			//	alert("NewMsgSelect");
			//}
		}
		_VNet2DBTable.Select(window.GAMEUI,SQL);
		_VNet2DBTable.ReadData("OnAddData","0,1,2,3,4");
		//_VNet2DBTable.SubDbRowRef();	//删除select的记录
		//_VNet2DBTable.Release();
		
		if (window.GetUnReadFriendMsg() <=0 )
		{
			window.find("Hall_Show_Msg").ShowOver();
		}
	}

	//打开这个界面后就是 即时聊天了 需要定时select
	void UpDataMsg()
	{
		//sleep(500);
		//while (1)
		//{
			//var _Param = "SELECT * FROM "+window.MSGCHATRECEIVE+" WHERE senderName="+window._MsgWhoName+" AND reciveUID="+window.GetMyUID();
			//printf("B# 短信select条件："+_Param);
			//NewMsgSelect(_Param);
			//sleep(500);
		//}
	}
};
