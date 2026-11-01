//陈晓聪 2009年3月31日
import("$./../GmlCtrls/VPopWnd/ClassDef.gml");

///------------------------------表情动作-------------------------------
// 动作表情的一行显示类
class Column_Brow_DBList_UI item
{
	size = "68,18";border = "0";bgcolor = -1;alpha = -1;
	var m_MyText = "";//文字
	var m_MyMark = "";//符号
	var m_ActID = "";//动作ID

	void Init()
	{
		//staticvar s_Select = new img{alpha = 100;}
		//鼠标滚动时显示的背景色，背景为由三张配图组成的动态图片，没有测试过是不是能成功
		staticvar _Over = new VPic3_ChatMutualBrow_UI{ size = "100%,32"; show=false;ycenter = true;}//鼠标滑过效果

		//动作表情文字
		//参数 data1：显示文字
		//参数 data2：说明文字
		staticvar s_Brow = new text
		{
			font = "宋体,-1,12";size = "100%,100%"; cursor = window.CURSOR_HAND;ycenter = true;
			void SetData(data0,data1,data2)
			{
				src = data1.Trim(" ");
				parent.m_ActID = data0;
				parent.m_MyText = data1.Trim(" ");
				parent.m_MyMark = data2.Trim(" ");

			}
		}
		new item
		{
			size = "100%,12";
			cursor = window.CURSOR_HAND;
			void OnMouseOver()
			{
				parent._Over.show = true;

				set window
				{
					_BrowFaceItem.del();
					var _BrowFaceItem = new item
					{
						var _bk = new VPic9_HandWnd_UI{};

						var _BrowFaceText = new text
						{
							//color = "#FFFFFF";
							font = "宋体,-1,12";pos(12,9);
							zindex="top";show = true;
						}

						void SetData(param)
						{
							_BrowFaceText.src = param;
							size(param.Count*7,34);
							_bk.SetSize(param.Count*7,34);
						}
					}
				}
				window._BrowFaceItem.pos(window.mousex+30,window.mousey);
				window._BrowFaceItem.SetData(parent.m_MyMark);
			}
			void OnMouseOut()
			{
				//alert("m_ID: "+m_ID + " m_ChooseID: "+window.find("ChatSend_Logic_name").m_ChooseID);
				if (toint(parent.m_ID) != toint(window.find("ChatSend_Logic_name").m_ChooseID))
					parent._Over.show = false;
				window._BrowFaceItem.del();
			}
		}
	}
	void OnDelete()
	{
		window._BrowFaceItem.del();
	}
	//需要被显示的类覆盖
	void OnMySelect()
	{
		window.PlaySound(4);
		window._BrowFaceItem.del();
//		s_Select.alpha = 0;
	}		//选择的效果
	void OnMyUnSelect()
	{
//		s_Select.alpha = 100;
	}	//不选择的效果
};

//排版器，可自定义
class Brow_DBList_TypeSet_UI VN2LCTypesetter
{
	autochgrow="68";
};

//
//总的类：List
//
class Brow_DBList_UI VN2ListCtrl
{
	//需要显示时改变
	pos = "12,14";size = "82%,89%";bgcolor = -1;alpha = 0;
	scroll = window.SCROLL_NOTENNIS;
	typesetter ="Brow_DBList_TypeSet_UI";

//	bgcolor = "#FF";
};

///------------------------------私聊对象-------------------------------
// 私聊对象的一行显示类
//class Column_PrivateName_DBList_UI item
//{
//	size = "113,19";border = "0";bgcolor = -1;alpha = -1;
//	void Init()
//	{
//		staticvar s_Select = new imgm{pos = "2,0";alpha = 100;src = "$./imgs/bk_PlayerNameList_Select.tga";size = "111,19";}
//		//玩家名
//		staticvar s_text = new text
//		{
//			pos = "2,0";size="111,19";
//			font = "宋体,-1,12";color = "#FFFFFF";
//			xcenter = true;ycenter = true;
//			void SetData(data)
//			{
//				src = data;
//			}
//		};
//	}
//	void OnMouseOver()
//	{
//		s_Select.alpha = 0;
//
//	}
//	void OnMouseOut()
//	{
//		s_Select.alpha = 100;
//	}
//	//需要被显示的类覆盖
//	void OnMySelect(){window.PlaySound(4);}		//选择的效果
//	void OnMyUnSelect(){}	//不选择的效果
//};
//
////
////总的类：List
////
//class PrivateName_DBList_UI VN2ListCtrl
//{
//	//需要显示时改变
//	pos = "48,112";size="133,57";alpha = -1;bgcolor = -1;
//	scroll = "no";
//	scroll = "no;smallscroll";
//};
