//家族列表中的内容
//夏洋洋 2010-3-7

//一行内容	家族名称+族长+等级+人数+家族签名
class VFamilyList_Content_UI item
{
	size = "99%,28";//bgcolor = "#ff";
	cursor = window.CURSOR_HAND;
	void Init()
	{
		new VListBG2_UI{size="100%,27";}
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果

		//家族名称
		staticvar m_Text_FamilyName = new BaseText
		{	
			pos = "7,7";
		}
		//族长
		staticvar m_Text_HeaderName = new BaseText
		{	
			pos = "117,7";
		}
		//等级
		staticvar m_Text_FamilyLev = new BaseText
		{
			pos = "227,7";
		}
		//人数
		staticvar m_Text_FamilyPeopleNum = new BaseText
		{
			pos = "317,7";
			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}
		//家族签名
		staticvar m_Text_FamilySlogan = new BaseText
		{
			pos = "407,7";
		}
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
		s_SelectBK.show=true;
		_IMG.show=false;
		_SelectState = true;
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;
		_SelectState = false;
	}
}

//总的类
class VFamilyList_Content_All_UI VN2ListCtrl
{
	//需要显示时改变
	size="560,308"; pos="45,105"; valign(0,0);halign(0,0);
	alpha = -1;bgcolor = -1;
	scroll = window.SCROLL_NOTENNIS;

	//[功能]设置列表的位置
	//[参数]data：列表的位置
	//[返回值]无
	void SetPos(data)
	{
		pos = data;
	}
	//[功能]设置列表的位置
	//[参数]data：列表的位置
	//[返回值]无
	void SetSize(data)
	{
		size = data;
	}
	
}