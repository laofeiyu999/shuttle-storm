import("$./../Game/ClassDef_PlayUI_S_Energy_Name.gml");
import("$./../Game/ClassDef_PlayUI_Skill.gml");
import("$./ClassDef_KeyType.gml");
import("$./../Game/ClassDef_PlayUI_StorePower.gml");
import("$./../../Logic/Game/ClassDef_PlayLogic_Skill_Icon.gml");

class VTraining_UI item
{
	size="100%,100%";bkcolor=-1;alpha = 0;
	void Init()
	{
		//我的昵称+能量
		//参数：见类定义$./../Game/ClassDef_PlayLogic_Sub.gml
		staticvar s_Head = new VRole_P1_Name_Energy_UI
		{
			halign(2,0);valign(2,0);
			//参数1 param:true / false 显示隐藏
			void SetData2(param){show = param;}
//			Init();
		}
		//能量条变化提示
		staticvar s_PowerTips = new item
		{
			size(199,25);halign(2,111);valign(2,0);
			var _temp = 0;
			var _tips1 = new img
			{
				size(199,25);show=false;
				src="$./imgs/02.tga";
			}
			var _tips2 = new img
			{
				size(199,25);show=false;
				src="$./imgs/01.tga";
			}

			void SetTips(param)
			{
				if(param==true)
				{
					_temp = 0;
				}
				else
				{
					_temp = 1;
				}
				_tips1.show=param;

				while(1)
				{
					if(_temp==0)
					{
						sleep(300);
						_tips2.show="xor";
					}
					else
					{
						_tips1.show=false;
						_tips2.show=false;
						return;
					}
				}
			}
		}

		//我的技能
		//参数：见类定义$./../Game/ClassDef_PlayLogic_Sub.gml
		staticvar s_Skill = new item
		{
			pos(20,50);size(53,53);
			new img
			{
				src="$./../PublicImage/Skill/skill_2_0.tga";
			}
			var _skill = new img
			{
				pos(4,4);size(45,45);
			}
			//参数1 param:true / false 显示隐藏
			void SetData2(param){show = param;}
			void SetData(enterID)
			{
				_Skill.src = "$./../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(enterID)+".tga";
			}
//			Init();
		}

		staticvar s_LostPoint = new img//剩余球数图片
		{
			size(70,20);
			//pos(466,16);
			show=false;
			src="$./imgs/LostPoint.tga";
			top = 16;
			halign(100,-558+width);
		}

		//剩余球数
		//参数data：剩余球数
		staticvar s_RemainingPoint = new item
		{
			size="160,67";
			//pos(440,40);
			top = 40;
			halign(100,-584+width);
			show=false;
			//个位数
			var _progress_one = new img
			{
				pos(50,0);
			}
			//十位数
			var _progress_two = new img
			{
				pos(0,0);
			}
			//是否显示
			void SetShowPoint(param)
			{
				show=param;
				parent.s_LostPoint.show=param;
			}
			void SetData(data)
			{
				var _data_i = data%10;     //个位
				var _data_j = data/10;     //十位

				_progress_one.src = "$./imgs/new_num"+_data_i+".tga";
				_progress_two.src = "$./imgs/new_num"+_data_j+".tga";
			}
		}

		staticvar s_GoalPoint = new img//完成数
		{
			size(54,20);//pos(750,16);
			show=false;
			src="$./imgs/GoalPoint.tga";
			top = 16;
			halign(100,-274+width);
		}

		staticvar s_FinishPoint = new img//目标数
		{
			size(54,20);//pos(850,16);
			show=false;
			src="$./imgs/FinishPoint.tga";
			top = 16;
			halign(100,-174+width);
		}

		//右上角进度
		//参数 data2:当前数
		//参数 data3:总数
		staticvar s_Point = new item
		{
			size="350,190";//pos(620,0);
			halign(100,-404+width);
			//个位数
			var _progress1_one = new img
			{
				pos(120,45);
			}
			//十位数
			var _progress1_two = new img
			{
				pos(70,45);
			}
			//斜杠
			new img
			{
				pos(170,45);
				src = "$./imgs/Slash.tga";
			}
			//个位数
			var _progress2_one = new img
			{
				pos(270,45);
			}
			//十位数
			var _progress2_two = new img
			{
				pos(220,45);
			}
			void SetData(data1,data2,data3)
			{
				//当前数
				var _data2_i = data2%10;     //个位
				var _data2_j = data2/10;     //十位
				//总数
				var _data3_i = data3%10;     //个位
				var _data3_j = data3/10;     //十位

				_progress1_one.src = "$./imgs/new_num"+_data2_i+".tga";
				if(_data2_j>0)
				{
					_progress1_two.src = "$./imgs/new_num"+_data2_j+".tga";
				}

				_progress2_one.src = "$./imgs/new_num"+_data3_i+".tga";
				if(_data3_j>0)
				{
					_progress2_one.pos(270,45);
					_progress2_two.src = "$./imgs/new_num"+_data3_j+".tga";
				}
				if(_data3_j==0)
				{
					_progress2_one.pos(220,45);
				}
				//动画
				_progress1_one.setParamTimer("pos","120,45","70,25",300,0);
				_progress1_two.setParamTimer("pos","70,45","0,25",300,0);

				_progress1_one.setParamTimer("size","67,67","120,120",300,0);
				_progress1_two.setParamTimer("size","67,67","120,120",300,0);

				_progress1_one.setParamTimer("pos","70,25","120,45",300,0);
				_progress1_two.setParamTimer("pos","0,25","70,45",300,0);

				_progress1_one.setParamTimer("size","120,120","67,67",300,0);
				_progress1_two.setParamTimer("size","120,120","67,67",300,0);
			}

			//参数1 param:true / false 显示隐藏
			void SetData2(param)
			{
				show = param;
				parent.s_GoalPoint.show=param;
				parent.s_FinishPoint.show=param;
			}
		}

		//开始训练+完成的提示
		//参数 data2: 文件名
		staticvar s_TipInfo = new item
		{
			var _sizeW = 0;
			var _tempdata2 = "";
			//参数1 param:true / false 显示隐藏
			void SetData2(param)
			{
//				pos(200,300);
				halign(50,0);valign(50,0);
				if(param)
				{
					show = param;
					_tipInfo.setParamTimer("pos","0,35","0,0",300,700);
					_tipInfo.setParamTimer("size",""+_sizeW+",0",""+_sizeW+",69",300,700);
					printf("1");
				}
				else
				{
					_tipInfo.setParamTimer("pos","0,0","0,35",300,700);
					_tipInfo.setParamTimer("size",""+_sizeW+",69",""+_sizeW+",0",300,700,"del");
					printf("2");
				}
			}
			void SetData(data1,data2)
			{
				printf("训练类型："+data2);
				staticvar _tipInfo = new img
				{
					src = "$./imgs/"+data2+"1.tga";
					size(width,0);
					parent.size(width,69);
					parent._sizeW=width;
					parent._tempdata2 = data2;
				}
			}
		}

		//键盘-元素名字需要与逻辑相同
		//参数1 param:true / false 显示隐藏键盘
		staticvar s_KeyBoard = new item
		{
			size = "100%,100%";pos(558,18);
			//bgcolor = "#ff";alpha=50;
			/*对按键的操作
			参见类定义 $./../GmlCtrls/Common/ClassDef_Text.gml
			//设置数据
				void SetData(data1)  参数1 ：可用
			//设置动画
				void SetAni(param)  参数1 ：1开始动画 2停止动画-按下状态 3停止动画-抬起状态
			*/

			//方向键：左
			staticvar _left = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}

			//方向键：右
			staticvar _right = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//方向键：上
			staticvar _up = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//方向键：下
			staticvar _bottom = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//击球键：(J)
			staticvar _J = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//击球键：(K)
			staticvar _K = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//击球键：(L)
			staticvar _L = new VKey_Type_UI
			{
				//设置图片
				void SetData(data1)
				{
					SetMyType(data1);
					parent.TypeSet();
				}
				//设置显示效果
				void SetAni(param)
				{
					SetMySpeed(param);
				}
			}
			//参数1 param:true / false 显示隐藏键盘
			void SetData2(param)
			{
				show = param;
			}

			//所有按键的排版
			void TypeSet()
			{
				_L.pos(430-_L._temp.width,parent.height-175);
				_K.pos(430-_L.width-_K.width+12,parent.height-175);
				_J.pos(430-_L.width-_K.width-_J.width+24,parent.height-175);
				_right.pos(430-_L.width-_K.width-_J.width-_right.width+24,parent.height-175);
				_bottom.pos(430-_L.width-_K.width-_J.width-_right.width-_bottom.width+36,parent.height-175);
				_left.pos(430-_L.width-_K.width-_J.width-_right.width-_bottom.width-_left.width+48,parent.height-175);
				_up.pos((430-_L.width-_K.width-_J.width-_right.width-_bottom.width-_left.width+13)+(_right.width+_bottom.width+_left.width)/2,parent.height-215);
			}
		}

