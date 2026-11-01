import("$./action.gml")

var actiondata = new haiou_action{}

//创建海鸥
void createHaiou()
{
	var i = 1;
	while( i <= 50 ){							//创建几只海鸥
		
		var haiou_name = "npchaiou"+i;
		CreateNPC(haiou_name,2);
		SetAction(haiou_name,1,"$./../act/daiji-01.v3act");
		SetAction(haiou_name,2,"$./../act/daiji-02.v3act");
		SetAction(haiou_name,3,"$./../act/daiji.v3act");
		SetAction(haiou_name,4,"$./../act/zou.v3act");
		SetAction(haiou_name,5,"$./../act/qifei.v3act");
		SetAction(haiou_name,6,"$./../act/huaxiang.v3act");
		SetAction(haiou_name,7,"$./../act/feixing.v3act");
		SetNPCModel(haiou_name,"$./../act/haiou.v3s","$./../act/haiou.v3ske",3,500);
		SetScale(haiou_name,"0.05,0.05,0.05");
		switch(i){
			case 1:	/*场地中的海鸥*/
				SetPos(haiou_name,"-5,0,-2");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 2:/*椅子上的海鸥*/
				SetPos(haiou_name,"-6.65,1,1");
				SetRotate(haiou_name,"-125,0,0");
				break;
			case 3:/*场地左下海鸥*/
				SetPos(haiou_name,"-7,0,-6");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 4:/*场地左下海鸥*/
				SetPos(haiou_name,"-6,0,-5");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 5:/*椅子上的海鸥*/
				SetPos(haiou_name,"6.5,1,-0.75");
				SetRotate(haiou_name,"70,0,0");
				break;
			case 6:/*网边的海鸥*/
				SetPos(haiou_name,"-8,0,0");
				SetRotate(haiou_name,"90,0,0");
				break;
			case 7:/*网边的海鸥*/
				SetPos(haiou_name,"-7,0,-0.75");
				SetRotate(haiou_name,"90,0,0");
				break;
			case 8:/*网边的海鸥*/
				SetPos(haiou_name,"-7.5,0,0.75");
				SetRotate(haiou_name,"90,0,0");
				break;
			case 9:/*边缘台上的海鸥*/
				SetPos(haiou_name,"-11,1.5,-4.5");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 10:/*边缘台上的海鸥*/
				SetPos(haiou_name,"-11,1.2,4.5");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 11:/*场地左下海鸥*/
				SetPos(haiou_name,"-8,0,-6.5");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 12:/*场地左下海鸥*/
				SetPos(haiou_name,"-8.5,0,-5.5");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 13:/*场地左下的海鸥*/
				SetPos(haiou_name,"-7.5,0,-11");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 14:/*场地左下的海鸥*/
				SetPos(haiou_name,"-8,0,-10");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 15:/*场地左下的海鸥*/
				SetPos(haiou_name,"-8,0,-12");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 16:/*场地后的海鸥*/
				SetPos(haiou_name,"-8,0,-15");
				SetRotate(haiou_name,"-120,0,0");
				break;
			case 17:/*场地后的海鸥*/
				SetPos(haiou_name,"-9,0,-14");
				SetRotate(haiou_name,"-120,0,0");
				break;
			case 18:/*场地后的海鸥*/
				SetPos(haiou_name,"-10,0,-14");
				SetRotate(haiou_name,"-120,0,0");
				break;
			case 19:/*场地后的海鸥*/
				SetPos(haiou_name,"-7,0,-14");
				SetRotate(haiou_name,"-120,0,0");
				break;
			case 20:/*场地后的海鸥*/
				SetPos(haiou_name,"-6,0,-15");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 21:/*场地后的海鸥*/
				SetPos(haiou_name,"-8,0,-17");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 22:/*场地后的海鸥*/
				SetPos(haiou_name,"-8.5,0,-17.5");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 23:/*场地后的海鸥*/
				SetPos(haiou_name,"-6,0,-17.5");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 24:/*场地后的海鸥*/
				SetPos(haiou_name,"-5,0,-16.5");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 25:/*场地后的海鸥*/
				SetPos(haiou_name,"-4.5,0,-19");
				SetRotate(haiou_name,"-160,0,0");
				break;
			case 26:/*场地后的海鸥*/
				SetPos(haiou_name,"-3.5,0,-18");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 27:/*场地后的海鸥*/
				SetPos(haiou_name,"-3,0,-16");
				SetRotate(haiou_name,"-135,0,0");
				break;
			case 28:/*场地后的海鸥*/
				SetPos(haiou_name,"-2,0,-17.5");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 29:/*场地后台子的海鸥*/
				SetPos(haiou_name,"-1.5,0.8,-18.5");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 30:/*场地后台子的海鸥*/
				SetPos(haiou_name,"-3,1.25,-18.5");
				SetRotate(haiou_name,"180,0,0");
				break;
			case 31:/*桌子上的海鸥*/
				SetPos(haiou_name,"-10.5,0.7,9.5");
				SetRotate(haiou_name,"-90,0,0");
				break;
			case 32:/*场地左边的海鸥*/
				SetPos(haiou_name,"-8,0,8");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 33:/*场地左边的海鸥*/
				SetPos(haiou_name,"-6,0,11");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 34:/*场地后台子上的海鸥*/
				SetPos(haiou_name,"-7.8,0.8,18.5");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 35:/*场地后台子上的海鸥*/
				SetPos(haiou_name,"-7.2,0.8,18.5");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 36:/*场地后台子上的海鸥*/
				SetPos(haiou_name,"-8.5,0.8,18.5");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 37:/*场地后的海鸥*/
				SetPos(haiou_name,"-7.5,0,16");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 38:/*场地后的海鸥*/
				SetPos(haiou_name,"-5.5,0,15");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 39:/*场地后的海鸥*/
				SetPos(haiou_name,"-6.5,0,17");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 40:/*场地后的海鸥*/
				SetPos(haiou_name,"-7,0,16");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 41:/*场地后的海鸥*/
				SetPos(haiou_name,"-8,0,16.5");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 42:/*场地后的海鸥*/
				SetPos(haiou_name,"-5.5,0,17");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 43:/*场地后的海鸥*/
				SetPos(haiou_name,"-7,0,14");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 44:/*场地后的海鸥*/
				SetPos(haiou_name,"-4,0,17");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 45:/*场地后的海鸥*/
				SetPos(haiou_name,"-3.5,0,17");
				SetRotate(haiou_name,"-35,0,0");
				break;
			case 46:/*场地后的海鸥*/
				SetPos(haiou_name,"-3,0,15");
				SetRotate(haiou_name,"25,0,0");
				break;
			case 47:/*场地后的海鸥*/
				SetPos(haiou_name,"-0.5,0,15");
				SetRotate(haiou_name,"0,0,0");
				break;
			case 48:/*场地后的海鸥*/
				SetPos(haiou_name,"5.8,0,16");
				SetRotate(haiou_name,"25,0,0");
				break;
			case 49:/*场地后的海鸥*/
				SetPos(haiou_name,"6.2,0,13");
				SetRotate(haiou_name,"45,0,0");
				break;
			case 50:/*场地后木桶上的海鸥*/
				SetPos(haiou_name,"-2.3,0.9,19");
				SetRotate(haiou_name,"45,0,0");
		}
		SetActionOverFn(haiou_name,"haiou_ActionOver");
		SetCollisionFn(haiou_name,"haiou_startfly");
		i += 1;
	}
}

