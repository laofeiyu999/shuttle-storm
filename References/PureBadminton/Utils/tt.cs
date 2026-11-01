using System.Globalization;
using OPS.Obfuscator.Attribute;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class tt
{
	public static CultureInfo pou
	{
		get
		{
			if (!(LocalizationSettings.SelectedLocale != null))
			{
				return null;
			}
			return LocalizationSettings.SelectedLocale.Identifier.CultureInfo;
		}
	}

	public static string gra(string a, string b, params object[] arguments)
	{
		return LocalizationSettings.StringDatabase.GetLocalizedString(a, b, arguments);
	}
}
