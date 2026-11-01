using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class tk
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ti
	{
		public string nbu;

		internal bool gqg(sz a)
		{
			return a.Id == nbu;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class tj
	{
		public CareerDate nbv;

		internal bool gqh(sz a)
		{
			if (a.Week == nbv.WeekNumber)
			{
				if (a.YearCondition != null)
				{
					return a.YearCondition.gqf(nbv.Year);
				}
				return true;
			}
			return false;
		}
	}

	private static sz[] nbw;

	public static IEnumerable<sz> pos
	{
		get
		{
			if (nbw == null)
			{
				nbw = JsonConvert.DeserializeObject<sz[]>(Resources.Load<TextAsset>("Tournaments").text);
				sz[] array = nbw;
				for (int i = 0; i < array.Length; i++)
				{
					array[i].gpq();
				}
			}
			return nbw;
		}
	}

	public static sz gqj(string a)
	{
		return pos.FirstOrDefault((sz a) => a.Id == a);
	}

	public static IEnumerable<sz> gqk(CareerDate a)
	{
		return pos.Where((sz a) => a.Week == a.WeekNumber && (a.YearCondition == null || a.YearCondition.gqf(a.Year)));
	}
}
