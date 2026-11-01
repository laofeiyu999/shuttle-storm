using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterRandomBlink : MonoBehaviour
{
	private Animator mny;

	private bool mnz = true;

	public bool pjh
	{
		get
		{
			return base.enabled;
		}
		set
		{
			if (!value && base.enabled)
			{
				StartCoroutine(fru());
			}
			base.enabled = value;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		mny = GetComponent<Animator>();
		if (base.enabled)
		{
			StartCoroutine(fru());
		}
	}

	private IEnumerator fru()
	{
		yield return new WaitForSeconds(Random.Range(3, 6));
		if (mnz)
		{
			mny.SetTrigger("Blink");
			StartCoroutine(fru());
		}
	}
}
