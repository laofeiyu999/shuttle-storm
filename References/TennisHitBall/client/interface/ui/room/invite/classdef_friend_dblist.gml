//邀请-全部-List显示类定义
//@刘高辰
//2008年10月28日
importex("$./ClassDef_All_DBList.gml");
class VColumn_InviteFriend_List_UI VColumn_InviteAll_List_UI
{
};
	/*size = "354,37";bgcolor = -1;cursor = window.CURSOR_HAND;

	//===========================与显示交互======================
	void Init()
	{
		staticvar _IMG = new img
		{
			show = false;
			valign(50,0);
			src = "$./../../Social/imgs"+window.g_Sex+"/selete.tga";
		}
		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new text
		{
			size = "105,37";
			color = "#FFFFFF";
			ycenter = true;
			xcenter = true;
			void SetData(data1)
			{
				src = data1;
			}
		}

		//等级
		//参数 data1：等级
		staticvar s_Level = new text
		{
			pos = "105,0";
			size = "50,37";
			color = "#FFFFFF";
			ycenter = true;
			xcenter = true;
			void SetData(data1)
			{
				src = data1;
			}
		}

		//性别
		//参数 data1：性别  0未知 1男 2女
		staticvar s_Sex = new img
		{
			halign(52,0);
			valign(50,0);
			void SetData(data1)
			{
				if(data1 == 1)
				{
					src = "$./../../SelfInfo/imgs"+window.g_Sex+"/boy.tga";
				}
				if(data1 == 2)
				{
					src = "$./../../SelfInfo/imgs"+window.g_Sex+"/girl.tga";
				}
			}
		}
		
		//称号
		//参数 data1：玩家的UID
		staticvar s_Title = new text
		{
			pos = "210,0";
			size = "150,37";
			color = "#FFFFFF";
			xcenter = true;
			ycenter = true;
			void SetData(data1)
			{
				if(tostring(data1)=="" || toint(data1) < 1)
				{
					src = "--";
				}
				else
				{
					src = window.GetQualifyByQID(data1);
				}
			}
		}

		//技术类型
		//参数 data1：
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";

			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}

	}
	void OnMySelect(){_IMG.show = true;s_NKname.color = "#000000";s_Level.color = "#000000";s_Title.color = "#000000";}//选择的效果
	void OnMyUnSelect(){_IMG.show = false;s_NKname.color = "#FFFFFF";s_Level.color = "#FFFFFF";s_Title.color = "#FFFFFF";}//不选择的效果
};*/

//
//总的类：List
//
class VInvite_Friend_List_UI VInvite_All_List_UI{}
/*
	//需要显示时改变
	size="354,365";valign(49,5);halign(49,0);
	//
	alpha = 0;bgcolor = -1;
};*/