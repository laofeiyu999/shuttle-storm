using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum Continent
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Europe,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Asia,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	America,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Oceania,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Africa
}
