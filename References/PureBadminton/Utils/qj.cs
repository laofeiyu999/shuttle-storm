using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class qj
{
	public const string msh = "matchCount";

	private static int? msi;

	public static int plj
	{
		get
		{
			if (!msi.HasValue)
			{
				msi = PlayerPrefs.GetInt("matchCount", 1);
			}
			return msi.Value;
		}
		set
		{
			PlayerPrefs.SetInt("matchCount", value);
			msi = value;
			PlayerPrefs.Save();
		}
	}
}
