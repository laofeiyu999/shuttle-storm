import("$./../../../Logic/init.gml");
import("$./../../../Const.gml");
import("$./ClassDef_RadioCtrl.gml");
size = "800,600";
wndsize = "800,600";
//size = "1024,768";
//wndsize = "1024,768";
bgcolor = "#FFFFFF";

new VRadioCtrl_UI
{
	pos = "100,100";
	bgcolor = "#FFFF00";
	SetRadioName("name1,name2,,name4");
	InitMax("1,2,3,4",4,"aa");
}
void OnCheckRadio0()
{
//	alert("a");
}
void OnCheckRadio1()
{
//	alert("b");
}
void OnCheckRadio2()
{
//	alert("c");
}
/*
	--------------------------------------可翻动radio的控件-------------------------
	VRadioCtrl_UI类:

	//_arrTital：标签中的字的字符串用逗号分开   _max：最多显示的标签数    radio：的groupname的特别之处
	void InitMax(_arrTital,_max,_name)//这里自动设置size

	//设置radio第几个是灰的
	void SetRadioGreyIndex(_Index)
	//设置radio第几个是亮的
	void SetRadioLightIndex(_Index)

	//设置宽度	写在InitMax(_arrTital,_max,_name)后面	用来拉宽控件
	void SetWidth(_width)

	注意：>>>>>>必须重载的函数<<<<<<
	void OnCheckRadio0(){}
	void OnCheckRadio1(){}
	void OnCheckRadio2(){}
	......
	有几个radio就重载几个OnCheckRadio函数编号从0开始，函数里是OnCheck()时干的事

	下面这些可重载（非必须，可不写，以下是默认的）
	void GetRadioWidth(){return 61;}//radio宽度
	void GetRadioHeight(){return 22;}//radio高度
	void GetRadioSpace(){return 1;}//radio间距
	void GetBtnWidth(){return 11;}//button宽度
	void GetBtnRadionSpace(){return 1;}//button和radio的间距
*/