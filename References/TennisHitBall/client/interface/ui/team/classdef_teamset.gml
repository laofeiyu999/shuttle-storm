//活动设置 - 显示
//


class VTeamSet_UI VUIBG_UI
{
	size = "348,469";bgcolor = -1;//alpha = 50;
	//=============================与界面交互========================================

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/zdsz-bt-text.tga");
		InitClose();
//		InitHelp();
		InitBtnBG();
		new VPic9_BK2_UI{size="100%,365,-30,0";pos="15,38";}

		//图 队伍名称
		new img
		{
			src="$./imgs"+window.g_Sex+"/dwmc-text.tga";
			pos = "35,61";
		}
		//edit的底
		new VPic9_EditBK_UI
		{
			size = "145,20";pos="150,61";
		}
		//队伍名称:edit
		staticvar s_Edit_TeamName = new BaseEdit
		{
			size = "145,20";pos="150,61";
			//bgcolor = "#FF";alpha = 80;
			src = ""+window.GetMyName()+"的队伍";
			maxsize = 18;ycenter = true;xcenter = true;
		}

		//图 邀请队友
		new img
		{
			src="$./imgs"+window.g_Sex+"/yqdy-text.tga";
			pos = "35,103";
		}
		//图 精确查找
		new img
		{
			src="$./imgs"+window.g_Sex+"/jqcz-text.tga";
			pos = "67,136";
		}
		//精确查找：Radio
		staticvar s_R_ExacFind = new VRadio_Single_New_UI
		{
			pos="38,135";
		}
		//图 范围查找
		new img
		{
			src="$./imgs"+window.g_Sex+"/fwcz.tga";
			pos = "67,178";
		}
		// 范围查找：Radio
		staticvar s_R_RangeFind = new VRadio_Single_New_UI
		{
			pos="38,176";
		}

		//edit的底
		new VPic9_EditBK_UI
		{
			size = "145,20";pos="150,134";
		}
		//精确查找名字:edit
		staticvar s_Edit_NkName = new BaseEdit
		{
			size = "145,20";pos="152,134";
			maxsize = 12;ycenter = true;xcenter = true;
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			InitText("确定");pos="38,413";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos="220,413";
		}

		//列表上面的灰条
		new VPic3_GreyTop_UI
		{
			pos="20,200";size="306,32"
		}
		

		//图 昵称
		new img
		{
			src = "$./imgs"+window.g_Sex+"/nc-text.tga";pos="42,207";
		}
//		//图 向下的小三角
//		new img
//		{
//			src = "$./imgs"+window.g_Sex+"/sanjiao.tga";pos="50,222";
//		}
		//图 等级
		new img
		{
			src = "$./imgs"+window.g_Sex+"/dj-text.tga";pos="112,207";
		}
//		//图 向下的小三角
//		new img
//		{
//			src = "$./imgs"+window.g_Sex+"/sanjiao.tga";pos="120,222";
//		}
		//图 关系
		new img
		{
			src = "$./imgs"+window.g_Sex+"/gx-text.tga";pos="182,207";
		}
//		//图 向下的小三角
//		new img
//		{
//			src = "$./imgs"+window.g_Sex+"/sanjiao.tga";pos="190,222";
//		}
		//图 技术方向
		new img
		{
			src = "$./imgs"+window.g_Sex+"/jslx-text-bs.tga";pos="244,207";
		}
//		//图 向下的小三角
//		new img
//		{
//			src = "$./imgs"+window.g_Sex+"/sanjiao.tga";pos="266,222";
//		}
	}
};