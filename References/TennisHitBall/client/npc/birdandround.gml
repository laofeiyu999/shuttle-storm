/*import("$./../npc/flyid.gml")

var haioufly = new flyid();
void CreateAll()
{
    
	CreateNPC("haiou",0.5);
	
	
	SetAction("haiou",1,"$./haiou/act/daijidongzuo1.v3act");
	SetAction("haiou",2,"$./haiou/act/daijidongzuo2.v3act");
	SetAction("haiou",3,"$./haiou/act/daiji.v3act");
	SetAction("haiou",4,"$./haiou/act/feixiang-huaxiang.v3act");
	SetAction("haiou",5,"$./haiou/act/qifei.v3act");
	SetAction("haiou",6,"$./haiou/act/feixing.v3act");
	SetAction("haiou",7,"$./haiou/act/zou.v3act");
	
	SetNPCModel("haiou","$./haiou/act/haiou.v3s","$./haiou/act/haiou.v3ske",3,1000);
	SetScale("haiou","0.1,0.1,0.1");
	SetBound("haiou",1);
	SetPos("haiou","7.5,0,0");
	SetRotate("haiou","-90,0,0");
    SetCollisionFn("haiou","haiou_startfly");
	

}

/*void  haiou_ActionOver(last_action_id)
{


	
  
	switch( last_action_id) 
	{

	case 3:
		{
	        UseAction_Point("haiou",5,3000,"5.5,3,0")； 
			break;
	    }
	case 5:
		{
			UseAction_Point("haiou",6,5000,"-3,3,0")；	printf("现在这个动作是"+last_action_id);;		
			break;
		}
	case 6:
		{
			UseAction_Point("haiou",4,3000,"-7.5,0,0")；
			break;
		}

	case 4:
		{
		    UseAction_Point("haiou",7,12000,"7.5,0,0")；
			break;
		}

    case 7:
		{

		   UseAction("haiou",2,5000);
		   break;
	    }

	case 2:
		{
		   UseAction("haiou",3,5000);
		   break;
		}

	}
}
*/


/*void pop()
{
    printf("现在这个动作是"+last_action_id);
}*/


/*void haiou_startfly( "haiou",collision_id,num,speed,length )
{
   haioufly.haiou_ActionOver(last_action_id)

}*/