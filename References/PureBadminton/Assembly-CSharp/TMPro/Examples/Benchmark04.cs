using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Benchmark04 : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int SpawnType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int MinPointSize = 12;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int MaxPointSize = 64;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int Steps = 4;

	private Transform kax;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		kax = base.transform;
		float num = 0f;
		float num3 = (Camera.main.orthographicSize = Screen.height / 2);
		float num4 = num3;
		float num5 = (float)Screen.width / (float)Screen.height;
		for (int i = MinPointSize; i <= MaxPointSize; i += Steps)
		{
			if (SpawnType == 0)
			{
				GameObject gameObject = new GameObject("Text - " + i + " Pts");
				if (num > num4 * 2f)
				{
					break;
				}
				gameObject.transform.position = kax.position + new Vector3(num5 * (0f - num4) * 0.975f, num4 * 0.975f - num, 0f);
				TextMeshPro textMeshPro = gameObject.AddComponent<TextMeshPro>();
				textMeshPro.rectTransform.pivot = new Vector2(0f, 0.5f);
				textMeshPro.textWrappingMode = TextWrappingModes.NoWrap;
				textMeshPro.extraPadding = true;
				textMeshPro.isOrthographic = true;
				textMeshPro.fontSize = i;
				textMeshPro.text = i + " pts - Lorem ipsum dolor sit...";
				textMeshPro.color = new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue);
				num += (float)i;
			}
		}
	}
}
