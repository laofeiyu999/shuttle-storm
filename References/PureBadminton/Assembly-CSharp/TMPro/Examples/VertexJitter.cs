using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VertexJitter : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	private struct VertexAnim
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float angleRange;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float angle;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float speed;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float AngleMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float SpeedMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float CurveScale = 1f;

	private TMP_Text kgl;

	private bool kgm;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kgl = GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bjl);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bjl);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bjm());
	}

	private void bjl(Object a)
	{
		if (a == kgl)
		{
			kgm = true;
		}
	}

	private IEnumerator bjm()
	{
		kgl.ForceMeshUpdate();
		TMP_TextInfo textInfo = kgl.textInfo;
		int num = 0;
		kgm = true;
		VertexAnim[] array = new VertexAnim[1024];
		for (int i = 0; i < 1024; i++)
		{
			array[i].angleRange = Random.Range(10f, 25f);
			array[i].speed = Random.Range(1f, 3f);
		}
		TMP_MeshInfo[] array2 = textInfo.CopyMeshInfoVertexData();
		while (true)
		{
			if (kgm)
			{
				array2 = textInfo.CopyMeshInfoVertexData();
				kgm = false;
			}
			int characterCount = textInfo.characterCount;
			if (characterCount == 0)
			{
				yield return new WaitForSeconds(0.25f);
				continue;
			}
			for (int j = 0; j < characterCount; j++)
			{
				if (textInfo.characterInfo[j].isVisible)
				{
					VertexAnim vertexAnim = array[j];
					int materialReferenceIndex = textInfo.characterInfo[j].materialReferenceIndex;
					int vertexIndex = textInfo.characterInfo[j].vertexIndex;
					Vector3[] vertices = array2[materialReferenceIndex].vertices;
					Vector3 vector = (Vector2)((vertices[vertexIndex] + vertices[vertexIndex + 2]) / 2f);
					Vector3[] vertices2 = textInfo.meshInfo[materialReferenceIndex].vertices;
					vertices2[vertexIndex] = vertices[vertexIndex] - vector;
					vertices2[vertexIndex + 1] = vertices[vertexIndex + 1] - vector;
					vertices2[vertexIndex + 2] = vertices[vertexIndex + 2] - vector;
					vertices2[vertexIndex + 3] = vertices[vertexIndex + 3] - vector;
					vertexAnim.angle = Mathf.SmoothStep(0f - vertexAnim.angleRange, vertexAnim.angleRange, Mathf.PingPong((float)num / 25f * vertexAnim.speed, 1f));
					Matrix4x4 matrix4x = Matrix4x4.TRS(new Vector3(Random.Range(-0.25f, 0.25f), Random.Range(-0.25f, 0.25f), 0f) * CurveScale, Quaternion.Euler(0f, 0f, Random.Range(-5f, 5f) * AngleMultiplier), Vector3.one);
					vertices2[vertexIndex] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex]);
					vertices2[vertexIndex + 1] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 1]);
					vertices2[vertexIndex + 2] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 2]);
					vertices2[vertexIndex + 3] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 3]);
					vertices2[vertexIndex] += vector;
					vertices2[vertexIndex + 1] += vector;
					vertices2[vertexIndex + 2] += vector;
					vertices2[vertexIndex + 3] += vector;
					array[j] = vertexAnim;
				}
			}
			for (int k = 0; k < textInfo.meshInfo.Length; k++)
			{
				textInfo.meshInfo[k].mesh.vertices = textInfo.meshInfo[k].vertices;
				kgl.UpdateGeometry(textInfo.meshInfo[k].mesh, k);
			}
			num++;
			yield return new WaitForSeconds(0.1f);
		}
	}
}
