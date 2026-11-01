using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TeleType : MonoBehaviour
{
	private string kea = "Example <sprite=2> of using <sprite=7> <#ffa000>Graphics Inline</color> <sprite=5> with Text in <font=\"Bangers SDF\" material=\"Bangers SDF - Drop Shadow\">TextMesh<#40a0ff>Pro</color></font><sprite=0> and Unity<sprite=1>";

	private string keb = "Example <sprite=2> of using <sprite=7> <#ffa000>Graphics Inline</color> <sprite=5> with Text in <font=\"Bangers SDF\" material=\"Bangers SDF - Drop Shadow\">TextMesh<#40a0ff>Pro</color></font><sprite=0> and Unity<sprite=2>";

	private TMP_Text kec;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kec = GetComponent<TMP_Text>();
		kec.text = kea;
		kec.textWrappingMode = TextWrappingModes.Normal;
		kec.alignment = TextAlignmentOptions.Top;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private IEnumerator Start()
	{
		kec.ForceMeshUpdate();
		int characterCount = kec.textInfo.characterCount;
		int num = 0;
		while (true)
		{
			int num2 = num % (characterCount + 1);
			kec.maxVisibleCharacters = num2;
			if (num2 >= characterCount)
			{
				yield return new WaitForSeconds(1f);
				kec.text = keb;
				yield return new WaitForSeconds(1f);
				kec.text = kea;
				yield return new WaitForSeconds(1f);
			}
			num++;
			yield return new WaitForSeconds(0.05f);
		}
	}
}
