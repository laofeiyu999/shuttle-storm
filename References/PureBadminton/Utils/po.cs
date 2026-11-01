using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class po
{
	public static a[] fyg<a>() where a : struct
	{
		if (!typeof(a).IsEnum)
		{
			throw new ArgumentException("GetValues<T> can only be called for types derived from System.Enum", "T");
		}
		return (a[])Enum.GetValues(typeof(a));
	}
}
