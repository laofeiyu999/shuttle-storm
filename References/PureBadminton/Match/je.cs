using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class je
{
	public static MatchLogTarget edl(MatchSettings.qn a)
	{
		if (a == null || string.IsNullOrEmpty(a.msw))
		{
			return MatchLogTarget.None;
		}
		if (a.plo)
		{
			return MatchLogTarget.LocalDirectory;
		}
		if (!a.mtb)
		{
			return MatchLogTarget.None;
		}
		return MatchLogTarget.Storage;
	}
}
