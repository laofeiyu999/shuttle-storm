using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class qk
{
	public const float msj = 1f;

	public const float msk = 1.04f;

	public const float msl = 0.165f;

	public static float gak(float a)
	{
		return a / 180f * MathF.PI;
	}

	public static float gal(float a)
	{
		return a / MathF.PI * 180f;
	}

	public static (float, float) gam(float a, float b)
	{
		b = gak(b);
		a = gak(a);
		float num = b - 0.165f;
		float num2 = -1.25f * Mathf.Log(Mathf.Tan(MathF.PI / 4f + 0.4f * a));
		num = 0.5f + 1f / (2f * MathF.PI) * num;
		num2 = 0.52f - 0.22575201f * num2;
		num2 -= 0.013f;
		return (num, num2);
	}
}
