//
//测试新的引导
//
import("$./../Logic/Init.gml");

wndsize = "1024,768";
bgcolor = "#000000";
drag = "window";

void OnClick_Window()
{
	alert("OnClick_Window");
}

new item
{
	size = "100%,100%";bgcolor = "#CCCCCC";alpha = 50;
	name = "zBtnName_Test1";
	new item
	{
		size = "600,500";pos = "100,100";bgcolor = "#FF";
		name = "zBtnName_Test2";
		new item
		{
			size = "450,350";pos = "150,150";bgcolor = "#FF00";
			name = "zBtnName_Test3";
			new item
			{
				size = "250,150";pos = "200,200";bgcolor = "#FF0000";
				name = "zBtnName_Test4";
				
				new item
				{
					size = "200,100";pos = "50,50";bgcolor = "#ffffff";
					name = "zBtnName_Test5";
					
					void OnClick_Test5()
					{
						alert("OnClick_Test5");
					}
				}
				void OnClick_Test4()
				{
					alert("OnClick_Test4");
				}
			}

			void OnClick_Test3()
			{
				alert("OnClick_Test3");
			}
		}

		void OnClick_Test2()
		{
			alert("OnClick_Test2");
		}
	}

	void OnClick_Test1()
	{
		alert("OnClick_Test1");
	}
}


new item
{
	bgcolor = "#FFFFFF";
	size = "50,50";

	void OnMouseDownL()
	{
		window.LMH1_NewCap("zBtnName_Test5");
	}
}

