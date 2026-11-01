using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class rr
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class rq
	{
		public string mye;

		internal bool gjg(rs a)
		{
			return a.Id == mye;
		}
	}

	public const string myf = "Gymnasium";

	public static readonly string[] myg = new string[3] { "Gymnasium", "France-Coubertin", "Malaysia-Axiata" };

	private static rs[] myh;

	public static IEnumerable<rs> pns
	{
		get
		{
			if (myh == null)
			{
				myh = JsonConvert.DeserializeObject<rs[]>(Resources.Load<TextAsset>("Stadiums").text);
			}
			return myh;
		}
	}

	public static string gji(string a)
	{
		return gjj(a).Source;
	}

	public static rs gjj(string a)
	{
		return pns.FirstOrDefault((rs a) => a.Id == a);
	}

	public static Sprite gjk(string a)
	{
		Sprite sprite = Resources.Load<Sprite>("Images/Stadiums/" + a);
		if (sprite == null)
		{
			sprite = Resources.Load<Sprite>("Images/Stadiums/GenericStadium");
		}
		return sprite;
	}
}
