//社交-搭档-List类定义【逻辑】
//

class VColumn_RelationUnSee_List_Logic item
{
	void OnDataExchange(iRow,szData)
	{
		parent.parent.GetLoverData();//社会界面的情侣刷新数据
		parent.parent.BindTable();//右侧基本信息刷新
		parent.parent.ReadDataFromDB();//右侧社交信息刷新
		parent.parent.GetBaseInfoLovAndPar();//右侧基础信息刷新
//		parent.parent.parent.s_Class_Friend._FriendList.scriptprcallsub("StartCheckBuddy");
	}
};

//
//总的类：List
//
class VRelationUnSee_DBList_Logic VN2ListCtrl
{
	selecttype="1";colfilter="0";
	columclass="0,VColumn_RelationUnSee_List_Logic"; 
};