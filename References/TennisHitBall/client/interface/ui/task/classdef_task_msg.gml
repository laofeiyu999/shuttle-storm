//

//一条消息信息的样式
class VTaskMsgShow item
{
	size = "100%,20";//bgcolor = "#ff";
	show= false;
	//内容
	var m_szContent = new text
	{
		size = "100%,100%";bold = true;txtborder = "#464646";
		ycenter = true;xcenter = true;
		pos = "0,0";
	}
	//[功能]设置内容以及内容的颜色
	//[参数]_bIsComplete：任务是否已完成，1为完成，非1为未完成
	void SetSrcData(data,_bIsComplete,id)
	{
		if(toint(_bIsComplete) == 1)
		{
			m_szContent.color = "#f5ec3d";
			
		}
		else
		{
			m_szContent.color = "#ffffff";
		}
		m_szContent.src = data;
		KillContentTimer(id);
		SetContentTimer(id);
	}
	void SetContentTimer()
	{
		m_szContent.setParamTimer("alpha",0,100,3000,0,0,"contentTimer_"+id);
	}
	void KillContentTimer(id)
	{
		m_szContent.killtimer("contentTimer_"+id);
		m_szContent.alpha = 0;
	}

};

class VTaskMsgShow_UI item
{
	size = "100%,80";

	//记录有几个显示
	var m_num = 0;
	//记录消息的排列顺序(从上到下)：1为2，3，1；2为3，1，2；3为1，2，3.
	var m_type = 3;

	void Init()
	{
		staticvar s_taskMsg1 = new VTaskMsgShow
		{
			pos(0,0);
			void SetData(_doneNum,_isDone)
			{
				parent.AddNum();
				parent.ChangeType();
//				SetSrc(_doneNum);
//				SetIsComplete(_isDone);
				SetSrcData(_doneNum,_isDone,1);
				show = true;
				timer(7000 , "SubNum" , "msgTimer_1");
				
			}
			void SubNum()
			{
				m_num -= 1;
				if(m_num < 0)
				{
					m_num = 0;
				}
				if(m_num == 0)
				{
					m_type = 3;
				}
				show = false;
			}
		}
		staticvar s_taskMsg2 = new VTaskMsgShow
		{
			pos(0,30);
			void SetData(_doneNum,_isDone)
			{
				parent.AddNum();
				parent.ChangeType();
//				SetSrc(_doneNum);
//				SetIsComplete(_isDone);
				SetSrcData(_doneNum,_isDone,2);
				show = true;
				timer(7000 , "SubNum" , "msgTimer_2");
				
			}
			void SubNum()
			{
				m_num -= 1;
				if(m_num < 0)
				{
					m_num = 0;
				}
				if(m_num == 0)
				{
					m_type = 3;
				}
				show = false;
			}
		}
		staticvar s_taskMsg3 = new VTaskMsgShow
		{
			pos(0,60);
			void SetData(_doneNum,_isDone)
			{
				parent.AddNum();
				parent.ChangeType();
//				SetSrc(_doneNum);
//				SetIsComplete(_isDone);
				SetSrcData(_doneNum,_isDone,3);
				show = true;
				timer(7000 , "SubNum" , "msgTimer_3");
				
			}
			void SubNum()
			{
				m_num -= 1;
				if(m_num < 0)
				{
					m_num = 0;
				}
				if(m_num == 0)
				{
					m_type = 3;
				}
				show = false;
			}
		}
	}
	//删除定时器
	void Kill_1()
	{
		s_taskMsg1.KillContentTimer();
		s_taskMsg1.killtimer("msgTimer_1");
		SubNum();
		s_taskMsg1.show = false;
	}
	void Kill_2()
	{
		s_taskMsg2.KillContentTimer();
		s_taskMsg2.killtimer("msgTimer_2");
		SubNum();
		s_taskMsg2.show = false;
	}
	void Kill_3()
	{
		s_taskMsg3.KillContentTimer();
		s_taskMsg3.killtimer("msgTimer_3");
		SubNum();
		s_taskMsg3.show = false;
	}
	//增加显示的数量
	void AddNum()
	{
		m_num += 1;
		if(m_num > 3)
		{
			m_num = 3;
		}
	}
	//减少显示的数量
	void SubNum()
	{
		m_num -= 1;
		if(m_num < 0)
		{
			m_num = 0;
		}
		if(m_num == 0)
		{
			m_type = 3;
		}
	}
	//改变排列顺序
	void ChangeType()
	{
		m_type += 1;
		if(m_type > 3)
		{
			m_type = 1;
		}
		SetPos();
	}
	//设置排列顺序
	void SetPos()
	{
		switch(m_type)
		{
			case 1:
				s_taskMsg2.pos = "0,0";
				s_taskMsg3.pos = "0,30";
				s_taskMsg1.pos = "0,60";
				break;
			case 2:
				s_taskMsg3.pos = "0,0";
				s_taskMsg1.pos = "0,30";
				s_taskMsg2.pos = "0,60";
				break;
			case 3:
				s_taskMsg1.pos = "0,0";
				s_taskMsg2.pos = "0,30";
				s_taskMsg3.pos = "0,60";
				break;
		}
	}
	//设置目标数
	void SetNeedDoneNum(_iNeedDone)
	{
		
		s_taskMsg1.SetNeedDone(_iNeedDone);
		s_taskMsg2.SetNeedDone(_iNeedDone);
		s_taskMsg3.SetNeedDone(_iNeedDone);
	}
	//显示消息框
	void SetData(_doneNum,_isDone)
	{
		if(m_num == 0)
		{
			s_taskMsg1.SetData(_doneNum,_isDone);
			return;
		}
		if(m_num == 1 || m_num == 2)
		{
			if(m_type == 1)
			{
				s_taskMsg2.SetData(_doneNum,_isDone);
				return;
			}
			if(m_type == 2)
			{
				s_taskMsg3.SetData(_doneNum,_isDone);
				return;
			}
			if(m_type == 3)
			{
				s_taskMsg1.SetData(_doneNum,_isDone);
				return;
			}
		}
		if(m_num == 3)
		{
			if(m_type == 1)
			{
				Kill_2();
				s_taskMsg2.SetData(_doneNum,_isDone);
				return;
			}
			if(m_type == 2)
			{
				Kill_3();
				s_taskMsg3.SetData(_doneNum,_isDone);
				return;
			}
			if(m_type == 3)
			{
				Kill_1();
				s_taskMsg1.SetData(_doneNum,_isDone);
				return;
			}
		}
	}

};

<END>
new item
{
	size = "800,600";bgcolor= "#000000";
	var _temp = new VTaskMsgShow_UI
	{
		Init();//bgcolor = "#ff0000";
		pos = "30,30";
		//SetNeedDoneNum(20);
	}
	var _index = 1;
	void OnClick()
	{
		_index += 1;
		_temp.SetData(_index,1);
	}
}