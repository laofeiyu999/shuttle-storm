using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum PairInvitationStatus
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InvitationSent = 1,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InvitationReceived,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InvitationRefused,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	InvitationAccepted
}
