
//创建所有的物体 这里的x.y.z指的是程序里面的轴向 返回值表示操作是否成功
void CreateAll()
{
	//====================================================================================
	//创建一个物体CreateNPC(npcname,受到碰撞的半径大小)
	var v = CreateNPC("haiou",0.5);
	if ( !v )
	{
		alert("创建haiou失败:");
	}
	//设置物体的动作 对于同一个物体 动作索引不能重复
	SetAction("haiou",1,"$./haiou/act/daiji-01.v3act");
	SetAction("haiou",2,"$./haiou/act/daiji-02.v3act");
	SetAction("haiou",3,"$./haiou/act/daiji.v3act");
	SetAction("haiou",4,"$./haiou/act/feixing.v3act");
	SetAction("haiou",5,"$./haiou/act/huaxiang.v3act");
	SetAction("haiou",6,"$./haiou/act/qifei.v3act");
	SetAction("haiou",7,"$./haiou/act/zou.v3act");
	//创建一个会活动的物体CreateNPC(npcname,skin,skeleton,actionid,actiontime); 返回值表示操作是否成功
	var v = SetNPCModel("haiou","$./haiou/act/haiou.v3s","$./haiou/act/haiou.v3ske",1,1000);
	if ( !v )
	{
		alert("SetNPCModel haiou失败:");
	}
	//设置一个物体的位置SetPos(name,"xpos,ypos,zpos",time(可不填为0,表示立即)); 返回值表示操作是否成功
	v = SetPos("haiou","0,0,0");
	if ( !v )
	{
		alert("SetPos haiou失败:");
	}
	//设置一个物体的大小SetScale(name,"xscale,yscale,zscale",time(可不填为0,表示立即)); 返回值表示操作是否成功
	v = SetScale("haiou","0.1,0.1,0.1");
	if ( !v )
	{
		alert("SetScale haiou失败:");
	}
	//设置一个物体的大小SetRotate(name,"yaw,pitch,roll",time(可不填为0,表示立即)); 返回值表示操作是否成功
	v = SetRotate("haiou","240,0,0");
	if ( !v )
	{
		alert("SetRotate haiou失败:");
	}

	//得到海鸥的位置
	v = GetPos("haiou");
	print("GetPos haiou:"+v);

	//得到海鸥的缩放
	v = GetScale("haiou");
	print("GetScale haiou:"+v);

	//得到海鸥的旋转角度
	v = GetRotate("haiou");
	print("GetRotate haiou:"+v);

	//计算一个向量的角度 只计算yaw,其他两个值为0
	var v3_1 = "-5,0,-3";
	var v3_2 = "1,0,-2";

	v = CalcAngle(v3_1);
	print("CalcAngle "+v3_1+":"+v);

	v = CalcLength(v3_1);
	print("CalcLength "+v3_1+":"+v);

	v = CalcAdd(v3_1,v3_2);
	print("CalcAdd "+v3_1 + ":" + v3_2 +":"+v);

	v = CalcSub(v3_1,v3_2);
	print("CalcSub "+ v3_1 + ":" + v3_2 +":"+v);

	v = CalcMul(3,v3_1);
	print("CalcMul 3*("+ v3_1 +") :"+v);

	v = CalcDiv(2,v3_1);
	print("CalcDiv ("+v3_1+")/2 :"+v);

	//把一个向量"1,0,0"旋转"180,0,0"后得到的旋转向量
	v = RotateVector("1,0,0","180,0,0");
	print("RotateVector \"1,0,0\" \"180,0,0\" :"+v);
}

var g_rotate_num = 0;
var g_action_num = 0;
var g_collision = false;
var g_fly = 0;
var g_dir;

void action_loop1()
{
	print("action_loop1");
	var rnum = g_rotate_num % 4;
	var expos;
	switch(rnum)
	{
	case 0:expos = "-2,0,2";break;
	case 1:expos = "-2,0,-2";break;
	case 2:expos = "2,0,-2";break;
	case 3:expos = "2,0,2";g_action_num += 1;break;
	}
	g_rotate_num += 1;

	print(" g_rotate_num:"+g_rotate_num+" expos:"+expos);
	var angle = CalcAngle(expos);

	SetRotate("haiou",angle);
	//使用动作,走相对的位移,相对的转向
	UseAction("haiou",7,2000,expos);
}

