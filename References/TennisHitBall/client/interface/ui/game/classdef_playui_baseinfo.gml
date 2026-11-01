//游戏内界面的部分类定义->基础提示信息

//基础提示信息：显示
//交换场地+局数+比分+局点+破发点
class VRole_BaseTipInfo_UI item
{
	size = "100%,100%";
	var _tempparam = 0;
	void Init()
	{
		//局数
		//参数 data2: 第几局 99.决胜局
		staticvar s_GameNum = new img
		{
			//pos = "390,310";
			halign(50,0);valign(35,0);
			size = "260,0";
			void SetNum(param)
			{
				parent._tempparam = param;
				if(param == 99)
				{
					src = "$./imgs/No_7_Board.tga";
				}
				else
				{
					src = "$./imgs/No_"+param+"_Board.tga";
				}
			}
			void SetData(data1,data2)
			{
				if (window.g_DEBUG)
				{
					if (data2>6 && data2<99)
					{	
						printf("B# 赶紧告诉小何，局数不对了:"+data2);
					}
				}
				SetNum(data2);
				setParamTimer("size","260,0","260,70",333,1133);
				//setParamTimer("pos","390,310","390,240",333,1133);
				setParamTimer("valign","35,0","35,-70",333,1133);
				setParamTimer("size","260,70","260,0",333,2033);
				//setParamTimer("pos","390,240","390,310",333,2033);
				setParamTimer("valign","35,-70","35,0",333,1133);
			}
		}

		//比分
		//参数 data2:自己的比分
		//参数 data3:对方的比分
		staticvar s_Point = new item
		{
			size = "800,135";//bgcolor= "#ff";
			halign(50,0);
			valign(50,0);
			var _p1num_1 = new img						//个位自己的比分
			{
				size = "127,0";pos="225,7";
			}
			var _p1num_2= new img						//十位自己的比分
			{
				size = "127,0";pos="120,7";
			}
			var _p1num_3= new img						//百位自己的比分
			{
				size = "127,0";pos="15,7";
			}
			var _Temp = new img							//斜杠
			{
				size = "84,0";show = false;
				valign(50,0);
				halign(50,0);
				src = "$./imgs/Wang.tga";
			}
			var _p2num_1 = new img						//个位对方的比分
			{
				size = "127,0";pos="655,7";
			}
			var _p2num_2 = new img						//十位对方的比分
			{
				size = "127,0";pos="550,7";
			}
			var _p2num_3= new img						//百位对方的比分
			{
				size = "127,0";pos="445,7";
			}
			var _data2_1 = 0;							//计算个位用自己的比分
			var _data2_2 = 0;							//计算十位用自己的比分
			var _data2_3 = 0;							//计算百位用自己的比分

			var _data3_1 = 0;							//计算个位用对方的比分
			var _data3_2 = 0;							//计算十位用对方的比分
			var _data3_3 = 0;							//计算百位用对方的比分

			//参数1：
			//参数2：自己的比分
			//参数3：对方的比分
			void SetData(data1,data2,data3)
			{
				print("D# 自己的分数:"+data2+",对方的分数:"+data3);
				var temp = toint(data2)%1000;
				_data2_1 = temp%10;					//计算个位
				_data2_2 = temp%100/10;				//计算十位
				_data2_3 = temp/100;				//计算百位

				if(toint(data2) == -1)//非决胜局
				{
					temp = "A";
					_p1num_1.src = "$./imgs/"+temp+".tga";
					_p1num_2.show=false;
					_p1num_3.show=false;
				}
				else
				{
					_p1num_2.show=true;
					_p1num_3.show=true;
					_p1num_1.src = "$./imgs/"+_data2_1+".tga";
					_p1num_2.src = "$./imgs/"+_data2_2+".tga";
					if(toint(data2)>99){_p1num_3.src = "$./imgs/"+_data2_3+".tga";}
				}
				
				temp = toint(data3)%1000;
				_data3_1 = temp%10;
				_data3_2 = temp%100/10;
				_data3_3 = temp/100;

				if(toint(data3) == -1)
				{
					temp = "A";
					_p2num_1.src = "$./imgs/"+temp+".tga";
					_p2num_1.pos="445,7";
					_p2num_2.show=false;
					_p2num_3.show=false;
				}
				else
				{
					_p2num_2.show=true;
					_p2num_3.show=true;
					_p2num_1.src = "$./imgs/"+_data3_1+".tga";
					_p2num_2.src = "$./imgs/"+_data3_2+".tga";
					if(toint(data3)>99)
					{
						_p2num_3.src = "$./imgs/"+_data3_3+".tga";
						_p2num_1.pos="655,7";
						_p2num_2.pos="550,7";
						_p2num_3.pos="445,7";
					}
					if(toint(data3)<100){_p2num_1.pos="550,7";_p2num_2.pos="445,7";}
				}

				_Temp.timer(1133,"show=true");
				_p1num_1.setParamTimer("size","127,0","127,119",333,1133);
				_p1num_2.setParamTimer("size","127,0","127,119",333,1133);
				_p1num_3.setParamTimer("size","127,0","127,119",333,1133);
				_Temp.setParamTimer("size","84,0","84,42",333,1133);
				_p2num_1.setParamTimer("size","127,0","127,119",333,1133);
				_p2num_2.setParamTimer("size","127,0","127,119",333,1133);
				_p2num_3.setParamTimer("size","127,0","127,119",333,1133);

				_p1num_1.setParamTimer("size","127,119","127,0",333,2033);
				_p1num_2.setParamTimer("size","127,119","127,0",333,2033);
				_p1num_3.setParamTimer("size","127,119","127,0",333,2033);
				_Temp.setParamTimer("size","84,42","84,0",333,2033);
				_p2num_1.setParamTimer("size","127,119","127,0",333,2033);
				_p2num_2.setParamTimer("size","127,119","127,0",333,2033);
				_p2num_3.setParamTimer("size","127,119","127,0",333,2033);
				_Temp.timer(4033,"show=false");
			}
		}
		//比分衬底
		new img
		{
			width = "100%";
			valign(50,0);
			halign(50,0);
			src = "$./imgs/Score_D.tga"
		}

		//赛点
		//参数 data2：0.默认状态 2.赛点
		staticvar s_SetPoint = new img
		{
			halign(50,0);
			valign(50,0);
			src = "$./imgs/MatchPoint.tga";
			size = "343,0";
			void SetData()
			{
				setParamTimer("size","343,0","343,104",333,1133);
				setParamTimer("size","343,104","343,0",333,2033);
			}
		}
		
		//局点 
		//参数 data2：0.默认状态 1.局点 
		staticvar s_GamePoint = new item
		{
			size = "346,69";
			halign(50,0);
			valign(66,0);
			var GamePoint = new img
			{
				src = "$./imgs/PointBoard.tga";
				size = "346,0";
			}
			var HighShine = new img3d
			{
				src = "$./imgs/B_LightRoll.tga";
				pos = "-100,0";
				SetShader("2d_add_texture.fx");
			}
			void ShineSound()
			{
				window.PlaySound(103);
			}
			void SetData()
			{
				GamePoint.setParamTimer("size","346,0","346,69",333,1133);
				HighShine.setParamTimer("pos","-100,0","346,0",233,1800);
				timer(1800,"ShineSound");
				GamePoint.setParamTimer("size","346,69","346,0",333,2033);
			}
		}

		//破发点
		//参数 data2： 0.不是破发点 1.有
		staticvar s_BreakPoint = new item
		{
			size = "346,69";
			halign(50,0);
			valign(66,0);
			var BreakPoint = new img
			{
				src = "$./imgs/BreakPoint.tga";
				size = "346,0";
			}
			var HighShine = new img3d
			{
				src = "$./imgs/B_LightRoll.tga";
				pos = "-100,0";
				SetShader("2d_add_texture.fx");
			}
			void End()
			{
				GamePoint.size = "346,0";
			}
			void ShineSound()
			{
				window.PlaySound(103);
			}
			void SetData()
			{
				BreakPoint.setParamTimer("size","346,0","346,69",333,1133);
				HighShine.setParamTimer("pos","-100,0","346,0",233,1800);
				timer(1800,"ShineSound");
				BreakPoint.setParamTimer("size","346,69","346,0",333,2033);
			}
		}

		//交换场地
		//参数 data2: 0.没有交换场地 1.有
		staticvar s_ChangeGround = new item
		{
			size = "346,69";
			halign(50,0);
			valign(66,0);
			var ChangeGround = new img
			{
				src = "$./imgs/ChangeSites.tga";
				size = "346,0";
			}
			var HighShine = new img3d
			{
				src = "$./imgs/B_LightRoll.tga";
				pos = "-100,0";
				SetShader("2d_add_texture.fx");
			}
			void ShineSound()
			{
				window.PlaySound(103);
			}
			void SetData()
			{
				ChangeGround.setParamTimer("size","346,0","346,69",333,1133);
				HighShine.setParamTimer("pos","-100,0","346,0",233,1800);
				timer(1800,"ShineSound");
				ChangeGround.setParamTimer("size","346,69","346,0",333,2033);
			}
		}
	}
};