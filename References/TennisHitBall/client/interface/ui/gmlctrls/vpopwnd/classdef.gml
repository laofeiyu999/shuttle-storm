//背景框 刘高辰 08年8月5日更新
//吴楠 2008年12月22日 修改

//界面背景 下层
// 动态底图框 9张图

class VSPLIT_9_UI item
{
	var m_SizeX = o;	//X方向大小
	var m_SizeY = o;	//Y方向大小

	// 图片顺序 0:左上,1:上,2:右上,3:左边,4:填充,5:右边,6:左下,7:下边,8:右下
	// ImgPath:/文件夹名/图片名,_up:上宽,_left:左宽,_down下宽,State:菜单类型 1:有上边 2:无上边 3:有上边 带高光4:悬停
	void Init(ImgPath,_left,_up,_down,State)
	{
		if (State == 1 || State == 3 || State == 4)
		{
			new img{src="$./imgs"+window.g_Sex+ImgPath+"_0.tga";}				// 0:左上

			new img																// 1:上
			{
				pos(_left,0); size("100%",_up,-(_left*2),0);
				src="$./imgs"+window.g_Sex+ImgPath+"_1.tga";
			}

			new img																// 2:右上
			{
				halign="100,0"; pos(_left,0);
				src="$./imgs"+window.g_Sex+ImgPath+"_2.tga";
			}
		}

		new img																	// 3:左边
		{
			pos(0,_up);
			src="$./imgs"+window.g_Sex+ImgPath+"_3.tga";
			if(State == 1)
			{
				clipani(_left,toint(parent.m_SizeY)-(_up+_down),1,1);
			}
			else
			{
				size(_left,"100%",0,-(_up+_down));pos(0,_up);
			}
		}

		new item																// 4:填充
		{
			size("100%","100%",-(_left*2),-(_up*2)); pos(_left,_up);
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"_4.tga";}
		}

		if (State == 3)
		{
			new img																//高光
			{
				size("100%",23,-(_left*2),0);pos(_left,23);
				src="$./imgs"+window.g_Sex+ImgPath+"_High.tga";
			}
		}

		new img																	//5:右边
		{
			pos(parent.m_SizeX-_left,_up);
			src="$./imgs"+window.g_Sex+ImgPath+"_5.tga";
			if(State == 1)
			{
				clipani(_left,toint(parent.m_SizeY)-(_up+_down),1,1);
			}
			else
			{
				size(_left,"100%",0,-(_up+_down));halign="100,0"; pos(0,_up);
			}
		}

		new img																	// 6:左下
		{
			valign="100,0"; pos(0,_down);
			src="$./imgs"+window.g_Sex+ImgPath+"_6.tga";
		}

		new img																	// 7:下边
		{
			pos(_left,0); size("100%",_down,-(_left*2),0); valign="100,0";
			src="$./imgs"+window.g_Sex+ImgPath+"_7.tga";
		}

		new img																	// 8:右下
		{
			halign="100,0"; valign="100,0";
			src="$./imgs"+window.g_Sex+ImgPath+"_8.tga";
		}

		if(State == 1 || State == 2)
		{
			new img
			{
				halign(50,0);pos(0,_up+22);
				src = "$./imgs"+window.g_Sex+ImgPath+"_Line.tga";
				//printf("SizeY:"+parent.m_SizeY+",_up:"+_up+",_down:"+_down);

				if(toint(parent.m_SizeY)-(_up+_down+24) < 231)
				{
					clipani(toint(parent.m_SizeX)-(_left),toint(parent.m_SizeY)-(_up+_down+22),1,1);
				}
				else
				{
					clipani(toint(parent.m_SizeX)-(_left),231,1,1);
				}
			}
		}

	}//end init()

	//设置大小
	void SetSize(_sizeX,_sizeY)
	{
		//alert("VSPLIT_9_UI:"+_sizeX+","+_sizeY);
		m_SizeX = _sizeX;
		m_SizeY = _sizeY;
		size(_sizeX,_sizeY);
	}
};

class VEnter_Game_BK_UI VSPLIT_9_UI
{
	//size(100,292);
	void OnCreated()
	{
		Init("/EnterBK/Ditu",23,40,40,3);
	}
};

class VMouseBK_UI VSPLIT_9_UI
{
	//SetSize(150,200);
	void OnCreated()
	{
		Init("/bk/RightDrop",16,7,16,1);
	}
};
class VLISTBASE_UI VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/bk/RightDrop",16,7,16,2);
	}
};
class VTRAIN_BK_POP_UI VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/EnterBK/Ditu",23,40,40,3);
	}
};
class VHANGWND_BK_UI VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/HangWndBK/HangWnd",16,16,16,4);
	}
};
class VCHAT_BK_UI_H VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/chat/h",32,32,32,4);
	}
};
class VCHAT_BK_UI_H VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/chat/h",32,32,32,4);
	}
};
class VCHAT_BK_UI_R VSPLIT_9_UI
{
	void OnCreated()
	{
		Init("/chat/r",32,32,32,4);
	}
};

