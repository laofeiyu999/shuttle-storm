using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VertexShakeA : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float AngleMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float SpeedMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float ScaleMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float RotationMultiplier = 1f;

	private TMP_Text kgs;

	private bool kgt;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kgs = GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bjr);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bjr);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bjs());
	}

	private void bjr(Object a)
	{
		if ((bool)(a = kgs))
		{
			kgt = true;
		}
	}

	private IEnumerator bjs()
	{
		kgs.ForceMeshUpdate();
		TMP_TextInfo textInfo = kgs.textInfo;
		Vector3[][] array = new Vector3[0][];
		kgt = true;
		while (true)
		{
			if (kgt)
			{
				if (array.Length < textInfo.meshInfo.Length)
				{
					array = new Vector3[textInfo.meshInfo.Length][];
				}
				for (int i = 0; i < textInfo.meshInfo.Length; i++)
				{
					int num = textInfo.meshInfo[i].vertices.Length;
					array[i] = new Vector3[num];
				}
				kgt = false;
			}
			if (textInfo.characterCount == 0)
			{
				yield return new WaitForSeconds(0.25f);
				continue;
			}
			int lineCount = textInfo.lineCount;
			for (int j = 0; j < lineCount; j++)
			{
				int firstCharacterIndex = textInfo.lineInfo[j].firstCharacterIndex;
				int lastCharacterIndex = textInfo.lineInfo[j].lastCharacterIndex;
				Vector3 vector = (textInfo.characterInfo[firstCharacterIndex].bottomLeft + textInfo.characterInfo[lastCharacterIndex].topRight) / 2f;
				Quaternion q = Quaternion.Euler(0f, 0f, Random.Range(-0.25f, 0.25f) * RotationMultiplier);
				for (int k = firstCharacterIndex; k <= lastCharacterIndex; k++)
				{
					if (textInfo.characterInfo[k].isVisible)
					{
						int materialReferenceIndex = textInfo.characterInfo[k].materialReferenceIndex;
						int vertexIndex = textInfo.characterInfo[k].vertexIndex;
						Vector3[] vertices = textInfo.meshInfo[materialReferenceIndex].vertices;
						array[materialReferenceIndex][vertexIndex] = vertices[vertexIndex] - vector;
						array[materialReferenceIndex][vertexIndex + 1] = vertices[vertexIndex + 1] - vector;
						array[materialReferenceIndex][vertexIndex + 2] = vertices[vertexIndex + 2] - vector;
						array[materialReferenceIndex][vertexIndex + 3] = vertices[vertexIndex + 3] - vector;
						float num2 = Random.Range(0.995f - 0.001f * ScaleMultiplier, 1.005f + 0.001f * ScaleMultiplier);
						Matrix4x4 matrix4x = Matrix4x4.TRS(Vector3.one, q, Vector3.one * num2);
						array[materialReferenceIndex][vertexIndex] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex]);
						array[materialReferenceIndex][vertexIndex + 1] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 1]);
						array[materialReferenceIndex][vertexIndex + 2] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 2]);
						array[materialReferenceIndex][vertexIndex + 3] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 3]);
						array[materialReferenceIndex][vertexIndex] += vector;
						array[materialReferenceIndex][vertexIndex + 1] += vector;
						array[materialReferenceIndex][vertexIndex + 2] += vector;
						array[materialReferenceIndex][vertexIndex + 3] += vector;
					}
				}
			}
			for (int l = 0; l < textInfo.meshInfo.Length; l++)
			{
				textInfo.meshInfo[l].mesh.vertices = array[l];
				kgs.UpdateGeometry(textInfo.meshInfo[l].mesh, l);
			}
			yield return new WaitForSeconds(0.1f);
		}
	}
}
