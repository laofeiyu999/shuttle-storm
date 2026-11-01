using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class QuadraticDrag : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float Drag;

	private Rigidbody mbt;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		mbt = GetComponent<Rigidbody>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (mbt.linearVelocity.magnitude != 0f)
		{
			Vector3 force = -mbt.linearVelocity * mbt.linearVelocity.magnitude * Drag * Time.fixedDeltaTime;
			mbt.AddForce(force, ForceMode.VelocityChange);
		}
	}
}
