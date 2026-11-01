using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerUnlockedEquipment
{
	[JsonProperty("Type")]
	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public pz.EquipmentType Type
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Id")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Id
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Unread", DefaultValueHandling = DefaultValueHandling.Ignore)]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public bool Unread
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}
}
