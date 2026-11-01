
//聊天泡泡类 
class VSpeakFroth_UI item
{
	show = false;
	var m_loopState = 0;
	var m_id = 0;

	var _bk = new VPic9_SpeakFroth_UI{}
	var _sanjiao = new img{src = "$./imgs/xsj.tga";}
	var _text = new iframe
	{
		//autoenter = true;xcenter = true;ycenter = true;
		size = "140,20";src = "$./../../Logic/Chat_New/chat.htm";//bgcolor = "#FF";
		void SetData(_src)
		{
			var _content = window.ParseFace(_src);//解析表情
			appendHtml("<font align=center class=CHAT_SENCEBUGLE>"+_content+"</font>");
			BODY.starttypeset();
			var _height = BODY.DocumentHeight;
			if(_height<30){_height=30;}		//自己大小的最小值
			if(_src.Count<18)
			{
				width = 120;
			}
			else
			{
				width = 230;
			}
			size(width,_height);
		}
	}//txtborder = "#0";color = "#FFFFFF";bgcolor = "#FF00";alpha = 80;
	//1:三角在下边 2:三角在左边 
	void InitType(data)
	{
		if(data==1)
		{
			size(_text.width+15,_text.height+37);
			set _sanjiao
			{
				valign(100,0);halign(50,width/2);rotate = 0;
			}
			_bk.size = "100%,100%,0,-7";
			_bk.pos = "0,0";
			_text.pos = "15,15";
			m_loopState = 1;
		}
		else
		{
			size(_text.width+35,_text.height+30);
			set _sanjiao
			{
				valign(50,3);halign(0,0);rotate = 90;
			}
			_bk.size = "100%,100%,-5,0";
			_bk.pos = "5,0";
			_text.pos = "20,15";
		}
	}
	//初始化文本
	void InitText(data)
	{
		_text.SetData(data);
	}
	//_type 2:三角在左边 1:三角在下边
	void SetData(_src,_type)
	{
		zindex="top";
		InitText(_src);
		InitType(_type);
		show = true;
		setTimer(5000,"HideSelf","SpeakFroth_Timer");
	}
	void HideSelf()
	{
		del();
		m_loopState = 0;
	}
	void SetNameByID(_id)
	{
		m_id = _id;
		name = "SpeakFroth_"+_id;
	}
	//这个用于定点的  三角在左边的
	void SetPos1(_x,_y)
	{
		pos(_x,_y);
	}
	//这个用以移动的  三角在下面的
	void SetPos2(_pos)
	{
		printf("SetPos2:"+_pos);
		pos = ""+_pos;
		left = left-width/2;
		top = top-height;
		pos(left,top);
	}
	void OnUpdate()
	{
		if(m_loopState!=1){return;}
		SetPos2(window.GetAction2DPos(m_id));
		sleep(200);
	}
};