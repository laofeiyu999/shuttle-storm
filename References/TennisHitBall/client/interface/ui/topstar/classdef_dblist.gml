//明星榜列表大奖赛DB List显示类定义

//一行显示类：排名+昵称+等级+得分
class VColumn_TopStar_UI item
{
	size="561,28"; cursor = window.CURSOR_HAND; //bgcolor = -1;

	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		staticvar _MySelf = new VPic9_ChooseMySelf{size = "100%,32";show = false;}		// 高亮自己

		class TopText BaseText
		{
			size="100,27";ycenter = true; xcenter = true;
			void SetData(data){src = data;}
		};
		//奖牌
		staticvar s_Medal = new img
		{
			pos = "5,0";
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
			pos="0,0"; size="90,27"; 
			void SetData(data)
			{
				src = data;
				parent.s_Medal.SetData(data);
			}
		}		

		//排名升降
		staticvar s_RankChangeState = new img
		{
			pos(500,0);valign(50,0);

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

		//昵称
		//参数 data1:
		staticvar s_Nickname = new TopText
		{
			pos="90,0"; size="110,27"; 
		}	
		
		//等级
		//参数 data1:
		staticvar s_Level = new TopText
		{
			pos="210,0"; size="80,27"; 
		}
		
		//技术类型
		//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
		staticvar s_TechnicType = new TopText
		{
			pos="297,0"; size="130,27"; 
			void SetData(type)
			{
				src = window.GetTechnicByType(toint(type));
			}
		}	

		//得分
		//参数 data1:
		staticvar s_Point = new TopText
		{
			pos="410,0"; size="90,27";//  bkcolor="#FF";	
			void SetData(data1)
			{
				if(parent.parent.parent.m_Index==7||parent.parent.parent.m_Index==10)
				{
					src = ""+data1+"%";
				}
				else
				{
					src = data1;
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
class VTopStar_List_UI VN2ListCtrl
{
	//需要显示时改变
	size="560,282"; pos="45,128"; valign(0,0);halign(0,0);
	
//	alpha = 50;bgcolor = "#FF";
	alpha = -1;bgcolor = -1;
}