using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public readonly struct IdealPowerZone
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly float Min;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly float Max;

	public bool pgs => Min == Max;

	public IdealPowerZone(float min, float max)
	{
		Min = min;
		Max = max;
	}
}
