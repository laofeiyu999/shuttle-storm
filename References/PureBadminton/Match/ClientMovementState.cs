using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct ClientMovementState
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public uint Tick;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public Vector3 Position;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float Angle;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public string AnimationName;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float NormalizedTime;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool InPose;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public Vector2 MoveStick;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int ShotType;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public float ShotPower;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public Vector2 ShotDirection;
}
