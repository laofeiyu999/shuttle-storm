using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class pd
{
	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class RootObject
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public PairInfo[] pairs;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oz
	{
		public string mos;

		internal bool fts(PairInfo a)
		{
			return a.id == mos;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pa
	{
		public string mot;

		internal bool ftt(PairInfo a)
		{
			if (!(a.characterId1 == mot))
			{
				return a.characterId2 == mot;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pb
	{
		public string mou;

		public string mov;

		internal bool ftu(PairInfo a)
		{
			if (a.characterId1 == mou || a.characterId2 == mou)
			{
				return a.category == mov;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pc
	{
		public string mow;

		internal bool ftv(PairInfo a)
		{
			return a.category == mow;
		}
	}

	private static PairInfo[] mox;

	public static IEnumerable<PairInfo> pjr
	{
		get
		{
			if (mox == null)
			{
				TextAsset textAsset = Resources.Load<TextAsset>("GeneratedPairs");
				mox = JsonUtility.FromJson<RootObject>("{\"pairs\":" + textAsset.text + "}").pairs;
			}
			return mox;
		}
	}

	public static PairInfo ftx(string a)
	{
		return pjr.FirstOrDefault((PairInfo a) => a.id == a);
	}

	public static List<PairInfo> fty(string a)
	{
		return pjr.Where((PairInfo a) => a.characterId1 == a || a.characterId2 == a).ToList();
	}

	public static PairInfo ftz(string a, string b)
	{
		return pjr.FirstOrDefault((PairInfo a) => (a.characterId1 == a || a.characterId2 == a) && a.category == b);
	}

	public static List<PairInfo> fua(TournamentCategory a)
	{
		string mow = null;
		switch (a)
		{
		case TournamentCategory.MenDoubles:
			mow = "MD";
			break;
		case TournamentCategory.WomenDoubles:
			mow = "WD";
			break;
		case TournamentCategory.MixedDoubles:
			mow = "XD";
			break;
		default:
			throw new ArgumentException();
		}
		return pjr.Where((PairInfo a) => a.category == mow).ToList();
	}
}
