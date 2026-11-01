using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum CharacterStatsType
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Defense,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Power,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Precision,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Speed,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Stamina
}
