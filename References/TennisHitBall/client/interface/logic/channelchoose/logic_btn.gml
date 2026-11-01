//
//频道选择：按钮层：包含上边(设置+返回)
//yxf 2009年10月13日
//

new item
{
	name = "CHANNEL_CHOOSE_BTNLAYER_LOGIC";
	size = "100%,100%";
	
	new VBtnLayer_Top_Common_Logic
	{
		//返给实例用
		void OnMyCreated()
		{
			SetPos(window.POS_CHANNELCHOOSE);
		}
	}
}

