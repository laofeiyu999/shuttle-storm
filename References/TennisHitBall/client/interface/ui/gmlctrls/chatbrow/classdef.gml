//聊天表情的类定义
import("$./../VPopWnd/ClassDef.gml");
//YY
class F_yy img{src = "$./imgs/face_0.tga";clipani(25,25,1,8);anispeed = 10;};
//闭嘴
class F_biz img{src = "$./imgs/face_1.tga";clipani(25,25,1,2);anispeed = 5;};
//不屑
class F_bux img{src = "$./imgs/face_2.tga";clipani(25,25,1,5);anispeed = 5;};
//大哭
class F_dak img{src = "$./imgs/face_3.tga";clipani(25,25,1,4);anispeed = 10;};
//恶心
class F_exin img{src = "$./imgs/face_4.tga";clipani(25,25,1,10);anispeed = 10;};
//害羞
class F_haix img{src = "$./imgs/face_5.tga";clipani(25,25,1,4);anispeed = 6;};
//汗
class F_han img{src = "$./imgs/face_6.tga";clipani(25,25,1,16);anispeed = 10;};
//加油
class F_jiay img{src = "$./imgs/face_7.tga";clipani(25,25,1,4);anispeed = 10;};
//惊讶
class F_jingy img{src = "$./imgs/face_8.tga";clipani(25,25,1,8);anispeed = 10;};
//囧
class F_jiong img{src = "$./imgs/face_9.tga";clipani(25,25,1,8);anispeed = 10;};
//巨雷
class F_julei img{src = "$./imgs/face_10.tga";clipani(25,25,1,5);anispeed = 2;};
//开心
class F_kaixin img{src = "$./imgs/face_11.tga";clipani(25,25,1,2);anispeed = 10;};
//口哨
class F_kous img{src = "$./imgs/face_12.tga";clipani(25,25,1,10);anispeed = 10;};
//怒
class F_nule img{src = "$./imgs/face_13.tga";clipani(25,25,1,6);anispeed = 10;};
//色
class F_sese img{src = "$./imgs/face_14.tga";clipani(25,25,1,4);anispeed = 5;};
//傻笑
class F_shax img{src = "$./imgs/face_15.tga";clipani(25,25,1,6);anispeed = 10;};
//无力
class F_wuli img{src = "$./imgs/face_16.tga";clipani(25,25,1,18);anispeed = 10;};
//疑问
class F_yiw img{src = "$./imgs/face_17.tga";clipani(25,25,1,6);anispeed = 10;};
//再见
class F_bye img{src = "$./imgs/face_18.tga";clipani(25,25,1,2);anispeed = 5;};
//装可怜
class F_kelian img{src = "$./imgs/face_19.tga";clipani(25,25,1,10);anispeed = 10;};

//
//聊天表情 界面:显示类定义
//
class VChat_Brow_UI item
{
	size = "251,119";bgcolor = -1;alpha = 0;
	pos(window.mousex+10,window.mousey-120);
	/*
	new img
	{
		src = "$./imgs"+window.g_Sex+"/bk.tga";
		pos = "0,0";
	}
	*/
	//背景为9宫格的背景
	new VPic9_ChatFaceAlternation_UI
	{
		size = "100%,100%";
	}
};