void action_loop2()
{
	print("action_loop2");
	var rnum = g_rotate_num % 4;
	var endpos;
	switch(rnum)
	{
	case 0:endpos = "1,0,1";break;
	case 1:endpos = "-1,0,1";break;
	case 2:endpos = "-1,0,-1";break;
	case 3:endpos = "0,0,0";g_action_num += 1;break;
	}
	g_rotate_num += 1;

	print("g_rotate_num:"+g_rotate_num+" endpos:"+endpos);

	//向目标点endpos前进,自动转向 endpos如果没有,表示在原地
	UseAction_Point("haiou",7,2000,endpos);
}

void action_loop3()
{
	print("action_loop3");
	var rnum = g_rotate_num % 4;
	var endrotate;
	switch(rnum)
	{
	case 0:endrotate = "225,0,0";break;
	case 1:endrotate = "90,0,0";break;
	case 2:endrotate = "270,0,0";break;
	case 3:endrotate = "45,0,0";g_action_num += 1;break;
	}
	g_rotate_num += 1;

	print(" g_rotate_num:"+g_rotate_num+" endrotate:"+endrotate);
	var speed = 2;
	//以endrotate角度,speed速度前进 endrotate如果没有,表示以原来的方向前进
	UseAction_SpeedAngle("haiou",7,1000,speed,endrotate);
}

void Reset()
{
	SetPos("haiou","0,0,0");
	UseAction("haiou",1,1000);
	g_rotate_num = 0;
	g_action_num = 0;
	g_collision = false;
	g_fly = 0;
}

void action_fly()
{
	if( g_fly == 2 ) {Reset();/*DeleteNPC("haiou");*/return;}
	var pos = GetPos("haiou");
	UseAction("haiou",4,1000,g_dir);
	g_fly += 1;
}

//海鸥动作结束时调用的函数
void haiou_ActionOver(last_action_id)
{
	if( g_collision )
	{
		action_fly();
		return;
	}
	var v = g_action_num % 3;
	print("haiou_ActionOver:"+v);
	switch (v)
	{
	case 0:action_loop1();break;
	case 1:action_loop2();break;
	case 2:action_loop3();break;
	}
}

//海鸥被碰撞了 collision_id:碰撞的物体id num:碰撞的次数 speed:碰撞的物体的速度 length:两个物体之间的距离
void haiou_collision( collision_id,num,speed,length )
{
	DeleteNPC("haiou");
	return;
	if( g_collision ) return;
	g_collision = true;
	print("haiou_collision speed:"+speed);
	var speed_x = GetIndex(speed,0);
	var speed_y = GetIndex(speed,1);
	var speed_z = GetIndex(speed,2);
	//表示是海鸥碰到物体
	if ( speed_x == 0 && speed_y == 0 && speed_z == 0 )
	{
		print("海鸥碰到物体了");
		var rotate = GetRotate("haiou");
		print("rotate1:"+rotate);
		//把角度rotate旋转"180,0,0"
		rotate = RotateAngle(rotate,"180,0,0");
		print("rotate2:"+rotate);
		SetRotate("haiou",rotate);
		//得到rotate角度方向上的和"0,0,-1"向量长度相同的向量
		var dest = RotateVector("0,0,-1",rotate);
		print("dest:"+dest);
		var x = GetIndex(dest,0);
		var y = GetIndex(dest,1);
		var z = GetIndex(dest,2);
		var aim = ""+x+",1.5,"+z;
		print("aim:"+aim);
		g_dir = ""+x+",2.5,"+z;
		print("g_dir:"+g_dir);
		UseAction("haiou",6,800,aim);
		return;
	}
//	speed = CalcMul(0.1,speed);
	var a = GetIndex(speed,0);
	var b = GetIndex(speed,1);
	var c = GetIndex(speed,2);
	g_dir = ""+a+",2.5,"+c;
	print("g_dir:"+g_dir);
	g_dir = CalcMul(1,g_dir);
	
	printf("haiou_g_collision num:"+num+" speed:"+speed+" length:"+length);
	var dest = CalcMul(1,speed);
	print("dest:"+dest);
	var dest_angle = CalcAngle(dest);
	print("dest_angle:"+dest_angle);
	SetRotate("haiou",dest_angle);
	//得到向量中间的数字 如"1,2,3" GetIndex("1,2,3",2) == 3
	var x = GetIndex(dest,0);
	var y = GetIndex(dest,1);
	var z = GetIndex(dest,2);
	var aim = ""+x+",1.5,"+z;
	UseAction("haiou",6,800,aim);
}