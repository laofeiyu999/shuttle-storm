using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum TournamentCategory
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	MenSingles,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	WomenSingles,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	MenDoubles,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	WomenDoubles,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	MixedDoubles
}
