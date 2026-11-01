//
//录像的 DBlist
//
/*
import("$./../../Logic/init.gml");
var g_Sex = 1;
bgcolor = "#123456";
*/
//一行显示类：录像名称标题+录像日期+录像文件大小
class VColumn_VideoList_UI item
{
	size="609,56"; cursor=window.CURSOR_HAND;

	void Init()
	{
		new VListBG2_UI{size="100%,50";}//列表背景
		staticvar s_SelectBK = new VPic3_VideoListBK_New_UI{pos = "0,0";size = "100%,64";show = false;}//选中背景
		//staticvar _IMG = new VVedioOver_UI{ pos="0,0"; SetWidth(parent.width); show=false;}	//鼠标滑过效果
		staticvar _IMG = new VPic3_VideoListOverBK_New_UI
		{
			pos = "0,0";size = ""+parent.width+",64";
			//fillimg="$./imgs"+window.g_Sex+"/bk_video.tga";
			show = false;
		}	//鼠标滑过效果


		class video_text BaseText
		{
			autoenter=true; size="289,21";
		};

		// 录像名称
		new img{pos="27,7"; src="$./imgs"+window.g_Sex+"/video_name.tga";}
		staticvar s_Title = new video_text
		{
			pos="89,8";
			void SetData(data1)
			{
				src=data1;
			}
		}
		
		// 录像时间
		new img{pos="27,27"; src="$./imgs"+window.g_Sex+"/video_tm.tga";}
		staticvar s_Date = new video_text
		{
			pos = "89,28";
			void SetData(data1)
			{
				src = data1;
			}
		}

		// 录像大小
		new img{pos="380,27"; src="$./imgs"+window.g_Sex+"/video_sz.tga";}
		staticvar s_Size =new video_text
		{
			pos = "443,28";
			void SetData(data1)
			{
				src = data1+"k";
			}
		}
	}

	void OnMySelect()
	{
		_Bk.show = true;
	}

	void OnMyUnSelect()
	{
		_Bk.show = false;
	}

	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){_IMG.show=true;}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){_IMG.show=false;}
	}
	//选择的效果
	void OnMySelect()
	{
		if(_SelectState == true){return;}
		s_SelectBK.show=true;_IMG.show=false;_SelectState = true;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		if(_SelectState == false){return;}
		s_SelectBK.show=false;_SelectState = false;
	}

	var _videoHover = new VVideo_Hover{};//录像路径+名称悬停
}

//
//总的类：List
//
class VVideoList_UI VN2ListCtrl
{
	//需要显示时改变
	size="612,336"; pos="19,48"; bgcolor = "-1";
}
<END>
class TSVideoList item
{
	size="612,347"; pos="16,38"; bgcolor = "-1";

	new VColumn_VideoList_UI{Init();}
	new VColumn_VideoList_UI{pos="0,56";Init();}
	new VColumn_VideoList_UI{pos="0,112";Init();}
	new VColumn_VideoList_UI{pos="0,168";Init();}
	new VColumn_VideoList_UI{pos="0,224";Init();}
	new VColumn_VideoList_UI{pos="0,280";Init();}
};

new VColumn_VideoList_UI{pos = "0,50";Init();}