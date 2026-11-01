//
//商城-购物-服饰的物品list
//同性物品可以购买+赠送+索要
//异性物品只能赠送给跟物品同性的人

import("$./../../UI/Mall/ClassDef_Shopping_Dress_DBList.gml");

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_Mall_DressList_UI item
{
	size = "119,147";bgcolor = "-1";//border = "#123456";
	//===========================与显示交互======================
	void Init()
	{
		//物品识别ID
		//参数 ID: 物品的ID
		staticvar s_GID = new VIconMgr_Logic
		{
			SetHangType(window.ICON_MALL);
			SetMouseOverOpen(true);
			cursor = window.CURSOR_HAND;
		}

		new VPic3_MoneyBK_UI
		{
			pos = "9,124";size="103,16"
		}
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,奖券

		staticvar s_ItemGold = new BaseText
		{
			pos = "12,127";
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
				if (data2 == 3)
				{
					src = "奖券:"+data1;
				}
			}
		}
	
		//放入购物车:按钮
		staticvar s_Btn_ToBuyCar = new VBTN_Mall_ShoppingBag_New
		{
			pos = "90,123";SetHangID(22);
		}

		// 热销图标
		staticvar s_Img_SaleBG = new img
		{
			size = "35,25"; halign(0,-10);valign(85,0);
			src = "";
			show = false;
			void SetSrc(_TState)
			{
				// 背景
				if (toint(_TState) == 1 || toint(_TState) == 2)
					src = "$./../../UI/PublicImage/Item/SaleAttri2.tga";
				else
					src = "$./../../UI/PublicImage/Item/SaleAttri"+_TState+".tga";
			}
		}
		// 热销标识字
		staticvar s_Img_SaleFont = new img
		{
			size = "19,30"; halign(10, 0);valign(80,0);
			src = "";
			show = false;
			void SetSrc(_TState)
			{
				// 提示字
				if (toint(_TState) == 1 || toint(_TState) == 2)
					src = "$./../../UI/PublicImage/Item/SaleWord2.tga";
				else
					src = "$./../../UI/PublicImage/Item/SaleWord"+_TState+".tga";
				if (toint(_TState) > 5)
					return;
				clipani(19,30,1,10);anispeed = 10; 
			}
		}
	}
	//需要被显示的类覆盖
	void OnMySelect()
	{
		s_GID.SetSelect(true);
		s_GID.SetMouseOverOpen(false);
	}		
	void OnMyUnSelect()
	{
		s_GID.SetSelect(false);
		s_GID.SetMouseOverOpen(true);
	}	
};

//排版器，可自定义
class VMall_Dress_TypeSet_UI VN2LCTypesetter
{
	autochgrow="595";
};

//
//总的类：List
//
class VMall_DressList_UI VN2ListCtrl
{
	//需要显示时改变
	size="595,293";valign(0,0);halign(0,0);pos="28,60";
	alpha = -1;bgcolor = "-1";//border = "#FF0000";

	typesetter ="VMall_Dress_TypeSet_UI";
};