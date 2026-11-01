//训练结算任务list显示类
//2009-2-21
//吴楠

class VColumn_QList_UI item
{
	size="100%,28";
	void Init()
	{
		//名称
		//参数1 name: 名称
		new VListBG2_UI{size="100%,27";}//列表背景
		staticvar s_Name = new BaseText
		{
			size="100%,27";pos(0,0);ycenter=true;
			void SetData(data)
			{
				src=data;
			}
		}

		//状态
		//参数1 state：是否通过  0未通过 1通过
		staticvar s_State = new img
		{
			valign(50,0);halign(98,0);
			void SetData(data)
			{
				if(data == 1)
				{
					src="$./imgs"+window.g_Sex+"/ywc.tga";
				}
				if(data == 0)
				{
					src="$./imgs"+window.g_Sex+"/wwc-text.tga";
				}
			}
		}
	}
};

//总的类：List
//
class VQ_CourseList_UI VN2ListCtrl
{
	//需要显示时改变
	size="165,364";pos(560,180);
	scroll = window.SCROLL_NOTENNIS;
	bkcolor=-1;
//	bgcolor = -1;
};