//----------------------------------------新----------------------------------------
class VPic9_UI item
{
	var m_alpha = 0;//图片的透明度 陈晓聪 2009年2月10日

	//设置图片透明度值
	void SetAlpha(_alpha){m_alpha = _alpha} //陈晓聪 2009年2月10日

	// 图片顺序 0:左上,1:上,2:右上,3:左边,4:填充,5:右边,6:左下,7:下边,8:右下
	// ImgPath:图片名,up:上宽,left:左宽
	void Init(ImgPath,left,up)
	{
		new imgm{src="$./imgs"+window.g_Sex+ImgPath+"0.tga";alpha = m_alpha;}			// 0:左上

		new item									// 1:上
		{
			pos(left,0); size("100%",up,-(left*2),0);alpha = m_alpha;
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"1.tga"; }
		}
		new imgm										// 2:右上
		{
			halign="100,0"; pos(left,0);
			src="$./imgs"+window.g_Sex+ImgPath+"2.tga";
		}

		new item									// 3:左边
		{
			size(left,"100%",0,-(up*2)); pos(0,up);alpha = m_alpha;
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"3.tga"; }
		}

		new item									// 4:填充
		{
			size("100%","100%",-(left*2),-(up*2)); pos(left,up);alpha =m _alpha;
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"4.tga"; }
		}

		new item									// 5:右边
		{
			size(left,"100%",0,-(up*2)); halign="100,0"; pos(0,up);alpha = m_alpha;
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"5.tga"; }
		}

		new imgm										// 6:左下
		{
			valign="100,0"; pos(0,up);alpha = m_alpha;
			src="$./imgs"+window.g_Sex+ImgPath+"6.tga";
		}

		new item									// 7:下边
		{
			pos(left,0); size("100%",up,-(left*2),0); valign="100,0";alpha = m_alpha;
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"7.tga"; }
		}

		new imgm										// 8:右下
		{
			halign="100,0"; valign="100,0";alpha = m_alpha;
			src="$./imgs"+window.g_Sex+ImgPath+"8.tga";
		}
	}
};

// 动态底图框 3张图
class VPic3_UI item
{
	// 图片顺序 0:上,1:中,2:下
	// ImgPath:图片名,_height:上高
	void UpDown(ImgPath,_height)
	{
		new item									// 上边框 0:上
		{
			size("100%",_height);
			new img{src="$./imgs"+window.g_Sex+ImgPath+"0.tga"; }
		}

		new item									// 1:填充
		{
			size("100%","100%",0,-(_height*2)); pos(0,_height);
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"1.tga"; }
		}

		new item									// 下边框 2:下
		{
			size("100%",_height); valign="100,0";
			new img{src="$./imgs"+window.g_Sex+ImgPath+"2.tga"; }
		}
	}

	// 图片顺序 0:左,1:中,2:右
	// ImgPath:图片名,_width:左宽
	void LeftRight(ImgPath,_width)
	{
		new item									// 上边框 0:上
		{
			size(_width,"100%");
			new img{src="$./imgs"+window.g_Sex+ImgPath+"0.tga"; }
		}

		new item									// 1:填充
		{
			size("100%","100%",-(_width*2),0); pos(_width,0);
			new VN3D_FillImgs{size="100%,100%"; src="$./imgs"+window.g_Sex+ImgPath+"1.tga"; }
		}

		new item									// 下边框 2:下
		{
			size(_width,"100%"); halign(100,0);
			new img{src="$./imgs"+window.g_Sex+ImgPath+"2.tga"; }
		}
	}
};

//PageCtrl 新 
class VPic9_PageCtrl_UI item//VPic3_UI//VPic9_UI
{
	//修改原因：这个类只有3张图 会报错 2009年12月9日 yxf
	//Init("/new/PageCtrl_New/PageCtrlBK",16,32);
	//LeftRight("/new/PageCtrl_New/PageCtrlBK",16);
	fillimg = "$./imgs"+window.g_Sex+"/new/PageCtrl_New/fyd.tga";
};
//金钱背景 新
class VPic3_MoneyBK_UI VPic3_UI
{
	LeftRight("/new/MoneyBK_New/xs",4);
};
//经验条 新
class VPic3_PowerLine_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/NLC",16);
};
//经验条2 新	夏洋洋添加于2009-12-26
class VPic3_PowerLine2_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/t",4);
};
//经验条3 红色 add by zyy---2011-3-2 
class VPic3_PowerLine3_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/red",4);
};
//经验条4 黄色
class VPic3_PowerLine4_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/yellow",4);
};
//经验条5  绿色
class VPic3_PowerLine5_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/green",4);
};
//经验条6 蓝色
class VPic3_PowerLine6_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/blue",4);
};

