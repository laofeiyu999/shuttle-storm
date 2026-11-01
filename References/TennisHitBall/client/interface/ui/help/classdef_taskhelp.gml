//任务的帮助系统的类定义 - 显示
//yxf 2009年12月14日
//

class VTaskHelp_UI item
{
	//=============================与界面交互=======================================
	void Init()
	{	
		//图片
		staticvar s_Img = new img
		{
			valign(50,0);halign(50,0);
			var m_IsFirst = true;	//是否为第一次
			
			//
			void SetData(_src,id)
			{
				size = "0,0";
				if (toint(_src) == -1)
				{
					src = "$./imgs1/index_"+id+".jpg";
				}
				else
				{
					src = "$./imgs1/"+_src;
				}

				if (m_IsFirst)
				{
					setParamTimer("size","0,0","800,600",500,0,"ShowEnd");
					m_IsFirst = false;
				}
				else
				{
					size = "800,600";
				}
			}
		}

		//按钮：上一页
		staticvar s_Btn_PreNode = new VBTN_A_New
		{
			InitText("上一页");pos="670,712";
		}

		//按钮：下一页
		staticvar s_Btn_NextNode = new VBTN_A_New
		{
			InitText("下一页");pos="785,712";
		}
		
		//按钮：关闭
		staticvar s_Btn_Close = new VBTN_Close_New
		{
			pos="910,70";
		}
	}

	//隐藏
	void OnMyHide()
	{
		delaydel(500);
		s_Img.setParamTimer("size","800,600","0,0",500,0);
	}
};
