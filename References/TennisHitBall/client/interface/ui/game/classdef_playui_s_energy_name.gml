//游戏内界面的部分类定义
//显示部分
//@刘高辰
//08年8月7日

//P1昵称+能量：显示
class VRole_P1_Name_Energy_UI item
{
	size = "356,33";
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
		printf("B# 图片颜色VRole_P1_Name_Energy_UI：m_UID:"+m_UID+",teamID:"+teamID+",UID:"+UID);
		//能量
		staticvar s_CurrEnergy = new item
		{
			size = "356,33";
			var _Img_Heigh = 10;		 //能链条图片高度
			var _Full_Width = 182;   //能量满时图片的宽度
			var _fireWidth = 40;	//能量星星宽度

			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/S_ZJ_Energy_S.tga"; size = "340,33"}
			new img{src = "$./imgs"+parent.parent.m_UID+"/S_ZJ_EnergyD_D.tga"; pos="123,6";size(parent._Full_Width,parent._Img_Heigh);}

			new text
			{
				src = "能量";
				size = "25,20";pos = "97,4";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";

			}

			//当前能量
			var _IMG = new img
			{
				pos = "123,6";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/ZJ_CurrentEnergy.tga";
				void End()
				{
					parent._TempBeforSize = parent._TempSize;
					parent._fireBefor = parent._fireNow;
					if (parent._IsFull)
					{
						parent._Full.OnMyUpDate();
					}
					//强制设置星星跟随
					//parent._fires.left = parent._TempBeforSize - parent._fires.width+123;
					//printf("B# [能量条]:_TempBeforSize-End:"+parent._TempBeforSize+",_TempSize:"+parent._TempSize);
				}
			}
			//星星动画
			var _fires =new img
			{
				pos = "123,6";size(parent._fireWidth,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/ZJ_EnergyFires.tga";
				show =false;
				clipani(40,10,1,3);anispeed = 6;
			}
			//满能量
			var _Full = new img3d
			{
				pos = "123,6";show = false;//size = "275,12";
				size(parent._Full_Width,parent._Img_Heigh);

				src= "$./imgs"+parent.parent.m_UID+"/EnergyFull.tga";
				//setShader("2d_add_texture.fx");
				var _Begin = false;	//满能量开始开关
				void OnMyUpDate()
				{
					while (_Begin)
					{
						show = "xor";
						sleep(200);
					}
					_Begin = false;
					show = false;
					printf("B#  [能量条]: 能量动画结束");
				}
			}
			/**
			//自己最大的能量值
			var _num = new VN2NumShow
			{
				pos="389,5";
				src="$./imgs"+parent.parent.m_UID+"/Num.tga";
			}
			*/
			var _max = new img
			{
				pos(305,2);show = false;
				src= "$./imgs"+parent.parent.m_UID+"/MAX.tga";
			}
			/*
			//自己最大的能量值
			var _num = new text
			{
				size = "50,20";pos="326,8";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
			}
			//MAX
			var _max =new text
			{
				size = "50,20";pos="326,8";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
			}*/

			var _TempSize = 0;				//当前的尺寸
			var _TempBeforSize = 0;	//上次的尺寸
			var _IsFull = false;//是否为满能量
			var _tempEffect = false;//是否可以放特效 false的时候播
			var _firstNum = true;//是否为第一次设置能量
			var _fireBefor = 0; //星星上次尺寸
			var _fireNow =	0;           //当前尺寸
			var _fireBeforFlag = true;     //标识_fireBefor标识的类型，true则表示星星的大小，false则表示星星的位置

//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "275,20";pos = "118,20";xcenter = true;ycenter = true;
//				font = "宋体,-1,20";bold = true;
//			}
			//参数 data2:当前能量
			//参数 data3:总能量
			void SetData(data1,data2,data3)
			{
				if (data3.__Long__ <= 0){return;}

				_TempText.src = ""+data2+"/"+data3;
				if(data2.__Long__>data3.__Long__){data2=data3;} //__Long__  与 toint() 效果一样
				if (_firstNum)
				{
					//_num.setNum(data3);
					///_num.src = data3;
					//_max.src = data3;
					//_max.show = false;
					if(toint(data2) == toint(data3))
					{

						_fireBeforFlag = false;//标识位置
						_fireBefor = _Full_Width - _fireWidth + 123;
						_TempBeforSize = _Full_Width;
						_IMG.width = _Full_Width;
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
				//printf("B# [能量条] _TempBeforSize:"+_TempBeforSize+",data3"+data3);
				if(_TempBeforSize < _Full_Width || toint(data2) < toint(data3))
				{
					_TempSize = _Full_Width * toint(data2)/toint(data3);
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
						printf("B#  [能量条-大小改变]: left"+_fires.left+",width:"+_fires.width);
					}
					else
					{
						_fireNow =_TempSize-_fires.width+123;
						if(_fireBeforFlag)
						{
							_fires.left = _TempSize - _fireWidth + 123;
							_fireBeforFlag = false;
							_fires.setParamTimer("width",_fireBefor,_fireWidth,600,0);

						}
						else
						{
							_fires.setParamTimer("left",_fireBefor,_fireNow,600,0);
						}
						//printf("B#  [能量条-位置改变]: width"+_fires.width+",left:"+_fires.left+",_fireBefor"+_fireBefor+"_fireWidth"+_fireWidth);
					}
					printf("B# [能量条]:_TempBeforSize:"+_TempBeforSize+",_TempSize:"+_TempSize);
					_IMG.setParamTimer("width",_TempBeforSize,_TempSize,600,0,"End");
				}
				else
				{
					if(!_Full._Begin)
					{
						printf("B#  [能量条]: 能量已满但是没有满的动画");
						_Full._Begin = true;
						_Full.OnMyUpDate();
					}
				}
			}//SetData()
		}//s_CurrEnergy

				//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina =  new item
		{
			size = "356,33";
			var _Img_Heigh = 10;		 //体力条图片高度
			var _Full_Width = 182;   //体力满时图片的宽度
			var _fireWidth = 42;	//体力星星宽度
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/S_ZJ_StaminaD_D.tga"; pos="123,20";size(parent._Full_Width,parent._Img_Heigh);}
			new text
			{
				src = "体力";
				size = "25,20";pos = "97,17";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";

			}

			//当前体力
			var _IMG = new img
			{
				pos = "123,20";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/ZJ_CurrentStamina.tga";
				void End()
				{
					printf("B#  [体力条]: 体力条进入");
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
				pos = "123,20";show = false;//size = "275,12";
				size(parent._Full_Width,parent._Img_Heigh);

				src= "$./imgs"+parent.parent.m_UID+"/StaminaFull.tga";
				//setShader("2d_add_texture.fx");
				var _Begin = false;	//满体力开始开关
				void OnMyUpDate()
				{
					printf("B#  [体力条]: 体力条开始播放满体力动画");
					while (_Begin)
					{
						show = "xor";
						sleep(200);
					}
					_Begin = false;
					show = false;
				}
			}

			/*
			//自己最大的体力值
			var _num = new text
			{
				size = "50,20";pos="326,20";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
			}

			//MAX
			var _max =new text
			{
				size = "50,20";pos="320,20";//xcenter = true;
				font = "宋体,-1,12";color = "#000000";
			}*/
			/**
			//自己最大的体力值
			var _num = new VN2NumShow
			{
				pos="389,19";
				src="$./imgs"+parent.parent.m_UID+"/Num.tga";
			}
			*/
			var _max = new img
			{
				pos(305,17);show = false;
				src= "$./imgs"+parent.parent.m_UID+"/MAX.tga";
			}
			var _TempSize = 0;				//当前的尺寸
			var _TempBeforSize = 0;
			var _IsFull = false;//是否为满体力
			var _tempEffect = false;//是否可以放特效 false的时候播
			var _firstNum = true;//是否为第一次设置体力
			var _fireBefor = 0; //星星上次尺寸
			var _fireNow = 0;           //当前尺寸
			var _fireBeforFlag = true;     //标识_fireBefor标识的类型，true则表示星星的大小，false则表示星星的位置


//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "275,20";pos = "118,20";xcenter = true;ycenter = true;
//				font = "宋体,-1,20";bold = true;
//			}
			//参数 data2:当前体力
			//参数 data3:总体力
			void SetData(data1,data2,data3)
			{
				printf("7# P1体力条:"+parent.s_NickName.src+":data1:"+data1+",data2:"+data2+",data3:"+data3);
				if (data3.__Long__ <= 0){return;}

				_TempText.src = ""+data2+"/"+data3;
				if(data2.__Long__>data3.__Long__){data2=data3;} //__Long__  与 toint() 效果一样
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
						_IMG.width = _Full_Width;
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
					_IMG.setParamTimer("width",_TempBeforSize,_TempSize,600,0,"End");
				}else
				{
					if(!_Full._Begin)
					{
						printf("B#  [体力条]: 体力已满但是没有满的动画");
						_Full._Begin = true;
						_Full.OnMyUpDate();
					}
				}
			}//SetData()
		}//s_s_Stamina

		//昵称
		//参数 data2
		staticvar s_NickName = new text
		{
			pos = "10,10"; size = "100,30"; //xcenter = true;
			font("宋体",-1,12);
			color = "#FFFFFF";txtborder ="#000000";
			void SetData(data1,data2)
			{
				src = data2;
			}
		}
	}
};

//P2昵称+能量：显示
class VRole_P2_Name_Energy_UI item
{
	size = "219,30";
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
		printf("B# 图片颜色VRole_P2_Name_Energy_UI：m_UID:"+m_UID+",teamID:"+teamID+",UID:"+UID);
		//能量
		staticvar s_CurrEnergy = new item
		{

			size = "219,30";
			var _Img_Heigh = 7;
			var _Full_Width = 74;   //能量满时图片的宽度
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/DF_Energy_D.tga";}
			new img{src = "$./imgs"+parent.parent.m_UID+"/DF_EnergyD_D.tga"; pos="110,7";size(parent._Full_Width,parent._Img_Heigh);}
			//当前能量
			var _IMG = new img
			{
				pos = "110,7";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/DF_CurrentEnergy.tga";
				clipani(0,7,1,1);
			}
//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "104,20";pos = "11,28";xcenter = true;ycenter = true;
//				font = "宋体,-1,18";bold = true;
//			}
			//参数 data2:当前能量
			//参数 data3:总能量
			void SetData(data1,data2,data3)
			{
				printf("8#  P2能量条:"+parent.s_NickName.src+":data1:"+data1+",data2:"+data2+",data3:"+data3);
				if (data3.__Long__ <= 0){return;}
//				_TempText.src = ""+data2+"/"+data3;

				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				var _Temp = _Full_Width*toint(data2)/toint(data3);
				_IMG.clipani(_Temp,_Img_Heigh,1,1);
				_IMG.size(_Temp,_Img_Heigh);
			}
		}
				//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina =  new item
		{
			size = "219,30";
			var _Img_Heigh = 7;
			var _Full_Width = 74;   //能量满时图片的宽度
			//底图
			new img{src = "$./imgs"+parent.parent.m_UID+"/DF_StaminaD_D.tga"; pos="110,18";size(parent._Full_Width,parent._Img_Heigh);}
			//当前体力
			var _IMG = new img
			{
				pos = "110,18";size(0,parent._Img_Heigh);
				src = "$./imgs"+parent.parent.m_UID+"/DF_CurrentStamina.tga";
				clipani(0,7,1,1);
			}
//			//临时用-yxf
//			var _TempText = new text
//			{
//				size = "104,20";pos = "11,28";xcenter = true;ycenter = true;
//				font = "宋体,-1,18";bold = true;
//			}
			//参数 data2:当前能量
			//参数 data3:总能量
			void SetData(data1,data2,data3)
			{
				printf("7#  P2体力条:"+parent.s_NickName.src+":data1:"+data1+",data2:"+data2+",data3:"+data3);
				if (data3.__Long__ <= 0 || data2.__Long__ < 0){return;}
//				_TempText.src = ""+data2+"/"+data3;

				if(data2.__Long__>data3.__Long__){data2=data3;}//__Long__  与 toint() 效果一样
				var _Temp = _Full_Width*toint(data2)/toint(data3);
				_IMG.resetsize(true);
				_IMG.clipani(_Temp,_Img_Heigh,1,1);
			}
		}

		//昵称
		//参数 data2
		staticvar s_NickName = new text
		{
			pos = "9,10"; size = "100,20"; font("宋体",-1,12);color = "#FFFFFF";txtborder ="#000000"; //xcenter = true;
			void SetData(data1,data2){src = data2;}
		}
	}//end Init()
};