//频道选择界面，LIST层
//@刘高辰
//08年8月25日

//一行显示类：名称+状态
class VColumn_SevName_State_UI item
{
	size="584,30"; bgcolor=-1;cursor = window.CURSOR_HAND;

	//===========================与显示交互======================================
	void Init()
	{
		new VListBG_UI{size="100%,28";}
		staticvar s_SelectBK = new VPic3_ChannelListBK_UI{pos="0,1";size = "100%,32";show = false;}//选中背景
		staticvar s_Over = new VListSelect_UI{pos="0,5"; SetWidth(594); show=false;}//鼠标滑过效果
		
		//服务器类型
		//参数 data1: 1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯 7大奖赛
		staticvar s_Type = new BaseText
		{
			pos="16,8";xcenter = true;ycenter = true;bold = true;
			void SetData(data1)
			{
				src = window.GetChannelType(data1);
			}
		}

		//服务器名
		//参数 data1: 服务器名
		staticvar s_Name = new BaseText		
		{
			pos="80,8";xcenter = true;ycenter = true;bold = true;
			void SetData(data1){src = data1;}
		}

		//等级限制
		//参数 data1:
		staticvar s_LimitLv = new BaseText
		{
			pos = "190,8";xcenter = true;ycenter = true;bold = true;
			void SetData(data1)
			{
				src = ""+data1+"级";
			}
		}
		
		//状态
		//参数 data2：在线人数
		//参数 data3: 限制人数
		staticvar s_State = new VExpLine2_UI
		{
			pos="237,6";
		}
	}
	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){s_Over.show=true;}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){s_Over.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		_SelectState = true;
		s_SelectBK.show=true;s_Over.show=false;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		_SelectState = false;
		s_SelectBK.show=false;
	}
}

//总的类：List
//
class VChannelChoose_ServerList_UI VN2ListCtrl
{
	size="614,348";	pos = "17,53";//需要显示时改变
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
}