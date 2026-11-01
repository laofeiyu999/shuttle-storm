using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct MatchSnapshot
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool[] RallyWinners;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int[] SetRallyCounts;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float[] SetDurations;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public SetSummaryStats[] SetSummaries;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool[] SetHasSummary;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool TeamAServe;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool IsTeamAOnSideA;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool IsTeamAInverted;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool IsTeamBInverted;
}
