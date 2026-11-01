//活动总结算显示类定义
//yxf 2009年6月10日

//公司网址
class VWeb a
{
	cursor = window.CURSOR_HAND;
	//
	void OnMouseDownL()
	{
		window.g_CTennisUIInit.OpenIE("http://tennis.joy-china.net");
	}
};

class VActivityOver_UI item
{
	size="100%,100%";bgcolor=-1;alpha=0;
	
	void Init()
	{

		new img{src = "$./../GameOver/imgs"+window.g_Sex+"/bk.jpg";}
		new img{src = "$./imgs/text.tga";pos="21,104";}
		new img{src = "$./imgs"+window.g_Sex+"/top_bk.tga";valign(50,0);halign(50,0);}
		new img{src = "$./imgs"+window.g_Sex+"/text_bk.tga";valign(93,0);halign(50,0);}
		
		//说明文字
		staticvar s_Text = new iframe
		{
			size = "600,100";//bgcolor = "#FFFF";alpha = 50;
			pos="212,614";
			//scroll = window.SCROLL_NOTENNIS;
			var _html = new html
			{
				var _body = new body{}
			}

			void SetData(data)
			{
				_html._body.appendHtml("<font size=18px; color=#000000>&nbsp;&nbsp;&nbsp;&nbsp;"+data+"<br></font>");
			} 

			SetData("请获奖玩家即时查收【礼品盒】中的兑奖券，并于今天0点之前在【背包】的【道具】页面进行兑换您的奖品！未及时完成兑换的获奖玩家请关注《网球宝贝》官方网站(<VWeb>www.joy-china.net</VWeb>)，关注兑奖相关信息！");
		}
		
//		staticvar s_Text = new text
//		{
//			font = "宋体,-1,18";
//			size = "600,100";//bgcolor = "#FFFF";alpha = 50;color = "#FFFFFF";
//			pos="212,614";autoenter = true;
//			ycenter = true;//xcenter = true;
//			void SetData(data)
//			{
//				src = ""+data;
//			}
//
//			SetData("    请获奖玩家即时查收【礼品盒】中的兑奖券，并于今天0点之前在【背包】的【道具】页面进行兑换您的奖品！未及时完成兑换的获奖玩家请关注《网球宝贝》官方网站，关注兑奖相关信息！");
//		}

		//关闭：按钮
		staticvar s_Btn_Close = new VBTN_WzcloseWindow{valign(98,0);halign(98,0);}
	}
};