void haiou_ActionOver(haiou_name,last_action_id)
{
	//第一只海鸥
	if(haiou_name == "npchaiou1"){
		if(actiondata.haiou01_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction("npchaiou1",
				actiondata.haiou01_action_array[actiondata.haiou01_action],
				actiondata.haiou01_time_array[actiondata.haiou01_action]);

			if(actiondata.haiou01_action == 7) actiondata.haiou01_action = 0;
			else actiondata.haiou01_action += 1;
		}
	}
	//第二只海鸥
	if(haiou_name == "npchaiou2"){
		if(actiondata.haiou02_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou2",
				actiondata.haiou02_action_array[actiondata.haiou02_action],
				actiondata.haiou02_time_array[actiondata.haiou02_action],0);

			if(actiondata.haiou02_action == 3) actiondata.haiou02_action = 0;
			else actiondata.haiou02_action += 1;
		}
	}
	//第三只海鸥
	if(haiou_name == "npchaiou3"){
		if(actiondata.haiou03_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou03_action == 3){
				actiondata.haiou03_pos	= 1;
				actiondata.haiou03_speed = 1;
			}

			if(actiondata.haiou03_action == 7){
				actiondata.haiou03_pos = 0;
				actiondata.haiou03_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou3",
				actiondata.haiou03_action_array[actiondata.haiou03_action],
				actiondata.haiou03_time_array[actiondata.haiou03_action],
				actiondata.haiou03_speed_array[actiondata.haiou03_speed],
				actiondata.haiou03_pos_array[actiondata.haiou03_pos]);

			if(actiondata.haiou03_action == 7) actiondata.haiou03_action = 0;
			else actiondata.haiou03_action += 1;
			actiondata.haiou03_speed = 0;
		}
	}
	//第四只海鸥
	if(haiou_name == "npchaiou4"){
		if(actiondata.haiou04_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou04_action % 2 == 0){
				actiondata.haiou04_speed = 1;
				if(actiondata.haiou04_action == 2)	actiondata.haiou04_Angle = 1;
				if(actiondata.haiou04_action == 6)	actiondata.haiou04_Angle = 0;
			}

			UseAction_SpeedAngle("npchaiou4",
				actiondata.haiou04_action_array[actiondata.haiou04_action],
				actiondata.haiou04_time_array[actiondata.haiou04_action],
				actiondata.haiou04_speed_array[actiondata.haiou04_speed],
				actiondata.haiou04_Angle_array[actiondata.haiou04_Angle]);

			if(actiondata.haiou04_action == 7) actiondata.haiou04_action = 0;
			else actiondata.haiou04_action += 1;
			actiondata.haiou04_speed = 0;
		}
	}
	//第五只海鸥
	if(haiou_name == "npchaiou5"){
		if(actiondata.haiou05_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou5",
				actiondata.haiou05_action_array[actiondata.haiou05_action],
				actiondata.haiou05_time_array[actiondata.haiou05_action],0);

			if(actiondata.haiou05_action == 3) actiondata.haiou05_action = 0;
			else actiondata.haiou05_action += 1;
		}
	}
	//第六只海鸥
	if(haiou_name == "npchaiou6"){
		if(actiondata.haiou06_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou6",
				actiondata.haiou06_action_array[actiondata.haiou06_action],
				actiondata.haiou06_time_array[actiondata.haiou06_action],0);

			if(actiondata.haiou06_action == 5) actiondata.haiou06_action = 0;
			else actiondata.haiou06_action += 1;
		}
	}
	//第七只海鸥
	if(haiou_name == "npchaiou7"){
		if(actiondata.haiou07_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou7",
				actiondata.haiou07_action_array[actiondata.haiou07_action],
				actiondata.haiou07_time_array[actiondata.haiou07_action],0);

			if(actiondata.haiou07_action == 5) actiondata.haiou07_action = 0;
			else actiondata.haiou07_action += 1;
		}
	}
	//第八只海鸥
	if(haiou_name == "npchaiou8"){
		if(actiondata.haiou08_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou8",
				actiondata.haiou08_action_array[actiondata.haiou08_action],
				actiondata.haiou08_time_array[actiondata.haiou08_action],0);

			if(actiondata.haiou08_action == 5) actiondata.haiou08_action = 0;
			else actiondata.haiou08_action += 1;
		}
	}
	//第九只海鸥
	if(haiou_name == "npchaiou9"){
		if(actiondata.haiou09_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou9",
				actiondata.haiou09_action_array[actiondata.haiou09_action],
				actiondata.haiou09_time_array[actiondata.haiou09_action],0);

			if(actiondata.haiou09_action == 5) actiondata.haiou09_action = 0;
			else actiondata.haiou09_action += 1;
		}
	}
	//第十只海鸥
	if(haiou_name == "npchaiou10"){
		if(actiondata.haiou10_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou10",
				actiondata.haiou10_action_array[actiondata.haiou10_action],
				actiondata.haiou10_time_array[actiondata.haiou10_action],0);

			if(actiondata.haiou10_action == 5) actiondata.haiou10_action = 0;
			else actiondata.haiou10_action += 1;
		}
	}
	//第十一只海鸥
	if(haiou_name == "npchaiou11"){
		if(actiondata.haiou11_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou11_action == 3){
				actiondata.haiou11_pos	= 1;
				actiondata.haiou11_speed = 1;
			}

			if(actiondata.haiou11_action == 7){
				actiondata.haiou11_pos = 0;
				actiondata.haiou11_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou11",
				actiondata.haiou11_action_array[actiondata.haiou11_action],
				actiondata.haiou11_time_array[actiondata.haiou11_action],
				actiondata.haiou11_speed_array[actiondata.haiou11_speed],
				actiondata.haiou11_pos_array[actiondata.haiou11_pos]);

			if(actiondata.haiou11_action == 7) actiondata.haiou11_action = 0;
			else actiondata.haiou11_action += 1;
			actiondata.haiou11_speed = 0;
		}
	}
	//第十二只海鸥
	if(haiou_name == "npchaiou12"){
		if(actiondata.haiou12_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou12_action == 3){
				actiondata.haiou12_pos	= 1;
				actiondata.haiou12_speed = 1;
			}

			if(actiondata.haiou12_action == 7){
				actiondata.haiou12_pos = 0;
				actiondata.haiou12_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou12",
				actiondata.haiou12_action_array[actiondata.haiou12_action],
				actiondata.haiou12_time_array[actiondata.haiou12_action],
				actiondata.haiou12_speed_array[actiondata.haiou12_speed],
				actiondata.haiou12_pos_array[actiondata.haiou12_pos]);

			if(actiondata.haiou12_action == 7) actiondata.haiou12_action = 0;
			else actiondata.haiou12_action += 1;
			actiondata.haiou12_speed = 0;
		}
	}
	//第十三只海鸥
	if(haiou_name == "npchaiou13"){
		if(actiondata.haiou13_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou13_action == 3){
				actiondata.haiou13_angle = 1;
				actiondata.haiou13_speed = 1;
			}

			if(actiondata.haiou13_action == 7){
				actiondata.haiou13_angle = 0;
				actiondata.haiou13_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou13",
				actiondata.haiou13_action_array[actiondata.haiou13_action],
				actiondata.haiou13_time_array[actiondata.haiou13_action],
				actiondata.haiou13_speed_array[actiondata.haiou13_speed],
				actiondata.haiou13_angle_array[actiondata.haiou13_angle]);

			if(actiondata.haiou13_action == 7) actiondata.haiou13_action = 0;
			else actiondata.haiou13_action += 1;
			actiondata.haiou13_speed = 0;
		}
	}
	//第十四只海鸥
	if(haiou_name == "npchaiou14"){
		if(actiondata.haiou14_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou14_action == 1){
				actiondata.haiou14_angle = 1;
				actiondata.haiou14_speed = 1;
			}

			if(actiondata.haiou14_action == 3){
				actiondata.haiou14_angle = 0;
				actiondata.haiou14_speed = 1;
			}

			if(actiondata.haiou14_action == 6){
				actiondata.haiou14_angle = 1;
				actiondata.haiou14_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou14",
				actiondata.haiou14_action_array[actiondata.haiou14_action],
				actiondata.haiou14_time_array[actiondata.haiou14_action],
				actiondata.haiou14_speed_array[actiondata.haiou14_speed],
				actiondata.haiou14_angle_array[actiondata.haiou14_angle]);

			if(actiondata.haiou14_action == 7) actiondata.haiou14_action = 0;
			else actiondata.haiou14_action += 1;
			actiondata.haiou14_speed = 0;
		}
	}
	//第十五只海鸥
	if(haiou_name == "npchaiou15"){
		if(actiondata.haiou15_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou15_action % 2 == 0){
				actiondata.haiou15_speed = 1;
				if(actiondata.haiou15_action == 2)	actiondata.haiou15_angle = 1;
				if(actiondata.haiou15_action == 6)	actiondata.haiou15_angle = 0;
			}

			UseAction_SpeedAngle("npchaiou15",
				actiondata.haiou15_action_array[actiondata.haiou15_action],
				actiondata.haiou15_time_array[actiondata.haiou15_action],
				actiondata.haiou15_speed_array[actiondata.haiou15_speed],
				actiondata.haiou15_angle_array[actiondata.haiou15_angle]);

			if(actiondata.haiou15_action == 7) actiondata.haiou15_action = 0;
			else actiondata.haiou15_action += 1;
			actiondata.haiou15_speed = 0;
		}
	}
	//第十六只海鸥
	if(haiou_name == "npchaiou16"){
		if(actiondata.haiou16_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou16",
				actiondata.haiou16_action_array[actiondata.haiou16_action],
				actiondata.haiou16_time_array[actiondata.haiou16_action],0);

			if(actiondata.haiou16_action == 5) actiondata.haiou16_action = 0;
			else actiondata.haiou16_action += 1;
		}
	}
	//第十七只海鸥
	if(haiou_name == "npchaiou17"){
		if(actiondata.haiou17_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou17",
				actiondata.haiou17_action_array[actiondata.haiou17_action],
				actiondata.haiou17_time_array[actiondata.haiou17_action],0);

			if(actiondata.haiou17_action == 5) actiondata.haiou17_action = 0;
			else actiondata.haiou17_action += 1;
		}
	}
	//第十八只海鸥
	if(haiou_name == "npchaiou18"){
		if(actiondata.haiou18_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou18",
				actiondata.haiou18_action_array[actiondata.haiou18_action],
				actiondata.haiou18_time_array[actiondata.haiou18_action],0);

			if(actiondata.haiou18_action == 5) actiondata.haiou18_action = 0;
			else actiondata.haiou18_action += 1;
		}
	}
	//第十九只海鸥
	if(haiou_name == "npchaiou19"){
		if(actiondata.haiou19_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou19_action == 3){
				actiondata.haiou19_angle = 0;
				actiondata.haiou19_speed = 1;
			}

			if(actiondata.haiou19_action == 7){
				actiondata.haiou19_angle = 1;
				actiondata.haiou19_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou19",
				actiondata.haiou19_action_array[actiondata.haiou19_action],
				actiondata.haiou19_time_array[actiondata.haiou19_action],
				actiondata.haiou19_speed_array[actiondata.haiou19_speed],
				actiondata.haiou19_angle_array[actiondata.haiou19_angle]);

			if(actiondata.haiou19_action == 7) actiondata.haiou19_action = 0;
			else actiondata.haiou19_action += 1;
			actiondata.haiou19_speed = 0;
		}
	}
	//第二十只海鸥
	if(haiou_name == "npchaiou20"){
		if(actiondata.haiou20_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou20_action == 3){
				actiondata.haiou20_angle = 0;
				actiondata.haiou20_speed = 1;
			}

			if(actiondata.haiou20_action == 7){
				actiondata.haiou20_angle = 1;
				actiondata.haiou20_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou20",
				actiondata.haiou20_action_array[actiondata.haiou20_action],
				actiondata.haiou20_time_array[actiondata.haiou20_action],
				actiondata.haiou20_speed_array[actiondata.haiou20_speed],
				actiondata.haiou20_angle_array[actiondata.haiou20_angle]);

			if(actiondata.haiou20_action == 7) actiondata.haiou20_action = 0;
			else actiondata.haiou20_action += 1;
			actiondata.haiou20_speed = 0;
		}
	}
	//第21只海鸥
	if(haiou_name == "npchaiou21"){
		if(actiondata.haiou21_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou21",
				actiondata.haiou21_action_array[actiondata.haiou21_action],
				actiondata.haiou21_time_array[actiondata.haiou21_action],0);

			if(actiondata.haiou21_action == 5) actiondata.haiou21_action = 0;
			else actiondata.haiou21_action += 1;
		}
	}
	//第22只海鸥
	if(haiou_name == "npchaiou22"){
		if(actiondata.haiou22_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou22",
				actiondata.haiou22_action_array[actiondata.haiou22_action],
				actiondata.haiou22_time_array[actiondata.haiou22_action],0);

			if(actiondata.haiou22_action == 5) actiondata.haiou22_action = 0;
			else actiondata.haiou22_action += 1;
		}
	}
	//第23只海鸥
	if(haiou_name == "npchaiou23"){
		if(actiondata.haiou23_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou23",
				actiondata.haiou23_action_array[actiondata.haiou23_action],
				actiondata.haiou23_time_array[actiondata.haiou23_action],0);

			if(actiondata.haiou23_action == 5) actiondata.haiou23_action = 0;
			else actiondata.haiou23_action += 1;
		}
	}
	//第24只海鸥
	if(haiou_name == "npchaiou24"){
		if(actiondata.haiou24_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou24",
				actiondata.haiou24_action_array[actiondata.haiou24_action],
				actiondata.haiou24_time_array[actiondata.haiou24_action],0);

			if(actiondata.haiou24_action == 5) actiondata.haiou24_action = 0;
			else actiondata.haiou24_action += 1;
		}
	}
	//第25只海鸥
	if(haiou_name == "npchaiou25"){
		if(actiondata.haiou25_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou25",
				actiondata.haiou25_action_array[actiondata.haiou25_action],
				actiondata.haiou25_time_array[actiondata.haiou25_action],0);

			if(actiondata.haiou25_action == 5) actiondata.haiou25_action = 0;
			else actiondata.haiou25_action += 1;
		}
	}
	//第26只海鸥
	if(haiou_name == "npchaiou26"){
		if(actiondata.haiou26_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou26_action == 3){
				actiondata.haiou26_angle = 0;
				actiondata.haiou26_speed = 1;
			}

			if(actiondata.haiou26_action == 7){
				actiondata.haiou26_angle = 1;
				actiondata.haiou26_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou26",
				actiondata.haiou26_action_array[actiondata.haiou26_action],
				actiondata.haiou26_time_array[actiondata.haiou26_action],
				actiondata.haiou26_speed_array[actiondata.haiou26_speed],
				actiondata.haiou26_angle_array[actiondata.haiou26_angle]);

			if(actiondata.haiou26_action == 7) actiondata.haiou26_action = 0;
			else actiondata.haiou26_action += 1;
			actiondata.haiou26_speed = 0;
		}
	}
	//第27只海鸥
	if(haiou_name == "npchaiou27"){
		if(actiondata.haiou27_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou27_action == 3){
				actiondata.haiou27_angle = 0;
				actiondata.haiou27_speed = 1;
			}

			if(actiondata.haiou27_action == 7){
				actiondata.haiou27_angle = 1;
				actiondata.haiou27_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou27",
				actiondata.haiou27_action_array[actiondata.haiou27_action],
				actiondata.haiou27_time_array[actiondata.haiou27_action],
				actiondata.haiou27_speed_array[actiondata.haiou27_speed],
				actiondata.haiou27_angle_array[actiondata.haiou27_angle]);

			if(actiondata.haiou27_action == 7) actiondata.haiou27_action = 0;
			else actiondata.haiou27_action += 1;
			actiondata.haiou27_speed = 0;
		}
	}
	//第28只海鸥
	if(haiou_name == "npchaiou28"){
		if(actiondata.haiou28_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou28_action == 3){
				actiondata.haiou28_angle = 0;
				actiondata.haiou28_speed = 1;
			}

			if(actiondata.haiou28_action == 7){
				actiondata.haiou28_angle = 1;
				actiondata.haiou28_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou28",
				actiondata.haiou28_action_array[actiondata.haiou28_action],
				actiondata.haiou28_time_array[actiondata.haiou28_action],
				actiondata.haiou28_speed_array[actiondata.haiou28_speed],
				actiondata.haiou28_angle_array[actiondata.haiou28_angle]);

			if(actiondata.haiou28_action == 7) actiondata.haiou28_action = 0;
			else actiondata.haiou28_action += 1;
			actiondata.haiou28_speed = 0;
		}
	}
	//第29只海鸥
	if(haiou_name == "npchaiou29"){
		if(actiondata.haiou29_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou29_action == 3){
				actiondata.haiou29_angle = 0;
				actiondata.haiou29_speed = 1;
			}else{
				if(actiondata.haiou29_action == 7){
					actiondata.haiou29_angle = 1;
					actiondata.haiou29_speed = 1;
				}else{
					actiondata.haiou29_angle = 2;
					actiondata.haiou29_speed = 0;
				}
			}

			UseAction_SpeedAngle("npchaiou29",
				actiondata.haiou29_action_array[actiondata.haiou29_action],
				actiondata.haiou29_time_array[actiondata.haiou29_action],
				actiondata.haiou29_speed_array[actiondata.haiou29_speed],
				actiondata.haiou29_angle_array[actiondata.haiou29_angle]);

			if(actiondata.haiou29_action == 7) actiondata.haiou29_action = 0;
			else actiondata.haiou29_action += 1;
			actiondata.haiou29_speed = 0;
		}
	}
	//第30只海鸥
	if(haiou_name == "npchaiou30"){
		if(actiondata.haiou30_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou30",
				actiondata.haiou30_action_array[actiondata.haiou30_action],
				actiondata.haiou30_time_array[actiondata.haiou30_action],0);

			if(actiondata.haiou30_action == 5) actiondata.haiou30_action = 0;
			else actiondata.haiou30_action += 1;
		}
	}
	//第31只海鸥
	if(haiou_name == "npchaiou31"){
		if(actiondata.haiou31_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou31",
				actiondata.haiou31_action_array[actiondata.haiou31_action],
				actiondata.haiou31_time_array[actiondata.haiou31_action],0);

			if(actiondata.haiou31_action == 5) actiondata.haiou31_action = 0;
			else actiondata.haiou31_action += 1;
		}
	}
	//第32只海鸥
	if(haiou_name == "npchaiou32"){
		if(actiondata.haiou32_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou32_action == 3){
				actiondata.haiou32_angle = 0;
				actiondata.haiou32_speed = 1;
			}

			if(actiondata.haiou32_action == 7){
				actiondata.haiou32_angle = 1;
				actiondata.haiou32_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou32",
				actiondata.haiou32_action_array[actiondata.haiou32_action],
				actiondata.haiou32_time_array[actiondata.haiou32_action],
				actiondata.haiou32_speed_array[actiondata.haiou32_speed],
				actiondata.haiou32_angle_array[actiondata.haiou32_angle]);

			if(actiondata.haiou32_action == 7) actiondata.haiou32_action = 0;
			else actiondata.haiou32_action += 1;
			actiondata.haiou32_speed = 0;
		}
	}
	//第33只海鸥
	if(haiou_name == "npchaiou33"){
		if(actiondata.haiou33_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou33_action == 3){
				actiondata.haiou33_angle = 0;
				actiondata.haiou33_speed = 1;
			}

			if(actiondata.haiou33_action == 7){
				actiondata.haiou33_angle = 1;
				actiondata.haiou33_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou33",
				actiondata.haiou33_action_array[actiondata.haiou33_action],
				actiondata.haiou33_time_array[actiondata.haiou33_action],
				actiondata.haiou33_speed_array[actiondata.haiou33_speed],
				actiondata.haiou33_angle_array[actiondata.haiou33_angle]);

			if(actiondata.haiou33_action == 7) actiondata.haiou33_action = 0;
			else actiondata.haiou33_action += 1;
			actiondata.haiou33_speed = 0;
		}
	}
	//第34只海鸥
	if(haiou_name == "npchaiou34"){
		if(actiondata.haiou34_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou34",
				actiondata.haiou34_action_array[actiondata.haiou34_action],
				actiondata.haiou34_time_array[actiondata.haiou34_action],0);

			if(actiondata.haiou34_action == 5) actiondata.haiou34_action = 0;
			else actiondata.haiou34_action += 1;
		}
	}
	//第35只海鸥
	if(haiou_name == "npchaiou35"){
		if(actiondata.haiou35_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou35",
				actiondata.haiou35_action_array[actiondata.haiou35_action],
				actiondata.haiou35_time_array[actiondata.haiou35_action],0);

			if(actiondata.haiou35_action == 5) actiondata.haiou35_action = 0;
			else actiondata.haiou35_action += 1;
		}
	}
	//第36只海鸥
	if(haiou_name == "npchaiou36"){
		if(actiondata.haiou36_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou36",
				actiondata.haiou36_action_array[actiondata.haiou36_action],
				actiondata.haiou36_time_array[actiondata.haiou36_action],0);

			if(actiondata.haiou36_action == 5) actiondata.haiou36_action = 0;
			else actiondata.haiou36_action += 1;
		}
	}
	//第37只海鸥
	if(haiou_name == "npchaiou37"){
		if(actiondata.haiou37_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou37",
				actiondata.haiou37_action_array[actiondata.haiou37_action],
				actiondata.haiou37_time_array[actiondata.haiou37_action],0);

			if(actiondata.haiou37_action == 5) actiondata.haiou37_action = 0;
			else actiondata.haiou37_action += 1;
		}
	}
	//第38只海鸥
	if(haiou_name == "npchaiou38"){
		if(actiondata.haiou38_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou38",
				actiondata.haiou38_action_array[actiondata.haiou38_action],
				actiondata.haiou38_time_array[actiondata.haiou38_action],0);

			if(actiondata.haiou38_action == 5) actiondata.haiou38_action = 0;
			else actiondata.haiou38_action += 1;
		}
	}
	//第39只海鸥
	if(haiou_name == "npchaiou39"){
		if(actiondata.haiou39_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou39",
				actiondata.haiou39_action_array[actiondata.haiou39_action],
				actiondata.haiou39_time_array[actiondata.haiou39_action],0);

			if(actiondata.haiou39_action == 5) actiondata.haiou39_action = 0;
			else actiondata.haiou39_action += 1;
		}
	}
	//第40只海鸥
	if(haiou_name == "npchaiou40"){
		if(actiondata.haiou40_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou40",
				actiondata.haiou40_action_array[actiondata.haiou40_action],
				actiondata.haiou40_time_array[actiondata.haiou40_action],0);

			if(actiondata.haiou40_action == 5) actiondata.haiou40_action = 0;
			else actiondata.haiou40_action += 1;
		}
	}
	//第41只海鸥
	if(haiou_name == "npchaiou41"){
		if(actiondata.haiou41_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou41",
				actiondata.haiou41_action_array[actiondata.haiou41_action],
				actiondata.haiou41_time_array[actiondata.haiou41_action],0);

			if(actiondata.haiou41_action == 5) actiondata.haiou41_action = 0;
			else actiondata.haiou41_action += 1;
		}
	}
	//第42只海鸥
	if(haiou_name == "npchaiou42"){
		if(actiondata.haiou42_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou42",
				actiondata.haiou42_action_array[actiondata.haiou42_action],
				actiondata.haiou42_time_array[actiondata.haiou42_action],0);

			if(actiondata.haiou42_action == 5) actiondata.haiou42_action = 0;
			else actiondata.haiou42_action += 1;
		}
	}
	//第43只海鸥
	if(haiou_name == "npchaiou43"){
		if(actiondata.haiou43_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou43",
				actiondata.haiou43_action_array[actiondata.haiou43_action],
				actiondata.haiou43_time_array[actiondata.haiou43_action],0);

			if(actiondata.haiou43_action == 5) actiondata.haiou43_action = 0;
			else actiondata.haiou43_action += 1;
		}
	}
	//第44只海鸥
	if(haiou_name == "npchaiou44"){
		if(actiondata.haiou44_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou44_action == 3){
				actiondata.haiou44_angle = 0;
				actiondata.haiou44_speed = 1;
			}

			if(actiondata.haiou44_action == 7){
				actiondata.haiou44_angle = 1;
				actiondata.haiou44_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou44",
				actiondata.haiou44_action_array[actiondata.haiou44_action],
				actiondata.haiou44_time_array[actiondata.haiou44_action],
				actiondata.haiou44_speed_array[actiondata.haiou44_speed],
				actiondata.haiou44_angle_array[actiondata.haiou44_angle]);

			if(actiondata.haiou44_action == 7) actiondata.haiou44_action = 0;
			else actiondata.haiou44_action += 1;
			actiondata.haiou44_speed = 0;
		}
	}
	//第45只海鸥
	if(haiou_name == "npchaiou45"){
		if(actiondata.haiou45_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou45_action == 3){
				actiondata.haiou45_angle = 0;
				actiondata.haiou45_speed = 1;
			}

			if(actiondata.haiou45_action == 7){
				actiondata.haiou45_angle = 1;
				actiondata.haiou45_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou45",
				actiondata.haiou45_action_array[actiondata.haiou45_action],
				actiondata.haiou45_time_array[actiondata.haiou45_action],
				actiondata.haiou45_speed_array[actiondata.haiou45_speed],
				actiondata.haiou45_angle_array[actiondata.haiou45_angle]);

			if(actiondata.haiou45_action == 7) actiondata.haiou45_action = 0;
			else actiondata.haiou45_action += 1;
			actiondata.haiou45_speed = 0;
		}
	}
	//第46只海鸥
	if(haiou_name == "npchaiou46"){
		if(actiondata.haiou46_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou46",
				actiondata.haiou46_action_array[actiondata.haiou46_action],
				actiondata.haiou46_time_array[actiondata.haiou46_action],0);

			if(actiondata.haiou46_action == 5) actiondata.haiou46_action = 0;
			else actiondata.haiou46_action += 1;
		}
	}
	//第47只海鸥
	if(haiou_name == "npchaiou47"){
		if(actiondata.haiou47_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			if(actiondata.haiou47_action == 3){
				actiondata.haiou47_angle = 0;
				actiondata.haiou47_speed = 1;
			}

			if(actiondata.haiou47_action == 7){
				actiondata.haiou47_angle = 1;
				actiondata.haiou47_speed = 1;
			}

			UseAction_SpeedAngle("npchaiou47",
				actiondata.haiou47_action_array[actiondata.haiou47_action],
				actiondata.haiou47_time_array[actiondata.haiou47_action],
				actiondata.haiou47_speed_array[actiondata.haiou47_speed],
				actiondata.haiou47_angle_array[actiondata.haiou47_angle]);

			if(actiondata.haiou47_action == 7) actiondata.haiou47_action = 0;
			else actiondata.haiou47_action += 1;
			actiondata.haiou47_speed = 0;
		}
	}
	//第48只海鸥
	if(haiou_name == "npchaiou48"){
		if(actiondata.haiou48_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou48",
				actiondata.haiou48_action_array[actiondata.haiou48_action],
				actiondata.haiou48_time_array[actiondata.haiou48_action],0);

			if(actiondata.haiou48_action == 5) actiondata.haiou48_action = 0;
			else actiondata.haiou48_action += 1;
		}
	}
	//第49只海鸥
	if(haiou_name == "npchaiou49"){
		if(actiondata.haiou49_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou49",
				actiondata.haiou49_action_array[actiondata.haiou49_action],
				actiondata.haiou49_time_array[actiondata.haiou49_action],0);

			if(actiondata.haiou49_action == 5) actiondata.haiou49_action = 0;
			else actiondata.haiou49_action += 1;
		}
	}
	//第50只海鸥
	if(haiou_name == "npchaiou50"){
		if(actiondata.haiou50_fly){
			haiou_flying(haiou_name,last_action_id);
		}else{
			UseAction_SpeedAngle("npchaiou50",
				actiondata.haiou50_action_array[actiondata.haiou50_action],
				actiondata.haiou50_time_array[actiondata.haiou50_action],0);

			if(actiondata.haiou50_action == 5) actiondata.haiou50_action = 0;
			else actiondata.haiou50_action += 1;
		}
	}
}

