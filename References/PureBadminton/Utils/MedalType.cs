using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum MedalType
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	None,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Bronze,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Silver,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Gold
}
