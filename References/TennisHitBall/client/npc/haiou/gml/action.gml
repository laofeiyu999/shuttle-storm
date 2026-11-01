class haiou_action item
{
	//第一只海鸥
	//第一只海鸥动作
	var haiou01_fly			 = false;
	var haiou01_action		 = 0;
	var haiou01_action_array = sysarray(8);
	haiou01_action_array[0]	 = 3;
	haiou01_action_array[1]	 = 1;
	haiou01_action_array[2]	 = 2;
	haiou01_action_array[3]	 = 3;
	haiou01_action_array[4]	 = 1;
	haiou01_action_array[5]	 = 2;
	haiou01_action_array[6]	 = 1;
	haiou01_action_array[7]	 = 3;

	//第一只海鸥动作时间
	var haiou01_time_array	= sysarray(10);
	haiou01_time_array[0]	= 1000;
	haiou01_time_array[1]	= 4000;
	haiou01_time_array[2]	= 4000;
	haiou01_time_array[3]	= 1000;
	haiou01_time_array[4]	= 2000;
	haiou01_time_array[5]	= 6000;
	haiou01_time_array[6]	= 2500;
	haiou01_time_array[7]	= 1000;

	//第二只海鸥
	//第二只海鸥动作
	var haiou02_fly			 = false;
	var haiou02_action		 = 0;
	var haiou02_action_array = sysarray(4);
	haiou02_action_array[0]	 = 3;
	haiou02_action_array[1]	 = 1;
	haiou02_action_array[2]	 = 3;
	haiou02_action_array[3]	 = 1;

	//第二只海鸥动作时间
	var haiou02_time_array	= sysarray(4);
	haiou02_time_array[0]	= 3000;
	haiou02_time_array[1]	= 4000;
	haiou02_time_array[2]	= 3000;
	haiou02_time_array[3]	= 2000;

	//第三只海鸥
	//第三只海鸥动作
	var haiou03_fly				= false;
	var haiou03_action			= 0;
	var haiou03_action_array	= sysarray(8);
	haiou03_action_array[0]		= 2;
	haiou03_action_array[1]		= 1;
	haiou03_action_array[2]		= 2;
	haiou03_action_array[3]		= 4;
	haiou03_action_array[4]		= 3;
	haiou03_action_array[5]		= 1;
	haiou03_action_array[6]		= 2;
	haiou03_action_array[7]		= 4;

	//第三只海鸥时间
	var haiou03_time_array		= sysarray(8);
	haiou03_time_array[0]		= 3000;
	haiou03_time_array[1]		= 2000;
	haiou03_time_array[2]		= 3000;
	haiou03_time_array[3]		= 3000;
	haiou03_time_array[4]		= 1000;
	haiou03_time_array[5]		= 2000;
	haiou03_time_array[6]		= 4000;
	haiou03_time_array[7]		= 3000;

	//第三只海鸥速度
	var haiou03_speed			= 0;
	var haiou03_speed_array		= sysarray(2);
	haiou03_speed_array[0]		= 0;
	haiou03_speed_array[1]		= 1;

	//第三只海鸥角度
	var haiou03_pos				= 0;
	var haiou03_pos_array		= sysarray(2);
	haiou03_pos_array[0]		= "180,0,0";
	haiou03_pos_array[1]		= "0,0,0";

	//第四只海鸥
	//第四只海鸥动作
	var haiou04_fly				= false;
	var haiou04_action			= 0;
	var haiou04_action_array	= sysarray(8);
	haiou04_action_array[0]		= 4;
	haiou04_action_array[1]		= 1;
	haiou04_action_array[2]		= 4;
	haiou04_action_array[3]		= 2;
	haiou04_action_array[4]		= 4;
	haiou04_action_array[5]		= 1;
	haiou04_action_array[6]		= 4;
	haiou04_action_array[7]		= 3;

	//第四只海鸥时间
	var haiou04_time_array		= sysarray(8);
	haiou04_time_array[0]		= 2000;
	haiou04_time_array[1]		= 3000;
	haiou04_time_array[2]		= 3000;
	haiou04_time_array[3]		= 1500;
	haiou04_time_array[4]		= 2000;
	haiou04_time_array[5]		= 2500;
	haiou04_time_array[6]		= 3000;
	haiou04_time_array[7]		= 2000;

	//第四只海鸥速度
	var haiou04_speed			= 0;
	var haiou04_speed_array		= sysarray(2);
	haiou04_speed_array[0]		= 0;
	haiou04_speed_array[1]		= 1;

	//第四只海鸥角度
	var haiou04_Angle			= 0;
	var haiou04_Angle_array		= sysarray(2);
	haiou04_Angle_array[0]		= "0,0,0";
	haiou04_Angle_array[1]		= "180,0,0";

	//第五只海鸥
	//第五只海鸥动作
	var haiou05_fly				= false;
	var haiou05_action			= 0;
	var haiou05_action_array	= sysarray(4);
	haiou05_action_array[0]		= 1;
	haiou05_action_array[1]		= 2;
	haiou05_action_array[2]		= 3;
	haiou05_action_array[3]		= 2;

	//第五只海鸥时间
	var haiou05_time_array		= sysarray(8);
	haiou05_time_array[0]		= 2000;
	haiou05_time_array[1]		= 3000;
	haiou05_time_array[2]		= 2000;
	haiou05_time_array[3]		= 2000;

	//第六只海鸥
	//第六只海鸥动作
	var haiou06_fly			 = false;
	var haiou06_action		 = 0;
	var haiou06_action_array = sysarray(6);
	haiou06_action_array[0]	 = 3;
	haiou06_action_array[1]	 = 1;
	haiou06_action_array[2]	 = 3;
	haiou06_action_array[3]	 = 2;
	haiou06_action_array[4]	 = 1;
	haiou06_action_array[5]	 = 2;

	//第六只海鸥动作时间
	var haiou06_time_array	= sysarray(6);
	haiou06_time_array[0]	= 3000;
	haiou06_time_array[1]	= 4000;
	haiou06_time_array[2]	= 3000;
	haiou06_time_array[3]	= 2000;
	haiou06_time_array[4]	= 3000;
	haiou06_time_array[5]	= 2000;

	//第七只海鸥
	//第七只海鸥动作
	var haiou07_fly			 = false;
	var haiou07_action		 = 0;
	var haiou07_action_array = sysarray(6);
	haiou07_action_array[0]	 = 3;
	haiou07_action_array[1]	 = 1;
	haiou07_action_array[2]	 = 2;
	haiou07_action_array[3]	 = 3;
	haiou07_action_array[4]	 = 2;
	haiou07_action_array[5]	 = 1;

	//第七只海鸥动作时间
	var haiou07_time_array	= sysarray(6);
	haiou07_time_array[0]	= 3000;
	haiou07_time_array[1]	= 2000;
	haiou07_time_array[2]	= 3000;
	haiou07_time_array[3]	= 4000;
	haiou07_time_array[4]	= 2000;
	haiou07_time_array[5]	= 4000;

	//第八只海鸥
	//第八只海鸥动作
	var haiou08_fly			 = false;
	var haiou08_action		 = 0;
	var haiou08_action_array = sysarray(6);
	haiou08_action_array[0]	 = 1;
	haiou08_action_array[1]	 = 2;
	haiou08_action_array[2]	 = 3;
	haiou08_action_array[3]	 = 2;
	haiou08_action_array[4]	 = 1;
	haiou08_action_array[5]	 = 3;

	//第八只海鸥动作时间
	var haiou08_time_array	= sysarray(6);
	haiou08_time_array[0]	= 4000;
	haiou08_time_array[1]	= 2000;
	haiou08_time_array[2]	= 2000;
	haiou08_time_array[3]	= 3000;
	haiou08_time_array[4]	= 3000;
	haiou08_time_array[5]	= 4000;

	//第九只海鸥
	//第九只海鸥动作
	var haiou09_fly			 = false;
	var haiou09_action		 = 0;
	var haiou09_action_array = sysarray(6);
	haiou09_action_array[0]	 = 1;
	haiou09_action_array[1]	 = 3;
	haiou09_action_array[2]	 = 1;
	haiou09_action_array[3]	 = 3;
	haiou09_action_array[4]	 = 2;
	haiou09_action_array[5]	 = 3;

	//第九只海鸥动作时间
	var haiou09_time_array	= sysarray(6);
	haiou09_time_array[0]	= 4000;
	haiou09_time_array[1]	= 2000;
	haiou09_time_array[2]	= 3000;
	haiou09_time_array[3]	= 2000;
	haiou09_time_array[4]	= 3000;
	haiou09_time_array[5]	= 1000;

	//第十只海鸥
	//第十只海鸥动作
	var haiou10_fly			 = false;
	var haiou10_action		 = 0;
	var haiou10_action_array = sysarray(6);
	haiou10_action_array[0]	 = 1;
	haiou10_action_array[1]	 = 3;
	haiou10_action_array[2]	 = 1;
	haiou10_action_array[3]	 = 3;
	haiou10_action_array[4]	 = 1;
	haiou10_action_array[5]	 = 3;

	//第十只海鸥动作时间
	var haiou10_time_array	= sysarray(6);
	haiou10_time_array[0]	= 4000;
	haiou10_time_array[1]	= 2000;
	haiou10_time_array[2]	= 3000;
	haiou10_time_array[3]	= 2000;
	haiou10_time_array[4]	= 3000;
	haiou10_time_array[5]	= 1000;

	//第十一只海鸥
	//第十一只海鸥动作
	var haiou11_fly				= false;
	var haiou11_action			= 0;
	var haiou11_action_array	= sysarray(8);
	haiou11_action_array[0]		= 3;
	haiou11_action_array[1]		= 2;
	haiou11_action_array[2]		= 1;
	haiou11_action_array[3]		= 4;
	haiou11_action_array[4]		= 2;
	haiou11_action_array[5]		= 1;
	haiou11_action_array[6]		= 3;
	haiou11_action_array[7]		= 4;

	//第十一只海鸥时间
	var haiou11_time_array		= sysarray(8);
	haiou11_time_array[0]		= 1000;
	haiou11_time_array[1]		= 3000;
	haiou11_time_array[2]		= 3000;
	haiou11_time_array[3]		= 3000;
	haiou11_time_array[4]		= 1000;
	haiou11_time_array[5]		= 4000;
	haiou11_time_array[6]		= 2000;
	haiou11_time_array[7]		= 3000;

	//第十一只海鸥速度
	var haiou11_speed			= 0;
	var haiou11_speed_array		= sysarray(2);
	haiou11_speed_array[0]		= 0;
	haiou11_speed_array[1]		= 1;

	//第十一只海鸥角度
	var haiou11_pos				= 0;
	var haiou11_pos_array		= sysarray(2);
	haiou11_pos_array[0]		= "180,0,0";
	haiou11_pos_array[1]		= "0,0,0";

	//第十二只海鸥
	//第十二只海鸥动作
	var haiou12_fly				= false;
	var haiou12_action			= 0;
	var haiou12_action_array	= sysarray(8);
	haiou12_action_array[0]		= 2;
	haiou12_action_array[1]		= 3;
	haiou12_action_array[2]		= 2;
	haiou12_action_array[3]		= 4;
	haiou12_action_array[4]		= 1;
	haiou12_action_array[5]		= 2;
	haiou12_action_array[6]		= 1;
	haiou12_action_array[7]		= 4;

	//第十二只海鸥时间
	var haiou12_time_array		= sysarray(8);
	haiou12_time_array[0]		= 1000;
	haiou12_time_array[1]		= 4000;
	haiou12_time_array[2]		= 3000;
	haiou12_time_array[3]		= 2000;
	haiou12_time_array[4]		= 2000;
	haiou12_time_array[5]		= 2000;
	haiou12_time_array[6]		= 3000;
	haiou12_time_array[7]		= 2000;

	//第十二只海鸥速度
	var haiou12_speed			= 0;
	var haiou12_speed_array		= sysarray(2);
	haiou12_speed_array[0]		= 0;
	haiou12_speed_array[1]		= 1;

	//第十二只海鸥角度
	var haiou12_pos				= 0;
	var haiou12_pos_array		= sysarray(2);
	haiou12_pos_array[0]		= "180,0,0";
	haiou12_pos_array[1]		= "0,0,0";

	//第十三只海鸥
	//第十三只海鸥动作
	var haiou13_fly				= false;
	var haiou13_action			= 0;
	var haiou13_action_array	= sysarray(8);
	haiou13_action_array[0]		= 2;
	haiou13_action_array[1]		= 3;
	haiou13_action_array[2]		= 2;
	haiou13_action_array[3]		= 4;
	haiou13_action_array[4]		= 1;
	haiou13_action_array[5]		= 2;
	haiou13_action_array[6]		= 1;
	haiou13_action_array[7]		= 4;

	//第十三只海鸥时间
	var haiou13_time_array		= sysarray(8);
	haiou13_time_array[0]		= 2000;
	haiou13_time_array[1]		= 1000;
	haiou13_time_array[2]		= 3000;
	haiou13_time_array[3]		= 2000;
	haiou13_time_array[4]		= 4000;
	haiou13_time_array[5]		= 3000;
	haiou13_time_array[6]		= 4000;
	haiou13_time_array[7]		= 2000;

	//第十三只海鸥速度
	var haiou13_speed			= 0;
	var haiou13_speed_array		= sysarray(2);
	haiou13_speed_array[0]		= 0;
	haiou13_speed_array[1]		= 1;

	//第十三只海鸥角度
	var haiou13_angle			= 0;
	var haiou13_angle_array		= sysarray(2);
	haiou13_angle_array[0]		= "-90,0,0";
	haiou13_angle_array[1]		= "90,0,0";

	//第十四只海鸥
	//第十四只海鸥动作
	var haiou14_fly				= false;
	var haiou14_action			= 0;
	var haiou14_action_array	= sysarray(8);
	haiou14_action_array[0]		= 4;
	haiou14_action_array[1]		= 3;
	haiou14_action_array[2]		= 1;
	haiou14_action_array[3]		= 4;
	haiou14_action_array[4]		= 2;
	haiou14_action_array[5]		= 1;
	haiou14_action_array[6]		= 4;
	haiou14_action_array[7]		= 1;

	//第十四只海鸥时间
	var haiou14_time_array		= sysarray(8);
	haiou14_time_array[0]		= 1000;
	haiou14_time_array[1]		= 1000;
	haiou14_time_array[2]		= 3000;
	haiou14_time_array[3]		= 3000;
	haiou14_time_array[4]		= 4000;
	haiou14_time_array[5]		= 3000;
	haiou14_time_array[6]		= 2000;
	haiou14_time_array[7]		= 2000;

	//第十四只海鸥速度
	var haiou14_speed			= 0;
	var haiou14_speed_array		= sysarray(2);
	haiou14_speed_array[0]		= 0;
	haiou14_speed_array[1]		= 1;

	//第十四只海鸥角度
	var haiou14_angle			= 0;
	var haiou14_angle_array		= sysarray(2);
	haiou14_angle_array[0]		= "-90,0,0";
	haiou14_angle_array[1]		= "90,0,0";

	//第十五只海鸥
	//第十五只海鸥动作
	var haiou15_fly				= false;
	var haiou15_action			= 0;
	var haiou15_action_array	= sysarray(8);
	haiou15_action_array[0]		= 4;
	haiou15_action_array[1]		= 1;
	haiou15_action_array[2]		= 4;
	haiou15_action_array[3]		= 3;
	haiou15_action_array[4]		= 4;
	haiou15_action_array[5]		= 1;
	haiou15_action_array[6]		= 4;
	haiou15_action_array[7]		= 2;

	//第十五只海鸥时间
	var haiou15_time_array		= sysarray(8);
	haiou15_time_array[0]		= 1000;
	haiou15_time_array[1]		= 3000;
	haiou15_time_array[2]		= 1000;
	haiou15_time_array[3]		= 2000;
	haiou15_time_array[4]		= 1000;
	haiou15_time_array[5]		= 3000;
	haiou15_time_array[6]		= 1000;
	haiou15_time_array[7]		= 4000;

	//第十五只海鸥速度
	var haiou15_speed			= 0;
	var haiou15_speed_array		= sysarray(2);
	haiou15_speed_array[0]		= 0;
	haiou15_speed_array[1]		= 1;

	//第十五只海鸥角度
	var haiou15_angle			= 0;
	var haiou15_angle_array		= sysarray(2);
	haiou15_angle_array[0]		= "-90,0,0";
	haiou15_angle_array[1]		= "90,0,0";

	//第十六只海鸥
	//第十六只海鸥动作
	var haiou16_fly			 = false;
	var haiou16_action		 = 0;
	var haiou16_action_array = sysarray(6);
	haiou16_action_array[0]	 = 1;
	haiou16_action_array[1]	 = 3;
	haiou16_action_array[2]	 = 1;
	haiou16_action_array[3]	 = 2;
	haiou16_action_array[4]	 = 3;
	haiou16_action_array[5]	 = 2;

	//第十六只海鸥动作时间
	var haiou16_time_array	= sysarray(6);
	haiou16_time_array[0]	= 4000;
	haiou16_time_array[1]	= 1000;
	haiou16_time_array[2]	= 3500;
	haiou16_time_array[3]	= 2000;
	haiou16_time_array[4]	= 3500;
	haiou16_time_array[5]	= 2000;

	//第十七只海鸥
	//第十七只海鸥动作
	var haiou17_fly			 = false;
	var haiou17_action		 = 0;
	var haiou17_action_array = sysarray(6);
	haiou17_action_array[0]	 = 2;
	haiou17_action_array[1]	 = 3;
	haiou17_action_array[2]	 = 1;
	haiou17_action_array[3]	 = 3;
	haiou17_action_array[4]	 = 2;
	haiou17_action_array[5]	 = 1;

	//第十七只海鸥动作时间
	var haiou17_time_array	= sysarray(6);
	haiou17_time_array[0]	= 3000;
	haiou17_time_array[1]	= 2000;
	haiou17_time_array[2]	= 5500;
	haiou17_time_array[3]	= 2000;
	haiou17_time_array[4]	= 3500;
	haiou17_time_array[5]	= 2500;

	//第十八只海鸥
	//第十八只海鸥动作
	var haiou18_fly			 = false;
	var haiou18_action		 = 0;
	var haiou18_action_array = sysarray(6);
	haiou18_action_array[0]	 = 2;
	haiou18_action_array[1]	 = 1;
	haiou18_action_array[2]	 = 2;
	haiou18_action_array[3]	 = 3;
	haiou18_action_array[4]	 = 2;
	haiou18_action_array[5]	 = 1;

	//第十八只海鸥动作时间
	var haiou18_time_array	= sysarray(6);
	haiou18_time_array[0]	= 5000;
	haiou18_time_array[1]	= 3000;
	haiou18_time_array[2]	= 5500;
	haiou18_time_array[3]	= 2000;
	haiou18_time_array[4]	= 3500;
	haiou18_time_array[5]	= 4500;

	//第十九只海鸥
	//第十九只海鸥动作
	var haiou19_fly				= false;
	var haiou19_action			= 0;
	var haiou19_action_array	= sysarray(8);
	haiou19_action_array[0]		= 2;
	haiou19_action_array[1]		= 3;
	haiou19_action_array[2]		= 1;
	haiou19_action_array[3]		= 4;
	haiou19_action_array[4]		= 1;
	haiou19_action_array[5]		= 2;
	haiou19_action_array[6]		= 1;
	haiou19_action_array[7]		= 4;

	//第十九只海鸥时间
	var haiou19_time_array		= sysarray(8);
	haiou19_time_array[0]		= 5000;
	haiou19_time_array[1]		= 2000;
	haiou19_time_array[2]		= 4000;
	haiou19_time_array[3]		= 1000;
	haiou19_time_array[4]		= 4000;
	haiou19_time_array[5]		= 4000;
	haiou19_time_array[6]		= 4000;
	haiou19_time_array[7]		= 1000;

	//第十九只海鸥速度
	var haiou19_speed			= 0;
	var haiou19_speed_array		= sysarray(2);
	haiou19_speed_array[0]		= 0;
	haiou19_speed_array[1]		= 1;

	//第十九只海鸥角度
	var haiou19_angle			= 0;
	var haiou19_angle_array		= sysarray(2);
	haiou19_angle_array[0]		= "-120,0,0";
	haiou19_angle_array[1]		= "60,0,0";

	//第二十只海鸥
	//第二十只海鸥动作
	var haiou20_fly				= false;
	var haiou20_action			= 0;
	var haiou20_action_array	= sysarray(8);
	haiou20_action_array[0]		= 2;
	haiou20_action_array[1]		= 3;
	haiou20_action_array[2]		= 1;
	haiou20_action_array[3]		= 4;
	haiou20_action_array[4]		= 1;
	haiou20_action_array[5]		= 2;
	haiou20_action_array[6]		= 1;
	haiou20_action_array[7]		= 4;

	//第二十只海鸥时间
	var haiou20_time_array		= sysarray(8);
	haiou20_time_array[0]		= 8000;
	haiou20_time_array[1]		= 4000;
	haiou20_time_array[2]		= 9000;
	haiou20_time_array[3]		= 1000;
	haiou20_time_array[4]		= 9000;
	haiou20_time_array[5]		= 8000;
	haiou20_time_array[6]		= 4000;
	haiou20_time_array[7]		= 1000;

	//第二十只海鸥速度
	var haiou20_speed			= 0;
	var haiou20_speed_array		= sysarray(2);
	haiou20_speed_array[0]		= 0;
	haiou20_speed_array[1]		= 1;

	//第二十只海鸥角度
	var haiou20_angle			= 0;
	var haiou20_angle_array		= sysarray(2);
	haiou20_angle_array[0]		= "-160,0,0";
	haiou20_angle_array[1]		= "20,0,0";

	//第二十一只海鸥
	//第二十一只海鸥动作
	var haiou21_fly			 = false;
	var haiou21_action		 = 0;
	var haiou21_action_array = sysarray(6);
	haiou21_action_array[0]	 = 1;
	haiou21_action_array[1]	 = 3;
	haiou21_action_array[2]	 = 2;
	haiou21_action_array[3]	 = 3;
	haiou21_action_array[4]	 = 1;
	haiou21_action_array[5]	 = 3;

	//第二十一只海鸥动作时间
	var haiou21_time_array	= sysarray(6);
	haiou21_time_array[0]	= 1000;
	haiou21_time_array[1]	= 3000;
	haiou21_time_array[2]	= 5500;
	haiou21_time_array[3]	= 6000;
	haiou21_time_array[4]	= 3500;
	haiou21_time_array[5]	= 4500;

	//第二十二只海鸥
	//第二十二只海鸥动作
	var haiou22_fly			 = false;
	var haiou22_action		 = 0;
	var haiou22_action_array = sysarray(6);
	haiou22_action_array[0]	 = 2;
	haiou22_action_array[1]	 = 1;
	haiou22_action_array[2]	 = 2;
	haiou22_action_array[3]	 = 3;
	haiou22_action_array[4]	 = 2;
	haiou22_action_array[5]	 = 1;

	//第二十二只海鸥动作时间
	var haiou22_time_array	= sysarray(6);
	haiou22_time_array[0]	= 5000;
	haiou22_time_array[1]	= 7000;
	haiou22_time_array[2]	= 5500;
	haiou22_time_array[3]	= 3000;
	haiou22_time_array[4]	= 6500;
	haiou22_time_array[5]	= 3500;

	//第23只海鸥
	//第23只海鸥动作
	var haiou23_fly			 = false;
	var haiou23_action		 = 0;
	var haiou23_action_array = sysarray(6);
	haiou23_action_array[0]	 = 3;
	haiou23_action_array[1]	 = 2;
	haiou23_action_array[2]	 = 1;
	haiou23_action_array[3]	 = 3;
	haiou23_action_array[4]	 = 2;
	haiou23_action_array[5]	 = 1;

	//第23只海鸥动作时间
	var haiou23_time_array	= sysarray(6);
	haiou23_time_array[0]	= 5000;
	haiou23_time_array[1]	= 3000;
	haiou23_time_array[2]	= 8500;
	haiou23_time_array[3]	= 4000;
	haiou23_time_array[4]	= 2500;
	haiou23_time_array[5]	= 3500;

	//第24只海鸥
	//第24只海鸥动作
	var haiou24_fly			 = false;
	var haiou24_action		 = 0;
	var haiou24_action_array = sysarray(6);
	haiou24_action_array[0]	 = 2;
	haiou24_action_array[1]	 = 1;
	haiou24_action_array[2]	 = 2;
	haiou24_action_array[3]	 = 1;
	haiou24_action_array[4]	 = 2;
	haiou24_action_array[5]	 = 3;

	//第24只海鸥动作时间
	var haiou24_time_array	= sysarray(6);
	haiou24_time_array[0]	= 3000;
	haiou24_time_array[1]	= 7000;
	haiou24_time_array[2]	= 2500;
	haiou24_time_array[3]	= 3500;
	haiou24_time_array[4]	= 6500;
	haiou24_time_array[5]	= 6500;

	//第25只海鸥
	//第25只海鸥动作
	var haiou25_fly			 = false;
	var haiou25_action		 = 0;
	var haiou25_action_array = sysarray(6);
	haiou25_action_array[0]	 = 2;
	haiou25_action_array[1]	 = 3;
	haiou25_action_array[2]	 = 2;
	haiou25_action_array[3]	 = 1;
	haiou25_action_array[4]	 = 2;
	haiou25_action_array[5]	 = 1;

	//第25只海鸥动作时间
	var haiou25_time_array	= sysarray(6);
	haiou25_time_array[0]	= 1500;
	haiou25_time_array[1]	= 3000;
	haiou25_time_array[2]	= 3500;
	haiou25_time_array[3]	= 3000;
	haiou25_time_array[4]	= 2500;
	haiou25_time_array[5]	= 3500;

	//第26只海鸥
	//第26只海鸥动作
	var haiou26_fly				= false;
	var haiou26_action			= 0;
	var haiou26_action_array	= sysarray(8);
	haiou26_action_array[0]		= 2;
	haiou26_action_array[1]		= 3;
	haiou26_action_array[2]		= 2;
	haiou26_action_array[3]		= 4;
	haiou26_action_array[4]		= 1;
	haiou26_action_array[5]		= 2;
	haiou26_action_array[6]		= 3;
	haiou26_action_array[7]		= 4;

	//第26只海鸥时间
	var haiou26_time_array		= sysarray(8);
	haiou26_time_array[0]		= 5000;
	haiou26_time_array[1]		= 2000;
	haiou26_time_array[2]		= 6000;
	haiou26_time_array[3]		= 1500;
	haiou26_time_array[4]		= 9000;
	haiou26_time_array[5]		= 8000;
	haiou26_time_array[6]		= 4500;
	haiou26_time_array[7]		= 1500;

	//第26只海鸥速度
	var haiou26_speed			= 0;
	var haiou26_speed_array		= sysarray(2);
	haiou26_speed_array[0]		= 0;
	haiou26_speed_array[1]		= 1;

	//第26只海鸥角度
	var haiou26_angle			= 0;
	var haiou26_angle_array		= sysarray(2);
	haiou26_angle_array[0]		= "180,0,0";
	haiou26_angle_array[1]		= "0,0,0";

	//第27只海鸥
	//第27只海鸥动作
	var haiou27_fly				= false;
	var haiou27_action			= 0;
	var haiou27_action_array	= sysarray(8);
	haiou27_action_array[0]		= 1;
	haiou27_action_array[1]		= 3;
	haiou27_action_array[2]		= 1;
	haiou27_action_array[3]		= 4;
	haiou27_action_array[4]		= 1;
	haiou27_action_array[5]		= 2;
	haiou27_action_array[6]		= 1;
	haiou27_action_array[7]		= 4;

	//第27只海鸥时间
	var haiou27_time_array		= sysarray(8);
	haiou27_time_array[0]		= 3000;
	haiou27_time_array[1]		= 1500;
	haiou27_time_array[2]		= 9000;
	haiou27_time_array[3]		= 2000;
	haiou27_time_array[4]		= 3500;
	haiou27_time_array[5]		= 2000;
	haiou27_time_array[6]		= 4000;
	haiou27_time_array[7]		= 2000;

	//第27只海鸥速度
	var haiou27_speed			= 0;
	var haiou27_speed_array		= sysarray(2);
	haiou27_speed_array[0]		= 0;
	haiou27_speed_array[1]		= 1;

	//第27只海鸥角度
	var haiou27_angle			= 0;
	var haiou27_angle_array		= sysarray(2);
	haiou27_angle_array[0]		= "-135,0,0";
	haiou27_angle_array[1]		= "45,0,0";

	//第28只海鸥
	//第28只海鸥动作
	var haiou28_fly				= false;
	var haiou28_action			= 0;
	var haiou28_action_array	= sysarray(8);
	haiou28_action_array[0]		= 1;
	haiou28_action_array[1]		= 3;
	haiou28_action_array[2]		= 2;
	haiou28_action_array[3]		= 4;
	haiou28_action_array[4]		= 2;
	haiou28_action_array[5]		= 3;
	haiou28_action_array[6]		= 1;
	haiou28_action_array[7]		= 4;

	//第28只海鸥时间
	var haiou28_time_array		= sysarray(8);
	haiou28_time_array[0]		= 2000;
	haiou28_time_array[1]		= 1500;
	haiou28_time_array[2]		= 2000;
	haiou28_time_array[3]		= 3000;
	haiou28_time_array[4]		= 9000;
	haiou28_time_array[5]		= 8000;
	haiou28_time_array[6]		= 4000;
	haiou28_time_array[7]		= 3000;

	//第28只海鸥速度
	var haiou28_speed			= 0;
	var haiou28_speed_array		= sysarray(2);
	haiou28_speed_array[0]		= 0;
	haiou28_speed_array[1]		= 1;

	//第28只海鸥角度
	var haiou28_angle			= 0;
	var haiou28_angle_array		= sysarray(2);
	haiou28_angle_array[0]		= "-90,0,0";
	haiou28_angle_array[1]		= "90,0,0";

	//第29只海鸥
	//第29只海鸥动作
	var haiou29_fly				= false;
	var haiou29_action			= 0;
	var haiou29_action_array	= sysarray(8);
	haiou29_action_array[0]		= 1;
	haiou29_action_array[1]		= 3;
	haiou29_action_array[2]		= 1;
	haiou29_action_array[3]		= 4;
	haiou29_action_array[4]		= 1;
	haiou29_action_array[5]		= 3;
	haiou29_action_array[6]		= 1;
	haiou29_action_array[7]		= 4;

	//第29只海鸥时间
	var haiou29_time_array		= sysarray(8);
	haiou29_time_array[0]		= 2000;
	haiou29_time_array[1]		= 1500;
	haiou29_time_array[2]		= 2000;
	haiou29_time_array[3]		= 1000;
	haiou29_time_array[4]		= 9000;
	haiou29_time_array[5]		= 8000;
	haiou29_time_array[6]		= 4000;
	haiou29_time_array[7]		= 1000;

	//第29只海鸥速度
	var haiou29_speed			= 0;
	var haiou29_speed_array		= sysarray(2);
	haiou29_speed_array[0]		= 0;
	haiou29_speed_array[1]		= 1;

	//第29只海鸥角度
	var haiou29_angle			= 0;
	var haiou29_angle_array		= sysarray(3);
	haiou29_angle_array[0]		= "-90,0,0";
	haiou29_angle_array[1]		= "90,0,0";
	haiou29_angle_array[2]		= "180,0,0";

	//第30只海鸥
	//第30只海鸥动作
	var haiou30_fly			 = false;
	var haiou30_action		 = 0;
	var haiou30_action_array = sysarray(6);
	haiou30_action_array[0]	 = 1;
	haiou30_action_array[1]	 = 3;
	haiou30_action_array[2]	 = 1;
	haiou30_action_array[3]	 = 3;
	haiou30_action_array[4]	 = 1;
	haiou30_action_array[5]	 = 3;

	//第30只海鸥动作时间
	var haiou30_time_array	= sysarray(6);
	haiou30_time_array[0]	= 5500;
	haiou30_time_array[1]	= 1000;
	haiou30_time_array[2]	= 3500;
	haiou30_time_array[3]	= 2000;
	haiou30_time_array[4]	= 6500;
	haiou30_time_array[5]	= 2500;

	//第31只海鸥
	//第31只海鸥动作
	var haiou31_fly			 = false;
	var haiou31_action		 = 0;
	var haiou31_action_array = sysarray(6);
	haiou31_action_array[0]	 = 1;
	haiou31_action_array[1]	 = 3;
	haiou31_action_array[2]	 = 1;
	haiou31_action_array[3]	 = 3;
	haiou31_action_array[4]	 = 1;
	haiou31_action_array[5]	 = 3;

	//第31只海鸥动作时间
	var haiou31_time_array	= sysarray(6);
	haiou31_time_array[0]	= 2500;
	haiou31_time_array[1]	= 1000;
	haiou31_time_array[2]	= 3500;
	haiou31_time_array[3]	= 2000;
	haiou31_time_array[4]	= 5500;
	haiou31_time_array[5]	= 1500;

	//第32只海鸥
	//第32只海鸥动作
	var haiou32_fly				= false;
	var haiou32_action			= 0;
	var haiou32_action_array	= sysarray(8);
	haiou32_action_array[0]		= 1;
	haiou32_action_array[1]		= 3;
	haiou32_action_array[2]		= 2;
	haiou32_action_array[3]		= 4;
	haiou32_action_array[4]		= 2;
	haiou32_action_array[5]		= 3;
	haiou32_action_array[6]		= 1;
	haiou32_action_array[7]		= 4;

	//第32只海鸥时间
	var haiou32_time_array		= sysarray(8);
	haiou32_time_array[0]		= 4000;
	haiou32_time_array[1]		= 1600;
	haiou32_time_array[2]		= 2300;
	haiou32_time_array[3]		= 3000;
	haiou32_time_array[4]		= 6200;
	haiou32_time_array[5]		= 5200;
	haiou32_time_array[6]		= 5800;
	haiou32_time_array[7]		= 3000;

	//第32只海鸥速度
	var haiou32_speed			= 0;
	var haiou32_speed_array		= sysarray(2);
	haiou32_speed_array[0]		= 0;
	haiou32_speed_array[1]		= 1;

	//第32只海鸥角度
	var haiou32_angle			= 0;
	var haiou32_angle_array		= sysarray(2);
	haiou32_angle_array[0]		= "0,0,0";
	haiou32_angle_array[1]		= "180,0,0";

	//第33只海鸥
	//第33只海鸥动作
	var haiou33_fly				= false;
	var haiou33_action			= 0;
	var haiou33_action_array	= sysarray(8);
	haiou33_action_array[0]		= 2;
	haiou33_action_array[1]		= 3;
	haiou33_action_array[2]		= 2;
	haiou33_action_array[3]		= 4;
	haiou33_action_array[4]		= 1;
	haiou33_action_array[5]		= 3;
	haiou33_action_array[6]		= 2;
	haiou33_action_array[7]		= 4;

	//第33只海鸥时间
	var haiou33_time_array		= sysarray(8);
	haiou33_time_array[0]		= 2400;
	haiou33_time_array[1]		= 1500;
	haiou33_time_array[2]		= 2800;
	haiou33_time_array[3]		= 2400;
	haiou33_time_array[4]		= 2500;
	haiou33_time_array[5]		= 4900;
	haiou33_time_array[6]		= 3700;
	haiou33_time_array[7]		= 2400;

	//第33只海鸥速度
	var haiou33_speed			= 0;
	var haiou33_speed_array		= sysarray(2);
	haiou33_speed_array[0]		= 0;
	haiou33_speed_array[1]		= 1;

	//第33只海鸥角度
	var haiou33_angle			= 0;
	var haiou33_angle_array		= sysarray(2);
	haiou33_angle_array[0]		= "0,0,0";
	haiou33_angle_array[1]		= "180,0,0";

	//第34只海鸥
	//第34只海鸥动作
	var haiou34_fly			 = false;
	var haiou34_action		 = 0;
	var haiou34_action_array = sysarray(6);
	haiou34_action_array[0]	 = 2;
	haiou34_action_array[1]	 = 1;
	haiou34_action_array[2]	 = 2;
	haiou34_action_array[3]	 = 3;
	haiou34_action_array[4]	 = 2;
	haiou34_action_array[5]	 = 1;

	//第34只海鸥动作时间
	var haiou34_time_array	= sysarray(6);
	haiou34_time_array[0]	= 3700;
	haiou34_time_array[1]	= 2600;
	haiou34_time_array[2]	= 4900;
	haiou34_time_array[3]	= 3600;
	haiou34_time_array[4]	= 7200;
	haiou34_time_array[5]	= 5400;

	//第35只海鸥
	//第35只海鸥动作
	var haiou35_fly			 = false;
	var haiou35_action		 = 0;
	var haiou35_action_array = sysarray(6);
	haiou35_action_array[0]	 = 1;
	haiou35_action_array[1]	 = 3;
	haiou35_action_array[2]	 = 2;
	haiou35_action_array[3]	 = 3;
	haiou35_action_array[4]	 = 1;
	haiou35_action_array[5]	 = 3;

	//第35只海鸥动作时间
	var haiou35_time_array	= sysarray(6);
	haiou35_time_array[0]	= 3500;
	haiou35_time_array[1]	= 1000;
	haiou35_time_array[2]	= 2600;
	haiou35_time_array[3]	= 2100;
	haiou35_time_array[4]	= 7300;
	haiou35_time_array[5]	= 2600;

	//第36只海鸥
	//第36只海鸥动作
	var haiou36_fly			 = false;
	var haiou36_action		 = 0;
	var haiou36_action_array = sysarray(6);
	haiou36_action_array[0]	 = 1;
	haiou36_action_array[1]	 = 3;
	haiou36_action_array[2]	 = 2;
	haiou36_action_array[3]	 = 1;
	haiou36_action_array[4]	 = 3;
	haiou36_action_array[5]	 = 2;

	//第36只海鸥动作时间
	var haiou36_time_array	= sysarray(6);
	haiou36_time_array[0]	= 2600;
	haiou36_time_array[1]	= 2700;
	haiou36_time_array[2]	= 3600;
	haiou36_time_array[3]	= 2600;
	haiou36_time_array[4]	= 2500;
	haiou36_time_array[5]	= 3700;

	//第37只海鸥
	//第37只海鸥动作
	var haiou37_fly			 = false;
	var haiou37_action		 = 0;
	var haiou37_action_array = sysarray(6);
	haiou37_action_array[0]	 = 1;
	haiou37_action_array[1]	 = 2;
	haiou37_action_array[2]	 = 1;
	haiou37_action_array[3]	 = 3;
	haiou37_action_array[4]	 = 1;
	haiou37_action_array[5]	 = 2;

	//第37只海鸥动作时间
	var haiou37_time_array	= sysarray(6);
	haiou37_time_array[0]	= 2500;
	haiou37_time_array[1]	= 5200;
	haiou37_time_array[2]	= 3700;
	haiou37_time_array[3]	= 2600;
	haiou37_time_array[4]	= 6200;
	haiou37_time_array[5]	= 7300;

	//第38只海鸥
	//第38只海鸥动作
	var haiou38_fly			 = false;
	var haiou38_action		 = 0;
	var haiou38_action_array = sysarray(6);
	haiou38_action_array[0]	 = 2;
	haiou38_action_array[1]	 = 3;
	haiou38_action_array[2]	 = 2;
	haiou38_action_array[3]	 = 3;
	haiou38_action_array[4]	 = 2;
	haiou38_action_array[5]	 = 1;

	//第38只海鸥动作时间
	var haiou38_time_array	= sysarray(6);
	haiou38_time_array[0]	= 5200;
	haiou38_time_array[1]	= 7300;
	haiou38_time_array[2]	= 2500;
	haiou38_time_array[3]	= 3600;
	haiou38_time_array[4]	= 6200;
	haiou38_time_array[5]	= 3600;

	//第39只海鸥
	//第39只海鸥动作
	var haiou39_fly			 = false;
	var haiou39_action		 = 0;
	var haiou39_action_array = sysarray(6);
	haiou39_action_array[0]	 = 1;
	haiou39_action_array[1]	 = 2;
	haiou39_action_array[2]	 = 3;
	haiou39_action_array[3]	 = 1;
	haiou39_action_array[4]	 = 2;
	haiou39_action_array[5]	 = 3;

	//第39只海鸥动作时间
	var haiou39_time_array	= sysarray(6);
	haiou39_time_array[0]	= 7200;
	haiou39_time_array[1]	= 2700;
	haiou39_time_array[2]	= 1500;
	haiou39_time_array[3]	= 6200;
	haiou39_time_array[4]	= 1600;
	haiou39_time_array[5]	= 6600;

	//第40只海鸥
	//第40只海鸥动作
	var haiou40_fly			 = false;
	var haiou40_action		 = 0;
	var haiou40_action_array = sysarray(6);
	haiou40_action_array[0]	 = 3;
	haiou40_action_array[1]	 = 1;
	haiou40_action_array[2]	 = 2;
	haiou40_action_array[3]	 = 1;
	haiou40_action_array[4]	 = 3;
	haiou40_action_array[5]	 = 2;

	//第40只海鸥动作时间
	var haiou40_time_array	= sysarray(6);
	haiou40_time_array[0]	= 3700;
	haiou40_time_array[1]	= 2500;
	haiou40_time_array[2]	= 3300;
	haiou40_time_array[3]	= 2500;
	haiou40_time_array[4]	= 5100;
	haiou40_time_array[5]	= 2600;

	//第41只海鸥
	//第41只海鸥动作
	var haiou41_fly			 = false;
	var haiou41_action		 = 0;
	var haiou41_action_array = sysarray(6);
	haiou41_action_array[0]	 = 2;
	haiou41_action_array[1]	 = 3;
	haiou41_action_array[2]	 = 2;
	haiou41_action_array[3]	 = 1;
	haiou41_action_array[4]	 = 2;
	haiou41_action_array[5]	 = 1;

	//第41只海鸥动作时间
	var haiou41_time_array	= sysarray(6);
	haiou41_time_array[0]	= 8200;
	haiou41_time_array[1]	= 3600;
	haiou41_time_array[2]	= 3600;
	haiou41_time_array[3]	= 6100;
	haiou41_time_array[4]	= 2600;
	haiou41_time_array[5]	= 3700;

	//第42只海鸥
	//第42只海鸥动作
	var haiou42_fly			 = false;
	var haiou42_action		 = 0;
	var haiou42_action_array = sysarray(6);
	haiou42_action_array[0]	 = 1;
	haiou42_action_array[1]	 = 2;
	haiou42_action_array[2]	 = 3;
	haiou42_action_array[3]	 = 1;
	haiou42_action_array[4]	 = 3;
	haiou42_action_array[5]	 = 2;

	//第42只海鸥动作时间
	var haiou42_time_array	= sysarray(6);
	haiou42_time_array[0]	= 3800;
	haiou42_time_array[1]	= 2700;
	haiou42_time_array[2]	= 2500;
	haiou42_time_array[3]	= 5200;
	haiou42_time_array[4]	= 1600;
	haiou42_time_array[5]	= 2700;

	//第43只海鸥
	//第43只海鸥动作
	var haiou43_fly			 = false;
	var haiou43_action		 = 0;
	var haiou43_action_array = sysarray(6);
	haiou43_action_array[0]	 = 2;
	haiou43_action_array[1]	 = 1;
	haiou43_action_array[2]	 = 3;
	haiou43_action_array[3]	 = 1;
	haiou43_action_array[4]	 = 3;
	haiou43_action_array[5]	 = 2;

	//第43只海鸥动作时间
	var haiou43_time_array	= sysarray(6);
	haiou43_time_array[0]	= 6200;
	haiou43_time_array[1]	= 2700;
	haiou43_time_array[2]	= 6200;
	haiou43_time_array[3]	= 3700;
	haiou43_time_array[4]	= 2800;
	haiou43_time_array[5]	= 1600;

	//第44只海鸥
	//第44只海鸥动作
	var haiou44_fly				= false;
	var haiou44_action			= 0;
	var haiou44_action_array	= sysarray(8);
	haiou44_action_array[0]		= 1;
	haiou44_action_array[1]		= 3;
	haiou44_action_array[2]		= 1;
	haiou44_action_array[3]		= 4;
	haiou44_action_array[4]		= 1;
	haiou44_action_array[5]		= 3;
	haiou44_action_array[6]		= 2;
	haiou44_action_array[7]		= 4;

	//第44只海鸥时间
	var haiou44_time_array		= sysarray(8);
	haiou44_time_array[0]		= 7200;
	haiou44_time_array[1]		= 6200;
	haiou44_time_array[2]		= 1500;
	haiou44_time_array[3]		= 3000;
	haiou44_time_array[4]		= 2500;
	haiou44_time_array[5]		= 4900;
	haiou44_time_array[6]		= 3700;
	haiou44_time_array[7]		= 3000;

	//第44只海鸥速度
	var haiou44_speed			= 0;
	var haiou44_speed_array		= sysarray(2);
	haiou44_speed_array[0]		= 0;
	haiou44_speed_array[1]		= 1;

	//第44只海鸥角度
	var haiou44_angle			= 0;
	var haiou44_angle_array		= sysarray(2);
	haiou44_angle_array[0]		= "0,0,0";
	haiou44_angle_array[1]		= "180,0,0";

	//第45只海鸥
	//第45只海鸥动作
	var haiou45_fly				= false;
	var haiou45_action			= 0;
	var haiou45_action_array	= sysarray(8);
	haiou45_action_array[0]		= 2;
	haiou45_action_array[1]		= 3;
	haiou45_action_array[2]		= 1;
	haiou45_action_array[3]		= 4;
	haiou45_action_array[4]		= 2;
	haiou45_action_array[5]		= 3;
	haiou45_action_array[6]		= 1;
	haiou45_action_array[7]		= 4;

	//第45只海鸥时间
	var haiou45_time_array		= sysarray(8);
	haiou45_time_array[0]		= 3800;
	haiou45_time_array[1]		= 4800;
	haiou45_time_array[2]		= 6200;
	haiou45_time_array[3]		= 3000;
	haiou45_time_array[4]		= 4800;
	haiou45_time_array[5]		= 5100;
	haiou45_time_array[6]		= 3500;
	haiou45_time_array[7]		= 3000;

	//第45只海鸥速度
	var haiou45_speed			= 0;
	var haiou45_speed_array		= sysarray(2);
	haiou45_speed_array[0]		= 0;
	haiou45_speed_array[1]		= 1;

	//第45只海鸥角度
	var haiou45_angle			= 0;
	var haiou45_angle_array		= sysarray(2);
	haiou45_angle_array[0]		= "-35,0,0";
	haiou45_angle_array[1]		= "145,0,0";

	//第46只海鸥
	//第46只海鸥动作
	var haiou46_fly			 = false;
	var haiou46_action		 = 0;
	var haiou46_action_array = sysarray(6);
	haiou46_action_array[0]	 = 1;
	haiou46_action_array[1]	 = 3;
	haiou46_action_array[2]	 = 2;
	haiou46_action_array[3]	 = 3;
	haiou46_action_array[4]	 = 1;
	haiou46_action_array[5]	 = 2;

	//第46只海鸥动作时间
	var haiou46_time_array	= sysarray(6);
	haiou46_time_array[0]	= 3700;
	haiou46_time_array[1]	= 3800;
	haiou46_time_array[2]	= 6200;
	haiou46_time_array[3]	= 3700;
	haiou46_time_array[4]	= 3800;
	haiou46_time_array[5]	= 7200;

	//第47只海鸥
	//第47只海鸥动作
	var haiou47_fly				= false;
	var haiou47_action			= 0;
	var haiou47_action_array	= sysarray(8);
	haiou47_action_array[0]		= 2;
	haiou47_action_array[1]		= 1;
	haiou47_action_array[2]		= 3;
	haiou47_action_array[3]		= 4;
	haiou47_action_array[4]		= 1;
	haiou47_action_array[5]		= 3;
	haiou47_action_array[6]		= 1;
	haiou47_action_array[7]		= 4;

	//第47只海鸥时间
	var haiou47_time_array		= sysarray(8);
	haiou47_time_array[0]		= 2600;
	haiou47_time_array[1]		= 4900;
	haiou47_time_array[2]		= 3700;
	haiou47_time_array[3]		= 2600;
	haiou47_time_array[4]		= 3700;
	haiou47_time_array[5]		= 2100;
	haiou47_time_array[6]		= 3700;
	haiou47_time_array[7]		= 2600;

	//第47只海鸥速度
	var haiou47_speed			= 0;
	var haiou47_speed_array		= sysarray(2);
	haiou47_speed_array[0]		= 0;
	haiou47_speed_array[1]		= 1;

	//第47只海鸥角度
	var haiou47_angle			= 0;
	var haiou47_angle_array		= sysarray(2);
	haiou47_angle_array[0]		= "180,0,0";
	haiou47_angle_array[1]		= "0,0,0";

	//第48只海鸥
	//第48只海鸥动作
	var haiou48_fly			 = false;
	var haiou48_action		 = 0;
	var haiou48_action_array = sysarray(6);
	haiou48_action_array[0]	 = 2;
	haiou48_action_array[1]	 = 3;
	haiou48_action_array[2]	 = 1;
	haiou48_action_array[3]	 = 2;
	haiou48_action_array[4]	 = 3;
	haiou48_action_array[5]	 = 1;

	//第48只海鸥动作时间
	var haiou48_time_array	= sysarray(6);
	haiou48_time_array[0]	= 5100;
	haiou48_time_array[1]	= 4800;
	haiou48_time_array[2]	= 2600;
	haiou48_time_array[3]	= 5800;
	haiou48_time_array[4]	= 2600;
	haiou48_time_array[5]	= 3600;

	//第49只海鸥
	//第49只海鸥动作
	var haiou49_fly			 = false;
	var haiou49_action		 = 0;
	var haiou49_action_array = sysarray(6);
	haiou49_action_array[0]	 = 1;
	haiou49_action_array[1]	 = 3;
	haiou49_action_array[2]	 = 2;
	haiou49_action_array[3]	 = 1;
	haiou49_action_array[4]	 = 3;
	haiou49_action_array[5]	 = 2;

	//第49只海鸥动作时间
	var haiou49_time_array	= sysarray(6);
	haiou49_time_array[0]	= 6200;
	haiou49_time_array[1]	= 2700;
	haiou49_time_array[2]	= 7700;
	haiou49_time_array[3]	= 6200;
	haiou49_time_array[4]	= 2500;
	haiou49_time_array[5]	= 1600;

	//第50只海鸥
	//第50只海鸥动作
	var haiou50_fly			 = false;
	var haiou50_action		 = 0;
	var haiou50_action_array = sysarray(6);
	haiou50_action_array[0]	 = 1;
	haiou50_action_array[1]	 = 3;
	haiou50_action_array[2]	 = 2;
	haiou50_action_array[3]	 = 3;
	haiou50_action_array[4]	 = 1;
	haiou50_action_array[5]	 = 3;

	//第50只海鸥动作时间
	var haiou50_time_array	= sysarray(6);
	haiou50_time_array[0]	= 2600;
	haiou50_time_array[1]	= 6600;
	haiou50_time_array[2]	= 3800;
	haiou50_time_array[3]	= 1500;
	haiou50_time_array[4]	= 8200;
	haiou50_time_array[5]	= 3700;
};
