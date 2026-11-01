//
//Loading界面>>大厅进入竞技赛的等待界面>>显示类定义
//yxf 2009年3月5日

class VHallWaiting_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	//===================================与显示交互部分========================================
	void Init()
	{
		staticvar RaceBk_Img = new img
		{
			valign(50,0);halign(50,0);
			width = "100%";
			src = "$./imgs/RaceID_BK.tga";
		}
		staticvar RaceID_Img = new img
		{
			valign(50,0);//halign(31,0);
			src = "$./imgs/RaceID_Enter.tga";
		}
		staticvar RacePrepare_Img = new img
		{
			valign(50,0);//halign(70,0);
			src = "$./imgs/RaceID_prepara.tga";
		}
		//显示的文字>>
		staticvar s_TEXT = new img
		{
			valign(50,0);halign(50,0);
			
			//参数：比赛ID,1为活动赛，2为撮合赛,4为家族个人赛
			void SetData(raceID)
			{
				if(4 == toint(raceID))
				{
					parent.RaceBk_Img.src = "$./imgs/bsmsks-d.tga";
					parent.RaceID_Img.show = false;
					parent.RacePrepare_Img.show = false;
					src="$./imgs/bsmsks-text.tga";
					return;
				}
				if(2 == toint(raceID))
				{
					src = "$./imgs/RaceID_"+raceID+".tga";
				}else
				{
					raceID = 1;
					src = "$./imgs/RaceID_"+raceID+".tga";
				}
				parent.ReSetOtherImgPos();
			}

			
		}
		void ReSetOtherImgPos()
		{
			RaceID_Img.left = (width-s_TEXT.width)/2-RaceID_Img.width;
			RacePrepare_Img.left = (width-s_TEXT.width)/2+s_TEXT.width;
		}
	}
	//=========================================================================================
};