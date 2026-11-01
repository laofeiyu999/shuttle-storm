importex("$./../../../UI/Family/pop/ClassDef_Badge.gml");

//一个徽章外框或内框类
class VColumn_BadgeImg_Logic item
{
	var _badgeFlag = 0;	//内外框标志，1为外框，2为内框
	var _badgeLev = 0;	//徽章等级
	var _badgeIndex = 0;	//图片索引
	var _badgePath = 0;	//图片路径
	//===================================
	void Init()
	{
//		staticvar s_Bk = new VBadgeBK_UI
//		{}
		//徽章外框或内框图片
		staticvar s_BadgeImg = new img
		{}
	}
	inclass("VColumn_BadgeImg_UI");
	Init();
	//===========================================================
	void OnSelect(){OnMySelect();parent.parent.SaveBadgeInfo(_badgeFlag,_badgeLev,_badgeIndex);};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		_badgeFlag = parent.fieldstr(iRow,window.TENNIS_GAME_FAMILYBADGEINFO_BADGEFLAG);
		_badgeLev = parent.fieldstr(iRow,window.TENNIS_GAME_FAMILYBADGEINFO_BADGELEVEL);
		_badgeIndex = parent.fieldstr(iRow,window.TENNIS_GAME_FAMILYBADGEINFO_BADAGEINDEX);
		s_BadgeImg.SetData(_badgeFlag,_badgeLev,_badgeIndex);
		_badgePath = s_BadgeImg.src;
	}
}
//总的类：List
class VCreateFamily_BadgeList_Logic VN2ListCtrl
{
	pos = "46,283";size = "200,102";valign(0,0);halign(0,0);//需要显示时改变
	selecttype="1";colfilter="0";simpleshowmode="1,5";//bgcolor = "#ff";

	inclass("VCreateFamily_BadgeList_UI");
	columclass="0,VColumn_BadgeImg_Logic";
};