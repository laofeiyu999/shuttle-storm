using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SimpleScript : MonoBehaviour
{
	private TextMeshPro kbu;

	private const string kbv = "The <#0050FF>count is: </color>{0:2}";

	private float kbw;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		kbu = base.gameObject.AddComponent<TextMeshPro>();
		kbu.autoSizeTextContainer = true;
		kbu.fontSize = 48f;
		kbu.alignment = TextAlignmentOptions.Center;
		kbu.textWrappingMode = TextWrappingModes.NoWrap;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		kbu.SetText("The <#0050FF>count is: </color>{0:2}", kbw % 1000f);
		kbw += 1f * Time.deltaTime;
	}
}
