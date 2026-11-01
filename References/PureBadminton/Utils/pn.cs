using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class pn
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class pm
	{
		public float mqg;

		internal float fxo(Tournament a)
		{
			return mqg - a.pnv.CharacterAEnergy;
		}
	}

	public const float mqh = 0.05f;

	private const float mqi = 0.03f;

	private const float mqj = 0.03f;

	private const float mqk = 0.012f;

	private const float mql = 0.016f;

	private const float mqm = 0.2f;

	private const float mqn = 1.8f;

	private static float fxp(float a)
	{
		return Mathf.Lerp(2f, 1f, CharacterStats.ftj(a));
	}

	private static float fxq(float a)
	{
		return Mathf.Lerp(1.7f, 1f, CharacterStats.ftj(a));
	}

	private static float fxr(int a)
	{
		return 1f - ((195f - (float)a) / 200f).gtg(0f, 0.15f);
	}

	private static float fxs(float a)
	{
		return Mathf.Lerp(0.5f, 1f, CharacterStats.ftj(a));
	}

	public static float fxt(float a, float b, float c, int d)
	{
		return 0.03f * a * Mathf.Pow(b, 2f) * fxq(c) * fxr(d);
	}

	public static float fxu(float a, ShotType b, float c, int d)
	{
		if (b == ShotType.Drop || b == ShotType.Midcourt)
		{
			return 0f;
		}
		float num = 0.1f;
		if (b == ShotType.Smash)
		{
			num = 0.3f;
		}
		return num * fxt(a, 1f, c, d);
	}

	public static float fxv(float a, float b, float c, float d)
	{
		if (c > Mathf.Min(0.7f, fxy(d)))
		{
			return 0f;
		}
		float num = 1f - (c / 0.4f).gtg(0f, 1f);
		float num2 = 0.5f + 0.5f * num;
		return 0.05f * num2 * a * fxq(b);
	}

	public static float fxw(float a, float b, int c)
	{
		return 0.03f * a * fxq(b) * fxr(c);
	}

	public static float fxx(float a, float b)
	{
		return fxy(a).gtg(0f, b + 0.3f);
	}

	private static float fxy(float a)
	{
		return 0.5f + 0.5f * a.gtg(0f, 1f);
	}

	public static float fxz(float a)
	{
		return 0.25f + 0.75f * a;
	}

	public static float fya(float a)
	{
		return 0.25f + 0.75f * a;
	}

	public static float fyb(float a, float b, bool c)
	{
		return 0.012f * (c ? 1f : 1.8f) / (fxs(a) * b);
	}

	public static float fyc(qu a, string b, float c)
	{
		qz obj = a.Recap.get(b);
		float a2 = ((obj != null && obj.EnergySpent > 0f) ? a.Recap.get(b).EnergySpent : ((float)a.Recap.SetsScore.Sum((qx a) => a.muk + a.mul) * 0.016f * (a.muh.IsDouble ? 0.8f : 1f) * fxp(c) / a.muh.plu));
		return 0.2f * a2.gtg(0f, 1f) / fxs(c);
	}

	public static float fyd()
	{
		return 0.2f;
	}

	public static float fye(float a, float b, List<Tournament> c)
	{
		float mqg = fya(a);
		return c.Sum((Tournament a) => mqg - a.pnv.CharacterAEnergy) * 0.3f / fxs(b);
	}

	public static float fyf()
	{
		return 0.5f;
	}
}
