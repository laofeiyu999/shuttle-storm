using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextMeshSpawner : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int SpawnType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int NumberOfNPC = 12;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Font TheFont;

	private TextMeshProFloatingText kfx;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		for (int i = 0; i < NumberOfNPC; i++)
		{
			if (SpawnType == 0)
			{
				GameObject gameObject = new GameObject();
				gameObject.transform.position = new Vector3(Random.Range(-95f, 95f), 0.5f, Random.Range(-95f, 95f));
				TextMeshPro textMeshPro = gameObject.AddComponent<TextMeshPro>();
				textMeshPro.fontSize = 96f;
				textMeshPro.text = "!";
				textMeshPro.color = new Color32(byte.MaxValue, byte.MaxValue, 0, byte.MaxValue);
				kfx = gameObject.AddComponent<TextMeshProFloatingText>();
				kfx.SpawnType = 0;
			}
			else
			{
				GameObject gameObject2 = new GameObject();
				gameObject2.transform.position = new Vector3(Random.Range(-95f, 95f), 0.5f, Random.Range(-95f, 95f));
				TextMesh textMesh = gameObject2.AddComponent<TextMesh>();
				textMesh.GetComponent<Renderer>().sharedMaterial = TheFont.material;
				textMesh.font = TheFont;
				textMesh.anchor = TextAnchor.LowerCenter;
				textMesh.fontSize = 96;
				textMesh.color = new Color32(byte.MaxValue, byte.MaxValue, 0, byte.MaxValue);
				textMesh.text = "!";
				kfx = gameObject2.AddComponent<TextMeshProFloatingText>();
				kfx.SpawnType = 1;
			}
		}
	}
}
