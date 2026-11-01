
//创建所有的物体 这里的x.y.z指的是程序里面的轴向 返回值表示操作是否成功
void CreateAll()
{
	//第一只海鸥
	//====================================================================================
	//创建一个物体CreateNPC(npcname,radius) radius碰撞半径
//	var v = CreateNPC("nethaiou1",1);
//	if ( !v )
//	{
//		alert("创建nethaiou1失败:");
//	}
//	//设置物体的动作 对于同一个物体 动作索引不能重复
//	SetAction("nethaiou1",1,"$./haiou/daiji-01.v3act");
//	SetAction("nethaiou1",2,"$./haiou/daiji-02.v3act");
//	SetAction("nethaiou1",3,"$./haiou/daiji.v3act");
//	SetAction("nethaiou1",4,"$./haiou/zou.v3act");
//	SetAction("nethaiou1",5,"$./haiou/qifei.v3act");
//	SetAction("nethaiou1",6,"$./haiou/huaxiang.v3act");
//	SetAction("nethaiou1",7,"$./haiou/feixing.v3act");

	//创建一个会活动的物体CreateNPC(npcname,skin,skeleton,actionid,actiontime); 返回值表示操作是否成功
//	var v = SetNPCModel("nethaiou1","$./haiou/act/haiou.v3s","$./haiou/act/haiou.v3ske",1,1000);
//	if ( !v )
//	{
//		alert("SetNPCModel nethaiou1失败:");
//	}
//	SetBound("nethaiou1",1);
//	//设置一个物体的位置SetPos(name,"xpos,ypos,zpos"); 返回值表示操作是否成功
////	v = SetPos("nethaiou1","6.15,0.5,-0.75");
//	v = SetPos("nethaiou1","0,1,0");
//	if ( !v )
//	{
//		alert("SetPos nethaiou1失败:");
//	}
//	//设置一个物体的大小SetScale(name,"xscale,yscale,zscale"); 返回值表示操作是否成功
//	v = SetScale("nethaiou1","0.05,0.05,0.05");
//	if ( !v )
//	{
//		alert("SetScale nethaiou1失败:");
//	}
//	//设置一个物体的大小SetRotate(name,"yaw,pitch,roll"); 返回值表示操作是否成功
//	v = SetRotate("nethaiou1","90,0,0");
//	if ( !v )
//	{
//		alert("SetRotate nethaiou1失败:");
//	}

	//创建一个球
	v = CreateNPC("ball",1);
	if ( !v )
	{
		alert("创建ball失败:");
	}
	SetObjModel("ball","$./../model/ball.v3f");
	SetScale("ball","2,2,2");
	SetPos("ball","0,1,0");

	v = CreateNPC("people",1);
	SetAction("people",1,"$./haiou/act/huanhu01.v3act");
	SetAction("people",2,"$./haiou/act/huanhu02.v3act");
	SetNPCModel("people","$./haiou/act/A01S00L06F00P01X001.v3s","$./haiou/act/npc001.v3ske",1,1000);
	SetBound("people",1);
//	SetScale("people","0.004,0.004,0.004");

//	//第二只海鸥
//	v = CreateNPC("nethaiou2",1);
//	if ( !v )
//	{
//		alert("创建nethaiou2失败:");
//	}
//	//设置物体的动作 对于同一个物体 动作索引不能重复
//	SetAction("nethaiou2",1,"$./haiou/daiji-01.v3act");
//	SetAction("nethaiou2",2,"$./haiou/daiji-02.v3act");
//	SetAction("nethaiou2",3,"$./haiou/daiji.v3act");
//	SetAction("nethaiou2",4,"$./haiou/zou.v3act");
//	SetAction("nethaiou2",5,"$./haiou/qifei.v3act");
//	SetAction("nethaiou2",6,"$./haiou/huaxiang.v3act");
//	SetAction("nethaiou2",7,"$./haiou/feixing.v3act");
//
//	//创建一个会活动的物体CreateNPC(npcname,skin,skeleton,actionid,actiontime); 返回值表示操作是否成功
//	var v = SetNPCModel("nethaiou2","$./haiou/haiou.v3s","$./haiou/haiou.v3ske",3,1000);
//	if ( !v )
//	{
//		alert("SetNPCModel nethaiou2失败:");
//	}
//	//设置一个物体的位置SetPos(name,"xpos,ypos,zpos"); 返回值表示操作是否成功
//	v = SetPos("nethaiou2","6.6,0.98,0");
//	if ( !v )
//	{
//		alert("SetPos nethaiou2失败:");
//	}
//	//设置一个物体的大小SetScale(name,"xscale,yscale,zscale"); 返回值表示操作是否成功
//	v = SetScale("nethaiou2","0.05,0.05,0.05");
//	if ( !v )
//	{
//		alert("SetScale nethaiou2失败:");
//	}
//	//设置一个物体的大小SetRotate(name,"yaw,pitch,roll"); 返回值表示操作是否成功
//	v = SetRotate("nethaiou2","90,0,0");
//	if ( !v )
//	{
//		alert("SetRotate nethaiou2失败:");
//	}
//
//	//第三只海鸥
//	v = CreateNPC("npchaiou03",1);
//	if ( !v )
//	{
//		alert("创建npc_haiou_03失败:");
//	}
//	//设置物体的动作 对于同一个物体 动作索引不能重复
//	SetAction("npchaiou03",1,"$./haiou/daiji-01.v3act");
//	SetAction("npchaiou03",2,"$./haiou/daiji-02.v3act");
//	SetAction("npchaiou03",3,"$./haiou/daiji.v3act");
//	SetAction("npchaiou03",4,"$./haiou/zou.v3act");
//	SetAction("npchaiou03",5,"$./haiou/qifei.v3act");
//	SetAction("npchaiou03",6,"$./haiou/huaxiang.v3act");
//	SetAction("npchaiou03",7,"$./haiou/feixing.v3act");
//
//	//创建一个会活动的物体CreateNPC(npcname,skin,skeleton,actionid,actiontime); 返回值表示操作是否成功
//	var v = SetNPCModel("npchaiou03","$./haiou/haiou.v3s","$./haiou/haiou.v3ske",3,1000);
//	if ( !v )
//	{
//		alert("SetNPCModel npchaiou03失败:");
//	}
//	//设置一个物体的位置SetPos(name,"xpos,ypos,zpos"); 返回值表示操作是否成功
//	v = SetPos("npchaiou03","-6.6,0.98,0");
//	if ( !v )
//	{
//		alert("SetPos npchaiou03失败:");
//	}
//	//设置一个物体的大小SetScale(name,"xscale,yscale,zscale"); 返回值表示操作是否成功
//	v = SetScale("npchaiou03","0.05,0.05,0.05");
//	if ( !v )
//	{
//		alert("SetScale npchaiou03失败:");
//	}
//	//设置一个物体的大小SetRotate(name,"yaw,pitch,roll"); 返回值表示操作是否成功
//	v = SetRotate("npchaiou03","-90,0,0");
//	if ( !v )
//	{
//		alert("SetRotate npchaiou03失败:");
//	}

}

