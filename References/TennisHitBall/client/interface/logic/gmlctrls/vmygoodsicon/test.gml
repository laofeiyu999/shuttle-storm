
import("$./../../Init.gml");
import("$./../../../Const.gml");

bkcolor="#123456";
window.g_Sex=1;
wndsize = "1024,768";

//单个图标-技能
new VGoodsIconNew_Logic
{
	bgcolor = "#FF00";
	SetMySizeEx(100,100);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(40009,3,167);
	
	//[外部接口]设置背景隐藏
	//参数 true false
	SetBGHide(false);

	void OnMouseDownL()
	{
		SetIconEx(40009,3,167);
		//alert("1w:"+s_Icon.width+",h:"+s_Icon.height);
	}

	void OnMouseDownR()
	{
		SetIconEx(60101,3,167);
		//alert("2w:"+s_Icon.width+",h:"+s_Icon.height);
	}
}


//单个图标-技能
new VGoodsIconNew_Logic
{
	pos = "110,0";//bgcolor = "#FF";
	SetMySizeEx(85,85);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(40009,3,127);

	void OnClick()
	{
		//alert("w:"+s_Icon.width+",h:"+s_Icon.height);
	}
}

//单个图标-技能
new VGoodsIconNew_Logic
{
	pos = "200,0";//bgcolor = "#FF";
	SetMySizeEx(45,45);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(40009,3,14);

	void OnClick()
	{
		//alert("w:"+s_Icon.width+",h:"+s_Icon.height);
	}
}


//单个图标-物品
new VGoodsIconNew_Logic
{
	pos = "0,120";
	//bgcolor = "#FF00";
	//SetMySizeEx(100,100);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(1100042,0,167);

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	SetMouseOverOpen(true);
}

//单个图标-物品
new VGoodsIconNew_Logic
{
	pos = "110,120";//bgcolor = "#FF";
	SetMySizeEx(85,85);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(1100042,-1,354325432);

	//[外部接口]打开鼠标滑过效果
	//参数：true false
//	SetMouseOverOpen(true);

	//[外部接口]设置选中效果
	//参数：true false
	SetSelect(true);

}

//单个图标-技能
new VGoodsIconNew_Logic
{
	pos = "200,120";//bgcolor = "#FF";
	SetMySizeEx(45,45);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	SetIconEx(1100042,-1,124);

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	SetMouseOverOpen(true);
}

///////////////////////
//完整图标-物品
new VIconMgr_Logic
{
	pos = "0,240";
	//bgcolor = "#FF00";
	//SetMySizeEx(100,100);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
//	SetIconEx(1100042,0,0);
	SetIconEx("1100042","0","0");

	//[外部接口]设置图标的使用状态
	//参数：true false
	SetUseState(true);
	

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	SetMouseOverOpen(true);
}	



//完整图标-物品
new VIconMgr_Logic
{
	pos = "140,240";
	//bgcolor = "#FF00";
//	SetMySizeEx(100,100);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
//	SetIconEx(1100042,0,0);
	SetIconEx("1100042","0","0");

	//[外部接口]设置图标的使用状态
	//参数：true false
	SetUseState(true);
	
	
	//[外部接口]设置选中效果
	//参数：true false
	SetSelect(true);
	
}



//完整图标-物品
new VIconMgr_Logic
{
	pos = "280,240";
	//bgcolor = "#FF00";
	SetMySizeEx(100,100);

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
//	SetIconEx(1100042,0,0);
	//SetIconEx("1100042","0","0");
	SetIconEx("710001","0","0");

	//[外部接口]设置图标的使用状态
	//参数：true false
	SetUseState(true);
	
	
	//[外部接口]设置选中效果
	//参数：true false
//	SetSelect(true);

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	SetMouseOverOpen(true);


	//[外部接口]隐藏物品名称
	//参数：true false
	SetNameHide(false);
}

new VGoodsIcon_GreyBG_UI
{
	pos = "0,400";
}