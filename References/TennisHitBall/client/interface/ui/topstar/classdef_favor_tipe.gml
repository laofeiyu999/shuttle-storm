//明星榜-人气 标题栏设计
//安峰册 2009-12-4

class VFavor_TopStar_TopTipes item
{
	pos = "41,91";
	new VPic3_GreyTop_UI{size="100%,100%";}

	new img					// 显示排名
	{
		pos="36,8";
		src="$./imgs"+window.g_Sex +"/pm-text.tga"
	}

	new img					// 显示昵称
	{
		pos="137,7";
		src="$./imgs"+window.g_Sex +"/nc-text.tga"
	}

	new img					// 显示等级
	{
		pos="242,8";
		src="$./imgs"+window.g_Sex +"/dj-text.tga"
	}

	new img					// 显示技术特长
	{
		pos="340,7";
		src="$./imgs"+window.g_Sex +"/jslx-text-bs.tga"
	}

	var _changeImg = new img	// 人气
	{
		pos="456,8";
		src="$./imgs"+window.g_Sex +"/rq-text.tga";
	}

};