//第一只海鸥
var nethaiou1_action = 0;
void GetHaiOu1Action(nethaiou1_action)
{
	if ( nethaiou1_action % 2 == 0 || nethaiou1_action % 7 == 0 || nethaiou1_action% 13 == 0 )
	{
		return 2;
	}
	if ( nethaiou1_action % 3 == 0 )
	{
		return 3;
	}
	return 1;
}
void GetHaiOu1Time(action)
{
	switch (action)
	{
	case 1: return 3000;break;
	case 2: return 4000;break;
	case 3: return 3456;
	}
	return 2000;
}

void nethaiou1_ActionOver(last_action_id)
{
	var action = GetHaiOu1Action(nethaiou1_action);
	UseAction("nethaiou1",action,GetHaiOu1Time(action));
	nethaiou1_action += 1;
}

//第二只海鸥
var nethaiou2_action = 0;
var net2_action_array = sysarray(10);
net2_action_array[0] = 2;
net2_action_array[1] = 1;
net2_action_array[2] = 3;
net2_action_array[3] = 4;
net2_action_array[4] = 1;
net2_action_array[5] = 2;
net2_action_array[6] = 4;
net2_action_array[7] = 2;
net2_action_array[8] = 3;
net2_action_array[9] = 4;

var net2_time_array = sysarray(10);
net2_time_array[0] = 1253;
net2_time_array[1] = 6763;
net2_time_array[2] = 2346;
net2_time_array[3] = 12000;
net2_time_array[4] = 3452;
net2_time_array[5] = 1246;
net2_time_array[6] = 6000;
net2_time_array[7] = 4363;
net2_time_array[8] = 2316;
net2_time_array[9] = 18000;

