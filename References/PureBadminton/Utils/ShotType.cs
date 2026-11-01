using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum ShotType
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Clear,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Drop,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Smash,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Midcourt
}
