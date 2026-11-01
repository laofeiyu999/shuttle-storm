using System.Text;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class kc
{
	public static sbyte egk(float a)
	{
		return (sbyte)Mathf.Clamp(Mathf.RoundToInt(a * 127f), -127, 127);
	}

	public static float egl(sbyte a)
	{
		return (float)a / 127f;
	}

	public static ushort egm(float a)
	{
		return (ushort)Mathf.Clamp(Mathf.RoundToInt(a * 65535f), 0, 65535);
	}

	public static float egn(ushort a)
	{
		return (float)(int)a / 65535f;
	}

	public static short ego(float a)
	{
		return (short)Mathf.Clamp(Mathf.RoundToInt(a * 100f), -32768, 32767);
	}

	public static float egp(short a)
	{
		return (float)a / 100f;
	}

	public static short egq(float a)
	{
		return (short)(Mathf.RoundToInt(Mathf.Repeat(a, 360f) * 10f) % 3600);
	}

	public static float egr(short a)
	{
		return (float)a / 10f;
	}

	public static string egs(string a, int b)
	{
		if (string.IsNullOrEmpty(a) || Encoding.UTF8.GetByteCount(a) <= b)
		{
			return a ?? "";
		}
		int num = a.Length;
		while (num > 0 && Encoding.UTF8.GetByteCount(a.Substring(0, num)) > b)
		{
			num--;
		}
		if (num > 0 && char.IsHighSurrogate(a[num - 1]))
		{
			num--;
		}
		return a.Substring(0, num);
	}
}
