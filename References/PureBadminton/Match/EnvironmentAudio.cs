using System.Collections;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class EnvironmentAudio : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AudioClip applauseClip;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AudioClip applauseCheeringClip;

	private AudioSource lko;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected void Start()
	{
		lko = GetComponent<AudioSource>();
	}

	public void dwg(bool a)
	{
		lko.PlayOneShot(a ? applauseCheeringClip : applauseClip);
	}

	public IEnumerator dwh(bool a)
	{
		yield return dwi(a ? applauseCheeringClip : applauseClip);
	}

	private IEnumerator dwi(AudioClip a)
	{
		lko.PlayOneShot(a);
		yield return this.guu(a.length);
	}
}
