using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public readonly struct MatchLogFrame
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public static readonly MatchLogFrame Identity = new MatchLogFrame(Vector3.zero);

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly Vector3 Origin;

	public MatchLogFrame(Vector3 origin)
	{
		Origin = origin;
	}

	public static MatchLogFrame eet(Transform a)
	{
		return new MatchLogFrame((a != null) ? a.position : Vector3.zero);
	}

	public Vector3 eeu(Vector3 a)
	{
		return a - Origin;
	}
}
