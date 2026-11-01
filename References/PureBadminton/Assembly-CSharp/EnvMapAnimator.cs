using System.Collections;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class EnvMapAnimator : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Vector3 RotationSpeeds;

	private TMP_Text jzs;

	private Material jzt;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		jzs = GetComponent<TMP_Text>();
		jzt = jzs.fontSharedMaterial;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private IEnumerator Start()
	{
		Matrix4x4 value = default(Matrix4x4);
		while (true)
		{
			value.SetTRS(Vector3.zero, Quaternion.Euler(Time.time * RotationSpeeds.x, Time.time * RotationSpeeds.y, Time.time * RotationSpeeds.z), Vector3.one);
			jzt.SetMatrix("_EnvMatrix", value);
			yield return null;
		}
	}
}
