using System;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class Country
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string name;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string shortName;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string alpha2;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string alpha3;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string[] primaryColors;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string[] secondaryColors;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string continent;

	[JsonProperty("Outfit")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CharacterOutfit Outfit;

	public Continent pkz => continent switch
	{
		"EU" => Continent.Europe, 
		"AS" => Continent.Asia, 
		"AM" => Continent.America, 
		"OC" => Continent.Oceania, 
		"AF" => Continent.Africa, 
		_ => throw new NotImplementedException(), 
	};

	[OnDeserialized]
	internal void fxh(StreamingContext a)
	{
		if (Outfit == null)
		{
			Outfit = CharacterOutfit.ftd(this);
		}
		Outfit.Top.Id = "Country_" + alpha3;
		if (string.IsNullOrEmpty(Outfit.Bottom.Id))
		{
			Outfit.Bottom.Id = "Country_" + alpha3;
		}
	}
}
