//经验条类
//陈晓聪 2009年10月16日

class VExpLine_UI item
{
	var m_SizeY = 16;
	size = "214,"+m_SizeY;
	var _bk = new VPic3_PowerLine2Bk_UI{size = "100%,100%";}
	var _exp = new item
	{
		size = "0,"+parent.m_SizeY;
		var _realLine = new VPic3_PowerLine2_UI{size = "100%,100%";}
		void SetData(data1,data2)
		{
			size = ""+(data1*parent.width/data2)+","+parent.m_SizeY;
		}
	}
	//可选文字
	void InitText()
	{
		staticvar _text = new text
		{
			size(parent.width,parent.m_SizeY);xcenter = true;valign(50,0);
			font = "宋体,-1,12";color = "#0";
			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}
	}
	//设置数据
	void SetData(data1,data2)
	{
		_exp.SetData(data1,data2);
		_text.SetData(data1,data2);
	}
	//设置宽度(高度固定)
	void SetWidth(_width)
	{
		size(_width,m_SizeY);
		_bk.size(_width,m_SizeY);
		_text.size(_width,m_SizeY);
		_exp._realLine.size(_width,m_SizeY);
	}
};

//能量条 add by zyy 2011-3-3
class VExpline1_UI item
{
	var m_SizeY = 16;
	size = "214,"+m_SizeY;
	var _bk = new VPic3_PowerLine2Bk_UI{size = "100%,100%";}
	var _exp = new item
	{
		size = "0,"+parent.m_SizeY;
		//var _realLine = new VPic3_PowerLine2_UI{size = "100%,100%";	
		void SetData(data1,data2)
		{
			 if ((tofloat (data1)/tofloat (data2)) <=0.15){new VPic3_PowerLine4_UI{size = "100%,100%";}}
		else if ((tofloat (data1)/tofloat (data2)) <=0.3){new VPic3_PowerLine5_UI{size = "100%,100%";}}
		else if ((tofloat (data1)/tofloat (data2)) <=0.5){new VPic3_PowerLine6_UI{size = "100%,100%";}}
		else if ((tofloat (data1)/tofloat (data2)) <=0.7){new VPic3_PowerLine2_UI{size = "100%,100%";}}
		   else ((tofloat (data1)/tofloat (data2)) <=1.0){new VPic3_PowerLine3_UI{size = "100%,100%";}}
		    size = ""+(data1*parent.width/data2)+","+parent.m_SizeY;
		}
	}

	//可选文字
	void InitText()
	{
		staticvar _text = new text
		{
			size(parent.width,parent.m_SizeY);valign(50,0);
			left = 491 ;
			font = "宋体,-1,12";color = "#0";
			void SetData(data1,data2)
			{
				src = ""+data1+"+"+data2;
			}
		}
	}
    //设置鼠标悬停框的内容
	//id:	悬停的ID
	//time: 悬停出来的时间 不传则默认
	void SetHangSrc(_src)
	{
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangSrc(_src);
	}

	//设置鼠标悬停框的ID
	//id:	悬停的ID
	void SetHangID(id)
	{
		//悬停
		staticvar _btnhover = new VBTN_HOVER{};
		_btnhover.SetHangID(id);
	}
	//设置数据
	void SetData(data1,data2)
	{				
		_exp.SetData(data1,data2);
		_text.SetData(data1,data2);
	}
	//设置宽度(高度固定)
	void SetWidth(_width)
	{
		size(_width,m_SizeY);
		_bk.size(_width,m_SizeY);
		_text.size(_width,m_SizeY);
		_exp.size(_width,m_SizeY);
	}
};
//大经验条
class VExpLine2_UI item
{
	size = "321,19";
	var _bk = new img{src = "$./imgs"+window.g_Sex+"/line_bk.tga";}
	var _exp = new item
	{
		pos = "4,0";size = "0,19";
		var _realLine = new img{pos = "0,5";src = "$./imgs"+window.g_Sex+"/line1.tga";}
		var _ani = new img{halign(100,1);valign(100,-3);src = "$./imgs"+window.g_Sex+"/channel_starAni.tga";clipani(58,13,1,3);anispeed = 6;}
		void SetData(data1,data2)
		{
			if(data1 == data2)
			{
				size = "313,19";
				_realLine.src = "$./imgs"+window.g_Sex+"/line2.tga";
				parent._light.show = false;
				return;
			}
			_realLine.src = "$./imgs"+window.g_Sex+"/line1.tga";
			var _width = data1*313/data2;
			if(_width<_ani.width){_width = _ani.width;}
			size = ""+(_width)+",19";
			parent._light.SetPos();
			_light.show = true;
		}
	}
	var _light = new img
	{
		src = "$./imgs"+window.g_Sex+"/light.tga";
		void SetPos()
		{
			pos((parent._exp.left+parent._exp.width-9),3);
		}
	}
	//设置数据
	void SetData(data1,data2)
	{
		_exp.SetData(data1,data2);
	}
};
<END>
class VExpLine2_UI item
{
	size = "321,19";
	var _bk = new img{src = "$./imgs"+window.g_Sex+"/line_bk.tga";}
	var _exp = new item
	{
		pos = "4,0";size = "0,19";
		var _realLine = new img{pos = "0,5";src = "$./imgs"+window.g_Sex+"/line1.tga";}
		
		void SetData(data1,data2)
		{
			if(data1 == data2)
			{
				size = "313,19";
				parent._ani.SetPos();
				_realLine.src = "$./imgs"+window.g_Sex+"/line2.tga";
				return;
			}
			_realLine.src = "$./imgs"+window.g_Sex+"/line1.tga";
			var _width = data1*313/data2;
			if(_width<parent._ani.width){_width = parent._ani.width;}
			size = ""+(_width)+",19";
			parent._ani.SetPos();
		}
	}
	var _ani = new img
	{
		src = "$./imgs"+window.g_Sex+"/channel_starAni.tga";clipani(58,13,1,3);anispeed = 7;
		void SetPos()
		{
			pos((parent._exp.left+parent._exp.width-56),3);
		}
	}
	//设置数据
	void SetData(data1,data2)
	{
		_exp.SetData(data1,data2);
	}
};