using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class AchievementReward
{
	[JsonProperty("Type")]
	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public AchievementRewardType Type
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

	public pz.EquipmentType? fhz()
	{
		return Type switch
		{
			AchievementRewardType.Top => pz.EquipmentType.Top, 
			AchievementRewardType.Bottom => pz.EquipmentType.Bottom, 
			AchievementRewardType.Shoes => pz.EquipmentType.Shoes, 
			AchievementRewardType.Racket => pz.EquipmentType.Racket, 
			_ => null, 
		};
	}

	public CharacterStatsType? fia()
	{
		return Type switch
		{
			AchievementRewardType.Defense => CharacterStatsType.Defense, 
			AchievementRewardType.Power => CharacterStatsType.Power, 
			AchievementRewardType.Precision => CharacterStatsType.Precision, 
			AchievementRewardType.Speed => CharacterStatsType.Speed, 
			AchievementRewardType.Stamina => CharacterStatsType.Stamina, 
			_ => null, 
		};
	}
}