		//教练形象
		staticvar s_Coach = new item
		{
			size(300,300);
			//pos(0,350);
			valign(100,-418+height);
			show=false;//bgcolor = "#fff";alpha=50;
			var _people = new img
			{
				size(300,300);
			}
			//设置教练图片
			//参数:	role 1汪涵 2杜海涛 3何炅 4李维嘉 5吴昕 6谢娜
			//		type 1说话 2高兴 3沮丧
			//2010-4-1 老虎修改
			void SetType(role,type)
			{
				_people.src="$./coach/Coach_"+role+"_"+type+".tga";
			}
		}

		//对话框
		//参数 data1:对话的内容
		staticvar s_DLG = new item
		{
			var _isShow = 1;//bgcolor = "#ffff";alpha=50;
			size = "944,110";
			//pos(40,650);
			left=40;
			top = parent.s_Coach.top+parent.s_Coach.height;
			show=false;
			
			//背景图
			var _bk = new img
			{
				src = "$./imgs"+window.g_Sex+"/Box_1.tga";
				size(944,110);
			}
			//对话框：文字
			var _Text = new item
			{
				pos(20,15);
				var _temp = new BaseText
				{
					txtborder = "#CCCCCC";
					size(780,80);
//					font="黑体,-1,18";
					font="幼圆,-1,20";bold = true;
//					font="宋体,-1,20";bold = true;
					autoenter=true;ycenter=true;
				}
			}

			//参数1 param:true / false 显示隐藏
			void SetData2(param)
			{
				parent.s_Coach.show=param;
				parent.s_Btn_SkipVideo.show=param;
				parent.s_Btn_RetryTrain.show=param;
				parent.s_Btn_NextVideo.show=param;
				show=param;
				if(param==true)
				{
					//_bk.setParamTimer("size","0,0","944,110",300,700);
					_Text.setParamTimer("size","0,0","780,80",300,300);
					_isShow=2;
				}
				else
				{
					_Text.size(0,0);
					_isShow=1;
				}
			}

			//参数 data1:对话的内容
			void SetData(data1)
			{
				_Text._temp.src = data1;
				if(_isShow==2)
				{
					_Text.size(0,0);
					_Text.setParamTimer("size","0,0","780,80",300,300);
				}
			}
		}

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VGame_StorePower_UI{valign(90,-50);halign(50,0);}

		//跳过录像：按钮
		staticvar s_Btn_SkipVideo = new VBTN_A_New
		{
			pos = "890,664";
			left = parent.s_DLG.left+parent.s_DLG.width-width-10;
			top = parent.s_DLG.top+15;
			InitText("跳过录像");show=false;
		}

		//重复训练：按钮
		staticvar s_Btn_RetryTrain = new VBTN_A_New
		{
			//pos = "890,720";
			left = parent.s_DLG.left+parent.s_DLG.width-width-10;
			top = parent.s_DLG.top+parent.s_DLG.height-height-15;
			InitText("重复训练");show=false;
		}

		staticvar s_Btn_NextVideo = new VBTN_A_New
		{
			//pos = "812,720";
			left = parent.s_DLG.left+parent.s_DLG.width-width-100;
			top = parent.s_DLG.top+parent.s_DLG.height-height-15;
			InitText("下一步");show=false;
		}

		//大按键
		new VTipBigKey{}
	}//end init()

	//鼠标延时隐藏
	new HideCursor_UI{}
};