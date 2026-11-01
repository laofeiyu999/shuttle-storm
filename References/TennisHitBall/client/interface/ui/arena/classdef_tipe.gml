/** 活动场-活动列表-标题栏
*[作者]安峰册
*[时间]2009-11-18 10:07
*/
import("$./../GmlCtrls/VPopWnd/ClassDef.gml");

class ActivityTopTipes VPic3_GreyTop_UI
{
	//pos = "20,80";
	left = 20;top = 80;
	width = 597;
	height = 32;

	//new VPic3_GreyTop_UI{size="100%,100%";}

	new img					// 活动状态
	{
		pos="31,7";
		//src="$./imgs"+window.g_Sex +"/ph-text.tga"
	}
	
	new img					// 活动名
	{
		pos="98,7";
		src="$./imgs"+window.g_Sex +"/hdmc-text.tga"
	}

	new img					// 所需人数
	{
		pos="180,7";
		src="$./imgs"+window.g_Sex +"/sxrs-text.tga"
	}

	new img					// 活动时间
	{
		pos="252,6";
		src="$./imgs"+window.g_Sex +"/hdsj-text.tga"
	}

	new img					// 等级限制
	{
		pos="326,7";
		src="$./imgs"+window.g_Sex +"/djxz-text.tga";
	}

	new img					// 报名费用
	{
		pos="400,7";
		src="$./imgs"+window.g_Sex +"/bmfy-new-text.tga";
	}

	new img					// 活动人数
	{
		pos="465,7";
		src="$./imgs"+window.g_Sex +"/hdrs-text.tga";
	}

};