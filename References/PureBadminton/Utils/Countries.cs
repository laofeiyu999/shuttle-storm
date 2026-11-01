using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class Countries
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ph
	{
		public Country mqb;

		internal bool fwv(CharacterInfo a)
		{
			if (a.country == mqb.alpha3)
			{
				return a.gender == "m";
			}
			return false;
		}

		internal bool fww(CharacterInfo a)
		{
			if (a.country == mqb.alpha3)
			{
				return a.gender == "f";
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pi
	{
		public string mqc;

		internal bool fwx(Country a)
		{
			return a.alpha3 == mqc;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pj
	{
		public string mqd;

		internal bool fwy(Country a)
		{
			return a.alpha3 == mqd;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pk
	{
		public string mqe;

		internal bool fwz(Country a)
		{
			return a.alpha3 == mqe;
		}
	}

	private static Country[] mqf;

	public static IEnumerable<Country> pkx
	{
		get
		{
			if (mqf == null)
			{
				mqf = JsonConvert.DeserializeObject<Country[]>(Resources.Load<TextAsset>("Countries").text);
			}
			return mqf;
		}
	}

	public static IEnumerable<Country> pky => pkx.Where((Country a) => os.pji.Any((CharacterInfo a) => a.country == a.alpha3 && a.gender == "m") && os.pji.Any((CharacterInfo a) => a.country == a.alpha3 && a.gender == "f"));

	public static Country fxc(string a)
	{
		return pkx.FirstOrDefault((Country a) => a.alpha3 == a);
	}

	public static Sprite fxd(string a)
	{
		if (a == null)
		{
			return null;
		}
		return Resources.Load<Sprite>("Images/Flags/" + a.ToLower());
	}

	public static string fxe(string a)
	{
		return pkx.FirstOrDefault((Country a) => a.alpha3 == a)?.name;
	}

	public static string fxf(string a)
	{
		Country country = pkx.FirstOrDefault((Country a) => a.alpha3 == a);
		object obj = country?.shortName;
		if (obj == null)
		{
			if (country == null)
			{
				return null;
			}
			obj = country.name;
		}
		return (string)obj;
	}
}
