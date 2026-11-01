//
//训练外界面-UI+Logic
//yxf 2009年10月14日
//

importex("$./ClassDef.gml");

new item
{
	name = "TRAIN_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_TRAIN);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_TRAIN);

	var _VTrain_Logic = new VTrain_Logic{}
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_TRAIN);
	}
}