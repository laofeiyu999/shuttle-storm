//物品续费的物品list

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_PropContinue_Column_UI item
{
	size = "600,98";//border="-1";
	//===========================与显示交互======================
	void Init()
	{
		//图标
		//参数 data1: 物品的识别ID
		//参数 sex: 是否为同性物品 1是 2不是
		staticvar s_GID = new VGoodsIconNew_Logic
		{
			
		}

		staticvar _mc = new img
		{
			src = "$./imgs"+window.g_Sex+"/mc-text.tga";
			pos = "127,8";
		}
		
		new VPic9_EditBK_UI
		{
			pos = "170,6";size="140,20"
		}
//		staticvar _McEditSelectedFlag = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/xzsj.tga";
//			size = "7,7";
//			pos = "171,7";
//			show = false;
//		}
		staticvar _jg = new img
		{
			src = "$./imgs"+window.g_Sex+"/jg-text.tga";
			pos = "127,38";
		}
		//道具名称
		//参数 data1
		staticvar s_ItemName = new BaseText
		{
			pos = "177,9";//border="-1";
		}

		new VPic9_EditBK_UI
		{
			pos = "170,36";size="140,20"
		}
//		staticvar _QxEditSelectedFlag = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/xzsj.tga";
//			size = "7,7";
//			pos = "171,37";
//			show = false;
//		}
		staticvar _qx = new img
		{
			src = "$./imgs"+window.g_Sex+"/qx-text.tga";
			pos = "127,68";
		}
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,Pk点
		staticvar s_ItemGold = new BaseText
		{
			pos = "177,39";//border="-1";
			void SetData(data1,data2,data3)
			{
				if ( data2 == 1 )
				{
					src = "金币:" + data1;
				}
				if ( data2 == 2 )
				{
					src = "点券:" + data1;
				}
				if(data2 == 3)
				{
					src = "奖券:" + data1;
				}
				if (data3 == 1)
				{
					var _agio = tostring(tofloat(window.g_ItemAgio)/10);
					var _pos1 = _agio.Find(".");
					var _pos2 = _agio.Find("0");
					if(toint(_pos2-_pos1) == 1)
					{
						_agio = _agio.Mid(0,1);
					}
					else
					{
						_agio = _agio.Mid(0,3);
					}
					src += "(打"+_agio+"折)";
				}
				var _realValue = toint(toint(data1)*window.g_ItemAgio/100);
				SetGold(data2,_realValue);
			}
		}

		//期限
		staticvar s_CB_Time = new VMyDropMenu_UI{}

		//选择
		staticvar s_CH_Sel = new VCK_CK_New
		{
			pos = "320,68";
			void MouseCheck_UI()
			{
				parent._mc.src = "$./imgs"+window.g_Sex+"/mc1-text.tga";
				parent._jg.src = "$./imgs"+window.g_Sex+"/jg1-text.tga";
				parent._qx.src = "$./imgs"+window.g_Sex+"/qx1-text.tga";
//				parent._McEditSelectedFlag.show = true;
//				parent._QxEditSelectedFlag.show = true;
				parent.s_GID.SetSelect(true);
			}
			void MouseUnCheck_UI()
			{
				parent._mc.src = "$./imgs"+window.g_Sex+"/mc-text.tga";
				parent._jg.src = "$./imgs"+window.g_Sex+"/jg-text.tga";
				parent._qx.src = "$./imgs"+window.g_Sex+"/qx-text.tga";
//				parent._McEditSelectedFlag.show = false;
//				parent._QxEditSelectedFlag.show = false;
				parent.s_GID.SetSelect(false);
			}
		}
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
};

//排版器，可自定义
class VItem_PropContinue_TypeSet_UI VN2LCTypesetter
{
	autochgrow="381";
};

//
//总的类：List
//
class VItem_PropContinue_UI_List VN2ListCtrl
{
	//需要显示时改变
	size="395,337";valign(0,0);halign(0,0);
	alpha = 0;bgcolor = "-1";pos = "20,40";
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
};