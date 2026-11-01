//
//系统公告的提示显示类定义
//

class VSysAffiche_UI item
{
	size = "100%,40";halign(50,0);valign(50,0);bgcolor = -1;
	show = false;
	void Init()
	{
		new VPic3_SysAffiche_UI
		{
			size = "100%,34";
			valign(50,0);
//			width = "100%";
			//src = "$./imgs/bk.tga";
		}
		staticvar s_Text = new text
		{
			font = "黑体,-1,18";color = "#00FF00";bold = true;
			size = "772,40";
			ycenter = true;//xcenter = true;
			//bgcolor = "#cccccc";
			//xspace = -2;
			//参数：内容
			void SetData(content)
			{
				if (window.GetUIPos() < window.POS_HALL)
				{
					timer(2000,"ShowOver");
					return;
				}

				window.WriteChat5(content);
				parent.show = true;
				src = content;
				var _sizeX = toint(content.Count)*10;
				if (_sizeX < 80)
				{
					_sizeX = 80;
				}
				var _posX = 0 - _sizeX;
				var _timer = toint(content.Count)*350;
				if (_timer < 12000)
				{
					_timer = 12000;
				}
				size(_sizeX,40);
				//printf("B# 系统公告:_posX:"+_posX+"，_timer："+_timer+",count:"+content.Count+",content:"+content);
				setParamTimer("pos","772,0",""+_posX+",0",_timer,0,"ShowOver","VSysAffiche_UI_TIMER");
			}

			void ShowOver()
			{
				parent.show = false;
				parent.parent.OnUnDisplayMsg();
			}
		}
	}
	
	//紧急删除，当返回频道选择界面时
	void InstancyDel()
	{
		//printf("B# 系统公告-InstancyDel");
		s_Text.killtimer("VSysAffiche_UI_TIMER");
		s_Text.ShowOver();
	}
};