using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShuttleNetCollisionFix : MonoBehaviour
{
	private CourtManager mdr;

	private Rigidbody mds;

	private Vector3 mdt;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		mds = base.gameObject.GetComponent<Rigidbody>();
		mdr = GameManager.Current.Court;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (mds.linearVelocity.y > 0f && mds.linearVelocity.y > mdt.y + 3f && base.transform.position.y > 1.55f && base.transform.position.y - 1.55f < 0.1f && Mathf.Abs(base.transform.position.z - mdr.pci) < 0.2f)
		{
			mds.linearVelocity = new Vector3(mds.linearVelocity.x, mdt.y + 3f, mds.linearVelocity.z);
		}
		mdt = mds.linearVelocity;
	}
}
