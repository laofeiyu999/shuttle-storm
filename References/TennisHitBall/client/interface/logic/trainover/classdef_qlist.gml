//训练结算任务list类
//2009-2-21
//吴楠

importex("$./../../UI/TrainOver/ClassDef_QList.gml");

class VColumn_QList_Logic item
{
	size(250,30);
	//=========================显示部分===================================
	void Init()
	{
		//名称
		//参数1 name: 名称
		staticvar s_Name = new text
		{
			size(200,30);color = "#FFFFFF";
			void SetData(data)
			{
				src=data;
			}
		}

		//状态
		//参数1 state：是否通过  0未通过 1通过
		staticvar s_State = new text
		{
			size(50,30);pos = "200,0";
			void SetData(data)
			{
				src="未通过";
				if(data == 1)
				{
					src="已通过";
				}
			}
		}
	}
	inclass("VColumn_QList_UI");
	//====================================================================
	Init();

	void OnDataExchange(iRow,szData)
	{
		var _Name = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_NAME);	//名称
		var _State = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_STATE);	//状态 0未通过 1通过
		
		s_Name.SetData(_Name);
		s_State.SetData(_State);
	}
};

//
//总的类：List
//
class VQ_CourseList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="250,400";pos = "750,100";bkcolor="#ff0000";
	scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";//simpleshowmode="1,9";
	
	inclass("VQ_CourseList_UI"); //界面显示类

	columclass="0,VColumn_QList_Logic"; //识别id
};
