//
//大厅房间列表DB List类定义
//

//一行显示类：房间号+房间类型+房间名+房间状态+有密码(小锁)+观战按钮
class VColumn_Hall_Room_UI item
{
	size = "200,56";bgcolor = "-1";alpha = -1;
//	bgcolor = "#FF00";//alpha = -1;
	//===========================与显示交互======================
	void Init()
	{
		//夏洋洋修改于2009-12-24
		staticvar s_top = new item//VPic3_RoomListTop_UI
		{
			pos = "1,0";size = "195,47";
			var _topImg = new img
			{
				size = "100%,100%";
				src = "$./imgs"+window.g_Sex+"/fj-01.tga";
			}
			void SetData(data)
			{
//				delallchild();
//				if(data==1){LeftRight("/new/RoomList/top",32);}
//				else if(data==2){LeftRight("/new/RoomList/top_o",32);}
//				else if(data==3){LeftRight("/new/RoomList/top_c",32);}
				_topImg.src = "$./imgs"+window.g_Sex+"/fj-0"+data+".tga";
			}
		}
//		staticvar s_bottom = new VPic9_RoomListBottom_UI
//		{
//			pos = "0,22";size = "198,30";
//			void SetData(data)
//			{
//				delallchild();
//				if(data==1){Init("/new/RoomList/bottom",8,8);}
//				else if(data==3){Init("/new/RoomList/bottom_c",8,8);}
//			}
//		}
		//new img{pos = "142,20";src="$./imgs"+window.g_Sex+"/sanjiao.tga";}
		//参数2 data : 房间号
		//房间类型
		staticvar s_ID = new VN2NumShow
		{
			pos = "7,6";src = "$./../PublicImage/num/new/Num.tga";
			void SetData(data)
			{
				setNum(data,0,3);
			}
		}
		//参数1 data1 ：房间类型 0未知 1竞技单 2竞技双
		//参数2 data2 ：挑战金额 >0 
		staticvar s_Type = new img
		{
			pos="10,27";
			var _roomType = 0;
			var _roomMoney = 0;
			void SetData(_type,_money)
			{
				_roomType = _type;
				_roomMoney = _money;
				SetSrc(1);
			}
			//[功能]设置房间的src	夏洋洋添加于2009-12-24
			//[参数值]_index:索引号，指明是哪张图
			//[返回值]无
			void SetSrc(_index)
			{
				if(toint(_roomMoney)>0)
				{
					if(toint(_roomType)==1){src="$./imgs"+window.g_Sex+"/tzjdd-text0"+_index+".tga";}
					if(toint(_roomType)==2){src="$./imgs"+window.g_Sex+"/tzjsd-text0"+_index+".tga";}
					if(toint(_roomType)==10){src="$./imgs"+window.g_Sex+"/qltzj-text0"+_index+".tga";}
					return;
				}
				else
				{
					if(toint(_roomType)==1){src="$./imgs"+window.g_Sex+"/ptdd-text0"+_index+".tga";}
					if(toint(_roomType)==2){src="$./imgs"+window.g_Sex+"/ptsd-text0"+_index+".tga";}
					if(toint(_roomType)==10){src="$./imgs"+window.g_Sex+"/qlms-text0"+_index+".tga";}
					return;
				}
			}
		}
		//房间名
		//参数 data1:
		staticvar s_Name = new BaseText
		{
			pos = "34,0";size = "110,20";txtborder = "#D1C7D3";ycenter = true;xcenter= true;
		}
		//房间状态
		//参数 data1:0未知 1游戏中 2等待中（有密码显示密码，无显示1/2） 3结算中
		//参数 data2:当前人数
		//参数 data3:最大人数
		//参数 data4:有无密码(小锁)0没有 1有
		//参数 data5:男女比例 如1122 代表 "男男女女" 显示为 "女女男男"
		staticvar s_State = new item
		{
			pos = "135,2";size = "50,18";//bgcolor = "#FF";
			var _text = new BaseText{show = false;size = "100%,100%";ycenter = true;xcenter= true;src = "游戏中";txtborder = "#D1C7D3";}//pos = "0,1";
			var _lock = new img{valign(100,0);halign(50,0);src="$./imgs"+window.g_Sex+"/lock.tga";show = false;}
			var _player = new item
			{
				show = false;
				valign(50,0);halign(100,0);
				var _imgArr = sysarray(4);
				var _index = 0;
				while (_index<4)
				{
					var _img = new img
					{
						src="$./imgs"+window.g_Sex+"/sex_grey.tga";
						void SetSrc(data)
						{
							if(data==1){src="$./imgs"+window.g_Sex+"/sex_boy.tga";}
							else if(data==2){src="$./imgs"+window.g_Sex+"/sex_girl.tga";}
							else{src="$./imgs"+window.g_Sex+"/sex_grey.tga";}
						}
					}
					_imgArr[_index] = _img;
					_imgArr[_index].pos(10*_index,0);
					_index += 1;
				}
				void SetMax(data)
				{
					size(toint(data)*10,14);
				}
				void SetAllGrey()
				{
					_index=0;
					while (_index<4)
					{
						_imgArr[_index].SetSrc(0);
						_index += 1;
					}
				}
				void SetPlayerImg(data)
				{
					data = data.__Long__;
					SetAllGrey();
					if(data>1000)
					{
						_index = 3;
						_imgArr[_index].SetSrc(toint(data/1000));_index -= 1;
						_imgArr[_index].SetSrc(toint(data/100)%10);_index -= 1;
						_imgArr[_index].SetSrc(toint(data/10)%10);_index -= 1;
						_imgArr[_index].SetSrc(data%10);
						return;
					}
					if(data>100)
					{
						_index = 2;
						_imgArr[_index].SetSrc(toint(data/100)%10);_index -= 1;
						_imgArr[_index].SetSrc(toint(data/10)%10);_index -= 1;
						_imgArr[_index].SetSrc(data%10);
						return;
					}
					if(data>10)
					{
						_index = 1;
						_imgArr[_index].SetSrc(toint(data/10)%10);_index -= 1;
						_imgArr[_index].SetSrc(data%10);
						return;
					}
					if(data>0)
					{
						_index = 0;
						_imgArr[_index].SetSrc(data%10);
						return;
					}
				}
			}
			void SetData(data1,data2,data3,data4,data5)
			{
//				printf("9# aaaaa data1:"+data1+",data2:"+data2+",data3:"+data3+",data4:"+data4+",data5:"+data5);
				if(toint(data1)==2)
				{
					if(toint(data4)==0)
					{
						_player.show = true;
						_text.show = false;
						_lock.show = false;
						_player.SetPlayerImg(data5);
						_player.SetMax(data3);
					}
					else
					{
						_player.show = false;
						_text.show = false;
						_lock.show = true;
					}
				}
				else
				{
					_player.show = false;
					_text.show = true;
					_lock.show = false;
				}
			}
		}
		//观战人数 1/6
		//参数 data1:当前人数
		//参数 data2:最大人数
		staticvar s_LookNum = new BaseText
		{
			pos = "80,28";size = "60,14";xcenter= true;
			void SetData(_cur,_max)
			{
				src = "观战"+_cur+"/"+_max;
			}
		}
		// 观战
		staticvar s_Btn_LookAt=new VBTN_ViewGame_New{pos= "150,26";InitText("观战");show=false;};
	}
	Init();

