using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Benchmark01 : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int BenchmarkType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_FontAsset TMProFont;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Font TextMeshFont;

	private TextMeshPro kaf;

	private TextContainer kag;

	private TextMesh kah;

	private const string kai = "The <#0050FF>count is: </color>{0}";

	private const string kaj = "The <color=#0050FF>count is: </color>";

	private Material kak;

	private Material kal;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private IEnumerator Start()
	{
		if (BenchmarkType == 0)
		{
			kaf = base.gameObject.AddComponent<TextMeshPro>();
			kaf.autoSizeTextContainer = true;
			if (TMProFont != null)
			{
				kaf.font = TMProFont;
			}
			kaf.fontSize = 48f;
			kaf.alignment = TextAlignmentOptions.Center;
			kaf.extraPadding = true;
			kaf.textWrappingMode = TextWrappingModes.NoWrap;
			kak = kaf.font.material;
			kal = Resources.Load<Material>("Fonts & Materials/LiberationSans SDF - Drop Shadow");
		}
		else if (BenchmarkType == 1)
		{
			kah = base.gameObject.AddComponent<TextMesh>();
			if (TextMeshFont != null)
			{
				kah.font = TextMeshFont;
				kah.GetComponent<Renderer>().sharedMaterial = kah.font.material;
			}
			else
			{
				kah.font = Resources.Load("Fonts/ARIAL", typeof(Font)) as Font;
				kah.GetComponent<Renderer>().sharedMaterial = kah.font.material;
			}
			kah.fontSize = 48;
			kah.anchor = TextAnchor.MiddleCenter;
		}
		for (int i = 0; i <= 1000000; i++)
		{
			if (BenchmarkType == 0)
			{
				kaf.SetText("The <#0050FF>count is: </color>{0}", i % 1000);
				if (i % 1000 == 999)
				{
					TextMeshPro textMeshPro = kaf;
					Material fontSharedMaterial;
					if (!(kaf.fontSharedMaterial == kak))
					{
						Material material2 = (kaf.fontSharedMaterial = kak);
						fontSharedMaterial = material2;
					}
					else
					{
						Material material2 = (kaf.fontSharedMaterial = kal);
						fontSharedMaterial = material2;
					}
					textMeshPro.fontSharedMaterial = fontSharedMaterial;
				}
			}
			else if (BenchmarkType == 1)
			{
				kah.text = "The <color=#0050FF>count is: </color>" + i % 1000;
			}
			yield return null;
		}
		yield return null;
	}
}
