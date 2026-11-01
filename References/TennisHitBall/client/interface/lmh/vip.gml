//
//Vip的各种玩意儿
//维护人：孙小东

/*程序接口
//var g_CTennisUIInit = new CTennisUIInit{name = "CTennisUIInit";}

//[功能]取Vip的相关设置
//[参数]viptype:Vip的类型 目前0不是Vip 1是Vip
//		field:表VipSetting的字段名
//[返回值]错误的参数或没有此记录(0)，正确(数据库相关字段数据)
void GetVipSetting(int viptype,const char* field);

//调用例子
window.g_CTennisUIInit.GetVipSetting(1,"Buy");
或
window.find("CTennisUIInit").GetVipSetting(1,"Buy");
*/

set window
{
	//[功能]取玩家的购买折扣
	//[参数]_viptype:Vip的类型
	//[返回值]0.9 (即90% 打九折)
	void GetVipBuyAgio(_viptype)
	{
		var _temp = window.g_CTennisUIInit.GetVipSetting(_viptype,"Buy");
		var _temp2 = tofloat(_temp)/100.0;
		printf("B# Vip:GetVipBuyAgio()_viptype:"+_viptype+",_temp:"+_temp+",_temp2:"+_temp2);
		return _temp2;
	}
}