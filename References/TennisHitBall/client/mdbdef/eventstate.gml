// 创建日期:2011/5/16 18:26:28
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\EventState.mdb

set window
{
	var EVENTSTATE                                        ="EventState.mdb";

	var CONVERTDEF                                        ="ConvertDef";
	var EVENTSTATE_CONVERTDEF_AUTOID                      =0;   
	var EVENTSTATE_CONVERTDEF_AUTOID_STR                  ="AutoID";                     // DBTYPE_I4           

	var EVENTSTATE_CONVERTDEF_BASESTATE                   =1;   
	var EVENTSTATE_CONVERTDEF_BASESTATE_STR               ="BaseState";                  // DBTYPE_I4           基础状态1裁普通(未确认)	2裁技(未确认) 3裁(确认)	4被普(未确认) 5被技(未确认) 6被(确认) 7裁失球 8被失球 9裁失分 10被失分 11确认失分

	var EVENTSTATE_CONVERTDEF_INPUT                       =2;   
	var EVENTSTATE_CONVERTDEF_INPUT_STR                   ="Input";                      // DBTYPE_I4           输入序号 0无效输入 1裁普 2被普 5裁技 6被技 9裁放弃 10被放弃 13确定裁 14确定被 17裁失分 18被失分

	var EVENTSTATE_CONVERTDEF_TARGETSTATE                 =3;   
	var EVENTSTATE_CONVERTDEF_TARGETSTATE_STR             ="TargetState";                // DBTYPE_I4           1裁普通(未确认)	2裁技(未确认) 3裁(确认)	4被普(未确认) 5被技(未确认) 6被(确认) 7裁失球 8被失球 9裁失分 10被失分 11确认失分

	var EVENTSTATE_CONVERTDEF_CONVERTCONDITION            =4;   
	var EVENTSTATE_CONVERTDEF_CONVERTCONDITION_STR        ="ConvertCondition";           // DBTYPE_WVARCHAR     转换条件(策划用)

	var EVENTSTATE_CONVERTDEF___CONVERTCONDITION          =5;   
	var EVENTSTATE_CONVERTDEF___CONVERTCONDITION_STR      ="__ConvertCondition";         // DBTYPE_WVARCHAR     转换条件(程序用)

	var EVENTSTATE_CONVERTDEF_CONVERTGMLCONDITION         =6;   
	var EVENTSTATE_CONVERTDEF_CONVERTGMLCONDITION_STR     ="ConvertGmlCondition";        // DBTYPE_WVARCHAR     转换条件(GML中自定义函数)

	var EVENTSTATE_CONVERTDEF_CONVERTSCRIPT               =7;   
	var EVENTSTATE_CONVERTDEF_CONVERTSCRIPT_STR           ="ConvertScript";              // DBTYPE_WVARCHAR     转换后脚本(策划用)

	var EVENTSTATE_CONVERTDEF___CONVERTSCRIPT             =8;   
	var EVENTSTATE_CONVERTDEF___CONVERTSCRIPT_STR         ="__ConvertScript";            // DBTYPE_WVARCHAR     转换后脚本(程序用)

	var EVENTSTATE_CONVERTDEF_CONVERTGMLSCRIPT            =9;   
	var EVENTSTATE_CONVERTDEF_CONVERTGMLSCRIPT_STR        ="ConvertGmlScript";           // DBTYPE_WVARCHAR     转换后脚本(GML中自定义函数)

	var EVENTSTATE_CONVERTDEF_ZHUSHI                      =10;  
	var EVENTSTATE_CONVERTDEF_ZHUSHI_STR                  ="zhushi";                     // DBTYPE_WVARCHAR     说明


	var EVENTDEF                                          ="EventDef";
	var EVENTSTATE_EVENTDEF_STATEID                       =0;   
	var EVENTSTATE_EVENTDEF_STATEID_STR                   ="StateID";                    // DBTYPE_I4           状态ID

	var EVENTSTATE_EVENTDEF_DISCRIPTION                   =1;   
	var EVENTSTATE_EVENTDEF_DISCRIPTION_STR               ="Discription";                // DBTYPE_WVARCHAR     描述

	var EVENTSTATE_EVENTDEF_ENTERCONDITION                =2;   
	var EVENTSTATE_EVENTDEF_ENTERCONDITION_STR            ="EnterCondition";             // DBTYPE_WVARCHAR     进入条件(策划用)

	var EVENTSTATE_EVENTDEF___ENTERCONDITION              =3;   
	var EVENTSTATE_EVENTDEF___ENTERCONDITION_STR          ="__EnterCondition";           // DBTYPE_WVARCHAR     进入条件(程序用)

	var EVENTSTATE_EVENTDEF_ENTERSCRIPT                   =4;   
	var EVENTSTATE_EVENTDEF_ENTERSCRIPT_STR               ="EnterScript";                // DBTYPE_WVARCHAR     进入后脚本(策划用)

	var EVENTSTATE_EVENTDEF___ENTERSCRIPT                 =5;   
	var EVENTSTATE_EVENTDEF___ENTERSCRIPT_STR             ="__EnterScript";              // DBTYPE_WVARCHAR     进入后脚本(程序用)

	var EVENTSTATE_EVENTDEF_ENTERGMLSCRIPT                =6;   
	var EVENTSTATE_EVENTDEF_ENTERGMLSCRIPT_STR            ="EnterGmlScript";             // DBTYPE_WVARCHAR     进入后脚本(GML自定义函数)

	var EVENTSTATE_EVENTDEF_LEAVESCRIPT                   =7;   
	var EVENTSTATE_EVENTDEF_LEAVESCRIPT_STR               ="LeaveScript";                // DBTYPE_WVARCHAR     离开时的脚本(策划用)

	var EVENTSTATE_EVENTDEF___LEAVESCRIPT                 =8;   
	var EVENTSTATE_EVENTDEF___LEAVESCRIPT_STR             ="__LeaveScript";              // DBTYPE_WVARCHAR     离开时的脚本(程序用)

	var EVENTSTATE_EVENTDEF_LEAVEGMLSCRIPT                =9;   
	var EVENTSTATE_EVENTDEF_LEAVEGMLSCRIPT_STR            ="LeaveGmlScript";             // DBTYPE_WVARCHAR     离开时的脚本(GML自定义函数)

	var EVENTSTATE_EVENTDEF_ONDIESCRIPT                   =10;  
	var EVENTSTATE_EVENTDEF_ONDIESCRIPT_STR               ="OnDieScript";                // DBTYPE_WVARCHAR     到期后的脚本(策划用)

	var EVENTSTATE_EVENTDEF___ONDIESCRIPT                 =11;  
	var EVENTSTATE_EVENTDEF___ONDIESCRIPT_STR             ="__OnDieScript";              // DBTYPE_WVARCHAR     到期后的脚本(程序用)

	var EVENTSTATE_EVENTDEF_ONDIEGMLSCRIPT                =12;  
	var EVENTSTATE_EVENTDEF_ONDIEGMLSCRIPT_STR            ="OnDieGmlScript";             // DBTYPE_WVARCHAR     到期后的脚本(GML自定义函数)

	var EVENTSTATE_EVENTDEF_NEXTSTATE                     =13;  
	var EVENTSTATE_EVENTDEF_NEXTSTATE_STR                 ="NextState";                  // DBTYPE_I4           后续状态

	var EVENTSTATE_EVENTDEF_LASTTIME                      =14;  
	var EVENTSTATE_EVENTDEF_LASTTIME_STR                  ="LastTime";                   // DBTYPE_I4           状态持续时间

	var EVENTSTATE_EVENTDEF_ZEROLASTTIMEINSINGLE          =15;  
	var EVENTSTATE_EVENTDEF_ZEROLASTTIMEINSINGLE_STR      ="ZeroLastTimeInSingle";       // DBTYPE_BOOL         是否在单打中0持续时间


	var INPUTDEFINE                                       ="InputDefine";
	var EVENTSTATE_INPUTDEFINE_INPUTID                    =0;   
	var EVENTSTATE_INPUTDEFINE_INPUTID_STR                ="InputID";                    // DBTYPE_I4           输入序列号

	var EVENTSTATE_INPUTDEFINE_DESCRIPTION                =1;   
	var EVENTSTATE_INPUTDEFINE_DESCRIPTION_STR            ="Description";                // DBTYPE_WVARCHAR     输入描述

}
