//UI
//房间内人物悬停基本信息
//张洋 2010年9月19号

class VRoleHang_UI item
{
		size="160,105";bgcolor="-1";

		var m_wdith = 160;
		var m_height = 105;
		var m_X = window.mousex;
		var m_Y = window.mousey;

		if(m_X+m_wdith>window.width)//初始化后宽度超出窗口右边
		{
			m_X = m_X - m_wdith;
		}

		if(m_Y+m_height>window.height)//初始化后高度超出窗口下边
		{
			m_Y = m_Y - m_height;
		}

		//设定可行坐标
		pos(m_X,m_Y);


	staticvar s_html = new html
	{

		//鼠标悬停背景
		var _hangBK = new VPic9_HandWnd_UI
		{
			SetSize(parent.width-1,parent.height);
		}
		var _body = new body{}
		
		//[功能]设置悬浮数据
		//[参数]_isSelf: 是否自己， _userName: 玩家昵称 ，_userLv: 玩家等级， _userQ: 玩家称号， _userType: 技术类型
		//[返回值]无
		void SetData(_isSelf, _name, _lv, _title, _type)
		{

			_body.appendHtml("<font color=#000000 size=12px>昵称：</font>");
			_body.appendHtml("<font color=#000000 size=12px>"+_name+"<br></font>");
			_body.appendHtml("<font color=#000000 size=12px>等级：</font>");
			_body.appendHtml("<font color=#000000 size=12px>"+_lv+"<br></font>");
			_body.appendHtml("<font color=#000000 size=12px>称号：</font>");
			_body.appendHtml("<font color=#000000 size=12px>"+_title+"<br></font>");
			_body.appendHtml("<font color=#000000 size=12px>技术类型：</font>");
			_body.appendHtml("<font color=#000000 size=12px>"+_type+"</font>");

			//是其他玩家才加入这条
			if(!_isSelf)
			{
				_body.appendHtml("<br><font color=#048EBE size=12px><br>点击鼠标右键可加为好友<br></font>");
			}
		}


	}
};

<END>
//new fmodel{}
//bgcolor="#FFffff";
//import("$./../../Logic/Init.gml");
//new VRoleHang_UI{Init();}