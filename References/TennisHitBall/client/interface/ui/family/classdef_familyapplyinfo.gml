//申请信息
//夏洋洋 2010-3-4

class VFamilyApplyInfo_UI item
{
	size = "91%,56%";//bgcolor= "#ff";
	pos = "30,97";
	void Init()
	{	
		//同意
		staticvar s_Btn_Agree = new VBTN_A_New
		{
			InitText("同意");
			valign(95,0);halign(55,0);
		}
		//拒绝
		staticvar s_Btn_Refuse = new VBTN_A_New
		{
			InitText("拒绝");
			valign(95,0);halign(75,0);
		}
		//清空信息
		staticvar s_Btn_Clear = new VBTN_A_New
		{
			InitText("清空信息");
			valign(95,0);halign(95,0);
		}
	}
}