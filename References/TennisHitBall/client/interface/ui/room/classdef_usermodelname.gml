//人物模型上的信息显示
//夏洋洋

class VRoleModel_Info_UI item
{
	//show = false;
	size = "220,85";//bgcolor = "#00ff";
	pos = "250,75";

	void Init()
	{
		
		staticvar m_UserName = new BaseText
		{	
			size = "100%,25,-75,0";font = "宋体,-1,14";
			//bgcolor = "#ffff";
			valign(50,0);
			halign(50,0);
			//left = 75;
			//top = parent.m_UserFamilyName.top+parent.m_UserFamilyName.height;
			//xcenter = true;
			ycenter= true;
			color = "#ffffff";txtborder = "#000000";
		}
		//家族徽章
		staticvar s_FamilyIcon = new item
		{
			size= "25,25";show = false;
			top = 50;
			halign(5,0);
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
			
			//设置徽章状态	state：true有家族，false：没有家族
			void SetData(state,data)
			{
				if(state)
				{
					var _parserBadgeData = window.parserBadgeData(data);
					var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
					SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
					s_Badge_Out.show = true;
					s_Badge_In.show = true;
					//show = true;
				}
				else
				{
					s_Badge_Out.show = false;
					s_Badge_In.show = false;
					show = false;
				}
			}
		}
		staticvar m_UserFamilyName = new BaseText
		{
			var _familyName = "";font = "宋体,-1,14";
			size = "100%,25,-25,0";//bgcolor = "#ff";
			show = false;
			//valign(50,0);
			//halign(50,0);
			left = parent.s_FamilyIcon.left+parent.s_FamilyIcon.width;
			top = parent.s_FamilyIcon.top;
			//xcenter = true;
			ycenter= true;
			//color = "#1FAFAD";txtborder = "#000000";

			void SetData(data)
			{
				if(data == -1)
				{
					show = false;
					src = "";
					_familyName = "";
				}
				else
				{
					src = "<"+data+">";
					_familyName = ""+data;
					//SetFamilyColor();
					//show = true;
				}
				
			}

			void SetFamilyColor()
			{
				var _uid = window.GetFamilyIDByFamilyName(_familyName);
				var _lv = window.GetFamilyLev(_uid);
				SetFamilyColorByLv(_lv);
				
			}
			void SetFamilyColorByLv(_lv)
			{
				color = "#"+window.GetFamilyNameColor(_lv,window.FAMILY_COLORTYPE_COLOR);
				txtborder = "#"+window.GetFamilyNameColor(_lv,window.FAMILY_COLORTYPE_BORDERCOLOR);
			}
		}
		
//		 //搭档等级图标
//		staticvar m_PartnerBadge = new img
//		{
//			top = 25;
//			size= "25,25";show = false;
//			void SetData(data)
//			{
//				src = "$./../Friend/imgs/ddjz"+data+".tga";				
//			}
//		}
		 //XXX的情侣
		staticvar m_SomeOneLover = new BaseText
		{
			//bgcolor = "#ffff00";
			size = "100%,25,-75,0";font = "宋体,-1,14";
			top = 10;
			halign(50,0);
			ycenter= true;
			color = "#FF3547";txtborder = "#000000";
			void SetData(data)
			{
				if (tostring(data) != "" && tostring(data) != "0")
					src = "<"+data+"的情侣>";
				else
					src = "";
			}
		}
	}

	
}