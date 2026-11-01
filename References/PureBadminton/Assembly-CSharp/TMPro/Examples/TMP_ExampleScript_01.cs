using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_ExampleScript_01 : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum objectType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TextMeshPro,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TextMeshProUGUI
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public objectType ObjectType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool isStatic;

	private TMP_Text kce;

	private const string kcf = "The count is <#0080ff>{0}</color>";

	private int kcg;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (ObjectType == objectType.TextMeshPro)
		{
			kce = GetComponent<TextMeshPro>() ?? base.gameObject.AddComponent<TextMeshPro>();
		}
		else
		{
			kce = GetComponent<TextMeshProUGUI>() ?? base.gameObject.AddComponent<TextMeshProUGUI>();
		}
		kce.font = Resources.Load<TMP_FontAsset>("Fonts & Materials/Anton SDF");
		kce.fontSharedMaterial = Resources.Load<Material>("Fonts & Materials/Anton SDF - Drop Shadow");
		kce.fontSize = 120f;
		kce.text = "A <#0080ff>simple</color> line of text.";
		Vector2 preferredValues = kce.GetPreferredValues(float.PositiveInfinity, float.PositiveInfinity);
		kce.rectTransform.sizeDelta = new Vector2(preferredValues.x, preferredValues.y);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (!isStatic)
		{
			kce.SetText("The count is <#0080ff>{0}</color>", kcg % 1000);
			kcg++;
		}
	}
}
