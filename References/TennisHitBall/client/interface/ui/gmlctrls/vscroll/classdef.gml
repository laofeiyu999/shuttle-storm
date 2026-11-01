import("$./../VButton/ClassDef.gml");
///*
class meleescroll scrollbar
{
	class barx ScrollOneBar{cursor = window.CURSOR_HAND;size(20,29);};
	class bary ScrollOneBar{cursor = window.CURSOR_HAND;size(29,20);};
	class butnimg img
	{
		void reset(){replaceSrc("_o.tga","_n.tga");replaceSrc("_c.tga","_n.tga");}
		void Onmouseover(){reset();replaceSrc("_n.tga","_o.tga");}
		void Onmouseout(){reset();}
		void onmousedownl(){reset();replaceSrc("_n.tga","_c.tga");}
		void OnMouseUpL(){reset();replaceSrc("_n.tga","_o.tga");}
	};
	class midbar ScrollOneBar
	{
		cursor = window.CURSOR_HAND;
		void reset()
		{
			_IMG1._XX.replaceSrc("_c.tga","_n.tga");_IMG2._XX.replaceSrc("_c.tga","_n.tga");_IMG3._XX.replaceSrc("_c.tga","_n.tga");
			_IMG1._XX.replaceSrc("_o.tga","_n.tga");_IMG2._XX.replaceSrc("_o.tga","_n.tga");_IMG3._XX.replaceSrc("_o.tga","_n.tga");
		}
		void Onmouseover()
		{
			reset();fillimg_o();
			_IMG3._XX.replaceSrc("_n.tga","_o.tga");_IMG1._XX.replaceSrc("_n.tga","_o.tga");_IMG2._XX.replaceSrc("_n.tga","_o.tga");
		}
		void Onmouseout(){reset();fillimg_n();}
		void onmousedownl()
		{
			reset();fillimg_c();
			_IMG1._XX.replaceSrc("_n.tga","_c.tga");_IMG2._XX.replaceSrc("_n.tga","_c.tga");_IMG3._XX.replaceSrc("_n.tga","_c.tga");
		}
		void OnMouseUpL()
		{
			reset();fillimg_o();
			_IMG1._XX.replaceSrc("_n.tga","_o.tga");_IMG2._XX.replaceSrc("_n.tga","_o.tga");_IMG3._XX.replaceSrc("_n.tga","_o.tga");
		}
	};
};

