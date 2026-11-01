using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum TrainingType
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Movements,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	ClearLiftShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	DropNetShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	SmashKillShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	DriveShot,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Defense
}
