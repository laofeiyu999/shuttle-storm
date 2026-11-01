//训练的 考证或者任务list显示类
//@刘高辰
//08年9月1日

//一行显示类：名称+是否通过
class VColumn_Train_UI item
{
	size = "111,97";
	var m_State = true;	//是否能训练
	void Init()
	{
		//图标
		//参数1 _name: 名称
		staticvar s_Icon = new img
		{
			var m_name = "";
			//悬停
			var _btnhover = new VBTN_HOVER{};
			_btnhover.SetHangID(154);

			void SetData(_name)
			{
				cursor = window.CURSOR_HAND;
				m_name = _name;
				src = "$./../GmlCtrls/VRadio/imgs"+window.g_Sex+"/new/Train/"+_name+"_1.tga";
			}
		}
		//状态
		//参数1 state：是否通过  0未通过 1通过
		staticvar s_State = new img
		{
			void SetData(state)
			{
				if(state == 1)
				{
					src = "$./imgs/ywc.tga";
				}
				else
				{
					src = "";
				}
			}
		}
	}
	var _SelectState = false;
	void OnMouseOver()
	{
		window.PlaySound(144);
		if (!m_State) return;
		if(_SelectState == false){s_Icon.replaceSrc("_1.tga","_2.tga");}
	}
	void OnMouseOut()
	{
		if (!m_State) return;
		if(_SelectState == false){s_Icon.replaceSrc("_2.tga","_1.tga");}
	}
	void OnMySelect()
	{
		_SelectState = true;
		s_Icon.src = "$./../GmlCtrls/VRadio/imgs"+window.g_Sex+"/new/Train/"+s_Icon.m_name+"_3.tga";
	}
	void OnMyUnSelect()
	{
		_SelectState = false;s_Icon.replaceSrc("_3.tga","_1.tga");
	}
	
	//是否能用
	void SetState(param)
	{
		if (!param)
		{
			s_Icon.cursor = window.CURSOR_ARROW;
			m_State = false;
			s_Icon.src = "$./../GmlCtrls/VRadio/imgs"+window.g_Sex+"/new/Train/"+s_Icon.m_name+"_4.tga";
		}
	}
}

class VTringSet_ListType_UI VN2LCTypesetter
{
	autochgrow = "555";
};

//总的类：List
//
class VTrain_CourseList_UI VN2ListCtrl
{
	//需要显示时改变
	pos="56,96";size="555,291";
	alpha = -1;bgcolor = -1;
	typesetter = "VTringSet_ListType_UI";
	
};