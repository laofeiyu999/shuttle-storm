using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct ScoreCheck
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int SetIndex;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int TeamAScore;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int TeamBScore;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int TotalRallies;
}
