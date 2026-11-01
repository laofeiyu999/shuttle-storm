
new PrcDelayShow
{
	border="#FFFFFF"
//	size="180,300";	
	size="200,700";	
	zindex="top";	
	cursor="hand"
	bgcolor="#AAAAAA"
	group=1;
	drag="self";
	show=false;
	ystep=30
	timescale=0.1//5;
	sortdelay=30;
	/*
	new item
	{
		size="100%,20";
		bgcolor="#EEEEEE";
		drag="parent";
		cursor="hand"
		new text
		{
			src="函数调用延时监测器"
			pos="20,2";
			color="#00"
		}

		new text
		{
			var _check=0;
			src="+"
			pos="190,2"
			var agoheight;

			void OnClick()
			{
				_check+=1;
				if (_check%2==1)
				{
					src="+"
					agoheight=group.height;
					group.setSize(group.width,parent.height);
				}
				else
				{
					src="-";
					group.setSize(group.width,agoheight);
				}
			}
		}
	}
	*/
}