//网球SCROLL
class tenniscroll meleescroll
{
	cursor = window.CURSOR_HAND;
	size(24,21);
	bgcolor = -1;
	fillimg = "$./imgs"+window.g_Sex+"/tennis/Background.tga";
	new bary
	{
		halign(50,0);
		name = "SCROLLUP";
		new butnimg
		{
			halign(50,0);
			src = "$./imgs"+window.g_Sex+"/tennis/Up_n.tga";
		}
	}
	new bary
	{
		halign(50,0);
		valign(100,4);
		name="SCROLLDOWN";
		new butnimg
		{
			halign(50,0);
			src="$./imgs"+window.g_Sex+"/tennis/Down_n.tga";
		}
	}
	new midbar
	{
		name="SCROLLMID";size("100%","8");

//		fillimg="$./imgs"+ window.g_Sex+"/tennis/滑动钮中_n.tga";
		var _IMG1=new item
		{
			size = "100%,8";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/tennis/RollButtonTop_n.tga";
			}
		} 
		var _IMG2=new item
		{
			size = "100%,8";//pos = "0,15";
			valign(100,0);
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/tennis/RollButtonBottom_n.tga";
			}
		} 
		var _IMG3=new item
		{
			size = "100%,100%,0,-16";pos = "0,8";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/tennis/Rolling_n.tga";size = "100%,100%";
			}
		}
		void fillimg_n(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/tennis/Rolling_n.tga";};
		void fillimg_o(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/tennis/Rolling_o.tga";};
		void fillimg_c(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/tennis/Rolling_c.tga";};
	}
};
//*/
//<END>
class midbar_New ScrollOneBar
{
	cursor = window.CURSOR_HAND;
	void reset()
	{
		_IMG1._XX.replaceSrc("_c.tga","_n.tga");_IMG2._XX.replaceSrc("_c.tga","_n.tga");_IMG3._XX.replaceSrc("_c.tga","_n.tga");
		_IMG1._XX.replaceSrc("_o.tga","_n.tga");_IMG2._XX.replaceSrc("_o.tga","_n.tga");_IMG3._XX.replaceSrc("_o.tga","_n.tga");
	}
	void OnMouseOver()
	{
		reset();fillimg_o();
		_IMG3._XX.replaceSrc("_n.tga","_o.tga");_IMG1._XX.replaceSrc("_n.tga","_o.tga");_IMG2._XX.replaceSrc("_n.tga","_o.tga");
	}
	void OnMouseOut()
	{
		reset();fillimg_n();
	}
	void OnMouseDownL()
	{
		reset();fillimg_c();
		_IMG1._XX.replaceSrc("_n.tga","_c.tga");_IMG2._XX.replaceSrc("_n.tga","_c.tga");_IMG3._XX.replaceSrc("_n.tga","_c.tga");
	}
	void OnMouseUpL()
	{
		reset();fillimg_o();
		_IMG1._XX.replaceSrc("_n.tga","_o.tga");_IMG2._XX.replaceSrc("_n.tga","_o.tga");_IMG3._XX.replaceSrc("_n.tga","_o.tga");
	}
};

//新 大 网球SCROLL
class bigscroll scrollbar
{
	cursor = window.CURSOR_HAND;
	size(26,26);
	bgcolor = -1;
	new item
	{
		pos = "0,26";size = "16,100%,0,-52";fillimg = "$./imgs"+window.g_Sex+"/Big_New/bk.tga";
	}
	new VBTN_BigScrollUp_New
	{
		size(26,26);capturemouse = false;
		name = "SCROLLUP";
	}
	new VBTN_BigScrollDown_New
	{
		valign(100,0);size(26,26);capturemouse = false;
		name="SCROLLDOWN";
	}
	new midbar_New
	{
		name="SCROLLMID";size("100%","8");
//		name="SCROLLMID";size="100%,16,-4,0";//halign(50,0);
		var _IMG1=new item
		{
			size = "100%,2";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Big_New/up_n.tga";
			}
		} 
		var _IMG2=new item
		{
			size = "100%,2";//pos = "0,15";
			valign(100,0);
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Big_New/bottom_n.tga";
			}
		} 
		var _IMG3=new item
		{
			size = "100%,100%,0,-4";pos = "0,2";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Big_New/middle_n.tga";size = "100%,100%";
			}
		}
		void fillimg_n(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Big_New/middle_n.tga";};
		void fillimg_o(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Big_New/middle_o.tga";};
		void fillimg_c(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Big_New/middle_c.tga";};
	}
};

//新 小 网球SCROLL
class smallscroll scrollbar
{
	cursor = window.CURSOR_HAND;
//	size(14,14);
	new item
	{
		pos = "0,14";size = "16,100%,0,-28";fillimg = "$./imgs"+window.g_Sex+"/Small_New/bk.tga";
	}
	new VBTN_ScrollUp_New
	{
		size(13,14);capturemouse = false;
		name = "SCROLLUP";
	}
	new VBTN_ScrollDown_New
	{
		valign(100,0);size(13,14);capturemouse = false;
		name="SCROLLDOWN";
	}
	new midbar_New
	{
		name="SCROLLMID";size("100%","8");
		var _IMG1=new item
		{
			size = "100%,4";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Small_New/hg01.tga";
			}
		} 
		var _IMG2=new item
		{
			size = "100%,4";//pos = "0,15";
			valign(100,0);
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Small_New/hg03.tga";
			}
		} 
		var _IMG3=new item
		{
			size = "100%,100%,0,-8";pos = "0,4";
			var _XX = new VN3D_FillImgs
			{
				size = "100%,100%";
				src="$./imgs"+window.g_Sex+"/Small_New/hg02.tga";size = "100%,100%";
			}
		}
		void fillimg_n(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Small_New/hg02.tga";};
		void fillimg_o(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Small_New/hg002.tga";};
		void fillimg_c(){_IMG3._XX.src="$./imgs"+window.g_Sex+"/Small_New/hg0002.tga";};
	}
};