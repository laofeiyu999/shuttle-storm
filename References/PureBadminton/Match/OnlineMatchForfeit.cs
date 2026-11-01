using System.Collections;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class OnlineMatchForfeit
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ld
	{
		public float lza;

		internal bool erl()
		{
			return Time.unscaledTime - lza > 0.5f;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class le
	{
		public Task<bool> lzb;

		public ld lzc;

		internal bool erm()
		{
			if (!lzb.IsCompleted)
			{
				return Time.unscaledTime - lzc.lza > 5f;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lf
	{
		public float lzd;

		internal bool ern()
		{
			return Time.unscaledTime - lzd > 0.5f;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lg
	{
		public Task<bool> lze;

		public lf lzf;

		internal bool ero()
		{
			if (!lze.IsCompleted)
			{
				return Time.unscaledTime - lzf.lzd > 5f;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lh
	{
		public string lzg;

		internal bool erp(MatchSettings.PlayerSettings a)
		{
			return a.OnlinePlayerId == lzg;
		}
	}

	public const float lzr = 5f;

	public const float lzs = 0.5f;

	private static bool lzt;

	public static void erz()
	{
		if (!lzt && !OnlineMatchExit.pfy)
		{
			lzt = true;
			GameManager current = GameManager.Current;
			current.OnlineManager?.euk();
			current.StartCoroutine(esa(MatchSettings.Current.Online));
		}
	}

	private static IEnumerator esa(MatchSettings.qn a)
	{
		float lza = Time.unscaledTime;
		if (!a.plo)
		{
			Task<bool> lzb = bax.ijm(a.msw, a.mta, AbsenceReason.Forfeit, MatchAbsenceWatcher.lxr?.lxs.pvc);
			yield return new WaitUntil(() => lzb.IsCompleted || Time.unscaledTime - lza > 5f);
		}
		yield return new WaitUntil(() => Time.unscaledTime - lza > 0.5f);
		OnlineMatchExit.erj(a: false);
	}

	public static void esb(string a)
	{
		MatchSettings.qn qn = MatchSettings.Current?.Online;
		if (qn != null && !(a == qn.mta) && !MatchAbsenceWatcher.epy(qu.mug) && !OnlineMatchExit.pfy)
		{
			MatchAbsenceWatcher.lxr?.eqh(a);
			GameManager current = GameManager.Current;
			(string, object[]) notice = baq.iie("forfeit", esd(a));
			current.StartCoroutine(esc(qn, a, notice));
		}
	}

	private static IEnumerator esc(MatchSettings.qn a, string b, (string Key, object[] Args) notice)
	{
		float lzd = Time.unscaledTime;
		if (a.pln && !a.plo)
		{
			Task<bool> lze = bax.ijm(a.msw, b, AbsenceReason.Forfeit, MatchAbsenceWatcher.lxr?.lxs.pvc);
			yield return new WaitUntil(() => lze.IsCompleted || Time.unscaledTime - lzd > 5f);
		}
		yield return new WaitUntil(() => Time.unscaledTime - lzd > 0.5f);
		if (!OnlineMatchExit.pfy)
		{
			OnlineMenuNotice.iny(notice.Key, notice.Args);
			OnlineMatchExit.erj(a: false);
		}
	}

	public static string esd(string a)
	{
		CharacterInfo characterInfo = (MatchSettings.Current?.plv.FirstOrDefault((MatchSettings.PlayerSettings a) => a.OnlinePlayerId == a))?.CharacterInfo;
		if (characterInfo != null)
		{
			return (characterInfo.firstName + " " + characterInfo.lastName).Trim();
		}
		return a;
	}

	public static void ese()
	{
		lzt = false;
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		lzt = false;
	}
}
