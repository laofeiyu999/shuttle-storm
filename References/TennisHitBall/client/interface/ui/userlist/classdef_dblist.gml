//玩家列表-List类定义

// 简化设置代码的文本
class VUserList_Txt VipText
{
	xcenter = true;
	ycenter = true;
	height = parent.height;
	
	void SetParam(x, w)
	{
		left = x;
		width = w;
	}
}


//一行显示类：昵称+等级+性别+位置
class VColumn_UserList_UI item
{
	size = "100%,28";bgcolor = -1;cursor = window.CURSOR_HAND;
	//===========================与显示交互======================
	void Init()
	{
		
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		var layout = 0;
		
		staticvar s_Vip = new img
		{
			show = false;
			//alert(layout);
			pos(layout+7,0);
			valign(50,0);
			src = "$./../PublicImage/new/imgs"+window.g_Sex+"/vip.tga";
		}
		//昵称
		//参数 data1: 昵称
		//layout += s_Vip.width;
		staticvar s_NKname = new VUserList_Txt
		{
			//alert(layout);
			SetParam(layout+8, 129);
			void SetData(param1,vip)
			{
				src = param1;
				color = "#0";
				if (vip == window.G_VIPVALUE)
				{
					//parent.s_Vip.show = true;
					//color = window.G_VIPCOLOR;
				}
				else
				{
					//parent.s_Vip.show = false;
				}
			}

		}

		//等级
		//参数 data1：等级
		layout += s_NKname.width+18;
		staticvar s_Level = new VUserList_Txt
		{
			SetParam(layout, 55);
		}
		layout += s_Level.width;

		//性别
		//参数 data1：性别  0未知 1男 2女
		layout += 40;
		staticvar s_Sex = new VSex_UI
		{
			left = layout+15;
		}
		layout += s_Sex.width;
		
		//技术类型
		//参数 data1：
		layout += 56;
		staticvar s_TechnicType = new VUserList_Txt
		{
			SetParam(layout, 108);
		}
		layout += s_TechnicType.width;

		//位置
		//参数 caption: 游戏状态 0断线 1空闲中 2房间内 3游戏中
		//参数 _AState: 0.默认 1.报名了,等待消息回馈 2.已经报名了一个活动 3.进入竞技活动 4.活动结算
		layout += 7;
		staticvar s_Pos = new VUserList_Txt
		{
			SetParam(layout, 68);
			
			void SetData(caption,_AState)
			{
				caption = caption.__Long__;
				_AState = _AState.__Long__;
				
				if (_AState > 0)
				{
					src = "活动中";
					return;
				}
				switch (caption)
				{
					case 0:src = "- -";break;
					case 1:src = "游戏大厅";break;
					case 2:src = "房间内";break;
					case 3:src = "游戏中";break;
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
		if (parent.m_SelectOnly == 1)
		{
			parent.scriptprcallsub("OnUnSelect");
		}
		parent.m_SelectOnly = 1;
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		parent.m_SelectOnly = 0;
		s_SelectBK.show=false;_SelectState = false;
	}
};

//
//总的类：List
//
class VUserList_List_UI VN2ListCtrl
{
	var m_SelectOnly = 0;	//选中唯一 0没有 1有

	valign(0,0);halign(0,0);pos = "52,105";size = "0%,0%";size = "544,280";bgcolor = -1;
	bgcolor = -1;
};