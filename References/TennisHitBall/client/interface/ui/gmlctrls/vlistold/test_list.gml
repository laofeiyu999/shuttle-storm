import("$./../../../Logic/Init.gml");
bkcolor="#123456";

class Test_List item
{
	size="100,70";
	setFocus="true";

	var _list = new item
	{
		size(100,70);
		bkcolor="#ffff";alpha=50;
		show=false;
	}

	new item
	{
		size(20,20);pos(80,0);
		bkcolor="#ff";
		void OnClick()
		{
			parent._list.show="xor";
		}
	}
	
	void OnLostFocus()
	{
		_list.show=false;
	}
};

new Test_List{}