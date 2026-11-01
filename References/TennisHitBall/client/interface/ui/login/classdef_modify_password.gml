//
//修改密码界面的显示部分类定义
//

class VModify_PW_UI item//VUIBG_UI
{
	size = "0%,0%";size = "100%,100%";bgcolor = -1;alpha = -1;capturemouse = true;
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	//=========================与界面交互=========================
	void Init()
	{
		new VUIBG_UI
		{
			size = "300,230";
			valign(50,0);halign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/mpw/xgmm-bt-text.tga");
			InitBtnBG();
		}

		new VPic9_BK2_UI{/*pos = "15,40";*/valign(50,-15);halign(50,0);size = "270,125";}

		//用户名
		new img
		{
			//pos="25,50";
			valign(50,-60);halign(50,-80);
			src = "$./imgs"+window.g_Sex+"/mpw/yhm-text.tga";
		};
		new VPic9_EditBK_UI{size = "146,19";/*pos = "125,50";*/valign(50,-60);halign(50,50);}
		staticvar s_Edit_UserName = new BaseEdit
		{
			size = "146,19";//pos = "125,50";
			maxsize=16;valign(50,-60);halign(50,50);
		}
		//旧密码
		new img
		{
			//pos="25,80";
			valign(50,-30);halign(50,-80);
			src = "$./imgs"+window.g_Sex+"/mpw/jmm-text.tga";
		};
		new VPic9_EditBK_UI{size = "146,19";/*pos = "125,80";*/valign(50,-30);halign(50,50);}
		staticvar s_Edit_PassWord_Old = new BaseEdit
		{
			size = "146,19";//pos = "125,80";
			maxsize=16;password = true;
			valign(50,-30);halign(50,50);
		}
		//新密码
		new img
		{
//			pos="25,110";
			valign(50,0);halign(50,-80);
			src = "$./imgs"+window.g_Sex+"/mpw/xmm-text.tga";
		};
		new VPic9_EditBK_UI{size = "146,19";pos = "125,110";valign(50,0);halign(50,50);}
		staticvar s_Edit_PassWord_New1 = new BaseEdit
		{
			size = "146,19";//pos = "125,110";
			maxsize=16;password = true;
			valign(50,0);halign(50,50);
		}
		//确认新密码
		new img
		{
			//pos="25,140";
			valign(50,30);halign(50,-80);
			src = "$./imgs"+window.g_Sex+"/mpw/qrxmm-text.tga";
		};
		new VPic9_EditBK_UI{size = "146,19";/*pos = "125,140";*/valign(50,30);halign(50,50);}
		staticvar s_Edit_PassWord_New2 = new BaseEdit
		{
			size = "146,19";//pos = "125,140";
			maxsize=16;password = true;
			valign(50,30);halign(50,50);
		}


		//确定：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			InitText("确定");//pos="120,180";
			valign(50,80);halign(50,-70);
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos="200,180";
			valign(50,80);halign(50,70);
		}

	}
};