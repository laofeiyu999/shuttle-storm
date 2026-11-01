//
//游戏内界面的界面部分的类定义:开始>>双打
//

//P1角色的属性-界面
class VRole_Attribute_P1_D_UI item
{
	size="532,105";//bgcolor = "#1255";alpha = "50";

	void Init()
	{
		//力量
		staticvar s_TStrength = new text
		{
			size = "98,20";
			//pos = "45,58";
			left=window.width*0.010;
			top = 58;
			xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "力量";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//技术
		staticvar s_TSkill = new text
		{
			size = "98,20";
//			pos = "45,78";
			left=window.width*0.010;
			top = 78;
			xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "技术";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//前场
		staticvar s_TForceHand = new text
		{
			size = "98,20";
//			pos = "195,58";
			left=window.width*0.175;
			top = 58;
			xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "正手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//后场
		staticvar s_TBackHand = new text
		{
			size = "98,20";
//			pos = "195,78";
			left=window.width*0.175;
			top = 78;
			xcenter = true;
//			left = parent.s_TSkill.left + 180;
//			top = parent.s_TSkill.top;
			font = "宋体,-1,20";color = "#000000";//src = "反手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//能量
		staticvar s_TEnergy = new text
		{
//			pos = "370,58";
			left=window.width*0.322;
			top = 58;
			size = "100,20";
			xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "能量";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//昵称
		staticvar s_Nkname = new text
		{
			size = "170,26";
			//pos = "70,26";
			left=window.width*0.060;
			top = 26;
			xcenter = true;ycenter = true;
			font = "黑体,-1,20";color = "#ffffff";//src = "昵称";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//称号
		staticvar s_Title = new text
		{
			size = "135,20";
			//pos = "260,30";
			left=window.width*0.26;
			top = 30;
			xcenter = true;ycenter = true;
			font = "黑体,-1,12";color = "#ffffff";//src = "称号";bgcolor = "#FFFF";
			void SetData(data1,data2){src = window.GetQualifyByQID(data2);}
		}
	}
};
/////////////////////////////////////////////////////////////////////////////////////////
//P2角色的属性-界面
class VRole_Attribute_P2_D_UI item
{
	size="532,105";//bgcolor = "#FF00FF";alpha = "50";

	void Init()
	{
		//力量
		staticvar s_TStrength = new text
		{
			size = "98,20";
			//pos = "107,58";
			left=(138-(window.width-1023)*0.294)+25;
//			left=window.width*0.010+596;
			top = 58;

			//xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "力量";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//技术
		staticvar s_TSkill = new text
		{
			size = "98,20";
//			pos = "107,78";
			left=(138-(window.width-1023)*0.294)+25;
			top = 78
			//xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "技术";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//正手
		staticvar s_TForceHand = new text
		{
			size = "98,20";
//			pos = "255,58";
			left=(292-(window.width-1023)*0.194)+25;
			top = 58
			//xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "正手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//反手
		staticvar s_TBackHand = new text
		{
			size = "98,20";
//			pos = "255,78";
			left=(292-(window.width-1023)*0.194)+25;
			top = 78
			//xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "反手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//能量
		staticvar s_TEnergy = new text
		{
			size = "70,20";
			left=(430-(window.width-1023)*0.094)+25;
			top = 58
			//xcenter = true;
			font = "宋体,-1,20";color = "#000000";//src = "反手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//昵称
		staticvar s_Nkname = new text
		{
			size = "160,26";
//			pos = "265,26";
			left=(352-(window.width-1023)*0.294)-30;
			top = 26;
			//xcenter = true;ycenter = true;
			font = "黑体,-1,20";color = "#ffffff";//src = "反手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = data2;}
		}
		//称号
		staticvar s_Title = new text
		{
			size = "135,20";
//			pos = "75,33";
			left=(170-(window.width-1023)*0.294);
			top = 33;
			//xcenter = true;ycenter = true;
			font = "黑体,-1,12";color = "#ffffff";//src = "反手";bgcolor = "#FFFF";
			void SetData(data1,data2){src = window.GetQualifyByQID(data2);}
		}
	}
};