//
//录像界面的类定义
//

importex("$./ClassDef_DBList.gml");
importex("$./../../UI/Video/ClassDef.gml");

class VVideo_Logic CGameVideo
{
	size = "70%,65%";pos(0,50);bgcolor = "#F0F0";alpha = 50;
	
	//扫描文件写到数据库
	InitDB(""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/*.VRG",window.GAMEUI,window.VIDEOINFO);
	
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			pos = "680,0";Init("X");size = "30,30";
		}	
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(640,0);Init("？");size = "30,30";
		}
		//翻页：录像
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(90,0);halign(50,0);
		}
		//观看：按钮
		staticvar s_Btn_Look = new VMyButton
		{
			Init("观看");valign(100,0);halign(20,0);
		}
		//删除：按钮
		staticvar s_Btn_Del = new VMyButton
		{
			Init("删除");valign(100,0);halign(80,0);
		}
	}
	inclass("VVideo_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//点击了观看按钮
	void OnClick_BtnLook()
	{
		var _RecordRow = _VideoList.curselectrow();//选择的哪行
		var _temp = _VideoList.fieldstr(_RecordRow,window.GAMEUI_VIDEOINFO_TITLE);//文件名字
		if (_temp == "" || _temp == 0)
		{
			window.find("UIController").LoadDLG(186);//该录像不存在或已删除！
			return;
		}
		var _tempsize = _VideoList.fieldstr(_RecordRow,window.GAMEUI_VIDEOINFO_SIZE); //文件大小
		if (_tempsize == 0)
		{
			window.find("UIController").LoadDLG(187);//加载文件错误！
			return;
		}

		var _FileName = ""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/"+_temp;//设置录像的路径
		//print("吴楠："+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/"+_temp);

		window.HallToVideo(window.VIDEO_TYPE_DEFAULT,_FileName);
	}
	
	//点击了删除按钮
	void OnClick_BtnDel()
	{
		window.find("UIController").LoadDLG(29);//确定删除录像吗？
	}

	//确定要删除了
	void OnConfirm_BtnDel()
	{
		var _VideoRow = _VideoList.curselectrow();
		var _temp = _VideoList.fieldstr(_VideoRow,window.GAMEUI_VIDEOINFO_TITLE); //文件名
		//printf("B# yxf:删除录像，文件名:"+_temp);
		if (_temp == "" || _temp == 0)
		{
			window.find("UIController").LoadDLG(188);
			return;
		}
		var _FileName = ""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/"+_temp;
		DeleteFile(_FileName);
		
		//扫描文件写到数据库
		InitDB(""+window.getbinpath()+"../gamereplay/"+window.GetMyName()+"/*.VRG",window.GAMEUI,window.VIDEOINFO);
		_VideoList.SQL();
		_VideoList.scriptprcallsub("OnUnSelect");
		SetBtnState(window.BTN_STATE_GREY,window.BTN_STATE_GREY);
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_VIDEO);}
		}

		set s_Btn_Look//观看：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_BtnLook();}
			}
			SetState(window.BTN_STATE_GREY);//按钮为灰的
		}
		set s_Btn_Del//删除：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_BtnDel();}
			}
			SetState(window.BTN_STATE_GREY);//按钮为灰的
		}
		set s_PageCtrl//翻页：录像
		{
			targetname="VVideoList_Logic_NAME";
			countperpage = 6;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VVideoList_Logic");// 获得已绑定的数据表
		}
	}

	//================================DBList=========================================
	Init();
	
	var _VideoList = new VVideoList_Logic
	{
		//SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		name = "VVideoList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.VIDEOINFO,"Bind_VVideoList_Logic");// 绑定数据表
		
		void SQL()
		{
			var _SQL = "SELECT * FROM "+window.VIDEOINFO+" WHERE Del=0 ORDER BY "+window.GAMEUI_VIDEOINFO_DATA_STR+" DESC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VVideoList_Logic",window.GAMEUI,_SQL);
		}
		SQL();
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 背包-录像列表，PageviewEnd\n");
		}
	}	

	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数

	void SetBtnState(_lookState,_delState)
	{
		s_Btn_Look.SetState(_lookState);
		s_Btn_Del.SetState(_delState);
	}
};