//房间界面的显示部分类定义
//@刘高辰
//08年9月12日

class VRoom_UI item
{
	size = "100%,100%";//bgcolor = "#ff";
	valign(100,0);
	void GetMyTop(_p){return (height-_p.height-19);}
	void GetTextPos(_p1,_p2)
	{
		return ""+(_p1.left+(_p1.width-_p2.width)/2)+","+(height-_p2.height);
	}
	void GetTextLeft(_p,_width){return _p.left+(_p.width-_width)/2;}
	void GetTextTop(_p){return height-_p.height;}
	void Init()
	{
		new img{halign(56,-35);valign(100,-5);src = "$./imgs"+window.g_Sex+"/dtk.tga";}
		
		//GM自动开始房间提示信息字
		staticvar s_GMInfo = new img
		{
			size(100%,100%);
			valign(50,0);
			halign(50,0);
			show = false;
			src = "$./imgs/gmroomtips-text.tga";
		}
		//商城：按钮
		staticvar s_Btn_Mall = new VBTN_Hall_Mall_New
		{
			SetRelatePos(2);
			SetPos(361,12);
			void CallBack_OnImgChange(index){parent.s_BTN_Mall_Name.SetData(index);}
			void ClearBtnTextState(state)
			{
				m_Selected = state;
				parent.s_BTN_Mall_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Mall_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/sc0");
			//pos=parent.GetTextPos(parent.s_BTN_Mall,this);
			halign(100,-378);valign(100,-3);
		}

		
		//任务：Radio
		staticvar s_BTN_Task = new VBTN_Hall_Task_New
		{
			SetRelatePos(2);
			SetPos(313,12);
			void CallBack_OnImgChange(index){parent.s_BTN_Task_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Task_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Task_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/rw0");
			//pos(parent.GetTextLeft(parent.s_BTN_Task,width)-4,parent.GetTextTop(this));
			halign(100,-332);valign(100,-3);
		}
		//邮件：按钮
		staticvar s_Btn_Mail = new VBTN_Hall_mail_New
		{
			SetRelatePos(2);
			SetPos(267,12);
			void CallBack_OnImgChange(index){parent.s_BTN_Mail_Name.SetData(index);}
			void ClearBtnTextState(state)
			{
				m_Selected = state;
				parent.s_BTN_Mail_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Mail_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/yj0");
			//pos=parent.GetTextPos(parent.s_Btn_Mail,this);
			halign(100,-284);valign(100,-3);
		}
		//背包：按钮
		staticvar s_Btn_Pack = new VBTN_Hall_pack_New
		{
			SetRelatePos(2);
			SetPos(213,12);
			void CallBack_OnImgChange(index)
			{
				parent.s_Btn_Pack_Name.SetData(index);
			}
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_Btn_Pack_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_Btn_Pack_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/bb0");
			//pos=parent.GetTextPos(parent.s_Btn_Pack,this);
			halign(100,-234);valign(100,-3);
		}

		//观战列表：按钮
		staticvar s_Btn_LookList = new VBTN_Hall_viewList_New
		{
			SetRelatePos(2);
			SetPos(155,17);
			void CallBack_OnImgChange(index){parent.s_Btn_LookList_Name.SetData(index);}
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_Btn_LookList_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_Btn_LookList_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/gzlb0");
			//pos=parent.GetTextPos(parent.s_Btn_LookList,this);
			halign(100,-165);valign(100,-3);
		}
		//更换队伍:：按钮
		staticvar s_Btn_ChangeTeam = new VBTN_Hall_ChangeTeam_New
		{
			SetRelatePos(2);
			SetPos(105,17);
			void CallBack_OnImgChange(index){parent.s_Btn_ChangeTeam_Name.SetData(index);}
		}
		staticvar s_Btn_ChangeTeam_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/ghdw0");
			//pos=parent.GetTextPos(parent.s_Btn_ChangeTeam,this);
			halign(100,-115);valign(100,-3);
		}
		//邀请：按钮
		staticvar s_Btn_Invite = new VBTN_Hall_Invite_New
		{
			SetRelatePos(2);
			SetPos(53,17);
			void CallBack_OnImgChange(index){parent.s_Btn_Invite_Name.SetData(index);}
			void ClearBtnTextState(state)
			{
				m_Selected = state;
				parent.s_Btn_Invite_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_Btn_Invite_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/yqwj0");
			//pos=parent.GetTextPos(parent.s_Btn_Invite,this);
			halign(100,-63);valign(100,-3);
		}
		//房间设置：按钮
		staticvar s_Btn_RoomSet = new VBTN_Hall_RomeSet_New
		{
			SetRelatePos(2);
			SetPos(-3,12);
			void CallBack_OnImgChange(index){parent.s_Btn_RoomSet_Name.SetData(index);}
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_Btn_RoomSet_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_Btn_RoomSet_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/fjsz0");
			//pos=parent.GetTextPos(parent.s_Btn_RoomSet,this);
			halign(100,-7);valign(100,-3);
		}
		//开始游戏：按钮
		staticvar s_Btn_StartGame = new VBTN_GameStart_New
		{
			valign(100,-70);halign(100,0);
		}
		//准备：按钮
		//参数：0未知 1等待状态 2准备状态 
		staticvar s_Btn_Ready = new VBTN_GamePrepare_New
		{
			valign(100,-70);halign(100,0);
		}
		//取消准备：按钮
		//参数：0未知 1等待状态 2准备状态 
		staticvar s_Btn_CancelReady = new VBTN_CancelPrepare_New
		{
			valign(100,-70);halign(100,0);
		}
		//当前选择的地图
		//data1:ID
		//data2:地图的名字
		staticvar s_Item_CurrMap = new item
		{
			//pos="455,626";
			halign(56,-35);valign(100,-5);
			size = "174,136";//bgcolor = "#FF";alpha = 50;
			//名字
			var _name = new BaseText
			{
				//pos = "13,10";
				size = "150,22";
				valign(107,0);halign(50,0);
				//ycenter = true;
				xcenter = true;
			}
			//ID
			var _ID = new img
			{
				//pos = "18,50";
				valign(67,0);halign(50,0);
			}

			//局制
			//data1:几局制 1，2，3
			var _GameNum = new img
			{
				//pos = "88,105";
				valign(17,0);halign(50,0);
				void SetData(data1)
				{
					src = "$./imgs/juzhi_"+data1+".tga";
				}
			}

			void SetData(data1,data2)
			{
				_ID.src = "$./../PublicImage/MapIcon/Room/"+window.GetMapIconName(data1)+".tga";
				_name.src = "地图名称："+data2;
			}
		}
		
		//押注金额
		//value:-1,不显示 
		staticvar s_Wager = new item
		{
			size = "700,37";pos = "0,80";show = false;//bgcolor = "#FF";
			new img{src = "$./imgs/wagervalue.tga";pos(0,3);}
			var _num = new VN2NumShow
			{
				pos = "90,0";
				//setNum(param2);
				void NEWNUM()//在这里产生一个数字显示对象
				{
					new img;
				}
				void NUMSET(objname,index,num)//设置数字对象的显示
				{
					set find(objname)
					{
						src = "$./../PublicImage/num/wager.tga";
						clipani(35,37,1,10);
						aniindex=num;
						left=index*25;
					}
				}
			}
			//var _G = new img{src = "$./imgs/Gold.tga";}

			void SetData(value)
			{
//				alert("SetData:"+value);
				show = false;
				if (value > 0)
				{
					show = true;
					_num.setNum(value);
					//_G.pos(toint(window.GetNumCount(toint(value)))*25+90,0);
				}
			}
		}
	}
}