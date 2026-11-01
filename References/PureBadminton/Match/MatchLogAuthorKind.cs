using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum MatchLogAuthorKind : byte
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Player,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Server
}
