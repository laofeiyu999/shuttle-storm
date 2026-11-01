//训练结算界面
//2009-1-4 
//吴楠

class VTrainOver_BG VUIBG_UI
{
	size = "500,400";
	valign(30,0);halign(50,0);
	//pos = "25,94";
	bgcolor = "-1";
	SetTitalPos("25,0");
	InitBG("$./imgs" + window.g_Sex+ "/xljs-bt-text.tga");
//	InitClose();
//	InitHelp();	
	new img{ show = true;src = "$./imgs" + window.g_Sex+ "/jy-text.tga"; pos = "22,300"; }
	new img{ show = true;src = "$./imgs" + window.g_Sex+ "/jb-text.tga"; pos = "165,300";}
	new img{ show = true;src = "$./imgs" + window.g_Sex+ "/xllb-text.tga"; pos = "300,44";}
	new img{ show = true;src = "$./imgs" + window.g_Sex+ "/xlwc-text.tga"; pos = "22,44";}
	new VPic9_BK2_UI	//	训练完成底
	{
		size = "260,230";pos = "20,64";
	}
};

class VTrainOver_UI item
{
//	bgcolor = "#000000";alpha = 30;
	void Init()
	{
		new img
		{
			src = "$./../GameOver/imgs"+window.g_Sex+"/bk.jpg";size = "100%,100%";
		}
		staticvar s_Over_Bg = new VTrainOver_BG		//	左边结算框
		{
			
		}
		//训练说明
		//参数2 data2:说明
		staticvar s_Explain = new item
		{
			size(250,220);//pos="285,180";//bgcolor = "#00":
			left = parent.s_Over_Bg.left+25;
			top = parent.s_Over_Bg.top + 70;
			autoenter=true;
			//src = "$./../GmlCtrls/UI_BG/content.htm";
			var _html = new html
			{
				var _body = new body{};
			}
			
			void SetData(data1,data2)
			{
				//BODY.delallchild();
				//src = "  "+data2;
				_html._body.appendHtml("<font color=#028DBE size=12px>  "+window.TransHtmlform(data2)+"</font><br>");
			}
		}
		
//		//奖励-物品
//		//参数1 data2:格式："物品ID1,数量,有效期;物品ID2,数量,有效期"
//		staticvar s_AwardGoods = new VContentIframe_UI{size = "395,226";pos = "225,269";}
		//奖励-经验
		//参数2 data2:
		staticvar s_Award_Exp = new BaseText
		{			
			//pos="280,406";//86,522
			size(70,20);//bgcolor = "#FFFFFF";alpha = 30;
			left = parent.s_Explain.left+30;
			top = parent.s_Explain.top + parent.s_Explain.height+7;
			bold=true;ycenter = true;xcenter = true;
//			if(window.g_Sex==1){color = "#be0766";}
//			else{color = "#002579s";}
			void SetData(data1,data2){src=data2;}
		}
		//奖励-金币
		//参数2 data2:
		staticvar s_Award_Gold = new BaseText
		{
			//pos="420,406";//302,522
			size(70,20);//bgcolor = "#FFFFFF";alpha = 30;
			left = parent.s_Award_Exp.left + parent.s_Award_Exp.width + 75;
			top = parent.s_Award_Exp.top;
//			if(window.g_Sex==1){color = "#be0766";}
//			else{color = "#002579s";}
			bold=true;ycenter = true;xcenter = true;
			void SetData(data1,data2){src=data2;}
		}
	}
	//设置物品结算完成一次后的奖励
	void SetTrainOver()
	{
//		_bk.src="$./imgs"+window.g_Sex+"/bk2.tga";
//		_ItemBK.show=false;
//		s_Award_Icon.show=false;
//		s_Award_Name.show=false;
//		s_Award_Period.show=false;
//		_tips.show=false;
//		s_Award_Gold.pos(427,473);
//		s_Award_Exp.pos(555,473);
	}
};