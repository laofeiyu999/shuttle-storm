//宝箱的显示类定义
//yangxf 2009年5月26日
//

class VTreasureBox_UI item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	//bgcolor = -1;
	//valign(50,0);halign(50,0);
	//=============================与界面交互========================================
	void Init()
	{	
		//所得物品
		staticvar s_Goods = new item
		{
			size = "100%,100%";pos="36,38";
			//bgcolor="#00ff00";alpha=60;
			var _turn = new img
			{
				src = "$./imgs/turn.tga";valign(50,0);halign(50,0);
				show = false;size = "200,200";
				void Run()
				{
					show = true;
					clipani(200,200,1,20);
					anispeed = 60;
					parent._open.timer(3000,"Run");
				}
			}
			
			var _open = new img
			{
				src = "$./imgs/open.tga";valign(50,0);halign(50,0);
				show = false;size = "200,200";
				void Run()
				{
					parent._turn.show = false;
					show = true;
					clipani(200,200,1,4);
					anispeed = 12;
					aniloops = 1;
					parent.timer(1000,"AniOver");
				}
			}
			var _icon = new VGoodsIconNew_Logic
			{
				valign(50,0);halign(50,0);show = false;
				//bgcolor = "#FF";
				void SetData(data)
				{
					SetMySize(80,80);
					SetID(data);
				}

				//物品ID,等级，数量
				void SetGoods(entryid,lv,num)
				{
					if (entryid < 0) return;
					show = true;
					printf("B# 宝箱SetGoods():entryid:"+entryid+",lv:"+lv+",num:"+num);
					SetIcon(entryid,lv,num);
					SetData(entryid);
				}
			}
			var m_IsOver = false;
			var m_Num = 0;
			var m_GoodsStr = "";
			//
			void SetData(_str)
			{
				printf("B# 宝箱SetData():_str:"+_str);
				if (_str == "") 
					return;
				if (!m_IsOver)
				{
					m_GoodsStr = _str;
					return;
				}
				var _num = window.GetSplitCount(_str,"|");
				var _arrAll = window.SplitStr2(_str,";",_num);
				_icon.SetGoods(toint(_arrAll[0]),toint(_arrAll[1]),toint(_arrAll[2]));

				timer(3000,"parent.parent.del()");
				window.LoadInfoBoard(379); //物品已进入背包
			}//SetData

			//
			void SetNum(num)
			{
				printf("B# 宝箱:_num:"+_num);
				m_Num = toint(num);
				_turn.Run();
			}
			
			//
			void AniOver()
			{
				m_IsOver = true;
				SetData(m_GoodsStr);
			}
		}
	} // end Init

//	void OnClick()
//	{
//		s_Goods.SetNum(1);
//	}
};