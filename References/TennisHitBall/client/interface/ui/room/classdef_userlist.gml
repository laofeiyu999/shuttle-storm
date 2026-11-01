//房间界面-玩家列表DB List显示类定义
//@刘高辰 夏洋洋修改于2009-11-22
//08年9月16日

//一行显示类：P2Pping值+头像+昵称+状态(非房主：准备与否)+房主标识(房主：钥匙,非房主:踢)+个人信息(按钮)
class VColumn_RoomUser_UI item
{
	size = "320,40";bgcolor = -1;
//	bgcolor = "#FF";alpha = 50;

	void Init()
	{
		//房主标识
		//房主标识：(房主：钥匙,非房主:踢)
		//参数 data1：0不是 1是
		staticvar s_Sign = new item
		{
			pos = "0,0";size = "40,40";
			//房主：钥匙
			var _Img_Key = new img
			{
				pos = "5,15";src = "$./imgs/new/RoomOwner.tga";show = false;
			}
			//非房主：踢按钮
			var _Btn_Kick = new VBTN_Kick_New{pos = "5,20";show = false;SetHangID(30);}
		}
		//队伍标识
		//参数 data1 :1红 2蓝
		staticvar s_Team = new img
		{
			pos = "50,10";
			void SetData(data)
			{
				src = "$./imgs/new/team"+data+".tga";
			}
		}
		
		//家族徽章
		staticvar s_FamilyIcon = new item
		{
			size= "25,25";show = false;
			valign(70,0);left = 23;
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
			void SetData(state,data1,data2,data3,data4,data5,data6)
			{
				if(state)
				{
					SetFamilyBadge(data1,data2,data3,data4,data5,data6);
					show = true;
				}
				else
				{
					show = false;
				}
			}
		}
		//昵称
		//参数 data1:
		staticvar s_NkName = new VipText
		{
			pos = "49,15";size = "90,20";cursor = window.CURSOR_HAND;
			xcenter = true;ycenter = true;	
			void OnMouseOver()
			{
				txtunderline = 1;
			}
			void OnMouseOut()
			{
				txtunderline = 0;
			}
		}
		//等级
		//参数：
		staticvar s_Lv = new BaseText
		{
			pos = "145,19";
			void SetData(data)
			{
				src = "Lv:"+data;
			}
		}
		//技术类型
		//参数：
		staticvar s_Technic = new BaseText
		{
			pos = "175,19";
			void SetData(data)
			{
				src = window.GetTechnicByType(data)
			}
		}
		//性别
		//参数：1男 2女
		staticvar s_Sex = new VSex_UI{pos = "225,10";size = "27,30";}
		//个人信息:按钮
		//参数：暂无
		staticvar s_Btn_Info = new VBTN_RoleInfo_New{pos = "120,0";}
		
		//提取用户ID
		var _UserID = window.find("VRoom_UserList_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_USERDT_UID); //玩家ID
		
		//加为好友
		staticvar s_Btn_AddFriend = new VBTN_AddFriend_New
		{
			var _x = 142+2;
			var _y = 0;
			pos(_x,_y);
		}

		//私聊
		staticvar s_Btn_PrivateChat = new VBTN_PrivateChat_New
		{
			var _x = 144+23;
			var _y = 0;
			pos(_x,_y);
		}

		//赠花
		staticvar s_Btn_PresentFlower = new VBTN_PresentFlower_New
		{
			var _x = 167+25;
			var _y = 1;
			pos(_x,_y);
		}
		//动作
		staticvar s_Btn_Action = new VBTN_Action_New
		{
			var _x = 142+2;
			var _y = 0;
			pos(_x,_y);
		}

		if(_UserID == window.GetMyUID())  //创建自己
		{
			//只显示动作，屏蔽加为好友、私聊、赠花
			s_Btn_AddFriend.show = false;
			s_Btn_PrivateChat.show = false;
			s_Btn_PresentFlower.show = false;
			s_Btn_Action.show=true;
		}
		else							//创建其他角色
		{
			//不显示动作，显示加为好友、私聊、赠花
			s_Btn_AddFriend.show = true;
			s_Btn_PrivateChat.show = true;
			s_Btn_PresentFlower.show = true;
			s_Btn_Action.show=false;
		}

		//P2Pping值
		//参数 data1 : <60绿 60-100黄 >100红
		staticvar s_Ping = new VBTN_HOVER//item
		{
			SetHangID(48);
			pos = "130,33";size(75,5);//bgcolor = "#FF";
			var _i = 0;
			while (_i < 5)
			{
				new img{src = "$./imgs/new/ping00.tga";pos(parent._i*15,0);name = "ping_sub"+parent._i;}
				_i += 1;
			}
			

			//设置子项的Src
			void SetPingSubSrc(max,srcindex)
			{
				var _i = 0;
				while (_i < 5)
				{
					find("ping_sub"+_i).show = false;
					_i += 1;
				}

				_i = 0;
				while (_i < max)
				{
					find("ping_sub"+_i).show = true;
					find("ping_sub"+_i).src = "$./imgs/new/ping0"+srcindex+".tga";
					_i += 1;
				}
			}

			void SetData(data1)
			{
				SetPingSubSrc(5,0);
				data1 = toint(data1);
				SetHangSrc("网络延时:"+data1+"ms");
				if (data1 <= window.g_Ping_12)
				{
					SetPingSubSrc(1,1);return;
					return;
				}	
				if (data1 <= window.g_Ping_23)
				{
					SetPingSubSrc(2,2);return;
				}
				if (data1 <= window.g_Ping_34)
				{
					SetPingSubSrc(3,3);return;
				}
				if (data1 <= window.g_Ping_45)
				{
					SetPingSubSrc(4,4);return;
				}	
				SetPingSubSrc(5,5);
			}
		}
		//状态
		//状态(房主：啥也没有。非房主：准备与否)
		//参数 data1:0未知 1等待 2准备
		staticvar s_State = new img
		{
			pos = "250,0";valign(100,3);
			src = "$./imgs/Ready.tga";
			void SetData(data1)
			{
				if(data1 == 2){show = true;}else{show = false;}
			}
		}
	}

	void OnMouseOver()
	{
		//s_NkName.color = "#8C1C1C";

		//s_Lv.color = "#8C1C1C";
		//s_Technic.color = "#8C1C1C";

	}
	void OnMouseOut()
	{
		//s_NkName.color = "#0";
		//s_Lv.color = "#0";
		//s_Technic.color = "#0";
	}
	//需要被显示的类覆盖
	void OnMySelect(){}	//选择的效果
	void OnMyUnSelect(){}				//不选择的效果
}

//
//总的类：List
//
class VRoom_UserList_UI VN2ListCtrl
{
	//需要显示时改变
	size="320,160";valign(25,0);halign(0,0);
	bgcolor = -1;alpha = -1;
};