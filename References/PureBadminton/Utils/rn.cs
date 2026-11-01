using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class rn : rl
{
	public const double mxx = 0.999999;

	private readonly double mxy;

	public rn(double a)
	{
		mxy = Math.Max(0.0, Math.Min(0.999999, a));
	}

	public double giv()
	{
		return mxy;
	}
}
