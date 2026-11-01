//
//游戏设置中，分辨率List类定义
//

importex("$./../../UI/GameSetUp/ClassDef_ResolutionList.gml");

//一行显示类：宽×高
class VColumn_Width_Height_Logic item
{
	size = "210,30";bgcolor = "#FF00";
	var _index = -1;
	//===========================与显示交互======================
	void Init()
	{
		//宽×高
		//参数 data1: 宽
		//参数 data2: 高
		staticvar s_Resolution = new VMyText
		{
			void SetData(data1,data2)
			{
				src = ""+data1+" × "+data2;
			}
		}
	}
	inclass("VColumn_Width_Height_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
		parent.parent.SetDefaultText(s_Resolution.src);
		parent.parent.WhichSelect(_index);
	};
	void OnUnSelect(){OnMyUnSelect();};
	void OnMouseOver(){OnMySelect();};
	void OnMouseOut(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		_index = szData;
		var _width = parent.fieldstr(iRow,window.GAMEUI_RESOLUTION_WIDTH);
		var _height = parent.fieldstr(iRow,window.GAMEUI_RESOLUTION_HEIGHT);
		s_Resolution.SetData(_width,_height,"");
//		if (_width == parent.parent.m_Width)
//		{
//			parent._iRow = iRow;
//			timer(100, "parent.ScrollToEnd()");
//			OnSelect();
//		}
	}
};

//
//总的类：List
//
class VGameSetUp_ResolutionList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="210,90";//valign(50,0);halign(60,0);
	scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";
	alpha = 70;//bgcolor = "#FF";

//	var _iRow = 0;
//	void ScrollToEnd()
//	{
//		var _targety = (_iRow.__Long__) * 35;
//		scrollto(0, _targety);
//	}
	inclass("VGameSetUp_ResolutionList_UI"); //界面显示类

	columclass="0,VColumn_Width_Height_Logic"; //ID
};