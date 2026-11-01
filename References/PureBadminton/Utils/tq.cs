using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class tq : tp
{
	[Flags]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum ShadowZones
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FrontCorners = 0,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RearCorners = 1,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Side = 2,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FrontRearCenter = 3
	}

	public ShadowZones ncm;

	public override ExerciseType pot => ExerciseType.Shadow;
}
