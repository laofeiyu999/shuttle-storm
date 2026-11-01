//游戏内提示信息的显示，老虎用
//显示部分
//@安峰册
//2009-12-1

class VGame_Playing_PromptInfo_UI item
{
	pos = ""+((parent.width.__Long__)/2-160)+",50"; size = "400,100"; bgcolor="-1";alpha = 0;


	var m_DfUse		= new img{ src = "$./imgs/DFUse.tga"; pos = "0,20"; size = "120,0";show = false;}
	var m_SkillInfo	= new img
		{ 
			src=""; pos = "130,0"; size = "250,0"; show = false;
			
			//动画结束
			void actEnd()
			{
				parent.IsHide(false);
			}
		}

	
	//是否显示元素
	void IsHide(param)
	{
		m_DfUse.show = param;
		m_SkillInfo.show = param;
	}

	//设置数据，设置图片的显示状态
	//参数 data1:显示状态，true显示；false不显示
	//参数  :data，显示的图片名称,其值为0-12
	void setData(data1,data2)
	{
		//动画
		m_SkillInfo.src = "$./imgs/promptInfo_"+data2+".tga";

		if(data1)
		{
			IsHide(data1);

			m_DfUse.setParamTimer("size","120,0","120,30",300,0);
			m_SkillInfo.setParamTimer("size","250,0","250,50",300,0);
		}
		else
		{
			/*
			m_DfUse.setParamTimer("size","120,30","120,0",300,0);
			m_SkillInfo.setParamTimer("size","250,50","250,0",300,0,"actEnd");*/
			IsHide(data1);
		}
	}
};