//经验条背景 新
class VPic3_PowerLineBk_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/NLD",16);
};
//经验条2背景 新	夏洋洋添加于2009-12-26
class VPic3_PowerLine2Bk_UI VPic3_UI
{
	LeftRight("/new/PowerLine_New/d",4);
};
//播放条 新 夏洋洋添加于2009-12-3
class VPic3_VedioPowerLine_UI VPic3_UI
{
	LeftRight("/new/VedioPowerLine/nlt",4);
};
//播放条条 灰	夏洋洋添加于2009-12-25
class VPic3_VedioPowerLineGray_UI VPic3_UI
{
	LeftRight("/new/VedioPowerLine/nltd",4);
};
//顶部灰背景 新
class VPic3_GreyTop_UI VPic3_UI
{
	LeftRight("/new/GreyTop_New/GreyTop",64);
};
//底部灰背景 新
class VPic3_GreyBottom_UI VPic3_UI
{
	LeftRight("/new/GreyBottom_New/GreyBottom",32);
};
//界面标题底 新
class VPic3_Tital_UI VPic3_UI
{
	LeftRight("/new/Tital_New/bt",16);capturemouse = true;
};
//界面标题 水晶	夏洋洋添加于2009-12-16
class VPic3_Tital_SJ_UI VPic3_UI
{
	LeftRight("/new/Tital_New/sj",8);
};
//界面底1 新
class VPic9_BK1_UI VPic9_UI
{
	Init("/new/BK1_New/z",16,16);capturemouse = true;
};
//界面底2 新
class VPic9_BK2_UI VPic9_UI
{
	//Init("/new/BK2_New/ls",8,8);capturemouse = true;
	Init("/new/BK1_New/b",8,8);capturemouse = true;
};
//界面底3 新
class VPic9_BK3_UI VPic9_UI
{
	Init("/new/BK1_New/h",16,16);capturemouse = true;
};
//界面内容底4 新
class VPic9_BK4_UI VPic9_UI
{
	Init("/new/BK1_New/b",8,8);capturemouse = true;
};
//界面大按钮背景 新
class VPic3_ButtonBK_UI VPic3_UI
{
	LeftRight("/new/ButtonBK_New/ButtonBK",4);
};
//房间列表背景 上（灰） 新
class VPic3_RoomListTop_UI VPic3_UI
{
	LeftRight("/new/RoomList/top",32);
};
//房间列表背景 下 新
class VPic9_RoomListBottom_UI VPic9_UI
{
	Init("/new/RoomList/bottom",8,8);
};
//留言背景 新
class VPic9_MsgBK_UI VPic9_UI
{
	Init("/new/MsgBK_New/MsgBK",8,8);
};
//输入框背景 新
class VPic9_EditBK_UI VPic9_UI
{
	Init("/new/EditBK_New/s",4,4);
};
//小聊天框	夏洋洋添加于2009-12-26
class Pic9_EditBK2_UI VPic9_UI
{
	Init("/new/EditBK_New/x",4,4);
};
//小喇叭部分
class Pic9_LittleBugleBK_UI VPic9_UI
{
	Init("/new/EditBK_New/lb",4,4);
}
//鼠标右键菜单背景 新
class VPic9_MouseRMenu_UI VPic9_UI
{
	Init("/new/MouseRMenu_New/MouseRMenu",2,2);
};
//充值背景 新
class VPic9_AddMoney_UI VPic9_UI
{
	Init("/new/AddMoney_New/AddMoney",16,16);
};
//登陆输入背景 新
class VPic3_Login_EditBK_UI VPic3_UI
{
	LeftRight("/new/Login/editBk",2);
};
//列表选中背景 新
class VPic3_ListBK1_UI VPic3_UI
{
	LeftRight("/new/ListBK/xz",4);
};
//在列表选项上滑过效果	夏洋洋添加于2009-12-22
class VPic3_ListOverBK_UI VPic3_UI
{
	LeftRight("/new/ListBK/jg",2);
};
//在列表选项上滑过效果	双人
class VPic3_ListOverBK2_UI VPic3_UI
{
	LeftRight("/new/ListBK/sjg",2);
};
//频道选择 列表选中背景 新
class VPic3_ChannelListBK_UI VPic3_UI
{
	LeftRight("/new/ListBK/xz",4);
};
//频道选中背景 双人
class VPic3_ChannelListBK2_UI VPic3_UI
{
	LeftRight("/new/ListBK/sxz",4);
};
//录像 列表选中背景 新
class VPic3_VideoListBK_UI VPic3_UI
{
	LeftRight("/new/ListBK/video",8);
};
// 列表中选择自己的背景
class VPic9_ChooseMySelf VPic9_UI
{
	Init("/new/ListBK/xskm", 4,4);
};
//主菜单背景 新
class VPic9_MainMenu1_UI VPic9_UI
{
	Init("/new/MainMenu/bk1_",16,16);
};
//主菜单背景 新
class VPic9_MainMenu2_UI VPic9_UI
{
	Init("/new/MainMenu/bk2_",4,4);
};
//主菜单选中 新
class VPic3_MainMenuSelect_UI VPic3_UI
{
	LeftRight("/new/MainMenu/select",16);
};
//聊天泡泡
class VPic9_SpeakFroth_UI VPic9_UI
{
	Init("/new/SpeakFroth/ltpp",16,16);

};
//悬停背景
class VPic9_HandWnd_UI VPic9_UI
{
	Init("/new/HangWnd/HangWnd",8,16);
};

