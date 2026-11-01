//下拉菜单
import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");
import("$./ClassDef_MyDropMenu.gml");
bgcolor = "#FFFFFF";
//		staticvar s_DropDownMenu = new VDROPMENU_UI
//		{
//			pos(50,200);
//			m_sizeX = 115;
//			setIMGShow(true);
//			m_DefaultText.color="#804000";
//			SetData(4,"长刀,重剑,火刃枪,双刀",1,2);
//		}
//		staticvar s_Menu = new VDROPMENU_UI
//		{
//			pos(180,200);
//			m_sizeX = 115;
//			setIMGShow(true);
//			m_DefaultText.color="#804000";
//			SetData(4,"大刀,AK47,分丰富的是,打发鞍山市",2,2);
//		}

//		new VMyDropMenu_UI
//		{
//			bgcolor = "#FF";
//			pos(100,100);
//			SetWidthAndType(100,1);
//			SetData("长刀,重剑,火刃枪,双刀");
//		}
bgcolor = "#FFFFFF";
new item
{
	pos = "120,120";size = "120,100";bgcolor = "#FFFFFF";
	scroll = "no;yes";
	new item
	{
		size = "100,200";bgcolor = "#FF";
		drag = "self";
		void OnDrag()
		{
			_Menu.SetPos(10,100);
		}
		var _Menu = new VMyDropMenu_UI
		{
			void GetOffSetX()
			{
				return (parent.parent.getViewX()+parent.getViewX()+parent.parent.left+parent.left);
			}
			void GetOffSetY()
			{
				return (parent.parent.getViewY()+parent.getViewY()+parent.parent.top+parent.top);
			}
			SetID(1);
			SetPos(10,100);
			SetWidthAndType(80,0);
			SetData("长刀,重剑,火刃枪,双刀,长刀,重剑,火刃枪,双刀,长刀,重剑,火刃枪,双刀");
			GreyIndex(5);
			GreyIndex(4);
			GreyIndex(7);

//			void OnUpdate()
//			{
//				sleep(100);
//				SetPos(10,60);
//			}
		}
//		void OnClick()
//		{
//			_Menu.SetPos(10,100);
//		}
		void CheckDropMenuView()
		{
//			printf("下拉测试代码：位置="+(_Menu.top+parent.getViewY()+18));
//			printf("下拉测试代码：位置="+(_Menu.top+parent.getViewY()));
			var _top = _Menu.top+top+parent.getViewY()+18;
			if(_top<0 || _top>parent.height){printf("太高");window.find("Menu"+_Menu.m_DropMenuId).ShouldHide();}
			else{window.find("Menu"+_Menu.m_DropMenuId).ShouldShow();}
		}
		void OnUpdate()
		{
			sleep(1000);
			_Menu.SetPos(10,100);
			CheckDropMenuView();
		}
	}
	
	new item
	{
		pos = "200,200";
		size = "100,100";bgcolor = "#CC10FF";
		drag = "self";
		var _item2 = new item
		{
			pos = "10,10";bgcolor = "#FFFF00";size = "100,100";
			var _Menu = new VMyDropMenu_UI
			{
				//bgcolor = "#FF";//size = "100,100";
				void GetOffSetX()
				{
					return parent.parent.parent.left+parent.parent.left+parent.left;
				}
				void GetOffSetY()
				{
					return parent.parent.parent.top+parent.parent.top+parent.top;
				}
				SetID(2);
				SetPos(10,10);
				SetWidthAndType(80,0);
				SetData("长刀,重剑,火刃枪,双刀,长刀,重剑,火刃枪,双刀,长刀,重剑,火刃枪,双刀");
			}
		}
		void OnDrag()
		{
			_item2._Menu.SetPos(10,10);
		}
	}
}
