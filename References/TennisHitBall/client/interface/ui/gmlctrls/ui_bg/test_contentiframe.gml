import("$./../../../Logic/init.gml");
import("$./../../../Const.gml");

import("$./ClassDef_ContentIframe.gml");
size = "800,600";
wndsize = "800,600";
bgcolor = "#FFFFFF";

new VContentIframe_UI
{
	size = "380,100";
	bgcolor = "#FF0000";
	SetData("/sp爱<v1>是打发</v1><br>是大法师<br>的/sp爱是打<br>发士大夫<br>爱是<br>打发","",1,1,0);
//	SetData("/sp爱<v1>是打发</v1><br>是大法师<br>的/sp爱是打<br>发士大夫<br>爱是<br>打发","1100042,1,2;1100042,10,0;1100042",10,20,0);
}

//var _tempArr = window.SplitStr2("1",",");
//
//new item
//{
//	size = "1,1";
//	alert(""+parent._tempArr[0]+","+parent._tempArr[1]+","+parent._tempArr[2]);
//}