//海鸥开始起飞
void haiou_startfly( haiou_name,collision_id,num,speed,length ){
	var speed_x = GetIndex(speed,0);
	var speed_y = GetIndex(speed,1);
	var speed_z = GetIndex(speed,2);
//	if(collision_id == 2 || collision_id == 1)
	{
		var npchaiou_Angle = CalcAngle(speed);
		var npchaiou_Angle_x = GetIndex(npchaiou_Angle,0);
		var npchaiou_Angle_y = GetIndex(npchaiou_Angle,1);
		npchaiou_Angle = ""+npchaiou_Angle_x+","+npchaiou_Angle_y+",30";
					
		switch(haiou_name){
			case "npchaiou1":
				actiondata.haiou01_fly = true;
				break;
			case "npchaiou2":
				actiondata.haiou02_fly = true;
				break;
			case "npchaiou3":
				actiondata.haiou03_fly = true;
				break;
			case "npchaiou4":
				actiondata.haiou04_fly = true;
				break;
			case "npchaiou5":
				actiondata.haiou05_fly = true;
				break;
			case "npchaiou6":
				actiondata.haiou06_fly = true;
				break;
			case "npchaiou7":
				actiondata.haiou07_fly = true;
				break;
			case "npchaiou8":
				actiondata.haiou08_fly = true;
				break;
			case "npchaiou9":
				actiondata.haiou09_fly = true;
				break;
			case "npchaiou10":
				actiondata.haiou10_fly = true;
				break;
			case "npchaiou11":
				actiondata.haiou11_fly = true;
				break;
			case "npchaiou12":
				actiondata.haiou12_fly = true;
				break;
			case "npchaiou13":
				actiondata.haiou13_fly = true;
				break;
			case "npchaiou14":
				actiondata.haiou14_fly = true;
				break;
			case "npchaiou15":
				actiondata.haiou15_fly = true;
				break;
			case "npchaiou16":
				actiondata.haiou16_fly = true;
				break;
			case "npchaiou17":
				actiondata.haiou17_fly = true;
				break;
			case "npchaiou18":
				actiondata.haiou18_fly = true;
				break;
			case "npchaiou19":
				actiondata.haiou19_fly = true;
				break;
			case "npchaiou20":
				actiondata.haiou20_fly = true;
				break;
			case "npchaiou21":
				actiondata.haiou21_fly = true;
				break;
			case "npchaiou22":
				actiondata.haiou22_fly = true;
				break;
			case "npchaiou23":
				actiondata.haiou23_fly = true;
				break;
			case "npchaiou24":
				actiondata.haiou24_fly = true;
				break;
			case "npchaiou25":
				actiondata.haiou25_fly = true;
				break;
			case "npchaiou26":
				actiondata.haiou26_fly = true;
				break;
			case "npchaiou27":
				actiondata.haiou27_fly = true;
				break;
			case "npchaiou28":
				actiondata.haiou28_fly = true;
				break;
			case "npchaiou29":
				actiondata.haiou29_fly = true;
				break;
			case "npchaiou30":
				actiondata.haiou30_fly = true;
				break;
			case "npchaiou31":
				actiondata.haiou31_fly = true;
				break;
			case "npchaiou32":
				actiondata.haiou32_fly = true;
				break;
			case "npchaiou33":
				actiondata.haiou33_fly = true;
				break;
			case "npchaiou34":
				actiondata.haiou34_fly = true;
				break;
			case "npchaiou35":
				actiondata.haiou35_fly = true;
				break;
			case "npchaiou36":
				actiondata.haiou36_fly = true;
				break;
			case "npchaiou37":
				actiondata.haiou37_fly = true;
				break;
			case "npchaiou38":
				actiondata.haiou38_fly = true;
				break;
			case "npchaiou39":
				actiondata.haiou39_fly = true;
				break;
			case "npchaiou40":
				actiondata.haiou40_fly = true;
				break;
			case "npchaiou41":
				actiondata.haiou41_fly = true;
				break;
			case "npchaiou42":
				actiondata.haiou42_fly = true;
				break;
			case "npchaiou43":
				actiondata.haiou43_fly = true;
				break;
			case "npchaiou44":
				actiondata.haiou44_fly = true;
				break;
			case "npchaiou45":
				actiondata.haiou45_fly = true;
				break;
			case "npchaiou46":
				actiondata.haiou46_fly = true;
				break;
			case "npchaiou47":
				actiondata.haiou47_fly = true;
				break;
			case "npchaiou48":
				actiondata.haiou48_fly = true;
				break;
			case "npchaiou49":
				actiondata.haiou49_fly = true;
				break;
			case "npchaiou50":
				actiondata.haiou50_fly = true;
		}
		UseAction_SpeedAngle(haiou_name,5,1200,5,npchaiou_Angle);
	}
}

//海鸥飞行方法
void haiou_flying(haiou_name,last_action_id){
//	if(last_action_id == 7)	DeleteNPC(haiou_name);

	var angel = GetRotate(haiou_name);
	var haiou_x = GetIndex(angel,0);
	var haiou_y = GetIndex(angel,1);
	printf("angel======="+angel);
	if(haiou_x <= 180 && haiou_x >=0){
		switch(last_action_id){
			case 5:
				var haiou_angel_01 = ""+haiou_x+","+haiou_y+",15";
				UseAction_SpeedAngle(haiou_name,6,1000,3,haiou_angel_01);
				break;
			case 6:
				var haiou_angel_03 = ""+haiou_x+","+haiou_y+",0";
				UseAction_SpeedAngle(haiou_name,7,10000,5,haiou_angel_03);
				
		}
	}else{
		var haiou_angel_02 = ""+haiou_x+","+haiou_y+",30";
		UseAction_SpeedAngle(haiou_name,7,3000,5,haiou_angel_02);
	}
}


//	DeleteNPC(haiou_name);
