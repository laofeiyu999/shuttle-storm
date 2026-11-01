//
//系统公告的提示，在最上层的：如服务器要重启等 @yxf
//
import("$./ClassDef.gml");

//接口定义
//AddMsg(content,data="");//添加消息
//IamFree();//我有空
new CSystemAffiche
{
	size = "100%,40";valign(5,0);//bgcolor = "#FFFF";
	
	name = "CSYSTEMAFFICHE_LOGIC";
	//drag = "self";
	var _VSysAffiche = new VSysAffiche{}

	var _TB = new VNet2DBTable//数据库视图
	{
		Init(window.M_G_SERVER,window.CHATRECEIVE);
		
		Select(window.M_G_SERVER,"SELECT * FROM "+window.CHATRECEIVE+" WHERE "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_SCROLL);

		//数据库增加记录会自动调此函数 type:0普通,1私聊,2世界,3队伍,4频道,5系统公告,6GM,
		//7系统提示,8滚动公告,9小喇叭,10物品，11最上层的系统公告 12邀请
		void OnAddData(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm)
		{
			printf("B# [公告]content:"+content+",type:"+type+",_color:"+_color);
			if (toint(type) == 8)
			{
				if (window.GetUIPos() < window.POS_HALL)
				{
					return;
				}
//				if(_color != "")
//				{
//					parent._VSysAffiche.SetTextColor(_color);
//				}
//				else
//				{
//					parent._VSysAffiche.SetTextColor("#00FF00");
//				}
				parent.AddMsg(content);
				return;
			}
		}
	}

	//[功能]程序调用-有公告要显示
	//[参数]content:内容
	//		_name:玩家昵称
	//		data:其他数据(消息序号,消息类型,标记类型,发送者UID.....)
	void OnDisplayMsg(content,_name,data)
	{
		printf("B# [公告]系统CAfficheMgr:OnDisplayMsg："+content);
		_VSysAffiche.SetData(content);
	}

	//没有消息了
	void OnUnDisplayMsg()
	{
		IamFree();//我有空(程序函数)
	}
	
}