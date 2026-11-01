using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum CancelShotReason : byte
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Unknown,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	NoInput,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	TooFar,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	NotOverNet,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	RallyEnded,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	TeammatePlayed,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Missed,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	TrajectoryChanged,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	ShuttleTouched
}
