using System;
using System.Security.Cryptography;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class kg
{
	public static byte[] ehe(string a)
	{
		if (a == null)
		{
			a = "";
		}
		if (Guid.TryParse(a, out var result))
		{
			return result.ToByteArray();
		}
		string text = a.Replace("-", "");
		if (text.Length >= 32 && Guid.TryParseExact(text.Substring(text.Length - 32), "N", out result))
		{
			return result.ToByteArray();
		}
		using MD5 mD = MD5.Create();
		return mD.ComputeHash(Encoding.UTF8.GetBytes(a));
	}
}
