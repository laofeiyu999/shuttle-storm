using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class rs
{
	[JsonProperty("id")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Id;

	[JsonProperty("source")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Source = "Malaysia-Axiata";

	[JsonProperty("location")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Location;

	[JsonProperty("floorColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Color? FloorColor;

	[JsonProperty("courtColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Color? CourtColor;

	[JsonProperty("judgeChairColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Color? JudgeChairColor;

	[JsonProperty("wallsColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Color? WallsColor;
}
