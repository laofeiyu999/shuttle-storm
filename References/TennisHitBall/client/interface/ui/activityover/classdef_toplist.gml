//
//活动15天排名逻辑类定义
//

//一行显示类：排名+昵称
class VColumn_ActivityOverTop_UI item
{
	size = "760,27";//bgcolor = "#FF00";
	//===========================与显示交互======================
	void Init()
	{
		//排名
		//参数 data1：排名
		staticvar s_Index = new text
		{
			color = "#FFFFFF";size = "150,27";//bgcolor = "#FF";
			xcenter = true;ycenter = true;
			void SetData(data1)
			{
				src = "No."+data1;
			}
		}

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new text
		{
			pos = "160,0";size = "200,27";//bgcolor = "#FFFFF";
			color = "#FFFFFF";ycenter = true;
			void SetData(data1)
			{
				src = data1;
			}
		}

		//点数
		//参数 data1: 
		staticvar s_Text = new text
		{
			pos = "360,0";size = "400,27";//bgcolor = "#FFFF";
			color = "#FFFFFF";ycenter = true;//xcenter = true;
			void SetData(data1)
			{
				src = data1;
				//src = window.GetActivityOverText(toint(data1));
			}
		}
	}
	void OnMySelect(){}	//选择的效果
	void OnMyUnSelect(){}				//不选择的效果
};

//
//总的类：List
//
class VActivityOver_TopList_UI VN2ListCtrl
{
	size="760,340";valign(50,10);halign(50,0);
	bgcolor = -1;
	scroll = window.SCROLL_NO;alpha = 50;
	scroll = window.SCROLL_NOTENNIS;
};