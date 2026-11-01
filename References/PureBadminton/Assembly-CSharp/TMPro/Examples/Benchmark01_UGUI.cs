using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Benchmark01_UGUI : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int BenchmarkType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Canvas canvas;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_FontAsset TMProFont;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Font TextMeshFont;

	private TextMeshProUGUI kaq;

	private Text kar;

	private const string kas = "The <#0050FF>count is: </color>";

	private const string kat = "The <color=#0050FF>count is: </color>";

	private Material kau;

	private Material kav;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private IEnumerator Start()
	{
		if (BenchmarkType == 0)
		{
			kaq = base.gameObject.AddComponent<TextMeshProUGUI>();
			if (TMProFont != null)
			{
				kaq.font = TMProFont;
			}
			kaq.fontSize = 48f;
			kaq.alignment = TextAlignmentOptions.Center;
			kaq.extraPadding = true;
			kau = kaq.font.material;
			kav = Resources.Load<Material>("Fonts & Materials/LiberationSans SDF - BEVEL");
		}
		else if (BenchmarkType == 1)
		{
			kar = base.gameObject.AddComponent<Text>();
			if (TextMeshFont != null)
			{
				kar.font = TextMeshFont;
			}
			kar.fontSize = 48;
			kar.alignment = TextAnchor.MiddleCenter;
		}
		for (int i = 0; i <= 1000000; i++)
		{
			if (BenchmarkType == 0)
			{
				kaq.text = "The <#0050FF>count is: </color>" + i % 1000;
				if (i % 1000 == 999)
				{
					TextMeshProUGUI textMeshProUGUI = kaq;
					Material fontSharedMaterial;
					if (!(kaq.fontSharedMaterial == kau))
					{
						Material material2 = (kaq.fontSharedMaterial = kau);
						fontSharedMaterial = material2;
					}
					else
					{
						Material material2 = (kaq.fontSharedMaterial = kav);
						fontSharedMaterial = material2;
					}
					textMeshProUGUI.fontSharedMaterial = fontSharedMaterial;
				}
			}
			else if (BenchmarkType == 1)
			{
				kar.text = "The <color=#0050FF>count is: </color>" + i % 1000;
			}
			yield return null;
		}
		yield return null;
	}
}
