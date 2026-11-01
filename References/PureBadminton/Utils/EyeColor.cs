using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum EyeColor
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Black,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Brown,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Hazel,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Green,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Blue,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Lightblue,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Grey
}
