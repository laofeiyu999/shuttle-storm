//
//游戏设置中，背景音乐
//

importex("$./../../UI/GameSetUp/ClassDef_BgMusicList.gml");

//一行显示类：
class VColumn_Music_Logic item
{
	size = "210,30";bgcolor = "#FF00";
	var m_ID = -1;
	//===========================与显示交互======================
	void Init()
	{
		//音乐名
		//参数 data1:
		staticvar s_Name = new VMyText
		{
			void SetData(data1)
			{
				src = ""+data1;
			}
		}
	}
	inclass("VColumn_Music_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
		window.find("ComBoxList_"+parent.m_ListName).SetDefaultSrc(s_Name.src);
		window.find("ComBoxList_"+parent.m_ListName).WhichSelect(m_ID);
		parent.SetShow(false);
	};
	void OnUnSelect(){OnMyUnSelect();};
	void OnMouseOver(){OnMySelect();};
	void OnMouseOut(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		m_ID = szData;
		s_Name.SetData(parent.fieldstr(iRow,window.GAMEUI_SOUND_REGISTER_SHOWNAME));
	}
};

//
//总的类：List
//
class VGameSetUp_MusicList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="210,90";
	scroll = window.SCROLL_NOYES;capturemouse = true;
	//
	selecttype="1";colfilter="0";
	alpha = 70;//bgcolor = "#FF";

	inclass("VGameSetUp_MusicList_UI"); 

	columclass="0,VColumn_Music_Logic"; 
};