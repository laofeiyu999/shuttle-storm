//家族玩家列表
//夏洋洋 2010-3-8

//一行内容	排序+名字+等级+性别+技术类型+贡献度
class VFamilyPeopleList_Content_UI item
{
	size = "100%,28";//bgcolor = "#ff";
	cursor = window.CURSOR_HAND;
	void Init()
	{
		new VListBG2_UI{size="100%,27";}
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4";SetWidth(405); show=false;}	//鼠标滑过效果

		//排序
		staticvar m__FamilySort = new BaseText
		{	
			pos = "20,7";
		}
		//职务符号
		staticvar m_FamilyPotence = new img
		{
			size = "10,15";
			pos = "35,7";
			show = false;
			void SetData(data)
			{
				switch(data)
				{
					case 1:src = "$./imgs/zztb.tga";show=true;break;
					case 2:src = "$./imgs/glytb.tga";show=true;break;
					default:src = "";show = false;break;
				}
			}
		}
		//屏蔽发言
		staticvar m_CanChatState = new img
		{
			size = "15,15";
			pos = "55,7";
			src = "$./imgs/pbtb.tga";
			show = false;
			
			void SetCanChatState(_state)
			{
				if(_state == 1)
				{
					show = false;
				}
				else
				{
					show = true;
				}
			}
		}
		//名字
		staticvar m_Name = new BaseText
		{	
			pos = "60,7";size = "90,28";xcenter = true;//bgcolor = "#FF";
		}
		//等级
		staticvar m_Lev = new BaseText
		{
			pos = "160,7";
		}
		//性别
		staticvar m_Sex = new img
		{
			pos = "207,3";
			size = "23,23";

			//[功能]设置性别
			//[参数]data：男女性别参数
			//[返回值]无
			void SetData(data)
			{
				if(data == "")
				{
					src = "";
					return;
				}
				if(data == window.USER_SEX_MAN)
				{
					src = "$./../SelfInfo/imgs"+window.g_Sex+"/boy.tga";
					return;
				}
				if(data == window.USER_SEX_WOMAN)
				{
					src = "$./../SelfInfo/imgs"+window.g_Sex+"/girl.tga";
					return;
				}
			}
		}
		//技术类型
		staticvar m_SkillType = new BaseText
		{
			pos = "250,7";size = "70,15";xcenter = true;
		}
		//贡献度
		staticvar m_Point = new BaseText
		{
			pos = "315,7";size = "80,15";xcenter = true;
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

	void isOnline(data)
	{
		if(data)
		{
			m_Name.color = "#000000";
			m_Lev.color = "#000000";
			m_SkillType.color = "#000000";
			m_Point.color = "#000000";
		}
		else
		{
			m_Name.color = "#85858A";
			m_Lev.color = "#85858A";
			m_SkillType.color = "#85858A";
			m_Point.color = "#85858A";
		}
	}
}

//总的类
class VFamilyPeopleList_Content_All_UI VN2ListCtrl
{
	//需要显示时改变
	valign(0,0);halign(0,0);size="300,250"; pos="45,105"; 
	alpha = -1;bgcolor = -1;

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