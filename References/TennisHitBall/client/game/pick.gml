//
//拾取 做点选3D模型用 从猎刃移植
//yxf 2009年10月10日

class MouseCapture item
{
	var __MgrAdd = group.find("MgrPicking");
	if (__MgrAdd != 0){ __MgrAdd.PickAddObj(find("Action"), 2); }

	void MouseCapture_MgrRemove( target)//OnDelete()
	{ 
		var __MgrRemove = group.find("MgrPicking");
		if (__MgrRemove != 0){ __MgrRemove.PickRemoveObj( target); }
//		alert("MouseCapture Remove Action.");
	}
	
	void add_removeMyObj( true_false )
	{
		var __MgrAdd = group.find("MgrPicking");
		print( "add_removeMyObj = " + true_false + " npcid = "+ _cnpnc.GetDefId());
		if( true_false != 0 )
		{
			if (__MgrAdd != 0){ __MgrAdd.PickAddObj(find("Action"), 2); }
		}
		if (true_false == 0)
		{
			if (__MgrAdd != 0){ __MgrAdd.PickRemoveObj(find("Action")); }
		}
	}
	set find("Action")//bodyact
	{
		// 拾取回调
		void PickOnMouseClick(lr)
		{
			parent.OnMouseClick(lr);

//			printf("PickOnMouseClick lr:"+lr);
//			if( toint(window.find("gameui")._maptype)==toint(window.CUPOS_InCull) )
//			{
//				if( parent.GetSelfDistance() < 1 )
//				{
//					group.find("selfcharacter").SetCollectID( parent._cnpnc.GetRoleId() );
//					window.CurSelectCollect = parent._cnpnc.GetNpcObjID();
//					window.GetSelf().bodyfsm.FaceToUser( parent._cnpnc.GetRoleId() );
//				}
//			}
//
//			if(parent.GetSelfDistance() > 2 && parent.GetRoleType() == 3)
//			{
//				group.find("autoPath").SetNpcFPath(parent._cnpnc.GetDefId(),"FindNpcEnd");
//				return;
//			}
//			if( parent.GetSelfDistance() < 2 )
//			{				
//				if( group.find("selfcharacter").parent.bodyfsm.GetCurState() == 97 )
//					group.find("selfcharacter").parent.bodyfsm.ClearSet(96);
//			}
//			if( lr == 1 && parent.GetRoleType() == 5 && parent.GetSelfDistance() < 4 )
//			{
//				parent.MyMouseEnterL();
//			}
//
//			if(lr==1){parent.OnMouseEnterL();}
//			if(lr==2){parent.OnMouseEnterR();}
		}
		// 功能：光标移入物体范围时触发。
		// 参数：iUserData - 用户自定义数据；
		//       bActive - 是否为主动拾取（因光标移动而发生的拾取时为真）；
		//       rpiInfo - 拾取实例。
		// 返回值：无。
		void PickOnMouseEnter(iUserData,bActive,rpiInfo)
		{
			if(window.GetUIPos() == window.POS_GAME || window.GetUIPos() == window.POS_TRAINING)
			{
				window.cursor = window.CURSOR_ARROW;
				return;
			}
			window.cursor = window.CURSOR_HAND;
			printf("PickOnMouseEnter");
			//var dis = parent.GetSelfDistance();
			//print("PickOnMouseEnter dis:"+dis);
			//if(parent.GetSelfDistance() > 5){ return;}
			parent.OnMouseEnter();
		}
		// 功能：光标离开物体的时候触发。
		// 参数：iUserData - 用户自定义数据；
		//       bActive - 是否为主动离开（因光标移动而发生的离开时为真）；
		//       ritObj - 离开的物体。
		// 返回值：无。
		void PickOnMouseLeave(iUserData,bActive,ritObj)
		{
			window.cursor = window.CURSOR_ARROW;
			printf("PickOnMouseLeave");
			//print("PickOnMouseLeave dis:"+dis);
			//if(parent.GetSelfDistance() > 5){return;}
			parent.OnMouseLeave();
		}
		
		void PickOnMouseMove(iUserData,bActive,rpiInfo)
		{
			printf("PickOnMouseMove");
        }
        
        void PickOnMouseUnclick(iUserData,ritObj)
		{
			printf("PickOnMouseUnclick");

			//parent.OnMouseUnClick();
        }
	}
};