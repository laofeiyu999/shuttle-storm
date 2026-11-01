using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VertexShakeB : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float AngleMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float SpeedMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float CurveScale = 1f;

	private TMP_Text kgz;

	private bool kha;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kgz = GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bjx);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bjx);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bjy());
	}

	private void bjx(Object a)
	{
		if ((bool)(a = kgz))
		{
			kha = true;
		}
	}

	private IEnumerator bjy()
	{
		kgz.ForceMeshUpdate();
		TMP_TextInfo textInfo = kgz.textInfo;
		Vector3[][] array = new Vector3[0][];
		kha = true;
		while (true)
		{
			if (kha)
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
				kha = false;
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
				Quaternion q = Quaternion.Euler(0f, 0f, Random.Range(-0.25f, 0.25f));
				for (int k = firstCharacterIndex; k <= lastCharacterIndex; k++)
				{
					if (textInfo.characterInfo[k].isVisible)
					{
						int materialReferenceIndex = textInfo.characterInfo[k].materialReferenceIndex;
						int vertexIndex = textInfo.characterInfo[k].vertexIndex;
						Vector3[] vertices = textInfo.meshInfo[materialReferenceIndex].vertices;
						Vector3 vector2 = (vertices[vertexIndex] + vertices[vertexIndex + 2]) / 2f;
						array[materialReferenceIndex][vertexIndex] = vertices[vertexIndex] - vector2;
						array[materialReferenceIndex][vertexIndex + 1] = vertices[vertexIndex + 1] - vector2;
						array[materialReferenceIndex][vertexIndex + 2] = vertices[vertexIndex + 2] - vector2;
						array[materialReferenceIndex][vertexIndex + 3] = vertices[vertexIndex + 3] - vector2;
						float num2 = Random.Range(0.95f, 1.05f);
						Matrix4x4 matrix4x = Matrix4x4.TRS(Vector3.one, Quaternion.identity, Vector3.one * num2);
						array[materialReferenceIndex][vertexIndex] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex]);
						array[materialReferenceIndex][vertexIndex + 1] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 1]);
						array[materialReferenceIndex][vertexIndex + 2] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 2]);
						array[materialReferenceIndex][vertexIndex + 3] = matrix4x.MultiplyPoint3x4(array[materialReferenceIndex][vertexIndex + 3]);
						array[materialReferenceIndex][vertexIndex] += vector2;
						array[materialReferenceIndex][vertexIndex + 1] += vector2;
						array[materialReferenceIndex][vertexIndex + 2] += vector2;
						array[materialReferenceIndex][vertexIndex + 3] += vector2;
						array[materialReferenceIndex][vertexIndex] -= vector;
						array[materialReferenceIndex][vertexIndex + 1] -= vector;
						array[materialReferenceIndex][vertexIndex + 2] -= vector;
						array[materialReferenceIndex][vertexIndex + 3] -= vector;
						matrix4x = Matrix4x4.TRS(Vector3.one, q, Vector3.one);
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
				kgz.UpdateGeometry(textInfo.meshInfo[l].mesh, l);
			}
			yield return new WaitForSeconds(0.1f);
		}
	}
}
