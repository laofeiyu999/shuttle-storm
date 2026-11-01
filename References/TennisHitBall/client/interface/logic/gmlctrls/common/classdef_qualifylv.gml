//
//训练和结算的时候监视称号或者等级是否有提升
//yxf 2009年1月22日
importex("$./../../../UI/GmlCtrls/Common/ClassDef_QualifyLv.gml");
importex("$./../../../Const.gml");
class VQualifyLv_Logic item
{
	size="100%,100%";name="VQualifyLv_Logic_NAME";
	var m_LastLv = 0;//window.GetLVByUID();	//记下比赛前的等级
	var m_CurrLv = 0;	//记下升级后等级
	//=============================与界面交互========================================
	void Init()
	{
		//升级提示
		staticvar s_LvUp = new item
		{
			//设置升级
			//参数：级数
			void showLvUp(CuLevel)
			{
				alert("恭喜你升到"+CuLevel+"级！");
			}
		}
		//称号提示
		staticvar s_Qualify = new item
		{
			//设置称号
			//参数：称号名称
			void SetData(QualifyData)
			{
				alert("恭喜你获得"+QualifyData+"称号！");
			}
		}
	}
	inclass("VQualifyLv_UI");
	//===============================================================================
	
	void OnCreated()
	{
		printf("B# VQualifyLv_Logic:OnCreated()");
	}
	
	void OnDelete()
	{
		printf("B# VQualifyLv_Logic:OnDelete()");	
	}

	//显示属性
	void ShowAtt(currlv)
	{
		new VQualifyAttributeEx_UI
		{
			Init();
//			bgcolor = "#ff";
			width = 2*width;
			var _perAttHeight = toint(height/window.ATL_MAX)+1;
			valign(10,0);halign(40,0);
			var _roletypeLv = window.GetRoleTypeLvByUID(window.GetMyUID(),parent.m_LastLv);
			var _currroletypeLv = window.GetRoleTypeLvByUID(window.GetMyUID(),currlv);
			_currroletypeLv = _currroletypeLv.__Long__;

			s_TStrength.SetDataEx(window.GetUserInitAttByLv(window.GetMySex(),_roletypeLv,window.ATL_STRENGTH),window.GetUserInitAttByLv(window.GetMySex(),_currroletypeLv,window.ATL_STRENGTH));
			s_Tstrength.pos(0,0);
			s_TSkill.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_SKILL),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_SKILL));
			s_TSkill.pos(width/2,0);
			s_TForceHand.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_FRONT),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_FRONT));
			s_TForceHand.pos(0,_perAttHeight);
			s_TBackHand.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_BACK),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_BACK));
			s_TBackHand.pos(width/2,_perAttHeight);
			s_TServe.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_SERVE),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_SERVE));
			s_TServe.pos(0,2*_perAttHeight);
			s_TEnergy.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_ENERGY),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_ENERGY));
			s_TEnergy.pos(width/2,2*_perAttHeight);
			s_Thew.SetDataEx(window.GetUserInitAttByLv(window.USER_SEX_MAN,_roletypeLv,window.ATL_THEW),window.GetUserInitAttByLv(window.USER_SEX_MAN,_currroletypeLv,window.ATL_THEW));
			s_Thew.pos(0,3*_perAttHeight);
		}
		
	}
	//[功能]删除所有显示元素
	//[参数值]无
	//[返回]无
	void DelAllShow()
	{
		sleep(window._Time_QualifyAndLvUp_Msg);
		delallchild();
	}
};