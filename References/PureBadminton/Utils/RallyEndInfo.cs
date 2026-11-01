using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct RallyEndInfo
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool LastShotByTeamA;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool TouchedPartner;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool TouchedOpponent;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool EndedOut;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool EndedInNet;
}
