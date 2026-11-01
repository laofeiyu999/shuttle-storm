using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qz
{
	[JsonProperty("Distance")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalDistance;

	[JsonProperty("AggressiveTime")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int PercentTimeAggressive;

	[JsonProperty("Clear")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalClear;

	[JsonProperty("Smash")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalSmash;

	[JsonProperty("Midcourt")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalMidcourt;

	[JsonProperty("Drop")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalDrop;

	[JsonProperty("Defense")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int TotalDefense;

	[JsonProperty("Energy")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public float EnergySpent;

	public int pmh => TotalClear + TotalSmash + TotalMidcourt + TotalDrop;
}
