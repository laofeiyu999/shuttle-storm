//游戏内界面的部分类定义>>双打
//yxf 2008年11月19日


//p1昵称+P3昵称+能量
class VRole_P1_P3_Name_Energy_UI item
{
	size = "356,82";		

	staticvar m_UID = 2;  //自己决定用的底图颜色，1为蓝，2为红

	//用户UID
	void Init(UID)
	{
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}
		printf("B# 图片颜色VRole_P1_P3_Name_Energy_UI：m_UID:"+m_UID+",teamID:"+teamID+",UID:"+UID);

		//能量
		staticvar s_CurrEnergy = new item
		{

			size = "356,82";
			var _Img_Heigh = 10;
			var _Full_Width = 182;   //能量满时图片的宽度
			var _fireWidth = 42;	//能量星星宽度
			var p3_Img_Heigh = 7;   //p3图片高度
			var p3_Full_Width = 73;


			//p1的设置
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_ZJ_Energy_D.tga"; pos = "0,0"; size = "340,33";}
		    new img{src = "$./imgs"+parent.parent.m_UID+"/D_ZJ_EnergyD_D.tga"; pos="123,6";size(parent._Full_Width,parent._Img_Heigh);}
			new text
			{
				src = "能量";
				size = "25,20";pos = "97,4";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
				
			}
			//当前能量
			var _Curr = new img
			{
				pos = "123,6";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/D_ZJ_CurrentEnergy.tga";// 蓝色能量条
				void End()
				{
					parent._TempBeforSize = parent._TempSize;//如果上次尺寸等于当前尺寸
					parent._fireBefor = parent._fireNow;// 星星上次尺寸和星星当前尺寸
					if (parent._IsFull)	// 如果能量条满
					{
						parent._Full.OnMyUpDate();
					}
				}
			}
			//星星动画
			var _fires =new img
			{
				pos = "123,6";size(parent._fireWidth,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/ZJ_EnergyFires.tga";
				show = false;
				clipani(40,10,1,3);anispeed = 6;
			}
			//满能量
			var _Full = new img3d
			{
				
				pos = "123,6";show = false;size=""+parent._Full_Width+","+parent._Img_Heigh;
				src= "$./imgs"+parent.parent.m_UID+"/EnergyFull_D.tga";
				//setShader("2d_add_texture.fx");
				var _Begin = false;	//满能量开始开关

				void OnMyUpDate()
				{
					while (_Begin)// 满体力开始开关
					{
						show = "xor";
						sleep(200);
					}
					_Begin = false;
					show = false;
				}
			}

			// 最大能量提示字"MAX"
			var _max = new img
			{
				pos(305,2);show = false;
				src= "$./imgs"+parent.parent.m_UID+"/MAX.tga";//"MAX"提示字
			}


			//p3的设置
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DY_Energy_D.tga"; pos = "0,50"; size = "219,30";}
		    new img{src = "$./imgs"+parent.parent.m_UID+"/D_DY_EnergyD_D.tga"; pos="110,57";size(parent.p3_Full_Width,parent.p3_Img_Heigh);}
			
			//当前能量
			var p3_Curr = new img
			{
				pos = "110,57";size(0,parent.p3_Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/D_DY_CurrentEnergy.tga";// 蓝色
			}
			
			/**
			//自己最大的能量值
			var _num = new text
			{
				size = "50,20";pos="442,8";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
			}
			//MAX
			var _max =new text
			{
				size = "50,20";pos="442,8";//center = true;
				font = "宋体,-1,12";color = "#000000";
			}
			/**
			//自己最大的能量值
			var _num = new VN2NumShow
			{
				pos="492,5";
				src="$./imgs"+parent.parent.m_UID+"/Num.tga";
			}
			*/

			
			var _TempSize = 0;				//当前的尺寸
			var _TempBeforSize = 0;	//上次的尺寸
			var _IsFull = false;	//是否为满能量
			var _tempEffect = false;//是否可以放特效 false的时候播
			var _firstNum = true;	//是否为第一次设置能量
			var _fireBefor = 0; //星星上次尺寸
			var _fireNow = 0;           //当前尺寸
			var _fireBeforFlag = true;     //标识_fireBefor标识的类型，true则表示星星的大小，false则表示星星的位置

//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "275,20";pos = "212,18";xcenter = true;ycenter = true;
//				font = "宋体,-1,20";bold = true;
//			}

			//参数 data2:当前能量
			//参数 data3:总能量
			//_type:1为自己，3为p3
			void SetData(data1,data2,data3,_type)
			{
				// 还是检查一下传入的参数是否正确.
				// 如果总能量值非法或为空, 返回
				if (data3.__Long__ <= 0)
				{
					return;
				}

				//_TempText.src = ""+data2+"/"+data3;
				// p3的设置
				if(toint(_type) == 3)// 如果类型为P3
				{
					if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
					var p3_Temp = p3_Full_Width*toint(data2)/toint(data3);	// p3_Temp保存当前能量宽度
					p3_Curr.resetsize(true);
					p3_Curr.clipani(p3_Temp,p3_Img_Heigh,1,1);// 设置图片遮挡位置
					return;
				}
				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				if (_firstNum)// 如果第一次设置能量
				{
					//_num.setNum(data3);
					//_num.src = data3 ;
					//_max.src =data3;
					if(toint(data2) == toint(data3))// 当前能量 == 总能量
					{

						_fireBeforFlag = false;//标识位置(星星)
						_fireBefor = _Full_Width - _fireWidth + 123;
						_TempBeforSize = _Full_Width;
						_Curr.width = _Full_Width;
					}
					_firstNum = false;
				}
				if(toint(data2) == toint(data3))
				{
					_IsFull = true;
					//_num.show = false;
					_fires.show = false;
					_max.show = true;
					if (!_tempEffect)
					{
						window.PlaySound(123);
						//在这里播一个特效-yxf 2008年11月3日
						window.find("NAME_GCMap").find("IAMISSELF").parent.find("ifuser").neweffintime(window._Time_Effect,"test122");
					}
					_tempEffect = true;
				}
				else
				{
					//_num.show = true;
					_max.show = false;
					_IsFull = false;
					_fires.show = true;
					_Full._Begin = false;
					_tempEffect = false;
				}
				if(_TempBeforSize < _Full_Width || toint(data2) < toint(data3))
				{
					
					_TempSize = _Full_Width*toint(data2)/toint(data3);
					//能量星星的尾随效果
					if(_TempSize < _fireWidth)
					{
						_fireNow = _TempSize;
						if(!_fireBeforFlag)
						{
							_fires.width = _TempSize;
							_fireBeforFlag = true;
							_fires.setParamTimer("left",_fireBefor,123,600,0);
							
						}else
						{
							_fires.setParamTimer("width",_fireBefor,_fireNow,600,0);
						}
						//printf("B#  [能量条-大小改变]: left"+_fires.left+",width:"+_fires.width);
						
					}else
					{
						_fireNow =_TempSize-_fires.width+123;
						if(_fireBeforFlag)
						{
							_fires.left = _TempSize-_fireWidth+123;
							_fireBeforFlag = false;
							_fires.setParamTimer("width",_fireBefor,_fireWidth,600,0);
							
						}else
						{
							_fires.setParamTimer("left",_fireBefor,_fireNow,600,0);
						}
						//printf("B#  [能量条-位置改变]: width"+_fires.width+",left:"+_fires.left+",_fireBefor"+_fireBefor+"_fireWidth"+_fireWidth);
					}
					_Curr.setParamTimer("width",_TempBeforSize,_TempSize,600,0,"End");
				}else
				{
					if(!_Full._Begin)
					{
						_Full._Begin = true;
						_Full.OnMyUpDate();
					}
				}
				
			}//end SetData()
		}//end s_CurrEnergy

		
		//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina = new item
		{
			size = "356,82";
			var _Img_Heigh = 10;
			var _Full_Width = 182;   //体力满时图片的宽度
			var _fireWidth = 42;	//体力星星宽度
			var p3_Img_Heigh = 5;
			var p3_Full_Width = 73;   //p3体力满时图片的宽度
			//底图
		    new img{src = "$./imgs"+parent.parent.m_UID+"/D_ZJ_StaminaD_D.tga"; pos="123,20";size=""+parent._Full_Width+","+parent._Img_Heigh;}
			new text
			{
				src = "体力";
				size = "25,20";pos = "97,17";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
				
			}
			//当前体力
			var _Curr = new img
			{
				pos = "123,20";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/D_ZJ_CurrentStamina.tga";
				void End()
				{
					parent._TempBeforSize = parent._TempSize;
					parent._fireBefor = parent._fireNow;
					if (parent._IsFull)
					{
						parent._Full._Begin = true;
						parent._Full.OnMyUpDate();
					}
				}
			}
			//星星动画
			var _fires =new img
			{
				pos = "123,20";size(parent._fireWidth,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/ZJ_StaminaFires.tga";
				show = false;
				clipani(40,10,1,3);anispeed = 6;
			}
			//满体力
			var _Full = new img3d
			{
				
				pos = "123,20";show = false;size=""+parent._Full_Width+","+parent._Img_Heigh;
				src= "$./imgs"+parent.parent.m_UID+"/StaminaFull.tga";
				//setShader("2d_add_texture.fx");
				var _Begin = false;	//满体力开始开关

				void OnMyUpDate()
				{
					while (_Begin)
					{
						show = "xor";	// 对显示取反
						sleep(200);
					}
					_Begin = false;
					show = false;
				}
			}
			
			//MAX
			var _max = new img
			{
				pos(305,17);show = false;
				src= "$./imgs"+parent.parent.m_UID+"/MAX.tga";
			}

			//p3体力设置
			//底图
		    new img{src = "$./imgs"+parent.parent.m_UID+"/D_DY_StaminaD_D.tga"; pos="110,68";size=""+parent.p3_Full_Width+","+parent.p3_Img_Heigh;}
			
			//当前体力
			var p3_Curr = new img
			{
				pos = "110,68";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/D_DY_CurrentStamina.tga";
			}
			

			var _TempSize = 0;				//当前的尺寸
			var _TempBeforSize = 0;	//上次的尺寸
			var _IsFull = false;	//是否为满能量
			var _tempEffect = false;//是否可以放特效 false的时候播
			var _firstNum = true;	//是否为第一次设置能量
			var _fireBefor = 0; //星星上次尺寸
			var _fireNow = 0;           //当前尺寸
			var _fireBeforFlag = true;     //标识_fireBefor标识的类型，true则表示星星的大小，false则表示星星的位置


			//参数 data2:当前体力
			//参数 data3:总体力
			//_type:1为自己，3为p3
			void SetData(data1,data2,data3,_type)
			{
				if (data3.__Long__ <= 0){return;}

				_TempText.src = ""+data2+"/"+data3;
				
				//p3的设置
				if(toint(_type)==3)
				{
					if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
					var p3_Temp = p3_Full_Width*toint(data2)/toint(data3);
					p3_Curr.resetsize(true);
					p3_Curr.clipani(p3_Temp,p3_Img_Heigh,1,1);
					return;
				}

				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				if (_firstNum)
				{
					//_num.setNum(data3);
					//_num.src = data3;
					//_max.src = data3;
					if(toint(data2) == toint(data3))
					{
						_fireBeforFlag = false;//标识位置
						_fireBefor = _Full_Width - _fireWidth + 123;
						_TempBeforSize = _Full_Width;
						_Curr.width = _Full_Width;
					}
					_firstNum = false;
				}
				if(toint(data2) == toint(data3))
				{
					_IsFull = true;
					//_num.show = false;
					_max.show = true;
					_fires.show = false;
					if (!_tempEffect)
					{
						window.PlaySound(123);
						//在这里播一个特效-安峰册 2009-11-19
						window.find("NAME_GCMap").find("IAMISSELF").parent.find("ifuser").neweffintime(window._Time_Effect,"test122");
					}
					_tempEffect = true;
				}
				else
				{
					//_num.show = true;
					_max.show = false;
					_IsFull = false;
					_fires.show = true;
					_Full._Begin = false;
					_tempEffect = false;
				}
				if(_TempBeforSize < _Full_Width || toint(data2) < toint(data3))
				{
					
					_TempSize = _Full_Width*toint(data2)/toint(data3);
					//能量星星的尾随效果
					if(_TempSize < _fireWidth)
					{
						_fireNow = _TempSize;
						if(!_fireBeforFlag)
						{
							_fires.width = _TempSize;
							_fireBeforFlag = true;
							_fires.setParamTimer("left",_fireBefor,123,600,0);
							
						}else
						{
							_fires.setParamTimer("width",_fireBefor,_fireNow,600,0);
						}
						
					}else
					{
						_fireNow =_TempSize-_fires.width+123;
						if(_fireBeforFlag)
						{
							_fires.left = _TempSize-_fireWidth+123;
							_fireBeforFlag = false;
							_fires.setParamTimer("width",_fireBefor,_fireWidth,600,0);
							
						}else
						{
							_fires.setParamTimer("left",_fireBefor,_fireNow,600,0);
						}
					}
					_Curr.setParamTimer("width",_TempBeforSize,_TempSize,600,0,"End");
				}else
				{
					if(!_Full._Begin)
					{
						_Full._Begin = true;
						_Full.OnMyUpDate();
					}
				}

			}//end SetData()
		}//end s_Stamina
			
		//昵称1(P1)
		//参数 data2
		staticvar s_Name1 = new text
		{
			pos = "10,10";size = "100,32" font("宋体",-1,12);color = "#FFFFFF";txtborder ="#000000"; //xcenter = true;
			void SetData(data1,data2){src = data2;}
		};	
		
		//昵称2(P3)
		//参数 data2
		staticvar s_Name2 = new text
		{
			pos = "10,60";size = "90,32" font("宋体",-1,12);color = "#FFFFFF";txtborder ="#000000"; //xcenter = true;
			void SetData(data1,data2){src = data2;}
		}	
	}
};

///////////////////////////////////////////////////////////////////////////////////////

//p2昵称+P4昵称+能量
class VRole_P2_P4_Name_Energy_UI item
{
	size = "237,90";		

	staticvar m_UID = 1;  //自己决定用的底图颜色，1为蓝，2为红

	//用户UID
	void Init(UID)
	{
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}		
		printf("B# 图片颜色VRole_P2_P4_Name_Energy_UI：m_UID:"+m_UID+",teamID:"+teamID+",UID:"+UID);
		//能量
		//参数 data2:当前能量
		//参数 data3:总能量
		staticvar s_CurrEnergy = new item
		{
			
			size = "210,70";
			var _Img_Heigh = 7;
			var _Full_Width = 74;
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_Energy_D.tga";}
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_EnergyD_D.tga"; pos="110,10";size(parent._Full_Width,parent._Img_Heigh);}

			//当前能量
			var _Curr = new img
			{
				pos = "110,10";size(0,parent._Img_Heigh);//clipani(0,5,1,1);
				src = "$./imgs"+parent.parent.m_UID+"/D_DF_CurrentEnergy_D.tga";
			}

			//p4的设置
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_Energy_D.tga"; pos = "0,40";}
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_EnergyD_D.tga"; pos="110,50";size(parent._Full_Width,parent._Img_Heigh);}

			//当前能量
			var p4_Curr = new img
			{
				pos = "110,50";size(0,parent._Img_Heigh);//clipani(0,7,1,1);
				src = "$./imgs"+parent.parent.m_UID+"/D_DF_CurrentEnergy_D.tga";
			}
//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "216,20";pos = "11,27";xcenter = true;ycenter = true;
//				font = "宋体,-1,18";bold = true;
//			}
			//_type:2为p2,4为p4
			void SetData(data1,data2,data3,_type)
			{
				if (data3.__Long__ <= 0){return;}

				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				var _Temp = _Full_Width*toint(data2)/toint(data3);
				if(toint(_type) == 2)
				{
					_Curr.resetsize(true);
					_Curr.clipani(_Temp,7,1,1);
				}
				
				//p4设置
				if(toint(_type) == 4)
				{
					p4_Curr.resetsize(true);
					p4_Curr.clipani(_Temp,7,1,1);
				}
			}
		}	

		//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina = new item
		{
			size = "237,90";
			var _Img_Heigh = 5;
			var _Full_Width = 74;
			//底图
			//new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_Energy_D.tga";}
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_StaminaD_D.tga"; pos="110,21";size(parent._Full_Width,parent._Img_Heigh);}

			//当前体力
			var _Curr = new img
			{
				pos = "110,21";size(0,parent._Img_Heigh);//clipani(0,5,1,1);
				src = "$./imgs"+parent.parent.m_UID+"/D_DF_CurrentStamina_D.tga";
			}

			//p4设置
			new img{src = "$./imgs"+parent.parent.m_UID+"/D_DF_StaminaD_D.tga"; pos="110,61";size(parent._Full_Width,parent._Img_Heigh);}

			//当前体力
			var p4_Curr = new img
			{
				pos = "110,61";size(0,parent._Img_Heigh);//clipani(0,5,1,1);
				src = "$./imgs"+parent.parent.m_UID+"/D_DF_CurrentStamina_D.tga";
			}
			//_type:2为p2,4为p4
			void SetData(data1,data2,data3,_type)
			{
				if (data3.__Long__ <= 0){return;}

				_TempText.src = ""+data2+"/"+data3;

				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				var _Temp = _Full_Width*toint(data2)/toint(data3);
				if(toint(_type) == 2)
				{
					_Curr.resetsize(true);
					_Curr.clipani(_Temp,5,1,1);
				}
				

				//p4设置
				if(toint(_type) == 4)
				{
					p4_Curr.resetsize(true);
					p4_Curr.clipani(_Temp,5,1,1);
				}
			}
		}

		//昵称1(P2)
		//参数 data2
		staticvar s_Name1 = new text
		{
			pos = "9,10"; size = "100,20";font("宋体",-1,12);color = "#FFFFFF";txtborder ="#000000";
			void SetData(data1,data2){src = data2;}
		};	
		
		//昵称2(P4)
		//参数 data2
		staticvar s_Name2 = new text
		{
			pos = "9,50"; size = "100,20";font("宋体",-1,12);color = "#FFFFFF";txtborder ="#000000";//xcenter = true;
			void SetData(data1,data2){src = data2;}
		}	
	}
};