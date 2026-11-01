using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
public enum AchievementCategory
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Tournament,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Training,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Ranking,
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
	Match
}
