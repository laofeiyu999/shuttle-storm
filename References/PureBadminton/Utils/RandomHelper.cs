using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class RandomHelper
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ro : IDisposable
	{
		private readonly rl mxz;

		private bool mya;

		public ro(rl a)
		{
			mxz = a;
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public void Dispose()
		{
			if (!mya)
			{
				mya = true;
				current = mxz;
			}
		}
	}

	private static readonly rl myb = new rm();

	[ThreadStatic]
	[NotObfuscatedCause("Because of compatibility component: .Net Framework - Compatibility : Is a special name.")]
	private static rl current;

	private static rl pnr => current ?? myb;

	public static IDisposable gix(rl a)
	{
		rl a2 = current;
		current = a;
		return new ro(a2);
	}

	public static float giy(float a = 1f)
	{
		return giz(0f, a);
	}

	public static float giz(float a, float b)
	{
		return (float)(pnr.giv() * (double)(b - a)) + a;
	}

	public static bool gja()
	{
		return pnr.giv() > 0.5;
	}

	public static float gjb(float a = 3f)
	{
		return MathF.Pow(giy(), a);
	}

	public static float gjc(float a = 3f)
	{
		return 1f - gjb(a);
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		current = null;
	}
}
