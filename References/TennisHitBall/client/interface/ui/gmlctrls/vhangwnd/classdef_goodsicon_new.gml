//
//物品的图标类定义
//yxf	2009年10月26日
//


class VGoodsIconNew_UI item
{
	bgcolor = -1;//border = "#0";
	var m_SizeX = 98;
	var m_SizeY = 98;
	var m_NumPosX = 0;
	var m_NumPosY = 0;
	var m_NumWidth = 16;					//数字图片宽 
	var m_NumMax = m_SizeX / m_NumWidth;	//数字的位数
	size(m_SizeX,m_SizeY);
	var m_IsOverOpen = false; //是否支持 鼠标滑过效果
	//显示相关-----------------------------------------------------
	void Init()
	{
		//物品背景
		staticvar s_BK = new img
		{
			valign(50,0);halign(50,0);size = "100%,100%";
			src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/xwpk01.tga";
			
			void OnMySelect()
			{
				src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/xwpk03.tga";
			}
			void OnMyUnSelect()
			{
				src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/xwpk01.tga";
			}
			void OnMouseOver()
			{
				if (!parent.m_IsOverOpen) return;
				OnMySelect();
			}
			void OnMouseOut()
			{
				if (!parent.m_IsOverOpen) return;
				OnMyUnSelect();
			}
		}
		//物品图标
		//参数1 物品ID
		staticvar s_Icon = new img
		{
			valign(50,0);halign(50,0);//bgcolor = "#FF";
			var oldEnttryID = -1;
			var oldNum      = -1;
			
			void AdjustSize()
			{
				if (parent.width < width)
				{
					width = parent.width - 4;	//微调
				}
				if (parent.height < height)
				{
					height = parent.height - 4;
				}
				valign(50,0);halign(50,0);
			}
			void SetData(entryid, level)
			{
				if (entryid > 0)
				{
					if (toint(level) > 0)
					{
						src = "$./../../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(entryid)+level+".tga";
					}
					else 
					{
						src = "$./../../PublicImage/GoodsIcon/"+window.GetIconNameByEnterID(entryid)+".tga";
					}
					printf("图标:width:"+width+",height:"+height);
					var _classKind = window.GetClassByEnterId(entryid);
					
					size(parent.width,parent.height);

					if(toint(_classKind)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Attribute)
					{
						//属性卡单独设置
						size(90,64);
						window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,entryid);
						var _goodAttValue = window.g_Row.GetData(window.M_G_GOODS_ITEMS_ATTVALUE);
						var _arr = window.Splitstr2(_goodAttValue,",");
						var _numIndex = _classKind%window.GOODS_CLASS_BASE ;
						window.g_Row.Release();
						
						printf("B# 属性卡数字 oldEnttryID： "+oldEnttryID+" ,entryid:"+entryid+",oldNum:"+oldNum+",_arr[_numIndex]: "+_arr[_numIndex]);
						if(oldEnttryID != entryid || toint(oldNum) != toint(_arr[_numIndex]))
						{
							parent._attNum.show = false;
							parent._add.show = false;
							parent._attNum.del();
							parent._add.del();
							set parent
							{	
								var _attNum = new VN2NumShow
								{
									
									size = "78,13";
									src = "$./../../../UI/PublicImage/num/sz.tga";
									show  = false;

									void SetData(num)
									{
										if(toint(num)>1)
										{
											var _tempNum = toint(num);
											var _tempCount = tostring(_tempNum).Count;
											_tempCount = toint(_tempCount);
											setNum(_tempNum);
											var _NumPosX = parent.s_Icon.width - 15 * _tempCount;
											var _NumPosY = parent.s_Icon.height - this.height+5;
											
											pos(_NumPosX,_NumPosY);
											parent._add.pos(_NumPosX-13,_NumPosY);
											//show = true;
										}
										else
										{
											//show = false;
										}
										parent.s_Icon.oldNum = toint(num);
									}
									
								}

								var _add = new img
								{
									show = false;
									size = "13,14";
									src = "$./../../../UI/PublicImage/num/+.tga";
								}
							}
							parent._attNum.SetData(_arr[_numIndex]);
							sleep(170);
							parent._attNum.show = true;
							parent._add.show = true;
						}
						else
							oldEnttryID = entryid;
					}
					else
					{
						parent._attNum.del();
						parent._add.del();
						AdjustSize();
					}
					//oldEnttryID = entryid;
				}
			}
		}

