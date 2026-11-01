//获取后场满蓄力时间 
//_max_h_store_time 最大后场时间
//_min_h_store_time 最小后场时间
//_user_h_num 玩家后场属性

void GET_H_STORE_TIME( userID, _max_h_store_time, _min_h_store_time, _user_h_num)
{
	var shuxingid = 1;
	var MatchDBRow = new VNet2DBRow
	{
		InitByInt(window.Tennis_Game,window.Match_param,window.Tennis_Game_Match_param_id,shuxingid);
	}
	if ( MatchDBRow.IsReady() == 0 )
	{ 
		MatchDBRow.del();
		printf("sxd9=========MatchDBRow打开失败=======================");
		return;
	}

	var _max_h_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_MAX_H_STORE_TIME);
	var _min_h_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_FLO_H_STORE_TIME);
	printf("sxd9 后场蓄力 最短蓄力时间是："+_max_h_store_time);
	printf("sxd9 后场蓄力 最长蓄力时间是："+_min_h_store_time);

	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,userID);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		RidDBRow.del();
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}
	var my_houchang = RidDBRow.GetData( window.M_G_Server_Roledt_TBackHand);

	//printf ("sxd9# 击球逻辑信息 _max_h_store_time:" + _max_h_store_time);
	//printf ("sxd9# 击球逻辑信息 _min_h_store_time:" + _min_h_store_time);
	printf ("sxd9# 击球逻辑信息 人物后场属性是：" + my_houchang);
	//return _max_h_store_time + _min_h_store_time + _user_h_num;
	//return 850;
	//var _time = my_houchang/300.0;
	//var user_time = (_min_h_store_time - _max_h_store_time)* _time* _time - 2*(_min_h_store_time - _max_h_store_time)*_time + _min_h_store_time; //其实就是 y=ax^2+bx+c
	//var tstatic = new T_ScriptFun{};
	var user_time = (tstatic.pow( (my_houchang+20), ( -2/5.5)) + + 0.09)*2815);
	printf("sxd9#目前玩家的后场满蓄力时间为："+user_time);
	printf("sxd9#后场参数："+_time);
	var time = toint(user_time)；
	printf("sxd9最终传回的后场满蓄力时间："+time);
	UserDBRow.del();
	MatchDBRow.del();
	RidDBRow.del();

	return time;

}

//获取前场满蓄力时间 
//_max_q_store_time 最大前场时间
//_min_q_store_time 最小前场时间
//_user_q_num 玩家前场属性
void GET_Q_STORE_TIME( userID, _max_q_store_time, _min_q_store_time, _user_q_num)
{
	var shuxingid = 1;
	var MatchDBRow = new VNet2DBRow
	{
		InitByInt(window.Tennis_Game,window.Match_param,window.Tennis_Game_Match_param_id,shuxingid);
	}
	if ( MatchDBRow.IsReady() == 0 )
	{ 
		MatchDBRow.del();
		printf("sxd9=========MatchDBRow打开失败=======================");
		return;
	}

	var _max_q_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_MAX_Q_STORE_TIME);
	var _min_q_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_FLO_Q_STORE_TIME);
	printf("sxd9 前场蓄力 最短蓄力时间是："+_max_q_store_time);
	printf("sxd9 前场蓄力 最长蓄力时间是："+_min_q_store_time);

	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,userID);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		RidDBRow.del()
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}
	var my_qianchang = RidDBRow.GetData( window.M_G_Server_Roledt_TForceHand);


	//printf ("sxd9# 击球逻辑信息 _max_q_store_time:" + _max_q_store_time);
	//printf ("sxd9# 击球逻辑信息 _min_q_store_time:" + _min_q_store_time);
	printf ("sxd9# 击球逻辑信息 当前角色前场值:" + my_qianchang);
	//return _max_q_store_time + _min_q_store_time + _user_q_num;
	//return 550;
	//var _time = my_qianchang/300.0;
	//var user_time = (_min_q_store_time - _max_q_store_time)* _time* _time - 2*(_min_q_store_time - _max_q_store_time)*_time + _min_q_store_time; //其实就是 y=ax^2+bx+c
	//var tstatic = new T_ScriptFun{};
	var user_time = (tstatic.pow( (my_qianchang+20), ( -2/5.5)) + + 0.09)*2515);
	printf("sxd9#目前玩家的前场满蓄力时间为："+user_time);
	printf("sxd9#前场参数："+_time);
	var time = toint(user_time)；
	printf("sxd9最终传回的前场满蓄力时间："+time);
	UserDBRow.del();
	MatchDBRow.del();
	RidDBRow.del();

	return time;
}

