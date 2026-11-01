using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum TournamentPhase
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Finished = 0,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Final = 1,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Half = 2,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Quarter = 3,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	OtherRound = 4,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Qualifications = 98,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Groups = 99
}