		//物品等级
		//参数1 等级
		staticvar s_Lv = new img
		{
			size(22,22);
			show=false;
			
			void SetData(lv)
			{
				if(toint(lv)>=1)
				{
					show=true;
					src = "$./../../PublicImage/imgs"+window.g_Sex+"/"+lv+".tga";
				}
				else
				{
					show=false;
				}
			}
		}

		// 物品等级边框
		// 参数1 等级
		staticvar s_lvFrm = new img 
		{
			size = "107%,100%";
			halign(50,0); 
			valign(50,-2);
			void SetSrc(level)
			{
				src = "$./../../../UI/PublicImage/Skill/skillLev_"+level+".tga";
			}
		}

		//物品数量
		//参数1 数量
		staticvar s_Num = new VN2NumShow
		{
			size(60,18);show=false;
			src="$./../../../UI/PublicImage/num/num1.tga";

			void SetData(num)
			{
				if(toint(num)>1)
				{
					/*以下功能实现根据父类大小调整显示数量的个数和位置*/
					var _TempNum = toint(num);
					var _TempCount = tostring(_TempNum).Count;
					_TempCount = toint(_TempCount);
//					alert("_TempCount:"+_TempCount+",m_NumMax:"+parent.m_NumMax);
					if (_TempCount > parent.m_NumMax)
					{
						//大于最大位数则显示最大位数的9 如：999
						_TempNum = 1;
						var _i = 0;
						while (_i < parent.m_NumMax)
						{
							_TempNum *= 10;
							_i += 1;
						}
						_TempNum -= 1;
						_TempCount = tostring(_TempNum).Count;
					}
//					alert("num:"+num+",_TempNum:"+_TempNum);
					setNum(_TempNum);

					parent.m_NumPosX = parent.m_SizeY - parent.m_NumWidth * _TempCount;
					parent.m_NumPosY = parent.m_SizeY - this.height-10;
					pos(parent.m_NumPosX,parent.m_NumPosY);
					sleep(250);
					show = true;
				}
				else
				{
					show=false;
				}
			}
		}
	}
	//-------------------------------------------------------------
	//设置图片大小的函数(数量要一起移动)
	//参数：x，y
	void SetMySizeUI(x,y)
	{
		m_SizeX = x;
		m_SizeY = y;
		size(m_SizeX,m_SizeY);

		m_NumMax = this.width / m_NumWidth;

		s_Num.pos(m_NumPosX - (m_SizeX-x), m_NumPosY - (m_SizeY - y));
		s_Icon.AdjustSize();
	}

	//[外部接口]设置选中效果
	//参数：true false
	void SetSelectUI(select)
	{
		if (select)
		{
			s_BK.OnMySelect();
		}
		else
		{
			s_BK.OnMyUnSelect();
		}
	}

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	void SetMouseOverOpenUI(_open)
	{
		m_IsOverOpen = _open;
	}
};


//灰色的图标类
class VGoodsIcon_GreyBG_UI item
{
	size = "119,147";
	//===========================与显示交互======================
	//new VPic3_GreyTop_UI{size="112,32";};
//	new img
//	{
//		valign(12,0);halign(48,0);
//		src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/sanjiao_top.tga";
//	}
	new img
	{	
		//pos="0,22";
		src = "$./../../PublicImage/new/imgs"+window.g_Sex+"/wpk01.tga";
	};
};
