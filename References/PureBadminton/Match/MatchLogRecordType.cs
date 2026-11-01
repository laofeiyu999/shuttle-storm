using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum MatchLogRecordType : byte
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	MatchHeader = 1,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InputSent,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InputReceived,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	StateSent,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	StateReceived,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Clamp,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Positions,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	PotentialShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	PreShotInputs,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	AuthShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	CancelShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	ShuttleReseed,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	RallyEnd,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Intensity,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Energy,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Rtt,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	ServeForced,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Resync,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Connection,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Alert
}
