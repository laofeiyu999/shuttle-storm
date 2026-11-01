//个人信息:装备属性类定义
//@刘高辰 08年9月3号
//yxf 2008年11月4日

/*
服饰：头发、五官、袜子、护腕手链、眼镜、附件(去掉)
装备：上衣、裙裤、手套、鞋、球拍、背饰、项链
*/
import("$./../../UI/SelfInfo/ClassDef_Equipment.gml");

class VSelfInfo_Equipment_Logic item
{
	size = "100%,100%";bgcolor = "#FF";alpha = 50;
	var _Sex = window.GetSexByUID(window.g_SelfInfo_UID);//底图的性别
	//=============================与界面交互========================================
	void Init()
	{
		//服饰：Radio
		staticvar s_R_Cloth = new VMyRadio
		{
			Init("服饰");pos = "15,15";
		}
		//装备：Radio
		staticvar s_R_Equipment = new VMyRadio
		{
			Init("装备");pos = "70,15";
		}
		//头发
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Hair = new VMyText{pos = "180,60";}
		//五官
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Facial = new VMyText{pos = "15,60";}
		//袜子
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Socks = new VMyText{pos = "15,360";}
		//护腕手链
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Cuff = new VMyText{pos = "15,60";}
		//眼镜
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Glasses = new VMyText{pos = "15,60";}
		//附件
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		//staticvar s_Annex = new VMyText{pos = "15,360";}
		
		//上装
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Jacket = new VMyText{pos = "15,150";}	
		//群/裤
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Trouser = new VMyText{pos = "15,250";}
		//手套
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Gloves = new VMyText{pos = "180,200";}
		//鞋
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Shoes = new VMyText{pos = "180,360";}
		//球拍
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Racket = new VMyText{pos = "180,360";}
		//背饰
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Back = new VMyText{pos = "180,360";}
		//项链
		//参数data1：物品的显示ID
		//参数data2：物品的GID - 球怕时才有值 其他为-1
		staticvar s_Necklace = new VMyText{pos = "180,360";}
	}
	inclass("VSelfInfo_Equipment_UI");//界面显示类
	//==============================function=========================================
	//初始化显示
	void InitShow()
	{
		s_Hair.show = false;
		s_Facial.show = false;
		s_Glasses.show = false;
		s_Cuff.show = false;
		s_Socks.show = false;
		//s_Annex.show = false;

		s_Jacket.show = false;
		s_Trouser.show = false;
		s_Gloves.show = false;
		s_Shoes.show = false;
		s_Racket.show = false;
		s_Back.show = false;
		s_Necklace.show = false;
	}
	//基础信息，战绩统计，装备属性的切换
	//参数 type：类型 1服饰 2装备
	void ChangeType(type)
	{
		ChangeBK(type);//换显示的底图
		InitShow();
		switch (type)
		{
			case 1:
			{
				s_Hair.show = true;
				s_Facial.show = true;
				s_Glasses.show = true;
				s_Cuff.show = true;
				s_Socks.show = true;
				//s_Annex.show = true;
				break;
			}
			case 2:
			{
				s_Jacket.show = true;
				s_Trouser.show = true;
				s_Gloves.show = true;
				s_Shoes.show = true;
				s_Racket.show = true;
				s_Back.show = true;
				s_Necklace.show = true;
				break;
			}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		set s_R_Cloth//服装：Radio
		{
			groupname="VSelf_Info_Equipment_Group";
			startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Equipment//装备：Radio
		{
			groupname="VSelf_Info_Equipment_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	//取数据库的数据
	void ReadDataFromDB()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,window.g_SelfInfo_RID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			window.find("UIController").LoadDLG(146);//玩家已离线，装备信息错误！
			printf("B# error:个人信息-装备DBname:"+window.M_G_SERVER+",TBName1:"+window.ROLEDT+",window.g_SelfInfo_RID:"+window.g_SelfInfo_RID);
			return;
		}

		if (window.g_SelfInfo_RID == window.GetMyRID())//如果是自己
		{
			s_Hair.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID0),window.GetGIDByPackID(200));//头发
			s_Facial.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID1),window.GetGIDByPackID(201));//五官
			s_Jacket.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID2),window.GetGIDByPackID(100));//上装
			s_Trouser.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID3),window.GetGIDByPackID(101));//裙/裤
			s_Gloves.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID4),window.GetGIDByPackID(102));//手套
			s_Socks.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID5),window.GetGIDByPackID(103));//袜
			s_Shoes.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID6),window.GetGIDByPackID(104));//鞋
			s_Back.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID7),window.GetGIDByPackID(303));//背饰
			s_Racket.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID8),window.GetGIDByPackID(105));//球拍
			s_Glasses.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID9),window.GetGIDByPackID(302));//眼镜
			s_Cuff.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID10),window.GetGIDByPackID(300));//护腕/手链
			s_Necklace.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID11),window.GetGIDByPackID(301));//项链
		}
		else
		{
			s_Hair.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID0),-1);//头发
			s_Facial.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID1),-1);//五官
			s_Jacket.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID2),-1);//上装
			s_Trouser.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID3),-1);//裙/裤
			s_Gloves.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID4),-1);//手套
			s_Socks.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID5),-1);//袜
			s_Shoes.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID6),-1);//鞋
			s_Back.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID7),-1);//背饰
			s_Racket.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID8),-1);//球拍
			s_Glasses.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID9),-1);//眼镜
			s_Cuff.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID10),-1);//护腕/手链
			s_Necklace.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID11),-1);//项链
		}
		_VNet2DBRow.del();
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		SetEvent();
		ReadDataFromDB();
	}
};