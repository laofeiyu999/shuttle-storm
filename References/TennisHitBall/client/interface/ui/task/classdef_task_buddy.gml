//密友任务界面
//武文博  2010.9.27

importex("$./ClassDef_Task_TaskContent.gml");

class VTask_Buddy_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	valign(50,0);halign(50,0);
	void Init()
	{
		//已接密友任务数量图
		staticvar s_pic_TaskNum = new img
		{
			size = "92,15";
			src = "$./imgs"+window.g_Sex+"/yjmyrw-text.tga";
			valign(92,0);halign(5,0);
			show = true;
		}
		//已接密友任务数量
		staticvar s_text_TaskNum = new text
		{	
			left = parent.s_pic_TaskNum.left + parent.s_pic_TaskNum.width-30;
			top = parent.s_pic_TaskNum.top;
			size = "104,19";xspace = 1;xcenter = true;ycenter = true;
			font = "宋体,-1,12";//color = "#e7cb94";
			bold = true;
			void SetData(data)
			{
				src = ""+data+"/"+window.g_NORMALTASK_MAX_SUM;
			}
		}
//		//今日还能完成任务数量图
//		staticvar s_pic_LeavTaskNum = new img
//		{
//			left = parent.s_text_TaskNum.left + parent.s_text_TaskNum.width;
//			top = parent.s_text_TaskNum.top;
//			size = "137,15";
//			src = "$./imgs"+window.g_Sex+"/jrkwc-text.tga";
//			//valign(92,0);halign(5,0);
//			show = true;
//		}
//		staticvar s_text_LeavTaskNum = new text
//		{
//			left = parent.s_pic_LeavTaskNum.left + parent.s_pic_LeavTaskNum.width;
//			top = parent.s_pic_LeavTaskNum.top;
//			size = "104,19";xspace = 1;xcenter = true;ycenter = true;
//			font = "宋体,-1,12";//color = "#e7cb94";
//			bold = true;
//			void SetData(data)
//			{
//				var _LeavTaskNum = 5-data;
//				src = ""+_LeavTaskNum;
//			}
//		}
		
		//放弃任务按钮
		staticvar s_btn_AbandonTask = new VBTN_A_New
		{
			InitText("放弃任务");
			valign(93,0);halign(95,0);
			show = false;
		}
		//接受任务按钮
		staticvar s_btn_AcceptTask = new VBTN_A_New
		{
			InitText("接受任务");
			valign(93,0);halign(80,0);
			show = false;
		}
		//完成任务按钮
		staticvar s_btn_CompleteTask = new VBTN_A_New
		{
			InitText("交付任务");
			valign(93,0);halign(80,0);
			show = false;
		}
		//任务内容
		staticvar s_TaskContent = new VTask_TaskContent_UI
		{
			valign(50,0);halign(94,0);
			SetPageKind(2);
		}
	}
};



