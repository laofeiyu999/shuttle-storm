
import("$./ClassDef.gml");

new fmodel{}
size = "800,600";
wndsize = "800,600";
bgcolor = "#FFFFFF";

//→ ← ↓ ↑

//普通样式
new VMyPageCtrl
{
	countperpage="1";			//每页条数
	//targetname="VPresent_Friend_List_NAME";
	//window.find("G_DBMANAGE").GetRegDbTable(this,"bind_RresentFriendlist");		// 获得已绑定的数据表
//	void OnClickL(){alert("L");}
//	void OnClickR(){alert("R");}
}

//普通样式
new VMyPageCtrl
{
	pos = "100,150";
	countperpage="1";			//每页条数
	Init();
}

//
new VN2PageCtrl
{
	pos="100,200";
	size="20,100";
	defaultview="1";
	countperpage="1";
	vertical="true"; //竖的
}