	var _SelectState = false;
	void OnMouseOver()
	{
		if(_SelectState == false){s_top.SetData(2);s_Type.SetSrc(2);}
		window.PlaySound(144);
	}
	void OnMouseOut()
	{
		if(_SelectState == false){s_top.SetData(1);s_Type.SetSrc(1);}
	}
	//选择的效果
	void OnMySelect()
	{
		if(_SelectState==true){return;}
		s_top.SetData(3);/*s_bottom.SetData(3);*/
		s_Type.SetSrc(3);_SelectState = true;
//		window.PlaySound(4);
	}
	//不 选择的效果
	void OnMyUnSelect()
	{
		if(_SelectState==false){return;}
		s_top.SetData(1);//s_bottom.SetData(1);
		s_Type.SetSrc(1);_SelectState = false;
	}
};

//排版器，可自定义
class VHall_RoomList_TypeSet_UI VN2LCTypesetter
{
	autochgrow="600";
};

//
//总的类：List
//
class VHall_RoomList_UI VN2ListCtrl
{
	//需要显示时改变
	pos = "26,80";size="600,224";valign(0,0);halign(0,0);
	alpha = -1;bgcolor = "-1";
//	alpha = 70;bgcolor = "#FF";

	typesetter ="VHall_RoomList_TypeSet_UI";
};
<END>
import("$./../../Logic/Init.gml");
var g_Sex = 1;
bgcolor = "#FF";alpha = 80;
size = "1024,768";
wndsize = "1024,768";

new VColumn_Hall_Room_UI
{
	Init();
	s_ID.setNum(299);
	s_Type.SetData(1,10);
	//参数 data1:0未知 1游戏中 2等待中（有密码显示密码，无显示1/2） 3结算中
	//参数 data2:当前人数
	//参数 data3:最大人数
	//参数 data4:有无密码(小锁)0没有 1有
	//参数 data5:男女比例 如1122 代表 "男男女女" 显示为 "女女男男"
	s_Name.SetData("发大法师大大方方");
	s_State.SetData(2,3,4,0,1);
	s_LookNum.SetData(2,4);
}