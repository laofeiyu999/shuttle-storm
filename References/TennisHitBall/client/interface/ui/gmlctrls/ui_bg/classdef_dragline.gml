
//有拖动钮的进度条
class VDragLine_UI item
{
	size = "214,14";//bgcolor = "#FF";
	var m_max = 0;
	new VPic3_PowerLineBk_UI{pos = "0,1";size = "100%,16";}//经验底图
	var _set = new item
	{
		size = "214,14";
		var _line = new item
		{
			pos = "0,1";
			size = "0,14";
			var _realLine = new VPic3_PowerLine_UI{size = "214,16";}
		}
		var _drag = new VBTN_DragBtn_New
		{
			pos = "0,0";drag = "self";
			void OnDrag()
			{
				parent._line.size = ""+left+",16";
				var x = left;
				var y = 0;
				if(height != 0){y = 0;}
				if(left>parent.width-20){x = parent.width-20;}
				if(left<0){x = 0;}
				pos = ""+x+","+y;
				parent.parent.OnDataChange();
			}
		}
		void OnClick()
		{
			var _x = window.mousex-parent.GetOffSet()-parent.left-left-10;
			if(_x>width-20){_x=width-20;}
			if(_x<0){_x=0;}
			_drag.pos = ""+_x+",0";
			_line.size = ""+_x+",16";
			parent.OnDataChange();
		}
	}
	void SetData(_cur,_max)
	{
		if(_max == ""){_max = 10;}
		m_max = _max;
		_set._drag.pos=""+(_cur*(width - _set._drag.width)/_max)+",0";
		_set._line.size = ""+_set._drag.left+",16";
	}
	//获得现在的数据
	void GetMyData()
	{
		return _set._drag.left*m_max/(width - _set._drag.width);
	}
	//设置宽度(高度是固定的)
	void SetSidth(_width)
	{
		size(_width,14);
		_set.size(_width,14);
		_set._line._realLine.size(_width,16);
	}
	//此类必须重载
	void GetOffSet()
	{
		return parent.left;
	}
	//可重载
	void OnDataChange()
	{
		
	}
};
