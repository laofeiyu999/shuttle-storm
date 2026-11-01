class TopStar_TopTipes item
{
	pos = "41,103";
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

	var _changeImg = new img					// 显示总成绩
	{
		pos="456,8";
		src="$./imgs"+window.g_Sex +"/zcs-text.tga";
	}
	void SetData(data)
	{
		switch (data)
		{
			case 0:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/zcc-text.tga";
				_changeImg.pos="440,8";
				break;
			}
			case 1:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/slcc-text.tga";
				_changeImg.pos="435,8";
				break;
			}
			case 2:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/zdf-text.tga";
				_changeImg.pos="441,8";
				break;
			}
			case 3:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/yjdfs-text.tga";
				_changeImg.pos="426,8";
				break;
			}
			case 4:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/jnzs-text.tga";
				_changeImg.pos="432,8";
				break;
			}
			case 5:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/mxlcs-text.tga";
				_changeImg.pos="426,8";
				break;
			}

			case 100:
			{
				_changeImg.src="$./imgs"+window.g_Sex +"/qmd-text.tga";
				_changeImg.pos="456,8";
				break;
			}
		}
	}
};