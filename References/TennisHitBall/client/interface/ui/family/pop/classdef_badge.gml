//家族徽章设计图
//夏洋洋 2010-3-3


class VBadgeBK_UI item
{
	size = "50,50";
	var _bk = new img
	{
		void changSrc(data)
		{
			src = "$./imgs"+window.g_Sex+"/dtk0"+data+".tga";
		}
	}
	void SetData(data)
	{
		_bk.changSrc(data);
	}
}

//一个徽章外框或内框类
class VColumn_BadgeImg_UI item
{
	size = "50,50";
	cursor = window.CURSOR_HAND;
	var s_Bk = new img
	{
		size = "100%,100%";
		src = "$./imgs"+window.g_Sex+"/k03.tga";
		
		void SetData(_state)
		{
			if(_state == 3)
			{
				show = true;
			}
			else
			{
				show = false;
			}
		}
	}
	void Init()
	{
//		staticvar s_Bk = new VBadgeBK_UI
//		{
//			SetData(2);
//		}
		//徽章外框或内框图片
		staticvar s_BadgeImg = new img
		{
			valign(50,0);halign(50,0);
			//[功能]设置徽章外框或内框图片
			//[参数]data1：1为外框，2为内框；data2:徽章等级;data3：图片索引
			//[返回值]无
			void SetData(data1,data2,data3)
			{
				src = "$./../imgs/Badge"+data1+"/"+data2+"/"+data3+".tga";
			}
		}
	}
	
	var _selectState = false;
	void OnMouseOver()
	{
		if(_selectState == false){s_Bk.SetData(2);}
	}
	void OnMouseOut()
	{
		if(_selectState == false){s_Bk.SetData(2);}
	}
	//选择效果
	void OnMySelect()
	{
		_selectState = true;
		s_Bk.SetData(3);
	}
	//不选择小姑
	void OnMyUnSelect()
	{
		_selectState = false;
		s_Bk.SetData(2);
	}
}
//排版器，可自定义
class VCreateFamily_TypeSet_UI VN2LCTypesetter
{
	autochgrow="260";
};
//总的类：List
class VCreateFamily_BadgeList_UI VN2ListCtrl
{
	pos = "46,283";size = "300,102";valign(0,0);halign(0,0);//需要显示时改变
	
	typesetter ="VCreateFamily_TypeSet_UI";

	//[功能]设置列表的位置
	//[参数]data：列表的位置
	//[返回值]无
	void SetPos(data)
	{
		pos = data;
	}
	//[功能]设置列表的位置
	//[参数]data：列表的位置
	//[返回值]无
	void SetSize(data)
	{
		size = data;
	}
};