using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchPingDisplay : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI _text;

	private const float lux = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		if (MatchSettings.Current?.Online == null || !rk.pnn)
		{
			base.gameObject.SetActive(value: false);
			return;
		}
		_text.text = "";
		InvokeRepeating("Refresh", 1f, 1f);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Refresh()
	{
		long? num = GameManager.Current?.OnlineManager?.pgk;
		_text.text = (num.HasValue ? bda.itt(num.Value, baw.ijg(num.Value)) : "");
	}
}
