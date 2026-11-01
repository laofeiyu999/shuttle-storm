//
//商城界面的类定义(包括:购物+技能镶嵌+充值)
//

class VMall_Control_UI item
{
	size = "50,500";alpha = 0;bkcolor="-1";halign(0,0);valign(0,0);pos="637,0"

	//=============================与界面交互========================================
	void Init()
	{
		//前往休闲区
		staticvar s_Btn_GoComfortShopping = new VBTN_Mall_GoComfortShopping
		{
			pos = "0,30";
			show = false;
		}
		//前往精品区
		staticvar s_Btn_GoNiceShopping = new VBTN_Mall_GoNiceShopping
		{
			pos = "0,30";
			show = false;
		}
		new img
		{
			src = "$./imgs"+window.g_Sex+"/chendi.tga";pos="0,150";size="55,287";
		}
		//男：Radio
		staticvar s_R_Man = new VRadio_Mall_boy_New
		{
			pos="5,170";
			SetHangID(16);
		}
		//女：Radio
		staticvar s_R_Woman = new VRadio_Mall_girl_New
		{
			pos="5,205";
			SetHangID(17);
		}

		//上一件:按钮
		staticvar s_Btn_Up = new VBTN_Mall_forward_New
		{
			pos="1,240";
			SetHangID(23);
		}
		//下一件:按钮
		staticvar s_Btn_Down = new VBTN_Mall_next_New
		{
			pos="1,279";
			SetHangID(24);
		}
		//形象还原:按钮
		staticvar s_Btn_AvaRestore = new VBTN_Mall_recover_New
		{
			pos="1,318";
			SetHangID(25);
		}
		//保存自己形象到购物车:按钮
		staticvar s_Btn_SendToBuyCar = new VBTN_Mall_del_New
		{
			pos="1,357";
			SetHangID(26);
		}
	}
};