//
//窗口背景
//

class V_BG_UI item
{
	size = "100%,100%";

	new img
	{
		size = "100%,100%";
		src = "$./bg"+window.g_Bg+"/bk.jpg";
		if (window.IsUIPos(window.POS_LOGIN))
		{
			src = "$./bg1/login_bk.jpg";
		}
	}

	new img
	{
		valign(100,0);halign(50,0);
		width="100%";
		src = "$./bg/bk_bottom.tga";
		if (window.GetUIPos() < window.POS_HALL)
		{
			show = false;
		}
	}
	//粒子效果
	new scene
	{
		new particle
		{
			src = "$./../../../../model/star.v3f";
			SetShader("particle_2d_add_texture.fx",0);
		}
	};
};