//获取最慢球速
//_max_speed_min 最小速度上限
//_min_speed_min 最小速度下限
//_user_tech 玩家技术

void GET_MIN_SPEED( userID, _max_speed_min, _min_speed_min, _user_tech)
{
	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,userID);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		RidDBRow.del()
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}
	var my_jishu = RidDBRow.GetData( window.M_G_Server_Roledt_TSkill);

	//printf ("sxd9# 击球逻辑信息 _max_speed_min:" + _max_speed_min);
	//printf ("sxd9# 击球逻辑信息 _min_speed_min:" + _min_speed_min);
	printf ("sxd9# 击球逻辑信息 当前角色技术值:" + my_jishu);
	//return _max_speed_min + _min_speed_min + _user_tech;
	//return 0.8;
	//var _speed = _user_tech/300.0;
	//var user_speed = (_min_speed_min - _max_speed_min)* _speed* _speed - 2*(_min_speed_min - _max_speed_min)*_speed + _min_speed_min; //其实就是 y=ax^2+bx+c
	//var tstatic = new T_ScriptFun{};
	var user_speed = (tstatic.pow( (my_jishu+20), ( -2/5.5)) + + 0.165)*2.4) //强大的计算幂函数的函数！ XX.pow(底数，指数)2.4
	printf("sxd9#目前玩家的最慢击球速度："+user_speed);
	printf("sxd9#技术参数："+_speed);
	UserDBRow.del();
	RidDBRow.del();

	return user_speed;
}

//获取最块球速
//_max_speed_min 最大速度上限
//_min_speed_min 最小速度下限
//_user_tech 玩家力量
void GET_MAX_SPEED( userID, _max_speed_max, _min_speed_max, _user_power)
{
	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,userID);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		RidDBRow.del()
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}
	var my_liliang = RidDBRow.GetData( window.M_G_Server_Roledt_TStrength);
	//printf ("sxd9# 击球逻辑信息 _max_speed_max:" + _max_speed_max);
	//printf ("sxd9# 击球逻辑信息 _min_speed_max:" + _min_speed_max);
	printf ("sxd9# 击球逻辑信息 当前玩家力量值:" + my_liliang);
	//return _max_speed_max + _min_speed_max + _user_power;
	//var _speed = _user_power/300.0;
	//var user_speed = (_min_speed_max - _max_speed_max)* _speed* _speed - 2*(_min_speed_max - _max_speed_max)*_speed + _min_speed_max; //其实就是 y=ax^2+bx+c
	//var tstatic = new T_ScriptFun{};
	var user_speed = (tstatic.pow( (my_liliang+20), ( -2/5.5)) + + 0.165)*1.5) //强大的计算幂函数的函数！ XX.pow(底数，指数)2.4
	
	printf("sxd9#最快速度：目前玩家的最快击球速度："+user_speed);
	//printf("sxd9#力量参数："+_speed);
	UserDBRow.del();
	RidDBRow.del();

	return user_speed;
}

void GET_MAX_HD_STORE_TIME(id)//后场方向满蓄力时间计算
{
	var shuxingid = 1;
	var MatchDBRow = new VNet2DBRow
	{
		InitByInt(window.Tennis_Game,window.Match_param,window.Tennis_Game_Match_param_id,shuxingid);
	}
	if ( MatchDBRow.IsReady() == 0 )
	{ 
		MatchDBRow.del();
		printf("sxd9=========MatchDBRow打开失败=======================");
		return;
	}
	var max_hd_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_MAX_HD_STORE_TIME);
	var min_hd_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_FLO_HD_STORE_TIME);
	printf("sxd9 后场方向蓄力 最短方向蓄力时间是："+max_hd_store_time);
	printf("sxd9 后场方向蓄力 最长方向蓄力时间是："+min_hd_store_time);

	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,id);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		RidDBRow.del()
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}

	var my_houchang = RidDBRow.GetData( window.M_G_Server_Roledt_TBackHand);
	printf("sxd9当前玩家的后场属性为："+my_houchang);
	var my_xuli =min_hd_store_time - my_houchang/300.0*(min_hd_store_time - max_hd_store_time);
	printf("sxd9当前人物后场方向蓄力时间为："+my_xuli);
	var _time = toint(my_xuli);
	printf("sxd9当前人物后场方向蓄力时间(整型)为："+_time);

	MatchDBRow.del();
	UserDBRow.del();
	RidDBRow.del();

	return _time;

}


