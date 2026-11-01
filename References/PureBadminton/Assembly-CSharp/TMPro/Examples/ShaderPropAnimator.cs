using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShaderPropAnimator : MonoBehaviour
{
	private Renderer kbs;

	private Material kbt;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimationCurve GlowCurve;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float m_frame;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kbs = GetComponent<Renderer>();
		kbt = kbs.material;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bhm());
	}

	private IEnumerator bhm()
	{
		m_frame = Random.Range(0f, 1f);
		while (true)
		{
			float value = GlowCurve.Evaluate(m_frame);
			kbt.SetFloat(ShaderUtilities.ID_GlowPower, value);
			m_frame += Time.deltaTime * Random.Range(0.2f, 0.3f);
			yield return new WaitForEndOfFrame();
		}
	}
}
