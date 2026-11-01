//快捷键聊天 LIST 类定义 武文博 2101.8.26

//一行显示类：行动+按键
class VColumn_Action_ShotcutChat_UI item
{
	size = "280,28";bgcolor = -1;cursor = window.CURSOR_HAND;

	void Init()
	{

		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32,-10,0";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width-20); show=false;}	//鼠标滑过效果

		staticvar s_Action = new item
		{
			size = "130,28";//bgcolor = "#FF";
			var _img = new img
			{
				valign(50,0);halign(50,0);
			}
			void SetData(data)
			{
				_img.src = "$./imgs"+window.g_Sex+"/ChatKey/an"+data+"-text.tga";
			}
		}
		//按键值
		//参数 data1：按键
		staticvar s_ShotcutChatValue = new BKText
		{
			pos = "130,4";size = "130,20";
			xcenter = true;ycenter = true;
		}
	}
	void OnMySelect()				//选择的效果
	{
		s_select.show = true;
	}
	void OnMyUnSelect()				//不选择的效果
	{
		s_select.show = false;
	}

	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_IMG.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
		window.PlaySound(144);
	}
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;_SelectState = false;
	}
};

//
//总的类：List
//
class VGameSetUp_ShotcutChatList_UI VN2ListCtrl
{
	valign(0,0);halign(0,0);size="310,256";pos = "20,78";
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
	bgcolor = -1;
}