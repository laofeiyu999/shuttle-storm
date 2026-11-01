//创建角色界面的提示框
//yxf 2008年10月21日

//确定要创建角色吗？
class VMB_CreateRole_UI item
{
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/CreateRole.tga");
			InitClose();
			InitBtnBG();

			new VPic9_BK2_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			size = "274,102";autoenter = true;
			//bgcolor ="#FF";alpha = 50;
			halign(50,0);valign(50,-15);

			void SetData(data1)
			{
				if (data1.Count <= 36)
				{
					xcenter = true;ycenter = true;
					src = data1;
				}
				else
				{
					src = "    "+data1;xcenter = false;ycenter = true;
				}
			}
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,431";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,431";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}
};