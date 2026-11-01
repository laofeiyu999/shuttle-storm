//
//活动排名类定义
//

//一行显示类：昵称
class VColumn_ArenaTeam_UI item
{
	size = "171,28";bgcolor= -1;alpha = 0;
	
	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new BaseText{size="165,21";xcenter=true;ycenter=true;}
	}

	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_IMG.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;_SelectState = false;
	}
};

//
//队友列表总的类：List
//
class VArena_TeamList_UI VN2ListCtrl
{
	//需要显示时改变
	size="190,84";pos="434,380";
	bgcolor=-1;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
};