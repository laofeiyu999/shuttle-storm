import("$./../../Logic/Init.gml");
import("$./../GmlCtrls/include.gml");
import("$./ClassDef_UserList.gml");

//wndsize ="1024,768";
//size ="1024,768";
size = "1152,864";
wndsize = "1152,864";
//wndsize ="1280,960";
//size ="1280,960";
new fmodel{}
bgcolor = "#123456";

new VColumn_RoomUser_UI
{
	Init();
	s_Sign._Img_Key.show=true;
	s_Team.SetData(1);
	s_FamilyIcon.SetData(true,1,1,1,2,1,1);
	s_NkName.SetData("哈哈啊哈和哈");
	s_Lv.SetData(13);
	s_Technic.SetData(1);
	s_State.SetData(2);
}