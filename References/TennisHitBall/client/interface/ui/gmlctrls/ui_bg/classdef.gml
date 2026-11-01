//界面背景类 
//陈晓聪 2009年10月16日
//此类已经在init中导入，使用说明在test文件中
class VUIBG_UI item
{
	
	var _content_bk = new VPic9_BK1_UI{pos = "0,20";}			//内容背景
	var _tital_bk = new VPic3_Tital_UI{pos = "0,0";}			//标题背景
	var _tital_bk_sj = new VPic3_Tital_SJ_UI{pos = "7,7";}		//水晶
	var _tital_shade = new item{pos = "9,7";fillimg = "$./imgs"+window.g_Sex+"/di wen.tga";}//底纹
	var _tital = new img{pos = "25,13";}						//标题 字

	//[功能]设置标题字位置	夏洋洋添加于2009-12-21
	//[参数]_pos：标题字的位置
	//[返回值]无
	void SetTitalPos(_pos)
	{
		_tital.pos = _pos;
	}
	void InitBG(_titalSrc)
	{
		//不加判断会打印错误 2009年12月9日 yxf
		if (_titalSrc != "" && _titalSrc != 0)
		{
			_tital.src = _titalSrc;
		}
		_tital_bk.size(width-4,32);
		_tital_bk_sj.size(width-16,21);
		_tital_shade.size(width-21,20);
		_content_bk.size(width-4,height-22);
	}
	void InitClose()		//new个X关闭钮
	{
		staticvar s_Btn_Close = new VBTN_Close_New{pos = ""+(parent.width-35)+",7";SetHangID(36);}			//关闭 钮
	}
	void InitHelp()			//new个帮助钮
	{
		staticvar s_Btn_Help = new VBTN_Help_New{pos = ""+(parent.width-57)+",7";SetHangID(35);}			//帮助 钮
	}
	void InitBtnBG()
	{
		_btn_bk.del();
		staticvar _btn_bk = new VPic3_ButtonBK_UI{size(parent.width-30,35);pos = "13,"+(parent.height-62);}		//大按钮底部背景
	}
	//[功能]设置按钮背景的大小,必须在InitBtnBG之后才能调用	夏洋洋添加于2009-12-23
	//[参数值]_size:按钮背景的大小
	//[返回值]无
	void SetBtnBGSize(_size)
	{
		_btn_bk.size = _size;
	}
	//[功能]设置按钮背景的位置,必须在InitBtnBG之后才能调用	夏洋洋添加于2009-12-23
	//[参数值]_pos:按钮背景的位置
	//[返回值]无
	void SetBtnBGPos(_pos)
	{
		_btn_bk.pos = _pos;
	}
	void OpenDrag()			//设置可拖拽
	{
		s_DragItem.del();
		staticvar s_DragItem = new item
		{
			halign(50,0);size = ""+(parent.width-20)+",29";//bgcolor = "#FF0000";

			void OnMouseOver()
			{
				drag = "parent";parent.valign(0,0);parent.halign(0,0);
			}
			void OnMouseOut()
			{
				drag = "";
			}
		}
	}

	void CloseDrag()		//关闭可拖拽
	{
		s_DragItem.del();
	}
	void OnDrag()
	{
		//zindex = "top";	
//		var _x = left;
//		var _y = top;
//		if(left+width>window.width+window.left){_x = window.width-width;}
//		if(left<window.left){_x = window.left;}
//		if(top+height>window.top+window.height){_y = window.top+window.height-height;}
//		if(top<39){_y = window.top+39;}
//		pos(_x,_y);
		OnDragFunc();
	}
	void OnDragFunc(){}
	
	//设置标题是文字
	void SetTitle(_src)
	{
		_tital.src =_src;
	}
	
	//激活窗口-最上层
	//有些地方需要去掉这个（比如游戏中快捷购买）
	void NeedFocusItem()
	{
		staticvar m_FocusItem = new item
		{
			size = "100%,100%";zindex = "top";//alpha = 80;bgcolor = "#FF";
			void OnClick()
			{
				printf("zindex:name:"+this.name+",parent.name:"+parent.name+",parent.parent.name:"+parent.parent.name);
				parent.parent.zindex = "top";
			}
		}
	}
	
	
};