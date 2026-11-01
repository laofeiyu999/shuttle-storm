class TestText text
{
	size = "200, 20"
	maxsize = 100;
};

class PingFrame item
{
	name = "P2POutputWindow";
	size = "200, 200";
	drag = "self";
	capturemouse=true;
	visible = false;

	var t1 = new TestText
	{
		src = "PING: "
		pos = "0, 20";
	}

	var t2 = new TestText
	{
		src = "MINPING: "
		pos = "0, 40";
	}

	var t3 = new TestText
	{
		src = "PROXYPING: "
		pos = "0, 60";
	}

	var t4 = new TestText
	{
		src = "MINPROXYPING: "
		pos = "0, 80";
	}

	var t5 = new TestText
	{
		src = "HOST: "
		pos = "0, 100";
	}

	var t6 = new TestText
	{
		src = "LOC: "
		pos = "0, 120";
	}

	var t7 = new TestText
	{
		src = "LASTIP: "
		pos = "0, 140";
	}
	
	var nameStr = new TestText
	{
		src = "NAME: "
		pos = "0, 160";
	}

	void SetData( Strname, ping, minping, proxyping, minproxyping)
	{
		nameStr.src = "NAME:" + Strname;
		t1.src = "PING:" + ping; 
		t2.src = "MINPING:" + minping; 
		t3.src = "PROXYPING:" + proxyping;
		t4.src = "MINPROXYPING:" + minproxyping; 
	}

	void SetHost( p1, p2, p3, p4)
	{
		t5.src = "HOST:" + p1 + "." + p2 + "." + p3 + "." + p4; 
	}

	void SetLoc( p1, p2, p3, p4)
	{
		t6.src = "LOC:" + p1 + "." + p2 + "." + p3 + "." + p4; 
	}

	void SetLast( p1, p2, p3, p4)
	{
		t7.src = "LAST:" + p1 + "." + p2 + "." + p3 + "." + p4; 
	}
}
