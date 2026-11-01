//明星榜列表-黄金联赛 DB List显示类定义



//一行显示类：排名+昵称+等级+得分
class VColumn_GoldenLMatchDBlist_UI item
{
	size="599,28"; cursor = window.CURSOR_HAND; //bgcolor = -1;

	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		staticvar _MySelf = new VPic9_ChooseMySelf{size = "100%,32";show = false;}		// 排行榜中的自己		
		
		class TopText BaseText
		{
			size="100,27";
			ycenter = true; xcenter = true;
			void SetData(data)
			{
				src = data;
			}
		};
		//奖牌
		staticvar s_Medal = new img
		{
			pos = "1,0";
			void SetData(index)
			{
//				alert("index:"+index);
				show = false;
				switch (index)
				{
				case 1:src = "$./imgs"+window.g_Sex+"/jp.tga";show = true;break;
				case 2:src = "$./imgs"+window.g_Sex+"/yp.tga";show = true;break;
				case 3:src = "$./imgs"+window.g_Sex+"/tp.tga";show = true;break;
				default:src = "";show = false;break;
				}
			}
		}
		//排名
		//参数 data1:
		staticvar s_Rank = new TopText
		{   
			pos="3,0"; size="45,27";
			void SetData(data)
			{
				src = data;
				parent.s_Medal.SetData(data);
			}
		}

		//昵称
		//参数 data1:
		staticvar s_Nickname = new TopText
		{
			left=parent.s_Rank.left + parent.s_Rank.width+9;
			top =parent.s_Rank.top;
			//pos="50,0"; 
			size="80,27";
			void SetData(data)
			{
				src = data;
			}
		}

		//家族名称
		staticvar s_familyName= new TopText
		{	
			left=parent.s_Nickname.left + parent.s_Nickname.width+12;
			top =parent.s_Nickname.top;
			void SetData(data)
			{
				if(data != "")
				{	color ="#0"
					src = data;					
				}
				else
				{
					color = "#929292";
					src = "无家族";
				}
				//src = data;
			}
		}

		//等级
		//参数 data1:
		staticvar s_Level = new TopText
		{
			left=parent.s_familyName.left + parent.s_familyName.width+8;
			top =parent.s_familyName.top;
			size="30,27";
		}

		//技术类型
		//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
		staticvar s_TechnicType = new TopText
		{	
			left=parent.s_Level.left + parent.s_Level.width+30;
			top =parent.s_Level.top;
			size="54,27";
			void SetData(type)
			{
				src = window.GetTechnicByType(toint(type));
			}
		}

	
		//胜率
		staticvar m_Text_ConInVic = new BaseText
		{	//bgcolor = "#55555";
			left=parent.s_TechnicType.left + parent.s_TechnicType.width+50;
			top =parent.s_TechnicType.top+7;
			void SetData(data)
			{
				src = ""+toint(data)+"%";
			}
		}

		//胜利场次
		//参数 data1:
		staticvar m_Text_VicTimes = new TopText
		{
			left=parent.m_Text_ConInVic.left + parent.m_Text_ConInVic.width+41;
			top =parent.m_Text_ConInVic.top-7;
			size="90,27";
			void SetData(data1)
			{
				src = data1;
			}
		}

		//升降名次
		staticvar m_VicTimes= new TopText
		{
			//bgcolor = "#55555";
			left=parent.m_Text_VicTimes.left + parent.m_Text_VicTimes.width+10;
			top =parent.m_Text_VicTimes.top;
			size="30,27";
			void SetData(data)
			{	
				if (data<0)
				{
				var data1 = tostring(data);
				src = data1.Mid(1,data1.Count);
				}
				else
				{
					src = data;
				}
			}
		}

		staticvar m_TopUpDown = new img 
		{
			pos = "530,8";size="20,27";
			void SetData(data)
			{
				//show = false;
				if (data<0)
				{
					pos = "542,1";size="20,25";
					src = "$./imgs"+window.g_Sex+"/updown_1.tga";//show = true;
				}
				if (data==0)
				{
					pos = "542,9";size="20,7";
					src = "$./imgs"+window.g_Sex+"/updown_2.tga";//show = true;
				}
				if (data>0)
				{
					pos = "542,1";size="20,25";
					src = "$./imgs"+window.g_Sex+"/updown_3.tga";//show = true;
				}
			}
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
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;

//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		s_SelectBK.show=false;_SelectState = false;
	}
};

//
//总的类：List
//
class VTopStar_GoldenLMatch_List_UI VN2ListCtrl
{
	//需要显示时改变
	size="600,298"; pos="25,115"; valign(0,0);halign(0,0);

//	alpha = 50;bgcolor = "#FF";
	alpha = -1;bgcolor = -1;
}