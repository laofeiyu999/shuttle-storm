//个人社交详细信息显示类定义
//武文博 2010-9-23

class VSelfInfo_Sociality_UI item
{
	/*
	*modify:	chenjihui
	*author:	武文博
	*data:		2010-12-16
	*/

	size = "95%,100%";bgcolor = -1;alpha = 0;
	
	void Init()
	{
		new VPic9_BK2_UI{pos="286,58";size="285,304";}
		
		//情侣
		new img{pos = "296,102";src="$./imgs"+window.g_Sex+"/new/ql-bt.tga";}
		//情侣昵称
		new img{pos = "296,138";src="$./imgs"+window.g_Sex+"/new/qlnc-text.tga";}
		staticvar s_Name_LoverDates = new BKText
		{
			pos="359,136";size="93,18";xcenter = true;ycenter = true;
			void  SetData(_name)
			{
				if (tostring(_name) != "" || _name != 0)
					src = ""+_name;
				else
					src = "";
			}

		}
		//解除婚约
		staticvar s_Btn_RelieveEngagement = new VBTN_58_New
		{
			pos="461,136";
			InitText("解除婚约");
		}
//		//亲密度
		new img{pos = "296,174";src="$./imgs"+window.g_Sex+"/new/qmd-text.tga";}
		staticvar s_LPoint_LoverDates = new BKText
		{
			pos="359,172";size="169,18";xcenter = true;ycenter = true;
			void  SetData(_lovePoin,_levshowname,_expadd)
			{
				if (tostring(_lovePoin) != "")
					src = ""+_lovePoin+" "+_levshowname+" "+"经验:+"+_expadd+"%";
				else
					src = "";
			}
		}
//		//情侣徽章
//		new img{pos = "187,138";src="$./imgs"+window.g_Sex+"/new/qlhz-text.tga";}
//		staticvar s_LBedge_LoverDates = new img
//		{
//			pos="258,130";size="28,28";xcenter = true;ycenter = true;
//			void Setdata(data)
//			{
//				src = "$./../Friend/imgs/"+data;
//			}
//		}
////		//情侣等级
//		new img{pos = "187,174";src="$./imgs"+window.g_Sex+"/new/qldj-text.tga";}
//		staticvar s_Level_LoverDates = new BKText{pos="250,172";size="44,18";xcenter = true;ycenter = true;}

//		//搭档
//		new img{pos = "26,232";src="$./imgs"+window.g_Sex+"/new/dd-bt.tga";}
//		//当前搭档
//		new img{pos = "26,268";src="$./imgs"+window.g_Sex+"/new/dqdd-text.tga";}
//		staticvar s_Curpartner_PartnerDates = new BKText{pos="89,266";size="93,18";xcenter = true;ycenter = true;}
//		//默契度
//		new img{pos = "26,304";src="$./imgs"+window.g_Sex+"/new/mqd-text.tga";}
//		staticvar s_Privity_PartnerDates = new BKText{pos="89,302";size="93,18";xcenter = true;ycenter = true;}
//		//搭档徽章
//		new img{pos = "187,268";src="$./imgs"+window.g_Sex+"/new/ddhz-text.tga";}
//		staticvar s_PBedge_PartnerDates = new img
//		{
//			pos="258,262";size="28,28";xcenter = true;ycenter = true;
//			void Setdata(data)
//			{
//				src = "$./../Friend/imgs/ddhz"+data+".tga";
//			}
//		}
//		//搭档等级
//		new img{pos = "187,304";src="$./imgs"+window.g_Sex+"/new/dddj-text.tga";}
//		staticvar s_PLevel_PartnerDates = new BKText{pos="250,302";size="44,18";xcenter = true;ycenter = true;}

		new VPic9_BK2_UI{pos="286,365";size="285,175";}
		
		//家族
		new img{pos = "311,391";src="$./imgs"+window.g_Sex+"/new/jz-bt.tga";}
		//家族名称
		new img{pos = "311,425";src="$./imgs"+window.g_Sex+"/new/jzmc-text.tga";}
		staticvar s_Fname_FamilyDates = new BKText{pos="374,423";size="165,18";xcenter = true;ycenter = true;}
		//家族等级
		new img{pos = "431,461";src="$./imgs"+window.g_Sex+"/new/jzdj-text.tga";}
		staticvar s_FLevel_FamilyDates = new BKText{pos="495,459";size="44,18";xcenter = true;ycenter = true;}
		//家族徽章
		new img{pos = "311,461";src="$./imgs"+window.g_Sex+"/new/jzhz-text.tga";}
		staticvar s_FBedge_FamilyDates = new item
		{
			pos = "389,455";
			size= "28,28";
			var s_Badge_Out = new img
			{
				size = "100%,100%";
			}
			var s_Badge_In = new img
			{
				size = "100%,100%";
			}
			//[功能]显示徽章图
			//[参数]data1：外框标志，data2：徽章等级，data3：图片索引，data4：内框标志，data5：徽章等级，data6：图片索引
			//[返回值]无
			void SetFamilyBadge(data1,data2,data3,data4,data5,data6)
			{
				s_Badge_Out.src = "$./../Family/imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
				s_Badge_In.src = "$./../Family/imgs/Badge"+data4+"/"+data5+"/"+data6+".tga";
			}
		}

		//家族成员
		new img{pos = "311,497";src="$./imgs"+window.g_Sex+"/new/jzcy-text.tga";}s
		staticvar s_FMember_FamilyDates = new BKText
		{
			pos="374,495";size="165,18";xcenter = true;ycenter = true;
			void SetData(data1,data2)
			{
				src = ""+data1+"/"+data2;
			}
		}

	}
};