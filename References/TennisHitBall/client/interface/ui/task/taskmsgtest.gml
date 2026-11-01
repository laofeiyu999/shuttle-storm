importex("$./ClassDef_Task_Msg.gml");



////当item的size大于_temp时字就能够出现渐变效果
//new item
//{
//	size = "800,600";bgcolor= "#ff0000";
//	
//	var _index = 1;
//	void OnClick()
//	{
//		_index += 1;
//		parent._temp.SetData(_index,1);
//	}
//}
//var _temp = new VTaskMsgShow_UI
//{
//	Init();//bgcolor = "#ff0000";
//	pos = "300,300";
//	//SetNeedDoneNum(20);
//}


//<END>
//当item的size小于_temp时字就不能够出现渐变效果
new img3d{};
bgcolor = "#ffffff";
//new item
//{
//	size = "50,50";bgcolor= "#ff0000";
//	
//	var _index = 1;
//	void OnClick()
//	{
//		_index += 1;
//		parent._temp.SetData(_index,1);
//	}
//}
//var _temp = new VTaskMsgShow_UI
//{
//	Init();//bgcolor = "#ff0000";
//	pos = "300,300";
//	//SetNeedDoneNum(20);
//}
new text
{
	src = "你好";bold = true;txtborder = "#000000";color = "#ff";
	alpha = 80;
}