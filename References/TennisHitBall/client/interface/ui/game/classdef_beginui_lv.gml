//
//游戏内界面的界面部分的类定义:开始>>双打>>LV
//

class VBegin_LV_UI item
{
	size = "450,300";show = false;//bgcolor = "#FF";
	var _temp;//记住等级的变量
	new img
	{
		size = "94,53";pos = "50,110";
		src = "$./imgs/LV-01.tga";
	}
	var h_num_bk = new img{size = "66,62";show = false;}//百位数 - 发光-底
	var t_num_bk = new img{size = "66,62";show = false;}//十位数 - 发光-底
	var o_num_bk = new img{size = "66,62";show = false;}//个位数 - 发光-底
	//
	var shinenum = new item
	{
		size = "100%,100%";show = false;

		var shinetop = new img
		{
			size = "80,80";pos = "55,95";
			src = "$./imgs/LV-02.tga";
		}
		var h_num = new img{size = "66,62";show = false;}//百位数 - 蓝色
		var t_num = new img{size = "66,62";show = false;}//十位数 - 蓝色
		var o_num = new img{size = "66,62";show = false;}//个位数 - 蓝色
	}
	void SetData(data1,data2)
	{
		var i = data2/100;        //取得百位数 
		var j = data2/10-i*10;    //十位数 
		var k = data2%10;        //取得个位数
		_temp = data2;
		if(i > 0)
		{
			shinenum.t_num.pos = "170,100";
			shinenum.h_num.pos = "125,100";
			shinenum.o_num.pos = "215,100";
			t_num_bk.pos = "170,100";
			h_num_bk.pos = "125,100";
			o_num_bk.pos = "215,100";
			h_num_bk.show = true;
			t_num_bk.show = true;
			o_num_bk.show = true;
			shinenum.h_num.src = "$./imgs/num/Light"+i+".tga";
			h_num_bk.src = "$./imgs/num/Blue"+i+".tga";
			shinenum.t_num.src = "$./imgs/num/Light"+j+".tga";
			t_num_bk.src = "$./imgs/num/Blue"+j+".tga";	
			shinenum.o_num.src = "$./imgs/num/Light"+k+".tga";
			o_num_bk.src = "$./imgs/num/Blue"+k+".tga";
		}
		else
		{
			if(j > 0)
			{
				o_num_bk.pos = "170,100";
				t_num_bk.pos = "125,100";
				shinenum.o_num.pos = "170,100";
				shinenum.t_num.pos = "125,100";
				h_num_bk.show = false;
				t_num_bk.show = true;
				o_num_bk.show = true;
				shinenum.h_num.show = false;
				shinenum.t_num.show = true;
				shinenum.o_num.show = true;
				shinenum.t_num.src = "$./imgs/num/Light"+j+".tga";
				t_num_bk.src = "$./imgs/num/Blue"+j+".tga";	
				shinenum.o_num.src = "$./imgs/num/Light"+k+".tga";
				o_num_bk.src = "$./imgs/num/Blue"+k+".tga";				
			}
			else
			{
				o_num_bk.pos = "125,100";
				shinenum.o_num.pos = "125,100";
				h_num_bk.show = false;
				t_num_bk.show = false;
				o_num_bk.show = true;
				shinenum.h_num.show = false;
				shinenum.t_num.show = false;
				shinenum.o_num.show = true;
				shinenum.o_num.src = "$./imgs/num/Light"+k+".tga";
				o_num_bk.src = "$./imgs/num/Blue"+k+".tga";	
			}
		}
	}
	void LvPos()
	{
		if(_temp > 99)
		{
			shinenum.t_num.setParamTimer("pos","170,100","103,31",133,1333);
			shinenum.t_num.setParamTimer("pos","103,31","170,100",133,1467);
			shinenum.h_num.setParamTimer("pos","125,100","58,31",133,1333);
			shinenum.h_num.setParamTimer("pos","58,31","125,100",133,1467);
			shinenum.o_num.setParamTimer("pos","215,100","158,31",133,1333);
			shinenum.o_num.setParamTimer("pos","158,31","215,100",133,1467);
		}
		else
		{
			if(_temp > 9)
			{
				shinenum.o_num.setParamTimer("pos","170,100","103,31",133,1333); 
				shinenum.o_num.setParamTimer("pos","103,31","170,100",133,1467); 
				shinenum.t_num.setParamTimer("pos","125,100","58,31",133,1333); 
				shinenum.t_num.setParamTimer("pos","58,31","125,100",133,1467); 
			}
			else
			{
				shinenum.o_num.setParamTimer("pos","125,100","58,31",133,1333); 
				shinenum.o_num.setParamTimer("pos","58,31","125,100",133,1467); 
			}
		}
	}
};