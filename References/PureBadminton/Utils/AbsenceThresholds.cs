using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct AbsenceThresholds
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float GraceSeconds;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float BudgetSeconds;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int EpisodeLimit;
}
