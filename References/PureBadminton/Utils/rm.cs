using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class rm : rl
{
	private readonly Random mxw;

	public rm()
	{
		mxw = new Random();
	}

	public rm(int a)
	{
		mxw = new Random(a);
	}

	public double giv()
	{
		return mxw.NextDouble();
	}
}
