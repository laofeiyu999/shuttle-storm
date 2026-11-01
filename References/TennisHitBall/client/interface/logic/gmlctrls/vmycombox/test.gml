import("$./../../Init.gml");
import("$./../Const.gml");
import("$./ClassDef.gml");

new fmodel{}
size = "800,600";
wndsize = "800,600";
bgcolor = "#123456";

new VMyComboBox 
{
	m_sizeX = 98;
	pos(487,-1);
	var m_ID = 2;
	SetData("1天,2天,3天,4天",m_ID);
	void WhichSelect(data)
	{
		alert(""+data);
	}
}