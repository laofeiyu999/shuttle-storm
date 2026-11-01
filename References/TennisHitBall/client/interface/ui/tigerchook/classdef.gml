//老虎鸡的显示类定义
//yangxf 2009年5月26日
//

class VTigerChook_UI item
{
	size = "446,214";//bgcolor = "#FF";alpha = 50;
	bgcolor = -1;
	valign(50,0);halign(50,0);
	//=============================与界面交互========================================
	void Init()
	{	
		new img{src = "$./imgs/bk.tga";}
		
		//所得物品
		staticvar s_Goods = new item
		{
			size(371,111);pos="36,38";
			//bgcolor="#00ff00";alpha=60;
			new img{src = "$./imgs/icon_bk.tga";pos(134,5);}
			new img{src = "$./imgs/icon_bk.tga";pos(5,5);}
			new img{src = "$./imgs/icon_bk.tga";pos(263,5);}
			var _g1 = new VTigerChook_Icon_UI{pos(134,5);show = false;}
			var _g2 = new VTigerChook_Icon_UI{pos(5,5);show = false;}
			var _g3 = new VTigerChook_Icon_UI{pos(263,5);show = false;}
			
			var m_IsOver = false;
			var m_Num = 0;
			var m_GoodsStr = "";
			//
			void SetData(_str)
			{
				printf("B# 老虎鸡SetData():_str:"+_str);
				if (_str == "") 
					return;
				if (!m_IsOver)
				{
					m_GoodsStr = _str;
					return;
				}
				sleep(2000);
				var _num = window.GetSplitCount(_str,"|");
				var _arrAll = window.SplitStr2(_str,";",_num);
				//_num = toint(_num)/3;
				_g1.SetGoods(toint(_arrAll[0]),toint(_arrAll[1]),toint(_arrAll[2]));
				_g2.SetGoods(toint(_arrAll[3]),toint(_arrAll[4]),toint(_arrAll[5]));
				_g3.SetGoods(toint(_arrAll[6]),toint(_arrAll[7]),toint(_arrAll[8]));
				
				timer(3000,"parent.parent.del()");
				window.LoadInfoBoard(379); //物品已进入背包
			}//SetData

			//
			void SetNum(num)
			{
				printf("B# 老虎鸡:_num:"+_num);
				m_Num = toint(num);
				var _i = 1;
				while (_i <= m_Num)
				{
					switch (_i)
					{
					case 1:_g1.show = true;_g1.Run();break;
					case 2:_g2.show = true;_g2.Run();break;
					case 3:_g3.show = true;_g3.Run();break;
					}
					sleep(1000);
					_i += 1;
				}
			}
			
			//
			var _j = 0;
			void AniOver()
			{
				_j += 1;
				if (_j == m_Num)
				{
					m_IsOver = true;
					SetData(m_GoodsStr);
				}
			}
		}
	} // end Init

//	void OnClick()
//	{
//		var _num = rand(1,4);
//		s_Goods.SetNum(_num);
//	}
};

//老虎鸡的一个物品，带动画
class VTigerChook_Icon_UI item
{
	size = "102,100";//bgcolor = "#FF";alpha = 50;

	var _img = new img
	{
		src = "$./imgs/icon.tga";show = false;
	}
	var _ques = new img
	{
		src = "$./imgs/question.tga";show = false;
	}
	var _icon = new VGoodsIconNew_Logic
	{
		valign(50,0);halign(50,0);
		//bgcolor = "#FF";
		void SetData(data)
		{
			SetMySize(80,80);
			SetID(data);
		}
	}

	void Run()
	{
		_img.show = true;
		_img.clipani(102,100,1,7);
		_img.anispeed = 8;
		timer(3000,"Over");
	}

	void Over()
	{
		_ques.show = true;
		_img.clipani(102,100,1,7);
		_img.anispeed = 0;
		_img.aniindex = rand(7);
		_img.show = false;
		parent.AniOver();
	}
	
	//物品ID,等级，数量
	void SetGoods(entryid,lv,num)
	{
		if (entryid < 0) return;
		printf("B# 老虎鸡SetGoods():entryid:"+entryid+",lv:"+lv+",num:"+num);
		_ques.show = false;
		_icon.SetIcon(entryid,lv,num);
		_icon.SetData(entryid);
	}
};