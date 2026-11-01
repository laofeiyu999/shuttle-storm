// SCORE

class Sign text
{
	size = "40, 15";
	pos = "5, 0";
	bgcolor = "#888888";
	maxsize = 5;
	src = ":";
};

class ScoreUI item
{
	size = "200, 50";

	var MyPlaScore = new text
	{
		size = "40, 15";
		pos = "50%, 5, -60, 0";
		bgcolor = "#888888";
		xcenter = true;
		maxsize = 5;
		src = "40";
	}

	var PlaSign = new Sign
	{
		pos = "50%, 5, -20, 0";
		xcenter = true;
	}

	var RivalPlaScore = new text
	{
		size = "40, 15";
		pos = "50%, 5, 20, 0";
		bgcolor = "#888888";
		xcenter = true;
		maxsize = 5;
		src = "40";
	}

	var MyInnScore = new text
	{
		size = "40, 15";
		pos = "50%, 25, -60, 0";
		bgcolor = "#888888";
		xcenter = true;
		maxsize = 5;
		src = "40";
	}

	var InnSign = new Sign
	{
		pos = "50%, 25, -20, 0";
		xcenter = true;
	}

	var RivalInnScore = new text
	{
		size = "40, 15";
		pos = "50%, 25, 20, 0";
		bgcolor = "#888888";
		xcenter = true;
		maxsize = 5;
		src = "40";
	}

	void SetScore( pla1, pla2, inn1, inn2)
	{
		MyPlaScore.src = pla1;
		RivalPlaScore.src = pla2;
		MyInnScore.src = inn1;
		RivalInnScore.src = inn2;
	}
};

var ui = new ScoreUI
{
	SetScore(0,0,0,0);
};



// IP CONNECTION
class Connection text
{
	size = "100, 25";
	bgcolor = "#888888";
	xcenter = true;
	var ip;

	void OnClick()
	{
		printf("Connection Click");
		window.ip = ip;	
		window.OnStartGame( );
		parent.visible = false;
	}

	void Init( name, connectIp)
	{
		src = name;
		ip = connectIp;
	}
}

class ConnectList item
{
	size = "100%, 100%";

	new Connection
	{
		Init( "韩硕", "socket:://192.168.0.36:2008");
		pos = "20, 100";
	}

	new Connection
	{
		Init( "车新", "socket:://192.168.0.22:2008");
		pos = "20, 140";
	}

	new Connection
	{
		Init( "丁丁", "socket:://192.168.0.74:2008");
		pos = "20, 180";
	}

	new Connection
	{
		Init( "小何", "socket:://192.168.0.23:2008");
		pos = "20, 220";
	}

	new Connection
	{
		Init( "阿福", "socket:://192.168.0.63:2008");
		pos = "20, 260";
	}

	new Connection
	{
		Init( "刘高辰", "socket:://192.168.0.33:2008");
		pos = "20, 300";
	}

	new Connection
	{
		Init( "杜萌", "socket:://192.168.0.25:2008");
		pos = "20, 340";
	}

}