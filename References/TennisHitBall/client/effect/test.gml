new img3d{};

bgcolor="#123456";

mainDevice.TexturePath(0,"$./texture");

new scene
{
	camera.src="keyboard";

	var b = new fmodel
	{
		src="$./effect/C02136.v3f";
		pos="0,0,4";
		setShader("add_texture.fx");
	};
};