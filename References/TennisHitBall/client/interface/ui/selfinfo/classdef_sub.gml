//个人信息:子类定义
//yxf 2008年12月17日

//服饰装备图标
class VDE_Icon_UI item
{
	size = "100,98";
	var _bk = new img{} //底图
	var _bk2 = new img{src = "$./../PublicImage/imgs"+window.g_Sex+"/Icon1.tga";show = false;}
	var _top = new VGoodsIconNew_Logic{}//图标

	//设置底图的图标
	//参数 _name :底图的名字
	void Init(_name)
	{
		_bk.src = "$./../PublicImage/imgs"+window.g_Sex+"/"+_name;
	}
	//设置装备的图标
	//参数data1：物品的显示ID
	//参数data2：物品的GID - 自己的球怕时才有值 其他为-1
	void SetData(data1,data2)
	{
		printf("B# VDE_Icon_UI:data1:"+data1+",data2:"+data2);	
		if (toint(data2) == -1)
		{
			var _id = window.GetEnterIDByDisplayID(data1);
			if (_id > 0)
			{
				_bk2.show = true;
				_bk.show = false;
			}
			_top.SetID(_id,0);//悬停用
		}
		else
		{
			if (data2 > 0)
			{
				_bk2.show = true;
				_bk.show = false;
			}
			_top.SetID(data2,1);//悬停用
		}
		_top.s_IMG.src = "$./../PublicImage/GoodsIcon/"+window.GetIconNameByDID(data1)+".tga";
	}
};