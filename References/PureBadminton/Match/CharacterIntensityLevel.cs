using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum CharacterIntensityLevel
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Default,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Aggressive,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Efficient
}
