//
//按钮层-上 显示定义
//

//登录
class VLogin_BtnLayer_Top_UI item
{
	size = "100%,32";bgcolor = -1;alpha = -1;
	//=========================与界面交互===========================
	void Init()
	{
		//上边栏背景、底纹、上边栏底边	夏洋洋修改、添加于2009-12-16
		new VPic3_TopLayer_BK_UI
		{
			size = "100%,32";
		}
		new VPic3_TopLayer_New_UI
		{
			size = "100%,32";
		}
		new item
		{
			size = "100%,32";
			fillimg = "$./imgs"+window.g_Sex+"/ls.tga";
		}
		new img
		{
			pos = "20,0";
			src = "$./imgs"+window.g_Sex+"/tital.tga";
		}
		//上边栏内容框背景	夏洋洋修改于2009-12-16
		new VPic3_TopLayer_ContentBK_UI
		{
			size = "200,32";
			pos = "160,3";
		}
		new BaseText
		{
			//  设置大区名
			void SetAreaName()
			{
				window.g_Row.InitByInt(window.GAMEUI,window.SELFDT,window.GAMEUI_SELFDT_SELFID,window.GetMyUID());
				if(!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					return window.DB_ERR;
				}
				var _Area = window.g_Row.GetData(window.GAMEUI_SELFDT_SAREA);	 // 大区名称
				window.g_Row.Release();
				return _Area;
			}
			pos = "170,3";size = "318,21";ycenter = true;bold = true;		//src = "登录";
			txtborder = "#FFFFFF";color = "#002D56";
			src = SetAreaName() + "  登录";

		}
		//修改密码：按钮(需求, 暂时不要了, 注释掉)
//		staticvar s_Btn_ModifyPW = new VBTN_changePassword_Login_New
//		{
//			//pos(parent.width-322,5);
//			halign(100,-322+width);top = 5;
//		}
		//注册帐号:按钮
		staticvar s_Btn_Register = new VBTN_LoggingIn_Login_New
		{
			//pos(parent.width-225,5);
			halign(100,-225+width);top = 5;
		}
		//充值:按钮
		staticvar s_Btn_Payment = new VBTN_AddMondy_Login_New
		{
			//pos(parent.width-132,4);
			halign(100,-132+width);top = 4;
		}
		//退出：按钮
		staticvar s_Btn_Exit = new VBTN_Exit_Login_New
		{
			//pos(parent.width-70,4);
			halign(100,-70+width);top = 4;
		}
		//new img{pos(parent.s_Btn_ModifyPW.left,parent.s_Btn_ModifyPW.top+16);src = "$./imgs"+window.g_Sex+"/xgmm-dy.tga";}
		new img{pos(parent.s_Btn_Register.left,parent.s_Btn_Register.top+16);src = "$./imgs"+window.g_Sex+"/zczh-dy.tga";}
		new img{pos(parent.s_Btn_Payment.left+2,parent.s_Btn_Payment.top+20);src = "$./imgs"+window.g_Sex+"/cz-dy.tga";}
		new img{pos(parent.s_Btn_Exit.left-1,parent.s_Btn_Exit.top+20);src = "$./imgs"+window.g_Sex+"/tc-dy.tga";}
	}
};

//================================================================================================
//频道+创建角色+大厅+房间：通用
class VBtnLayer_Top_Common_UI item
{
	size = "0%,0%";size = "100%,44";bgcolor = -1;alpha = -1;
	//=========================与界面交互===========================
	void Init()
	{
		//上边栏背景、底纹、上边栏底边	夏洋洋修改、添加于2009-12-16
		new VPic3_TopLayer_BK_UI
		{
			size = "100%,32";
		}
		new VPic3_TopLayer_New_UI
		{
			size = "100%,32";
		}
		new item
		{
			size = "100%,32";
			fillimg = "$./imgs"+window.g_Sex+"/ls.tga";
		}
		new img
		{
			pos = "0,0";//size = "129,40";
			src = "$./imgs"+window.g_Sex+"/tital.tga";
		}
		//上边栏内容框背景	夏洋洋修改于2009-12-16
		staticvar s_TextBk = new VPic3_TopLayer_ContentBK_UI
		{
			size = "200,32";
			pos = "160,3";
		}
		class BtnLayerFont text
		{
			ycenter = true;color = "#002D56";txtborder = "#FFFFFF";
			font = "宋体,-1,12";bold = true;//size = "100,21";
		};
		//参数 data1: "登录"
		staticvar s_Pos = new BtnLayerFont
		{
			pos = "170,6";//size = "100,21";
//			bgcolor = "#FF";alpha = 50;
			void SetData(data)
			{
				switch (data)
				{
				//case 1:src = SetAreaName() + "  登陆";
				case 2:src =   SetAreaName() + "  频道选择";parent.s_Btn_Return.SetHangID(1);break;
				case 3:src =   SetAreaName() + "  创建角色";break;
				case 10:src = SetAreaName() + "  游戏大厅";parent.s_Btn_Return.SetHangID(2);break;
				case 80:src = SetAreaName() + "";break;
				}
			}
			//  设置大区名
			void SetAreaName()
			{
				window.g_Row.InitByInt(window.GAMEUI,window.SELFDT,window.GAMEUI_SELFDT_SELFID,window.GetMyUID());
				if(!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					return window.DB_ERR;
				}
				var _Area = window.g_Row.GetData(window.GAMEUI_SELFDT_SAREA);	 // 大区名称
				window.g_Row.Release();
				return _Area;
			}
		}

		//频道类型+频道名+房间号
		//参数 data1: "新手区 > 旺仔 >"
		//	   data2: 1 (房间号)
		//	   data3: 房间名
		staticvar s_SVName = new BtnLayerFont
		{
			pos = "285,6";//bgcolor = "#FF";//size = "245,21";
			void SetData(data1,data2,data3)
			{
				if (parent.m_Pos == window.POS_ROOM)
				{
					left = parent.s_Pos.width + 180;
					var _roomID = toint(data2);
					if (_roomID > 10 && _roomID < 100)
					{
						_roomID = "0"+data2;
					}
					if (_roomID < 10)
					{
						_roomID = "00"+data2;
					}

					src = "  "+data1+" > 房间"+_roomID+" "+data3;
				}
				else
				{
					src = "  "+data1;
				}
				pos(parent.s_Pos.left+parent.s_Pos.width,6);
				parent.s_TextBk.width = parent.s_Pos.width + this.width + 50;
			}
		}
		
		//充值:按钮
		staticvar s_Btn_Payment = new VBTN_SmallAddMondy_New
		{
			//pos(parent.width-135,5);
			halign(100,-135);top = 5;
			SetHangID(10);
		}
		//设置：按钮
		staticvar s_Btn_GameSetUp = new VBTN_GameSet_New
		{
//			pos(parent.width-105,5);
			halign(100,-105);top = 5;
			SetHangID(11);
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VBTN_SmallHelp_New
		{
			//pos(parent.width-73,5);
			halign(100,-73);top = 5;
			SetHangID(9);
		}
		//返回：按钮
		staticvar s_Btn_Return = new VBTN_SmallRetrun_New
		{
			//pos(parent.width-45,5);
			halign(100,-45);top = 5;

		}
	}
};

//游戏中
class VGame_BtnLayer_Top_UI item
{
	size = "0%,0%";size = "100%,40";bgcolor = -1;
};