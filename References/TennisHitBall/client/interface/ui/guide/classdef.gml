//yxf 2009年3月25日
//

//界面引导类定义-单个的定义
class VGuide_UI item
{
	bgcolor = -1;
	void Init()
	{	
		//箭头
		//[参数]_src:图片文件名
		//		_pos:图片位置
		staticvar s_Img = new img
		{
			void SetData(_src,_pos)
			{
				src = "$./imgs/"+_src;
				parent.pos = ""+_pos;
				parent.size(width,height);
				clipani(width,height/2,1,2);
				anispeed = 3;
			}
		}
	}
};