void GET_MAX_QD_STORE_TIME(id)//前场方向满蓄力时间计算
{
	var shuxingid = 1;
	var MatchDBRow = new VNet2DBRow
	{
		InitByInt(window.Tennis_Game,window.Match_param,window.Tennis_Game_Match_param_id,shuxingid);
	}
	if ( MatchDBRow.IsReady() == 0 )
	{ 
		MatchDBRow.del();
		printf("sxd9=========MatchDBRow打开失败=======================");
		return;
	}

	var max_qd_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_MAX_QD_STORE_TIME);
	var min_qd_store_time =MatchDBRow.GetData(window.Tennis_Game_Match_param_FLO_QD_STORE_TIME);
	printf("sxd9 前场方向蓄力 最短方向蓄力时间是："+max_qd_store_time);
	printf("sxd9 前场方向蓄力 最长方向蓄力时间是："+min_qd_store_time);

	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,id);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		printf("sxd9=========UserDBRow打开失败=======================");
		return;
	}

	var _roleid = UserDBRow.GetData( window.M_G_Server_Userdt_rid);

	var RidDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Roledt, window.M_G_Server_Roledt_Rid,_roleid);
	}
	if ( RidDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		MatchDBRow.del();
		RidDBRow.del()
		printf("sxd9=========RidDBRow打开失败=======================");
		return;
	}

	var my_qianchang = RidDBRow.GetData( window.M_G_Server_Roledt_TForceHand);
	printf("sxd9当前玩家的前场属性为："+my_qianchang);
	var my_xuli =min_qd_store_time - my_qianchang/300.0*(min_qd_store_time - max_qd_store_time);
	printf("sxd9当前人物前场方向蓄力时间为："+my_xuli);
	var _time = toint(my_xuli);
	printf("sxd9当前人物前场方向蓄力时间(整型)为："+_time);

	MatchDBRow.del();
	UserDBRow.del();
	RidDBRow.del();

	return _time;
}

void CountSpeed(trackID,_speed)
{	
	var TrackDBRow = new VNet2DBRow
	{
		InitByInt(window.Tennis_Game,window.TrackInfo,window.Tennis_Game_TrackInfo_trackID,trackID);
	}
	if ( TrackDBRow.IsReady() == 0 )
	{ 
		TrackDBRow.del();
		printf("sxd9=========MatchDBRow打开失败=======================");
		return;
	}

	var tracktype =TrackDBRow.GetData(window.Tennis_Game_TrackInfo_StatType);
	if(tracktype == 1)//上旋
	{
		var speed_km = 280 - 200*_speed;
		return speed_km;
	}
	if(tracktype == 2)//截击
	{
		var speed_km = (280 - 200*_speed)/0.9;
		return speed_km;
	}
	if(tracktype == 3)//放高球
	{
		var speed_km = 280 - 200*_speed;
		return speed_km;
	}
	if(tracktype == 4)//削球
	{
		var speed_km = (280 - 200*_speed)/1.2;
		return speed_km;
	}
	if(tracktype == 5)//扣杀
	{
		var speed_km = (280 - 200*_speed)/0.8;
		return speed_km;
	}
	if(tracktype == 6 || tracktype == 7)//挡球或扑救
	{
		var speed_km = (280 - 200*_speed)/1.4;
		return speed_km;
	}
	if(tracktype == 8 || tracktype == 0)//发球
	{
		return -1;
	}
	TrackDBRow.del();

}

void RoleFullTime()
{
	var _uid = window.GetMyUID();
	printf("sxd8取得玩家的uid为："+_uid);
	var UserDBRow = new VNet2DBRow
	{
		InitByInt(window.M_G_Server,window.Userdt, window.M_G_Server_Userdt_Uid,_uid);
	}
	if ( UserDBRow.IsReady() == 0 )
	{ 
		UserDBRow.del();
		printf("sxd8=========UserDBRow打开失败=======================");
		return;
	}

	var roleZ =UserDBRow.GetData(window.M_G_Server_Userdt_posz);
	UserDBRow.del();
	printf("sxd8玩家的Z值为："+roleZ);
	if(roleZ < 0) { roleZ = (-1)* roleZ;}
	if(roleZ > 6.4)//在后场
	{
		printf("sxd8在后场!");
		var full_time = GET_H_STORE_TIME(_uid);
		printf("sxd8得到的满蓄力值为："+full_time);
		return full_time;
		
	}
	if(roleZ < 6.4 && roleZ > 0)//在前场
	{
		printf("sxd8在前场!");
		var full_time = GET_Q_STORE_TIME(_uid);
		printf("sxd8得到的满蓄力值为："+full_time);
		return full_time;
		
	}

}