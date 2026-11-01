using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ow
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class ov
	{
		public Color? mok;

		public Color? mol;

		public Color? mom;
	}

	public string mon;

	public ov moo;

	public ov mop;

	public static readonly List<ow> moq = new List<ow>
	{
		new ow
		{
			mon = "Black",
			moo = new ov
			{
				mok = Color.black,
				mol = ftq("#5E5E5E")
			},
			mop = new ov
			{
				mok = Color.black,
				mol = ftq("#EFEFEF")
			}
		},
		new ow
		{
			mon = "DarkBrown",
			moo = new ov
			{
				mok = ftq("#33281C"),
				mol = ftq("#846644")
			},
			mop = new ov
			{
				mok = Color.black,
				mol = ftq("#846645")
			}
		},
		new ow
		{
			mon = "Brown",
			moo = new ov
			{
				mok = ftq("#41361C"),
				mol = Color.black
			},
			mop = new ov
			{
				mok = ftq("#604628"),
				mol = ftq("#846644")
			}
		},
		new ow
		{
			mon = "DarkBlond",
			moo = new ov
			{
				mok = ftq("#59461E"),
				mol = ftq("#AB8C40"),
				mom = ftq("#4B4B4B")
			},
			mop = new ov
			{
				mok = ftq("#6B572E"),
				mol = ftq("#9F8C59"),
				mom = ftq("#4B4B4B")
			}
		},
		new ow
		{
			mon = "Blond",
			moo = new ov
			{
				mok = ftq("#98792D"),
				mol = ftq("#AB8C40")
			},
			mop = new ov
			{
				mok = ftq("#CD9756"),
				mol = ftq("#846644")
			}
		},
		new ow
		{
			mon = "Auburn",
			moo = new ov
			{
				mok = ftq("#4B301F"),
				mol = Color.black
			},
			mop = new ov
			{
				mok = ftq("#4A3018"),
				mol = ftq("#F89143")
			}
		},
		new ow
		{
			mon = "Red",
			moo = new ov
			{
				mok = ftq("#6C4126"),
				mol = ftq("#F89143"),
				mom = ftq("#4B4B4B")
			},
			mop = new ov
			{
				mok = ftq("#603E1E"),
				mol = ftq("#F89143"),
				mom = ftq("#4B4B4B")
			}
		},
		new ow
		{
			mon = "Grey",
			moo = new ov
			{
				mok = ftq("#3A3933"),
				mol = Color.black
			},
			mop = new ov
			{
				mok = ftq("#54514D"),
				mol = ftq("#686868")
			}
		},
		new ow
		{
			mon = "White",
			moo = new ov
			{
				mok = ftq("#5E5C55"),
				mol = Color.black,
				mom = ftq("#686767")
			},
			mop = new ov
			{
				mok = ftq("#898886"),
				mol = ftq("#686868"),
				mom = ftq("#686767")
			}
		}
	};

	private static Color? ftq(string a)
	{
		return qh.fzu(a);
	}
}
