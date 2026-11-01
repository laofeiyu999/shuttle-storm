//
//提示条的显示类定义
//@刘高辰
//2008年10月20日

class VMyInfoBoard_UI item
{
	size = "308,208";bgcolor = -1;alpha = 0;
	halign(50,0);valign(50,0);
	//=============================与界面交互==============================
	void Init()
	{
		new VUIBG_UI
		{
			size = "308,208";
//			pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			SetTitalPos("25,0");
			InitBG("$./../VMessageBox/imgs"+window.g_Sex+"/tsxx.tga");
			new VPic9_BK2_UI
			{
				size(parent.width-30,156);pos = "15,36";
			}
		}
//		new img
//		{
//			pos = "25,6";
//			src = "$./../VMessageBox/imgs"+window.g_Sex+"/tsxx.tga";
//		}
		//内容
		staticvar s_Text = new BaseText
		{
			size(parent.width-30,156);;pos = "15,36";autoenter = true;
			//bgcolor ="#FF";alpha = 50;

			void SetData(data1,data2)
			{
				if (data1.Count <= 36)
				{
					xcenter = true;ycenter = true;
					src = ""+data1;
				}
				else
				{
					src = "    "+data1;xcenter = false;ycenter = true;
				}
			}
		}
	}
};