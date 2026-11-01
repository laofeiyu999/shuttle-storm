//日常任务界面
//陈晓聪 2009年1月7日

import("$./ClassDef_Task_TaskContent.gml");

class VTask_Everyday_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	valign(50,0);halign(50,0);
	void Init()
	{
//		//任务内容
//		staticvar s_TaskContent = new VTask_TaskContent_UI
//		{
//			size = "500,321";pos = "302,96";
////			bgcolor = "#ff";alpha = 50;
//		}
//		//取消追踪
//		staticvar s_btn_CancelFollow = new VBTN_Base_A_UI
//		{
//			pos = ""+(parent.width-239)+","+(parent.height-43);InitText("取消追踪");
//		}
//		//任务追踪
//		staticvar s_btn_TaskFollow = new VBTN_Base_A_UI
//		{
//			pos = ""+(parent.width-239)+","+(parent.height-43);InitText("任务追踪");
//		}
//		//取消全部任务追踪
//		staticvar s_btn_CancelAllTaskFollow = new VBTN_Base_B_UI
//		{
//			pos = ""+(parent.width-147)+","+(parent.height-43);InitText("取消全部追踪");
//		}
//		//全部任务追踪
//		staticvar s_btn_AllTaskFollow = new VBTN_Base_B_UI
//		{
//			pos = ""+(parent.width-147)+","+(parent.height-43);InitText("全部任务追踪");
//		}
//		//已接的任务数量 字
//		new imgm
//		{
//			pos = "26,382";src = "$./imgs/text_SubmitedDailyTask.tga";
//		}
//		//数字背景 
//		new imgm
//		{
//			pos = "175,382";src = "$./imgs/bk_num.tga";
//		}
//		//已接受任务数量
//		staticvar s_text_CompletedNum = new text
//		{
//			pos = "170,382";size = "104,19";xspace = 1;xcenter = true;ycenter = true;
//			font = "宋体,-1,12";color = "#e7cb94";
//			void SetData(data)
//			{
//				src = ""+data+"/20";
//			}
//		}
//		//已完成的任务数量 字
//		new imgm
//		{
//			pos = "26,402";src = "$./imgs/text_CompletedDailyTask.tga";
//		}
//		//数字背景 
//		new imgm
//		{
//			pos = "175,402";src = "$./imgs/bk_num.tga";
//		}
//		//已完成任务数量
//		staticvar s_text_SubmitedNum = new text
//		{
//			pos = "170,402";size = "104,19";xspace = 1;xcenter = true;ycenter = true;
//			font = "宋体,-1,12";color = "#e7cb94";
//			void SetData(data)
//			{
//				src = ""+data+"/20";
//			}
//		}
//		//显示适合等级的任务
//		staticvar s_CB = new VCK_Black_UI
//		{
//			pos = "147,"+(parent.height-35);size = "188,17";//bgcolor = "#FF";alpha = 50;
//		}
//		new imgm
//		{
//			pos = "167,"+(parent.height-35);src = "$./imgs/text_SuitLevel.tga";
//		}
//
//
//		// 显示已接的任务
//		staticvar s_CB_ShowSubmitedTask=new VCK_Black_UI
//		{
//			pos = "387,"+(parent.height-35);size = "140,17";//bgcolor = "#FF";
//		}
//		new imgm{pos = "407,"+(parent.height-35);src = "$./imgs/text_SuitLevel1.tga";}
//
//
//		//接受任务
//		staticvar s_btn_AcceptTask = new VBTN_Base_A_UI
//		{
//			pos = "40,"+(parent.height-43);InitText("接受任务");
//		}
//		//放弃任务
//		staticvar s_btn_AbandonTask = new VBTN_Base_A_UI
//		{
//			pos = "40,"+(parent.height-43);InitText("放弃任务");
//		}
//		//完成任务
//		staticvar s_btn_CompleteTask = new VBTN_Base_A_UI
//		{
//			pos = "40,"+(parent.height-43);InitText("完成任务");
//		}
		=================
		//已接日常任务数量图
		staticvar s_pic_TaskNum = new img
		{
			size = "92,15";
			src = "$./imgs"+window.g_Sex+"/yjjzrw-z.tga";
			valign(92,0);halign(5,0);
			show = true;
		}
		//已完成任务数量
		staticvar s_text_SubmitedNum = new text
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
			show = true;
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
			SetPageKind(1);
		}
	}
};

//import("$./../../init.gml");
//wndsize="1024,768";
//bkcolor="#00FF";
//new VTask_Everyday_UI
//{
//	Init();
//}