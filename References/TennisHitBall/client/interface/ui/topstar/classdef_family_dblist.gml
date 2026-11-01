//家族排行榜
//夏洋洋 2010-3-8

//一行内容	名次+家族名称+族长+等级+积分+人数
class VColumn_FamilyDBList_UI item
{
	size = "99%,27";//bgcolor = "#ff";
	cursor = window.CURSOR_HAND;
	void Init()
	{
		new VListBG2_UI{size="100%,26";}
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		staticvar _MySelf = new VPic9_ChooseMySelf{size = "100%,32";show = false;};	// 高亮自己
		
		class TopText BaseText
		{
			size="100,27";
			ycenter = true; xcenter = true;
			void SetData(data)
			{
				src = data;
			}
		};

		//名次
		staticvar m_Text_FamilyTopStar = new BaseText
		{	
			pos = "30,7";
		}
		staticvar m_Img_FamilyTopStarNum = new img
		{
			pos = "7,1";
			show = false;
			void SetSrc(data)
			{
				switch(data)
				{
					case 1:src = "$./imgs"+window.g_Sex+"/jp.tga";show = true;break;
					case 2:src = "$./imgs"+window.g_Sex+"/yp.tga";show = true;break;
					case 3:src = "$./imgs"+window.g_Sex+"/tp.tga";show = true;break;
					default:src = "";show = false;break;
				}
			}
		}
		//家族徽章
		staticvar m_Img_FamilyBadge = new item
		{
			pos = "70,1";
			size= "23,23";
			var s_Badge_Out = new img
			{
				size = "100%,100%";
			}
			var s_Badge_In = new img
			{
				size = "100%,100%";
			}
			//[功能]显示徽章图
			//[参数]data1：外框标志，data2：徽章等级，data3：图片索引，data4：内框标志，data5：徽章等级，data6：图片索引
			//[返回值]无
			void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
			{
				s_Badge_Out.src = "$./../Family/imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
				s_Badge_In.src = "$./../Family/imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
			}
		}
		//家族名称
		staticvar m_Text_FamilyName = new BaseText
		{	
			pos = "107,7";
		}
		//族长
		staticvar m_Text_HeaderName = new BaseText
		{	
			pos = "217,7";
		}
		//等级
		staticvar m_Text_FamilyLev = new BaseText
		{
			pos = "333,7";
		}
		//积分
		staticvar m_Text_FamilyScore = new BaseText
		{	
			pos = "395,7";
		}
		//人数
		staticvar m_Text_FamilyPeopleNum = new BaseText
		{
			pos = "477,7";
		}
		//排名升降
		staticvar s_RankChangeState = new img
		{
			pos(525,0);valign(50,0);

			////updown:升降 1降 2未 3升
			void SetUpOrDown(_updown)
			{
				_updown = toint(_updown);
				if (_updown == -1)
				{
					src = "";
					return;
				}
				src = "$./imgs"+window.g_Sex+"/updown_"+_updown+".tga";
				return;
				
			}
		}
		//升降数值
		staticvar s_RankChangeValue = new TopText
		{
			size="70,27";
			left = parent.s_RankChangeState.left + parent.s_RankChangeState.width;
			valign(50,0);
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
class VTopStar_FamilyDBList_All_UI VN2ListCtrl
{
	//需要显示时改变
	size="560,632"; pos="45,115"; valign(0,0);halign(0,0);
	alpha = -1;bgcolor = -1;
//	scroll = window.SCROLL_NOTENNIS;

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