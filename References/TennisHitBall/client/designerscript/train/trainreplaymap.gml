class ReplayMap scene
{
	void OnCreated()
	{
		printf("E# ReplayMap OnCreated");
	}
	void OnDelete()
	{
		printf("E# ReplayMap OnDelete");
	}
	name = "Name_ReplayMap";
	group = 1;
	camera.pos = "0, 1, -3";
	camera.dir = "0, -0.15, 1";

	new CReplayCamera
	{
		name = "ReplayCamera";
	}

	new GameReplayLoad
	{
		size="100%,100%";
		name="GAMEMAP";
		setPlay(0);
		setAutoToEnd( 1);
	}

	new MapCtrl
	{
		name = "mapCtrl"; 
		LoadMap( 9);
	};

	void SetReplaySrc( src)
	{
		find("GAMEMAP").src= src;
	}
}

new ReplayMap{};
	
