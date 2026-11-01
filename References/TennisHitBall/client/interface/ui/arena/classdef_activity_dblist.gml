//活动列表 ；DB
//

//一行显示类：
class VColumn_ArenaActivity_UI item
{
	size=""+(parent.width-16)+",32";bgcolor=-1;alpha=-1;

	//===========================与显示交互======================
	void Init()
	{
		class ActivityListFont BaseText
		{
			ycenter = true;xcenter = true;
		};

		new VListBG2_UI{pos = "0,3";size="100%,28";};			//背景
		staticvar s_SelectBK = new VPic3_ChannelListBK_UI{pos = "0,3";size = "100%,32";show = false;}//选中背景
		staticvar _IMG = new VListSelect_UI{pos="0,7"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		//活动状态
		//参数：data 1热门 2新开 3其他
		staticvar s_ActivityState = new img
		{
			void SetData(data)
			{
				src = "";
				if (data == 1)
				{
					src="$./../PublicImage/imgs"+window.g_Sex+"/hot.tga";
					clipani(61,38,1,4);anispeed = 6;
				}
				if (data == 2)
				{
					src="$./../PublicImage/imgs"+window.g_Sex+"/new.tga";
					clipani(61,38,1,4);anispeed = 6;
				}
			}
		};
		//活动名
		//参数:data(活动名)
		staticvar s_Name = new ActivityListFont
		{
			pos(70,0);size="105,36";
		}
		//报名队伍人数
		staticvar s_TeamNum = new ActivityListFont
		{
			pos(185,0);size = "30,36";xcenter = true;
			void SetData(data)
			{
				if(toint(data)==1){src = "单人";}
				else if(toint(data)==2){src = "双人";}
				else{src = ""+data+"人";}
			}
		}
		//活动时间段
		//参数：data(如：11:00 - 11:12)
		staticvar s_Time = new ActivityListFont
		{
			pos(225,0);size="96,36";
			void SetData(data)
			{
				src = ""+data;
			}
		}
		//报名需要等级
		//参数1 最小等级
		//参数2 最高等级 -1代表 最低等级以上
		staticvar s_Lv = new ActivityListFont
		{
			pos(325,0);size = "45,36";
			void SetData(data1,data2)
			{
				if(toint(data2)==-1)
				{
					src = ""+data1+"级以上";
				}
				else
				{
					src = ""+data1+"-"+data2+"级";
				}
			}
		}
		//报名费用
		//param1:数值(100等) 免费时 值为0
		//param2:钱的类型文字(金币，点券，免费)
		staticvar s_Fare = new ActivityListFont
		{
			pos(370,0);size="100,36";xcenter = true;
			void SetData(data1,data2)
			{
				if(toint(data1)==0){src = data2;}
				else{src = ""+data1+data2;}
			}
		}
		//总人数
		//参数：data
		staticvar s_AllNum = new ActivityListFont
		{
			pos(430,0);size="108,36";xcenter = true;
			void SetData(data)
			{
				if (data == "")
				{
					data = 0;
				}
				src = ""+data+"人";
			}
		}
		//玩家的活动状态
		//参数：data 1初始状态 2等待排队中 3暂停中 4已取消排队
		staticvar s_RaceState = new img
		{
			halign(100,-5);valign(50,0);
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

	void SetData(_name,_time,_num)
	{
		s_Name.src=_name;
		s_Time.src=_time;
		s_AllNum.src=_num;
		return;
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
class VArena_ActivityDBList_UI VN2ListCtrl
{
	//需要显示时改变
	size="100%,326,-40,0";pos="22,102";
	bgcolor=-1;alpha=-1;
//	bgcolor="#123456";alpha=50;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
};