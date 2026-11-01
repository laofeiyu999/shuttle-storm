using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;

[RequireComponent(typeof(TextMeshProUGUI))]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class LocalizedTextMeshPro : MonoBehaviour
{
	private TextMeshProUGUI msr;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public LocalizedString localizedString;

	public LocalizedString plk
	{
		get
		{
			return localizedString;
		}
		set
		{
			if (localizedString != null && base.isActiveAndEnabled)
			{
				localizedString.StringChanged -= gay;
			}
			localizedString = value;
			if (localizedString != null && base.isActiveAndEnabled)
			{
				localizedString.StringChanged += gay;
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		msr = GetComponent<TextMeshProUGUI>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		if (localizedString != null)
		{
			localizedString.StringChanged += gay;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		if (localizedString != null)
		{
			localizedString.StringChanged -= gay;
		}
	}

	private void gay(string a)
	{
		msr.text = a;
	}
}
