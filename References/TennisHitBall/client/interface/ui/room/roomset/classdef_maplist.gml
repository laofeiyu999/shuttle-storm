//房间设置中，地图List类定义，显示
//@刘高辰
//08年8月15日
class VMapBK_UI item
{
	size="115,102";
	var _bk = new img
	{
		void ChangeSrc(data)
		{
			src="$./../imgs"+window.g_Sex+"/dtk0"+data+".tga";
		}
	};
	void SetData(data)
	{
		_bk.ChangeSrc(data);
	}
};
//一行显示类：图标+名称
class VColumn_MapIcon_Name_UI item
{
	size = "149,109";bgcolor = -1;alpha = -1;cursor = window.CURSOR_HAND;

	void Init()
	{
		staticvar s_bk = new VMapBK_UI{SetData(2);}
		//地图小图标
		//参数 data1: 图标文件名称
		staticvar s_Icon = new img
		{
			pos = "7,7";
			void SetData(data1,data2)
			{
				src = "$./../../PublicImage/MapIcon/RoomSet/"+data1+".tga";
			}
		}
		//地图名称
		//参数 data1：地图名
		staticvar s_Name = new BaseText
		{
			pos = "0,79";size = "111,18";xcenter = true;ycenter = true;
			void SetData(data1,data2)
			{
				src = data1;
			}
		}
	}
	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){s_bk.SetData(2);}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){s_bk.SetData(1);}
	}
	//选择的效果
	void OnMySelect()
	{
		_SelectState = true;
		s_bk.SetData(3);
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		_SelectState = false;
		s_bk.SetData(1);
	}
}
//排版器，可自定义
class VRoomSet_MapList_TypeSet_UI VN2LCTypesetter
{
	autochgrow="260";
};

//总的类：List
class VRoomSet_MapList_UI VN2ListCtrl
{
	pos = "46,283";size = "265,102";valign(0,0);halign(0,0);//需要显示时改变
	
	typesetter ="VRoomSet_MapList_TypeSet_UI";
};