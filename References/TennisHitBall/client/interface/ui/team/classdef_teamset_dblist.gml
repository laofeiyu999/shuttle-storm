//组队设置-List显示类定义
//

// 简化设置代码的文本
class VTeamSet_Txt BaseText
{
	xcenter = true;
	ycenter = true;
	height = parent.height;
	
	void SetParam(x, w)
	{
		left = x;
		width = w;
	}
	
	void SetData(caption)
	{
		src = caption;
	}
}

//一行显示类：昵称+等级+关系+技术方向
class VColumn_TeamSet_UI item
{
	size = "301,28";//bgcolor = "#FF00";
	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果

		var layout = 0;
		//昵称
		//参数 data1: 昵称
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_NKname = new VTeamSet_Txt
		{
			SetParam(layout, 73);
		}
		layout += s_NKname.width-3;
		
		//等级
		//参数 data1：等级
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_Level = new VTeamSet_Txt
		{
			SetParam(layout, 63);
		}
		layout += s_Level.width;
		
		//关系
		//参数 data1：1.好友 2.家族 3.夫妻...
		staticvar s_Relation = new VTeamSet_Txt
		{
			SetParam(layout, 74);
			void SetData(caption)
			{
				switch (caption)
				{
				case 1:src = "好友";break;
				case 2:src = "家族";break;
				case 3:src = "夫妻";break;
				}
			}
		}
		layout += s_Relation.width;

		//技术方向
		//参数 data1：
		staticvar s_TechnicType = new VTeamSet_Txt
		{
			SetParam(layout, 80);

			void SetData(type)
			{
				src = window.GetTechnicByType(type);
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
class VTeamSet_List_UI VN2ListCtrl
{
	valign(0,0);halign(0,0);size="306,167";pos="23,223";bgcolor=-1;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
};