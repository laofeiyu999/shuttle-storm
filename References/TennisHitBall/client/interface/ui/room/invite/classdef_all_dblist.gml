//邀请-全部-List显示类定义
//

class Invite_text BaseText
{
	size="100,20";
	ycenter = true; xcenter = true;
	void SetData(param1)
	{
		src = param1;
		color = "#0";
	}
};

class VColumn_InviteAll_List_UI item
{
	size="545,28"; cursor = window.CURSOR_HAND;
	//size = "354,37";bgcolor = -1;cursor = window.CURSOR_HAND;

	//===========================与显示交互======================
	void Init()
	{
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_SelectBK = new VPic3_ListBK1_UI{size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		//
		var _layout = 0;
		staticvar s_Vip = new img
		{
			show = false;
			//alert(layout);
			pos(_layout+3,0);
			valign(50,0);
			src = "$./../../PublicImage/new/imgs1/vip.tga";
		}

		_layout = _layout + s_Vip.width;
		staticvar s_NKname = new Invite_text						// 参数 data1: 昵称
		{
			pos(_layout,3); size="100,20";//bgcolor = "#ff";

			void SetData(param1,vip)
			{
				src = param1;
				color = "#0";
				parent.s_Vip.show = false;
				if (toint(vip) == window.G_VIPVALUE)
				{
					//parent.s_Vip.show = true;
					//color = window.G_VIPCOLOR;
				}
			}
		}

		_layout = _layout + s_NKname.width;
		staticvar s_Level = new Invite_text							// 参数 data1: 等级
		{
			pos(_layout,3); size="80,20";
		}

		_layout = _layout + s_Level.width;
		staticvar s_Sex = new VSex_UI								// 参数 data1：性别  0未知 1男 2女
		{
			pos="240,0";
		}

		_layout = _layout + s_Sex.width;
		staticvar s_TechnicType = new Invite_text							// 参数 data1: 技术类型
		{
			pos="302,3"; size="120,20";
			
			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}

		_layout = _layout + s_TechnicType.width;
		staticvar s_Title = new Invite_text					// 称号ID
		{
			pos="435,3";size="90,20";
				
			void SetData(data1)
			{
				src = "--";
				if(tostring(data1)!="" && toint(data1) > 0)
				{
					src = window.GetQualifyByQID(data1);
					printf("title:data:"+data1+",src:"+src);
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
class VInvite_All_List_UI VN2ListCtrl
{
	var m_SelectOnly = 0;	//选中唯一 0没有 1有

	valign(0,0);halign(0,0);pos = "52,105";size = "0%,0%";size = "545,280";bgcolor = -1;
};