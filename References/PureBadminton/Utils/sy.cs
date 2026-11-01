using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class sy
{
	public int? nap { get; set; }

	public int? naq { get; set; }

	public sy()
	{
	}

	public sy(MatchSettings.PlayerSettings a)
	{
		nap = a?.PlayerId;
		naq = a?.DeviceId;
	}
}
