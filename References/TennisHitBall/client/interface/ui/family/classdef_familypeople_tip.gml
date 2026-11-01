//家族成员列表
//夏洋洋 2010-3-4

class VFamily_PeopleList item
{
	new VPic3_GreyTop_UI{size="100%,32";}
	//符号
	var m_sign = new img
	{
		pos="20,8";
		src="$./imgs"+window.g_Sex+"/FamilyHall/px-text.tga";
	}
	//昵称
	var m_name = new img
	{
		top = parent.m_sign.top;
		left = parent.m_sign.left + parent.m_sign.width + 50;
		src="$./imgs"+window.g_Sex+"/FamilyHall/nc-text.tga";
	}
	//等级
	var m_lev = new img
	{
		top = parent.m_sign.top;
		left = parent.m_name.left + parent.m_name.width + 40;
		src="$./imgs"+window.g_Sex+"/FamilyHall/dj-text.tga";
	}
	//性别
	var m_sex = new img
	{
		top = parent.m_lev.top;
		left = parent.m_lev.left + parent.m_lev.width + 30;
		src="$./imgs"+window.g_Sex+"/FamilyHall/xb-text.tga";
	}
	//技术类型
	var m_skillType = new img
	{
		top = parent.m_sex.top;
		left = parent.m_sex.left + parent.m_sex.width + 30;
		src="$./imgs"+window.g_Sex+"/FamilyHall/jslx-text.tga";
	}
	//贡献度
	var m_offerNum = new img
	{
		top = parent.m_sex.top;
		left = parent.m_skillType.left + parent.m_skillType.width + 30;
		src="$./imgs"+window.g_Sex+"/FamilyHall/gxd-text.tga";
	}

	//设置排行显示状态，_state：false为不显示，true为显示
	void SetSignShowState(_state)
	{
		//m_sign.show = _state;
	}
}