//随机游戏的List:显示
//yxf 2009年11月25日

//一行显示类：
class VColumn_RandGame_UI item
{
	size(100,87);bgcolor = -1;
	//===========================与显示交互======================
	void Init()
	{
		//按钮
		staticvar s_Btn_Rand = new VBaseButton
		{
			var _isFirst = true;
			SetSize(98,87);
			//参数1:ID
			void SetData(id)
			{
				id = id.__Long__;
				if (id <= 0)
				{
					return;
				}
				if (!_isFirst)
				{
					return;
				}
				_isFirst = false;
				if (id == window.RANDOM_SINGLE)
				{
					Init("new/Hall/One");SetHangID(12);
				}
				if (id == window.RANDOM_DOUBLE)
				{
					Init("new/Hall/Two");SetHangID(13);
				}
			}
		}
		//玩家的活动状态
		//参数：data 1初始状态 2等待排队中 3暂停中 4已取消排队
		staticvar s_RaceState = new img
		{
			//halign(100,-5);valign(50,0);
			src="$./imgs"+window.g_Sex+"/ybm-text.tga";
			show=false;

			void SetData(data1)
			{
				show=false;
				if (data1 == window.g_QUEUE_QUEUEWAIT || data1 == window.g_QUEUE_PAUSE)
				{
					show=true;
				}
			}
		}
	}
};

//排版器，可自定义
class VGameHall_RandGame_TypeSet_UI VN2LCTypesetter
{
	autochgrow="200";
};

//
//总的类：List
//
class VGameHall_RandGame_UI VN2ListCtrl
{
	//需要显示时改变
	size="200,87";pos="52,"+(parent.height-108);alpha = 0;bgcolor = -1;
	typesetter ="VGameHall_RandGame_TypeSet_UI";
};