//聊天表情交互框
class VPic9_ChatFaceAlternation_UI VPic9_UI
{
	Init("/new/ChatFaceAlternation/ChatFaceAlternation",16,16);
};

//聊天表情交互选中效果
class VPic3_ChatMutualBrow_UI VPic3_UI
{
	LeftRight("/new/ChatMutualBrow/ChatMutualBrow",8);
};

//录像 列表选中背景 更新
class VPic3_VideoListBK_New_UI VPic3_UI
{
	LeftRight("/new/VideoListBK/VideoListBK",8);
};
//录像	在列表选项滑过的效果	夏洋洋添加于2009-12-23
class VPic3_VideoListOverBK_New_UI VPic3_UI
{
	LeftRight("/new/VideoListBK/VideoListOverBK",4);
};

//实景喇叭
class VPic9_SceneBugle_UI VPic9_UI
{
	Init("/new/SceneBugle/k",16,16);
};
//上边栏背景底	夏洋洋添加于2009-12-16
class VPic3_TopLayer_BK_UI VPic3_UI
{
	LeftRight("/new/TopLayer_New/b",4);
};
//上边栏背景	夏洋洋添加于2009-12-16
class VPic3_TopLayer_New_UI VPic3_UI
{
	LeftRight("/new/TopLayer_New/sj",4);
};
//上边栏中的文字框背景	夏洋洋添加于2009-12-16
class VPic3_TopLayer_ContentBK_UI VPic3_UI
{
	LeftRight("/new/TopLayer_New/ht",8);
};
//聊天框背景
class VPic9_Chat_New_BK_UI VPic9_UI
{
	Init("/new/Chat_New/ltk",8,8);
};
//阴影效果背景
class VPic3_Shade_UI VPic3_UI
{
	LeftRight("/new/Shade/ty",16);
};
//List的灰背景
class VPic9_ListBG_UI VPic9_UI
{
	Init("/new/ListBK/xsk",4,4);
}
//Help的背景
class VPic9_ListBG2_UI VPic9_UI
{
	Init("/new/ListBK/k",16,16);
}
//家族比赛按钮部分底图
class VPic9_FamilyCompeteBG_UI VPic9_UI
{
	Init("/new/Family/d",32,32);
}
//家族标签背景
class VPic3_FamilyLabelBK_UI VPic3_UI
{
	LeftRight("/new/Family/bqd",4);
}
//下拉框背景
class VPic9_DropMenuBG_UI VPic9_UI
{
	Init("/new/DropMenu/xl",4,4);
}
//系统公告
class VPic3_SysAffiche_UI VPic3_UI
{
	LeftRight("/new/SysAffiche/bk",87);
}

//强制引导
class VPic9_GuideFrame_UI VPic9_UI
{
	Init("/new/Guidebk/",4,4);
};

//列表选中背景 新-情侣排行榜大背景
class VPic3_ListBK1_Big_UI VPic3_UI
{
	LeftRight("/new/ListBK/bigbk",4);
};

//在列表选项上滑过效果 新-情侣排行榜大背景
class VPic3_ListOverBK_Big_UI VPic3_UI
{
	LeftRight("/new/ListBK/big_jg",2);
};

class VPic9_FamilyCreateBK_UI VPic9_UI
{
	Init("/new/FamilyCreate/FC",8,8);
};
