//密友任务
//武文博 2010.9.27
class VColumn_Task_BuddyTask_DBList_UI item
{
	size = "252,28";bgcolor = -1;alpha = -1;border = "0";
//	bgcolor = "#FF";alpha = 50;border = "#FF";
	
	new VListBG2_UI{size="97%,27";}//列表背景
	staticvar _Selected = new VPic3_ListBK1_UI{size = "97%,32";show = false;}//选中背景
	staticvar _IMG = new VListSelect_UI{pos="0,4"; SetWidth(parent.width-10); show=false;}	//鼠标滑过效果

	void Init()
	{
		//任务类型
		staticvar s_taskType = new BaseText
		{
			size = "40,21";
			font="宋体,-1,12"; 
			pos(3,7);
			void SetData(type)
			{
				src = "[密友]";
			}
		}
//		//任务等级
//		staticvar s_text_TaskLevel = new BaseText
//		{
//			//src = "47";
//			font="宋体,-1,12"; 
//			size = "50,21";
//			left = parent.s_taskType.left + parent.s_taskType.width+3;
//			top = parent.s_taskType.top;
//			//bgcolor = "#ff0000";
//			void SetData(lv)
//			{
//				//alert(1);
//				src = ""+"密友"+lv+"级";
//			}
//		}
		//任务名称
		staticvar s_text_TaskName = new BaseText
		{
			font="宋体,-1,12"; 
			size = "120,21";
			left = parent.s_taskType.left+parent.s_taskType.width+10;
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
		//OnMySelect();
		window.PlaySound(4);
	}
}

//
//总的类：List
//
class VTask_BuddyTask_DBList_UI VN2ListCtrl
{
	size = "260,330";pos = "26,80";
	bgcolor = -1;alpha = -1;border = "0";
	//scroll = window.SCROLL_NOYES;
	scroll = window.SCROLL_NOTENNIS;
	//border = "#00FFFF";
};

