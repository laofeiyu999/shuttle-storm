size="1024,768";
wndsize="1024,768";
bgcolor="#ffff";
importex("$./../../Logic/init.gml");
importex("$./ClassDef_Task_TaskContent.gml");
import("$./SubmitTaskClassDef.gml");
importex("$./../GmlCtrls/VPopWnd/ClassDef.gml");
import("$./ClassDef_Task_Everyday.gml");
import("$./ClassDef_Task_Normal.gml");

new VTask_Everyday_UI
{
	Init();
	//s_text_TaskNum.SetData(3);
	s_text_SubmitedNum.SetData(3);
}
<END>
new img3d
{
};
staticvar s = new VTask_TaskContent_UI
{
	pos = "100,100";//bgcolor = "#FF";alpha = 50;//size = "500,200";
	//s.SetData("任务名","村长星延很高兴看到新猎人的加入，他想向你大致介绍了村里的情况，去拜访他听听他的建议。","和武器锻造师@星刻@|10704|对话。","-@翼狼@|-1|&nbsp1/1",100,500,"1010002:2:1010002:3:1010002:2:1010002:20:1010002:11","1010002:2:1010002:20");//"1010002:2"
	//Init();
//	set _prize
//	{
//		void SetSelect(data)
//		{
//			alert(data);
//		}
//	}
	
}
//new VPrizeMgr_UI{bgcolor = "#FF";pos = "100,350";SetSelectState(0); SetRowNum(2);SetData("1010002:2:1010002:3:1010002:2:1010002:20:1010002:11");}
//new VItemPrize_Select_UI{SetNum(50);SetId(1010002);}
void OnMouseDownL()
{
	// <&nbsp>
//	s.SetData("任务名","任务内容任务内容任务内容任务内容任务内容爱的ddd是发生的发生地方adfasdsdfasdf按时打算的","任务目标1/1",456,234,"");
//	s.SetData("  @很高兴看到@的加入，@想向你大致介绍了村里的情况，去拜访他听听他的建议。","村长星延@新猎人@他他他他他他","11@12@13","任务目标1/1@和村长星研对话1/1","21@22",100,500,"1010002:2:1010002:3");//"1010002:2"
//	s.SetData("任务名","村长星延很高兴看到新猎人的加入，他想向你大致介绍了村里的情况，去拜访他听听他的建议。","任务目标  1/1","和村长星研对话  1/1",100,500,"1010002:2:1010002:3");//"1010002:2"
	s.SetData("任务名","和武器锻造师@星刻@|1|对话。","和武器锻造师@星刻@|10704|对话。","-@白暴龙@|-1|,@角羚@|-1|&nbsp1/1",100,500,"1100042:20:710001:11","40009:2",500);//"1010002:2"
}

void OnMouseDownR()
{
	//s.ClearData();
	window.s.SetData("任务名","村长星延很高兴看到新猎人的加入，他想向你大致介绍了村里的情况，去拜访他听听他的建议。","和武器锻造师@星刻@|10704|对话。","-@白暴龙@|-1|,@角羚@|-1|&nbsp1/1",100,500,"","40009:2",0);//"1010002:2"
}



new item
{
	size ="100%,100%";name = "POPLAYER";
}






<END>
void OnMouseDownL()
{
	staticvar s = new VTask_TaskContent_UI
	{
		pos = "100,100";size = "500,200";bgcolor = "#FF";alpha = 50;
		Init();
	}
	// <&nbsp>
//	s.SetData("任务名","任务内容任务内容任务内容任务内容任务内容爱的ddd是发生的发生地方adfasdsdfasdf按时打算的","任务目标1/1",456,234,"");
	s.SetData("拜访村长","村长星延很高兴看到新猎人的加入，他想向你大致介绍了村里的情况，去拜访他听听他的建议。","和村长星研对话1/1",100,500,"1010002:20:1010002:13");//"1010002:2"
}
void OnMouseDownR()
{
	s.del();
}