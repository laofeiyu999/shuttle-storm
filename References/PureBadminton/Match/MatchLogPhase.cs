using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum MatchLogPhase : byte
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Free,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Shot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Autopilot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Reset
}
