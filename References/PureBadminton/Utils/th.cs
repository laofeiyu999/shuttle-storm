using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class th
{
	[JsonProperty("modulo")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int Modulo = 1;

	[JsonProperty("remainder")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int Remainder;

	[JsonProperty("equals")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public bool IsEqual = true;

	public bool gqf(int a)
	{
		if (Modulo != 0)
		{
			return a % Modulo == Remainder == IsEqual;
		}
		return true;
	}
}
