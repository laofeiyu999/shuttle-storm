using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VertexColorCycler : MonoBehaviour
{
	private TMP_Text kgd;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kgd = GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bjg());
	}

	private IEnumerator bjg()
	{
		kgd.ForceMeshUpdate();
		TMP_TextInfo textInfo = kgd.textInfo;
		int num = 0;
		_ = (Color32)kgd.color;
		while (true)
		{
			int characterCount = textInfo.characterCount;
			if (characterCount == 0)
			{
				yield return new WaitForSeconds(0.25f);
				continue;
			}
			int materialReferenceIndex = textInfo.characterInfo[num].materialReferenceIndex;
			Color32[] colors = textInfo.meshInfo[materialReferenceIndex].colors32;
			int vertexIndex = textInfo.characterInfo[num].vertexIndex;
			if (textInfo.characterInfo[num].isVisible)
			{
				colors[vertexIndex + 3] = (colors[vertexIndex + 2] = (colors[vertexIndex + 1] = (colors[vertexIndex] = new Color32((byte)Random.Range(0, 255), (byte)Random.Range(0, 255), (byte)Random.Range(0, 255), byte.MaxValue))));
				kgd.UpdateVertexData(TMP_VertexDataUpdateFlags.Colors32);
			}
			num = (num + 1) % characterCount;
			yield return new WaitForSeconds(0.05f);
		}
	}
}
