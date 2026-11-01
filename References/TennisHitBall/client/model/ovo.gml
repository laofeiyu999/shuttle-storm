class FormatText text
{
	maxsize = "100";
	size = "100%, 20";
	color = "#0";
	font="幼圆, -1, 16";
	xcenter=true;
	ycenter=true;
};

class Credits item
{
	var nWidth = 200;
	var nHigth = 200;
	size = "" + nWidth + "," + nHigth;

	var arrmax = 40;
	var curInitIndex = 0;
	var _srr = sysarray(arrmax);
	var stopPos = 975;

	void ChangePos( centerPos)
	{
		if( stopPos < centerPos)
		{
			sleep( 2000);
			del();
			return;
		}
		CalPos( centerPos);
		CalAlpha( centerPos);
	}

	void CalPos( centerPos)
	{
		var calpos = "";
		var i = 0;
		while( i<arrmax)
		{
			calpos  = "0, " + ( i * 25 + ( -1 * ( centerPos - nHigth / 2)));
			_srr[i].pos = calpos;
			i=i+1;
		}
	}

	void CalAlpha( centerPos)
	{
		var calposY = 0;
		var offSet = 0;
		var i = 0;
		while( i<arrmax)
		{
			calposY  = ( i * 25 + ( -1 * ( centerPos - nHigth / 2)));
			offSet = calposY - nHigth / 2;
			if( ( offSet > -nHigth / 2) && ( offSet < nHigth / 2))
			{
				if( offSet < 0)
					offSet = offSet * -1;
				var calAlpha = 100 * ( ( 1.0) * offSet / ( nHigth / 2));
				printf( calAlpha );
				_srr[i].alpha = calAlpha;
			}
			i=i+1;
		}
	}
	
	void AddTextToArray( outText)
	{
		staticvar tmp = new FormatText{ src=outText};
		tmp.pos = "1000, 1000";
		_srr[curInitIndex] = tmp;
		curInitIndex = curInitIndex + 1;
	}

	AddTextToArray("CREDITS:");
	AddTextToArray("");
	AddTextToArray("");
	AddTextToArray("项目经理:");
	AddTextToArray("丁永仁");
	AddTextToArray("");
	AddTextToArray("主策划:");
	AddTextToArray("车新");
	AddTextToArray("");
	AddTextToArray("主程序:");
	AddTextToArray("韩硕");
	AddTextToArray("");
	AddTextToArray("主美术:");
	AddTextToArray("耿鑫");
	AddTextToArray("");
	AddTextToArray("策划:");
	AddTextToArray("苏虎臣 宫然");
	AddTextToArray("");
	AddTextToArray("程序:");
	AddTextToArray("何方志 杨星福");
	AddTextToArray("");
	AddTextToArray("美术:");
	AddTextToArray("刘刚 金斌 柴鹏 李鑫");
	AddTextToArray("解利建 董宁 李尧 王维");
	AddTextToArray("杜萌 韩凌 倪乐 王登吟");
	AddTextToArray("");
	AddTextToArray("测试:");
	AddTextToArray("高雷 孙小东 侯健");
	AddTextToArray("");
	AddTextToArray("友情援助:");
	AddTextToArray("丁文选 马晨");
	AddTextToArray("");
	AddTextToArray("参与工作人员:");
	AddTextToArray("翟羽 吴楠 刘高辰");
	AddTextToArray("");
	AddTextToArray("");
	AddTextToArray("");
	AddTextToArray("中娱在线");
	AddTextToArray("");
	AddTextToArray("Thanks For Your Play!");

	var ccPos = -150;

	void OnCreated()
	{
		while( 1)
		{
			sleep( 15);
			ccPos = ccPos + 1;
			ChangePos( ccPos);
		}
	}
};


class TennisC Credits
{
	pos = "0, 400";
};