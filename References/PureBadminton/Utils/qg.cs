using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qg
{
	[JsonProperty("WinningSets")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int WinningSets;

	[JsonProperty("SetPoints")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int SetPoints;

	[JsonProperty("Difficulty")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public rk.DifficultyLevel Difficulty;

	[JsonIgnore]
	public int? mrh;

	[JsonIgnore]
	public int? mri;

	[JsonIgnore]
	public float plg => MatchSettings.gbx(WinningSets, SetPoints);
}
