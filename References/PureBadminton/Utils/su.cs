using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class su
{
	[JsonProperty("Winner")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public bool Winner = true;

	[JsonProperty("GroupId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? GroupId;

	[JsonProperty("RoundId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? RoundId;

	[JsonProperty("RoundMatchId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? RoundMatchId;
}
