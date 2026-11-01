using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum ExerciseType
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Shadow,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	MultiShuttle,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	ThemeMatch
}
