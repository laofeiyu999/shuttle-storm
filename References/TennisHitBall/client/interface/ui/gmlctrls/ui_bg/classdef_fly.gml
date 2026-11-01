class VFly_UI item//VUIBG_UI
{
	bgcolor = "#ffffff";alpha = 50;
	//放大
	//pBtn：按钮的指针；pFace：界面的指针
	void SetBig(pFace,pBtn)
	{
		staticvar s_p = pFace;
		//show = true;
		setParamTimer("pos",""+pBtn.left+","+(window.height-(pBtn.parent.height-pBtn.top)),""+pFace.left+","+pFace.top,250,250);
		setParamTimer("size",""+pBtn.width+",16",""+pFace.width+","+pFace.height,250,250,"BigTimerEnd");
	}
	//缩小
	//pBtn：按钮的指针；pFace：界面的指针
	void SetSmall(pFace,pBtn)
	{
		//show = true;
		setParamTimer("pos",""+pFace.left+","+pFace.top,""+pBtn.left+","+(window.height-(pBtn.parent.height-pBtn.top)),250);
		setParamTimer("size",""+pFace.width+","+pFace.height,""+pBtn.width+",16",250,0,"SmallTimerEnd");
	}
//	//放大
//	//pBtn：按钮的指针；pFace：界面的指针
//	void SetBig(pFace,pBtn)
//	{
//		staticvar s_p = pFace;
//		setParamTimer("pos",""+(0-pFace.width)+","+pFace.top,""+pFace.left+","+pFace.top,250,250,"BigTimerEnd");//
//		size=""+pFace.width+","+pFace.height;
//		pos = ""+(0-pFace.width)+","+pFace.top;
//	}
//	//缩小
//	//pBtn：按钮的指针；pFace：界面的指针
//	void SetSmall(pFace,pBtn)
//	{
//		setParamTimer("pos",""+pFace.left+","+pFace.top,""+(0-pFace.width)+","+pFace.top,250,0,"SmallTimerEnd");//
//		size=""+pFace.width+","+pFace.height;
//	}

	void BigTimerEnd()
	{
		s_p.parent.show = true;
		del();
	}
	void SmallTimerEnd()
	{
		del();
	}
};