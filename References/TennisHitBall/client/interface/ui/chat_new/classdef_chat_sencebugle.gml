
class VSenceBugle_Froth_UI item
{
	show = false;
	size = "30,30";
	var m_typechange = 0;
	var _bk = new VPic9_SpeakFroth_UI{size = "30,30";}
	var _sanjiao = new img{src = "$./imgs/xsj.tga";}
	
	//1:三角在下边 2:三角在上边
	void InitType(data)
	{
		size(_text.width+15,_text.height+41);

		if(data==1)
		{
			m_typechange = 0;
			set _sanjiao
			{
				src = "$./imgs/xsj.tga";
				pos(parent.width/2,parent.height-height);rotate = -1;
			}
			_bk.pos = "0,0";_bk.size = "100%,100%,0,-11";
			_text.pos = "15,15";
		}
		else
		{
			m_typechange = 1;
			set _sanjiao
			{
				src = "$./imgs/xsj.tga";
				pos(parent.width/2-1.6*width,0);rotate = 180;
			}
			_bk.pos = "0,11";_bk.size = "100%,100%,0,-11";
			_text.pos = "15,27";
		}
	}
	void InitText(data1,data2)
	{
		_text.del();
		staticvar _text = new iframe
		{
			size = "135,30";src = "$./../../Logic/Chat_New/chat.htm";//bgcolor = "#FF";
			void SetData(_sendername,_src)
			{
				var _content = window.ParseFace(_src);//解析表情
				var _user="CharUser";
				if (_sendername == window.GetMyName())
				{
					_sendername = "你";
					_user = "CharSelf";
				}
				appendHtml("<font class=CHAT_SENCEBUGLE>"+
					"<"+_user+" username("+_sendername+")/>说："+
					_content+"</font>");
				BODY.starttypeset();
				var _height = BODY.DocumentHeight;
				if(_height<30){_height=30;}		//自己大小的最小值
				size(width,_height);
			}
		}
		_text.SetData(data1,data2);
	}
	void SetData(_name,_src)
	{
		show = false;
		InitText(_name,_src);
		InitType(1);
		ResetPos();
		show = true;
	}
	void ResetPos()
	{
		var _x = parent._Action.left+(parent._Action.width-width)/2;
		var _y = parent._Action.top-height+15;
		if(m_typechange == 1){InitType(1);}
		if(_y<0){_y = parent._Action.top+parent._Action.height-15;InitType(2);}//泡泡出了上边 在下边显示
		pos(_x,_y);
	}
}

class VSenceBugle_Action_UI item
{
	//valign(100,0);halign(100,0);
	//pos = "30,30";
};