var net2_pos_array = sysarray(10);
net2_pos_array[0] = "0,0,0";
net2_pos_array[1] = "0,0,0";
net2_pos_array[2] = "0,0,0";
net2_pos_array[3] = "-2,0,0";
net2_pos_array[4] = "0,0,0";
net2_pos_array[5] = "0,0,0";
net2_pos_array[6] = "-1,0,0";
net2_pos_array[7] = "0,0,0";
net2_pos_array[8] = "0,0,0";
net2_pos_array[9] = "3,0,0";

void GetHaiOu2Action(action)
{
	var v = action % 10;
	return net2_action_array[v];
}
void GetHaiOu2Time(action)
{
	var v = action % 10;
	return net2_time_array[v];
}
void GetHaiOu2Pos(action)
{
	var v = action % 10;
	return net2_pos_array[v];
}
var tp_action;
var tp_time;
var tp_pos;


void nethaiou2_BackAction()
{
	UseAction("nethaiou2",tp_action,tp_time,tp_pos );
	nethaiou2_action += 1;
}

void nethaiou2_ActionOver(last_action_id)
{
	var action = GetHaiOu2Action(nethaiou2_action);
	var time = GetHaiOu2Time(nethaiou2_action);
	var pos = GetHaiOu2Pos(nethaiou2_action);
	if( nethaiou2_action % 10 == 3 )
	{
		SetRotate("nethaiou2","90,0,0");
	}
	if( nethaiou2_action % 10 == 9 )
	{
		SetRotate("nethaiou2","-90,0,0");
		tp_action = action;
		tp_time = time;
		tp_pos = pos;
		timer( 1000,"nethaiou2_BackAction()" );
		return;
	}
	UseAction("nethaiou2",action,time,pos );
	nethaiou2_action += 1;
}

//第三只海鸥
//第三只海鸥动作
var haiou03_action		 = 0;
var haiou03_action_array = sysarray(10);
haiou03_action_array[0]	 = 3;
haiou03_action_array[1]	 = 4;
haiou03_action_array[2]	 = 2;
haiou03_action_array[3]	 = 3;
haiou03_action_array[4]	 = 1;
haiou03_action_array[5]	 = 4;
haiou03_action_array[6]	 = 1;
haiou03_action_array[7]	 = 3;
haiou03_action_array[8]	 = 2;
haiou03_action_array[9]	 = 4;

//第三只海鸥动作时间
var haiou03_time_array	= sysarray(10);
haiou03_time_array[0]	= 500;
haiou03_time_array[1]	= 4000;
haiou03_time_array[2]	= 1000;
haiou03_time_array[3]	= 500;
haiou03_time_array[4]	= 1000;
haiou03_time_array[5]	= 6000;
haiou03_time_array[6]	= 800;
haiou03_time_array[7]	= 300;
haiou03_time_array[8]	= 600;
haiou03_time_array[9]	= 10000;

//第三只海鸥动作角度
var haiou03_pos_array	= sysarray(10);
haiou03_pos_array[0]	= "0,0,0";
haiou03_pos_array[1]	= "2,0,0";
haiou03_pos_array[2]	= "0,0,0";
haiou03_pos_array[3]	= "0,0,0";
haiou03_pos_array[4]	= "0,0,0";
haiou03_pos_array[5]	= "2,0,0";
haiou03_pos_array[6]	= "0,0,0";
haiou03_pos_array[7]	= "0,0,0";
haiou03_pos_array[8]	= "0,0,0";
haiou03_pos_array[9]	= "-4,0,0";

void npchaiou03_ActionOver(last_action_id){
	printf("haiou03_action:"+haiou03_action);
	if(haiou03_action == 1 || haiou03_action == 5){
		SetRotate("npchaiou03","-90,0,0");
	}

	if(haiou03_action == 9){
		SetRotate("npchaiou03","90,0,0");
	}

//	printf("haiou03_action:"+haiou03_action);

	var action = haiou03_action_array[haiou03_action];
	var time   = haiou03_time_array[haiou03_action];
	var pos	   = haiou03_pos_array[haiou03_action];

	UseAction("npchaiou03",action,time,pos);

	if(haiou03_action == 9){
		haiou03_action = 0;
	}else{
		haiou03_action += 1;
	}
}

void people_ActionOver(last_action_id)
{
	var actionid = 1;
	if (last_action_id == 1)
	{
		actionid = 2;
	}
	UseAction("people",actionid,2000);
}