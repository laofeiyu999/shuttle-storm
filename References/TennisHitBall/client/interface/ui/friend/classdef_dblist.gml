//好友黑名单-List显示类定义
//

// 简化设置代码的文本
class VFriend_Txt BaseText
{
	xcenter = true;ycenter = true;
	height = parent.height;
	
	void SetParam(x, w)
	{
		left = x;
		width = w;
	}
	
	var COLOR_GREY = "#999999";
	void SetData(caption,state)
	{
		src = caption;
		if (state == 0)
			color = COLOR_GREY;
		else
			color = COLOR_DEFAULT;
	}	
}


class VColumn_Friend_List_UI item
{
	size = "100%,28";bgcolor = -1;

	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果

		var layout = 0;
		staticvar s_Vip = new img
		{
			size = "23,22";
			show = false;
			//alert(layout);
			pos(layout+7,0);
			valign(50,0);
			src = "$./../PublicImage/new/imgs1/vip.tga";
		}
		layout = layout + s_Vip.width;
		//昵称
		//参数 data1: 昵称		
		staticvar s_NKname = new VFriend_Txt
		{
			SetParam(layout, 101);
			void SetData(param1,vip,state)
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
				if (state == 0)
					color = COLOR_GREY;
				else
					color = COLOR_DEFAULT;
			}
		}
		layout += s_NKname.width;
		
		//等级
		//参数 data1：等级
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		layout += 20;
		staticvar s_Level = new VFriend_Txt
		{
			SetParam(layout, 58);
			void SetData(caption,state)
			{
				if (caption.__Long__ == 0)
				{
					src = "--";
				}
				else
				{
					src = caption;
				}

				if (state == 0)
					color = COLOR_GREY;
				else
					color = COLOR_DEFAULT;
			}	
		}
		layout += s_Level.width;
		
		//性别
		//参数 data1：性别  0未知 1男 2女
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		layout += 40;
		staticvar s_Sex = new VSex_UI
		{
			left = layout+18;
		}
		layout += s_Sex.width;
		
		//技术类型
		//参数 data1：
		layout += 60;
		staticvar s_TechnicType = new VFriend_Txt
		{
			SetParam(layout, 103);

			void SetData(type,state)
			{
				src = window.GetTechnicByType(type);

				if (state == 0)
					color = COLOR_GREY;
				else
					color = COLOR_DEFAULT;
			}
		}
		layout += s_TechnicType.width;

		//位置
		//参数 data1：位置
		layout += 10;
		staticvar s_Pos = new VFriend_Txt
		{
			SetParam(layout, 62);
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
class VFriend_List_UI VN2ListCtrl
{
	valign(0,0);halign(0,0);pos = "52,105";size = "0%,0%";size = "544,280";bgcolor = -1;
};