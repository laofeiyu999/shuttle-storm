using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShuttleRotation : MonoBehaviour
{
	[Tooltip("Rotation rate per (m/s) of shuttle speed. Faster shuttle = more aerodynamic torque = snaps to direction faster. Total rate = rotationSpeedPerVelocity * |v|.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float rotationSpeedPerVelocity = 2f;

	[Tooltip("Pitch angle (degrees) from horizontal of the cork-feathers axis when the shuttle lies on the floor. ~15° = cork tip and feather tips both touching the ground.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float restingPitchAngle = 15f;

	[Tooltip("Rotation rate (1/s) when the shuttle settles to its resting orientation.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float restingRotationSpeed = 3f;

	[Tooltip("If the velocity changes by more than this (m/s) between frames (e.g. a racket hit), snap rotation to the new direction instantly.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float snapVelocityDelta = 5f;

	private ShuttleTrajectoryRunner mdu;

	private Vector3 mdv = Vector3.forward;

	private Vector3 mdw;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		mdu = base.gameObject.GetComponent<ShuttleTrajectoryRunner>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (mdu == null)
		{
			return;
		}
		Vector3 vector = mdu.mej;
		float magnitude = vector.magnitude;
		Quaternion quaternion;
		float num;
		if (magnitude > 0.1f)
		{
			quaternion = Quaternion.LookRotation(vector) * Quaternion.Euler(90f, 0f, 0f);
			num = rotationSpeedPerVelocity * magnitude;
			Vector3 vector2 = new Vector3(vector.x, 0f, vector.z);
			if (vector2.sqrMagnitude > 0.0001f)
			{
				mdv = vector2.normalized;
			}
		}
		else
		{
			float f = MathF.PI / 180f * restingPitchAngle;
			quaternion = Quaternion.LookRotation(mdv * Mathf.Cos(f) + Vector3.down * Mathf.Sin(f)) * Quaternion.Euler(90f, 0f, 0f);
			num = restingRotationSpeed;
		}
		bool flag = (vector - mdw).magnitude > snapVelocityDelta;
		base.transform.rotation = (flag ? quaternion : Quaternion.Slerp(base.transform.rotation, quaternion, 1f - Mathf.Exp((0f - num) * Time.fixedDeltaTime)));
		mdw = vector;
	}
}
