//个人信息战绩统计显示类定义
//@刘高辰
//08年9月4号

/*
import("$./../../Logic/Init.gml");
window.g_Sex = 1;
bgcolor = "#12EE56";
wndsize = "1024,768";
size = "1024,768";
*/

class VSelfInfo_Record_UI item
{
	/*
	*modify:	chenjihui
	*author:	
	*data:		2010-12-16
	*/
	size = "95%,100%";bgcolor = -1;alpha = 0;

	void Init()
	{
		new VPic9_BK2_UI{pos="286,58";size="285,482";}

		// 总比赛场次
		new img{pos="310,105";src="$./imgs"+window.g_Sex+"/new/bszcc-text.tga";}
		staticvar s_All_MatchDates = new BKText{pos="425,104";size="133,18";xcenter = true;ycenter = true;}

		//胜利场次
		new img{pos="310,127";src="$./imgs"+window.g_Sex+"/new/slcc-text.tga";}
		staticvar s_Win_MatchDates = new BKText{pos="425,127";size="133,18";xcenter = true;ycenter = true;}

		//总得分
		new img{pos="310,150";src="$./imgs"+window.g_Sex+"/new/zdf-text.tga";}
		staticvar s_All_Point = new BKText{pos="425,150";size="133,18";xcenter = true;ycenter = true;}

		//胜率
		new img{pos="310,173";src="$./imgs"+window.g_Sex+"/new/sl-text.tga";}
		staticvar s_Winning = new BKText
		{
			pos="425,173";size="133,18";xcenter = true;ycenter = true;
			void SetData(data1,data2,data3)
			{
				if (window.g_DEBUG)
				{
					printf("个人信息-战绩统计-胜率；data2："+data2+",data3:"+data3);
				}
				if (toint(data3) <= 0)
				{
					src = "0%";
				}
				else
				{
					if (toint(data2) == toint(data3))
					{
						src = "100%";
					}
					else
					{
						var _temp = tostring(tofloat(data2)/toint(data3)*100);
						src = ""+_temp.Mid(0,_temp.Find("."))+"%";
					}
				}
			}
		}

		//ACE球总数
		new img{pos="310,195";src="$./imgs"+window.g_Sex+"/new/yjdfs-text.tga";}
		staticvar s_ACE_Total = new BKText{pos="425,195";size="133,18";xcenter = true;ycenter = true;}

		//破发成功率
		new img{pos="310,218";src="$./imgs"+window.g_Sex+"/new/pqcgl-text.tga";}
		staticvar s_Break_Point = new BKText
		{
			pos="425,218";size="133,18";xcenter = true;ycenter = true;
			void SetData(data1){src = ""+data1+"%";}
		}

		//破发局数
		new img{pos="310,241";src="$./imgs"+window.g_Sex+"/new/pfjs-text.tga";}
		staticvar s_Break_Num = new BKText{pos="425,241";size="133,18";xcenter = true;ycenter = true;}

		//技能总数
		new img{pos="310,317";src="$./imgs"+window.g_Sex+"/new/jnzs-text.tga";}
		staticvar s_Skill_Total = new BKText{pos="425,317";size="133,18";xcenter = true;ycenter = true;}

		//技能得分数
		new img{pos="310,340";src="$./imgs"+window.g_Sex+"/new/jndfs-text.tga";}
		staticvar s_Skill_PointNum = new BKText{pos="425,340";size="133,18";xcenter = true;ycenter = true;}

		//技能得分率
		new img{pos="310,363";src="$./imgs"+window.g_Sex+"/new/jndfl-text.tga";}
		staticvar s_Skill_Point = new BKText
		{
			pos="425,363";size="133,18";xcenter = true;ycenter = true;
			void SetData(data1,data2,data3)
			{
				if (window.g_DEBUG)
				{
					printf("个人信息-战绩统计-技能得分率；data2："+data2+",data3:"+data3);
				}
				if (toint(data3) <= 0)
				{
					src = "0%";
				}
				else
				{
					if (toint(data2) == toint(data3))
					{
						src = "100%";
					}
					else
					{
						var _temp = tostring(tofloat(data2)/toint(data3)*100);
						src = ""+_temp.Mid(0,_temp.Find("."))+"%";
					}
				}
			}
		}

		//普通破解技能总数
		new img{pos="310,386";src="$./imgs"+window.g_Sex+"/new/ftpf-text.tga";}
		staticvar s_General_Skill = new BKText{pos="425,386";size="133,18";xcenter = true;ycenter = true;}

		//技能破解技能总数
		new img{pos="310,408";src="$./imgs"+window.g_Sex+"/new/jnpj-text.tga";}
		staticvar s_Skill_Skill = new BKText{pos="425,408";size="133,18";xcenter = true;ycenter = true;}
	}
};

/*
new VSelfInfo_Record_UI
{
	Init();
}
*/
