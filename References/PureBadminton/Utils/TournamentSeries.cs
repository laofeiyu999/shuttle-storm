using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum TournamentSeries
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	WorldTournaments,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Super1000,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Super750,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Super500,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Super300,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Super100,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InternationalChallenge
}
