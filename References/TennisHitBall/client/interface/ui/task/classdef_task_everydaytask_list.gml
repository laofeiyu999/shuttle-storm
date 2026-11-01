//日常任务 list
//陈晓聪 2009年1月8日

// 一行显示类：图标
class VColumn_Task_EverydayTask_DBList_UI item
{
	size = "252,28";bgcolor = -1;alpha = -1;border = "0";
//	bgcolor = "#FF";alpha = 50;border = "#FF";

	new VListBG2_UI{size="97%,27";}//列表背景
	staticvar _Selected = new VPic3_ListBK1_UI{size = "97%,32";show = false;}//选中背景
	staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width-10); show=false;}	//鼠标滑过效果


	void Init()
	{
//		//选中效果
//		staticvar _Selected = new imgm
//		{
//			pos = "0,0";src = "$./imgs/bk_Selected.tga";alpha = 100;size = "252,21";
//		}
//		//活动任务 底图
//		staticvar s_img_ActivityTaskBk = new imgm
//		{
//			src = "$./imgs/bk_ActivityTask.tga";
//		}
//		//活动任务 字
//		staticvar s_text_ActivityTask = new imgm
//		{
//			pos = "190,8";src = "$./imgs/text_ActivityTask.tga";
//		}
//		//适用等级
//		//参数 Data
//		staticvar s_text_CompleteTimes = new text
//		{
//			pos = "0,0";size = "35,21";
//			ycenter = true;xright = true;
////			bgcolor = "#F0F000"; alpha = 50;
//			font = ",-1,12";
//			color = "#e7cb94";//231 203 148
//			void SetData(data)
//			{
//				src = ""+data+"级";
//			}
//		}
//		//任务名称
//		//参数 Data
//		staticvar s_text_TaskName = new text
//		{
//			pos = "40,0";
//			size = "110,21";
//			ycenter = true;
////			bgcolor = "#F0F0"; alpha = 50;
//			font = ",-1,12";
//			color = "#e7cb94";
//			void SetData(data)
//			{
//				src = data;
//			}
//		}
//		//任务类型
//		staticvar s_taskType = new text
//		{
//			pos = "150,0";
//			size = "48,21";
//			ycenter = true;xcenter = true;
////			bgcolor = "#F0F0"; alpha = 50;
//			font = "宋体,-1,12";
//			color = "#e7cb94";
//			void SetData(Data)
//			{
//				src = "【"+Data+"】";
//			}
//		}
//		//完成
//		staticvar s_JobDone = new imgm
//		{
//			pos = "198,1";src = "$./imgs/JobDone.tga";
//		}
//		//已接受
//		staticvar s_Submited = new imgm
//		{
//			pos = "198,1";src = "$./imgs/Submit.tga";
//		}
		================
		//任务类型
		staticvar s_taskType = new BaseText
		{
			size = "40,21";
			font="宋体,-1,12"; 
			pos(3,7);
			void SetData(type)
			{
				src = "[日常]";
			}
		}
		//任务等级
		staticvar s_text_TaskLevel = new BaseText
		{
			//src = "47";
			font="宋体,-1,12"; 
			size = "30,21";
			//halign(23,0);valign(50,0);
			left = parent.s_taskType.left + parent.s_taskType.width+3;
			top = parent.s_taskType.top;
			//bgcolor = "#ff0000";
			void SetData(lv)
			{
				//alert(1);
				src = ""+lv+"级";
			}
		}
		//任务名称
		staticvar s_text_TaskName = new BaseText
		{
			font="宋体,-1,12"; 
			size = "110,21";
			left = parent.s_text_TaskLevel.left+parent.s_text_TaskLevel.width+3;
			top = parent.s_taskType.top;
			void SetData(taskName)
			{
				src = ""+taskName;
			}
		}
		//已完成
		staticvar s_JobDone = new img
		{
			src = "$./imgs/ywc-txz.tga";
			show = false;
			size = "50,17";
			//halign(80,0);
			valign(40,0);
			left = parent.s_text_TaskName.left+parent.s_text_TaskName.width+3;
			//判断是否已完成
			void SetData(isFinishTask)
			{
				
				if(isFinishTask)
				{
					show = true;
				}
				else
				{
					show = false;
				}
			}
		}
		//已接受
		staticvar s_Submited = new img
		{
			src = "$./imgs/yj-txz.tga";
			show = false;
			size = "33,17";
			//halign(80,0);
			valign(40,0);
			left = parent.s_text_TaskName.left+parent.s_text_TaskName.width+3;
			//判断是否已接受
			void SetData(isSubmitedTask)
			{
				
				if(isFinishTask)
				{
					show = true;
				}
				else
				{
					show = false;
				}
			}
		}
	}
	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
	}
	void OnMouseOut()
	{
		_IMG.show=false;
	}
	//选择的效果
	void OnMySelect()
	{
		//_Selected.alpha = 0;
		_IMG.show = false;
		_Selected.show = true;
		_SelectState = true;
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		//_Selected.alpha = 100;
		_IMG.show = false;
		_Selected.show = false;
		_SelectState = false;
	}
	void OnClick()
	{
		OnMySelect();
		window.PlaySound(4);
	}
}

////排版器，可自定义
//class VTask_EverydayTask_TypeSet_UI VN2LCTypesetter
//{
//	autochgrow="252";
//};

//
//总的类：List
//
class VTask_EverydayTask_DBList_UI VN2ListCtrl
{
	size = "260,330";pos = "26,80";
	bgcolor = -1;alpha = -1;border = "0";
	//scroll = window.SCROLL_NOYES;
	scroll = window.SCROLL_NOTENNIS;
	//typesetter ="VTask_EverydayTask_TypeSet_UI";
	//border = "#00FFFF";
};

<END>
import("$./../../index.gml");
new item
{
	valign(50,0);halign(60,0);
	size = "800,600";
	bgcolor = "#ffffff";
	new VColumn_Task_EverydayTask_DBList_UI
	{
		
		Init();
		s_taskType.SetData("主线任务");
		s_text_TaskLevel.SetData(47);
		s_text_TaskName.SetData("任务名称啥啥啥");
		s_JobDone.SetData(true);
	}
}