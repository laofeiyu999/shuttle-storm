using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class jf
{
	public static uint edm(uint a, float b, double c)
	{
		long num = (long)Math.Round((double)b / c);
		return (uint)Math.Max(0L, a + num);
	}

	public static uint edn(uint? a, ref uint b)
	{
		if (a.HasValue)
		{
			b = a.Value;
		}
		return b;
	}
}
