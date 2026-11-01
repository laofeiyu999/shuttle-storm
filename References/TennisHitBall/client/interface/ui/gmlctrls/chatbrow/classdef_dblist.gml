//
//表情列表 List
//yxf 2008年12月11日
//

importex("$./../../../UI/GmlCtrls/ChatBrow/ClassDef_DBlist.gml");
importex("$./../VPopWnd/ClassDef.gml");
//一行显示类：表情图标
class VColumn_ChatBrow_UI item
{
	size = "33,33";bgcolor = -1;
	var m_MyText = "";//文字
	//var m_MyMark = "";//符号
	//===========================与显示交互======================================
	void Init()
	{
		//背景图片
		staticvar s_bk = new img
		{
			src = "$./imgs/bqk.tga"	;show = false;size = "25,25";valign(50,0);halign(50,0);
		}
		//表情图片
		//参数 data1：序号
		//参数 data2：文字
		//参数 data3: 符号
		//参数 data4: 帧数
		//参数 data5: 速度
		staticvar s_Brow = new img
		{
			valign(50,0);halign(50,0);
			void SetData(data1,data2,data3,data4,data5)
			{
				src = "$./imgs/face_"+data1+".tga";
				parent.m_MyText = data2;
				clipani(25,25,1,data4);
				anispeed = data5;
				
			}
			void OnMouseOver()
			{
				parent.s_bk.show = true;
			}
			void OnMouseOut()
			{
				parent.s_bk.show = false;
			}
		}
	}

	new item//鼠标悬停
	{
		size = "29,29";pos = "2,2";cursor = window.CURSOR_HAND;
		void OnMouseOver()
		{
			parent._Over.show = true;
			parent._bk.show = true;
			set window
			{
				
				_FaceItem.del();
				var _FaceItem = new item
				{
					//var _bk = new VHANGWND_BK_UI{}
					var _bk = new VPic9_HandWnd_UI{};

					var _FaceText = new text
					{
						//bgcolor = "#FF";
						font = "宋体,-1,12";pos(16,9);
						zindex="top";show = true;
					}

					void SetData(param)
					{
						_FaceText.src = param;
						size(param.Count*12,32);
						_bk.SetSize(param.Count*12,32);
					}
				}
			}
			window._FaceItem.pos(window.mousex+55,window.mousey);
			//window._FaceItem.SetData(""+parent.m_MyText+" "+parent.m_MyMark);
			window._FaceItem.SetData(""+parent.m_MyText+" ");
		}
		void OnMouseOut()
		{
			parent._Over.show = false;
			window._FaceItem.del();
		}
	}
	void OnDelete()
	{
		window._FaceItem.del();
	}
};

//排版器，可自定义
class VChatBBrow_TypeSet_UI VN2LCTypesetter
{
	autochgrow="220";
};

//
//总的类：List
//
class VChatBrow_List_UI VN2ListCtrl
{
	size = "231,100";pos = "12,10";
	bgcolor = -1;alpha = 0;
	typesetter ="VChatBBrow_TypeSet_UI";
};