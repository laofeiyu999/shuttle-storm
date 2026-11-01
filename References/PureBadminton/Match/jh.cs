using System;
using System.IO;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class jh
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class jg
	{
		public string lou;

		internal void eef(ki a)
		{
			eei(lou, a);
		}
	}

	public static string pet => Path.Combine(Path.GetTempPath(), "PureBadminton", "match-logs");

	public static Action<ki> eeh(MatchLogTarget a, string b, string c)
	{
		switch (a)
		{
		case MatchLogTarget.Storage:
			MatchLogUploader.iiq(b, c);
			return delegate(ki a)
			{
				MatchLogUploader.iir(a.ltm, a.ltn);
			};
		case MatchLogTarget.LocalDirectory:
		{
			string lou = Path.Combine(pet, b, c);
			return delegate(ki a)
			{
				eei(lou, a);
			};
		}
		default:
			return null;
		}
	}

	private static bool eei(string a, ki b)
	{
		try
		{
			Directory.CreateDirectory(a);
			File.WriteAllBytes(Path.Combine(a, b.ltm), b.ltn);
			return true;
		}
		catch (Exception ex) when (ex is IOException || ex is UnauthorizedAccessException)
		{
			Debug.LogWarning("[MatchLog] slice " + b.ltm + " not written: " + ex.Message);
			return false;
		}
	}
}
