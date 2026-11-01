using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VertexZoom : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class v
	{
		public List<float> khb;

		public Comparison<int> khc;

		internal int bjz(int a, int b)
		{
			return khb[a].CompareTo(khb[b]);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float AngleMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float SpeedMultiplier = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float CurveScale = 1f;

	private TMP_Text khk;

	private bool khl;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		khk = GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bke);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bke);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bkf());
	}

	private void bke(UnityEngine.Object a)
	{
		if (a == khk)
		{
			khl = true;
		}
	}

	private IEnumerator bkf()
	{
		khk.ForceMeshUpdate();
		TMP_TextInfo textInfo = khk.textInfo;
		TMP_MeshInfo[] array = textInfo.CopyMeshInfoVertexData();
		List<float> khb = new List<float>();
		List<int> list = new List<int>();
		khl = true;
		while (true)
		{
			if (khl)
			{
				array = textInfo.CopyMeshInfoVertexData();
				khl = false;
			}
			int characterCount = textInfo.characterCount;
			if (characterCount == 0)
			{
				yield return new WaitForSeconds(0.25f);
				continue;
			}
			khb.Clear();
			list.Clear();
			for (int i = 0; i < characterCount; i++)
			{
				if (textInfo.characterInfo[i].isVisible)
				{
					int materialReferenceIndex = textInfo.characterInfo[i].materialReferenceIndex;
					int vertexIndex = textInfo.characterInfo[i].vertexIndex;
					Vector3[] vertices = array[materialReferenceIndex].vertices;
					Vector3 vector = (Vector2)((vertices[vertexIndex] + vertices[vertexIndex + 2]) / 2f);
					Vector3[] vertices2 = textInfo.meshInfo[materialReferenceIndex].vertices;
					vertices2[vertexIndex] = vertices[vertexIndex] - vector;
					vertices2[vertexIndex + 1] = vertices[vertexIndex + 1] - vector;
					vertices2[vertexIndex + 2] = vertices[vertexIndex + 2] - vector;
					vertices2[vertexIndex + 3] = vertices[vertexIndex + 3] - vector;
					float num = UnityEngine.Random.Range(1f, 1.5f);
					khb.Add(num);
					list.Add(khb.Count - 1);
					Matrix4x4 matrix4x = Matrix4x4.TRS(new Vector3(0f, 0f, 0f), Quaternion.identity, Vector3.one * num);
					vertices2[vertexIndex] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex]);
					vertices2[vertexIndex + 1] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 1]);
					vertices2[vertexIndex + 2] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 2]);
					vertices2[vertexIndex + 3] = matrix4x.MultiplyPoint3x4(vertices2[vertexIndex + 3]);
					vertices2[vertexIndex] += vector;
					vertices2[vertexIndex + 1] += vector;
					vertices2[vertexIndex + 2] += vector;
					vertices2[vertexIndex + 3] += vector;
					Vector4[] uvs = array[materialReferenceIndex].uvs0;
					Vector4[] uvs2 = textInfo.meshInfo[materialReferenceIndex].uvs0;
					uvs2[vertexIndex] = uvs[vertexIndex];
					uvs2[vertexIndex + 1] = uvs[vertexIndex + 1];
					uvs2[vertexIndex + 2] = uvs[vertexIndex + 2];
					uvs2[vertexIndex + 3] = uvs[vertexIndex + 3];
					Color32[] colors = array[materialReferenceIndex].colors32;
					Color32[] colors2 = textInfo.meshInfo[materialReferenceIndex].colors32;
					colors2[vertexIndex] = colors[vertexIndex];
					colors2[vertexIndex + 1] = colors[vertexIndex + 1];
					colors2[vertexIndex + 2] = colors[vertexIndex + 2];
					colors2[vertexIndex + 3] = colors[vertexIndex + 3];
				}
			}
			for (int j = 0; j < textInfo.meshInfo.Length; j++)
			{
				list.Sort((int a, int b) => khb[a].CompareTo(khb[b]));
				textInfo.meshInfo[j].SortGeometry(list);
				textInfo.meshInfo[j].mesh.vertices = textInfo.meshInfo[j].vertices;
				textInfo.meshInfo[j].mesh.SetUVs(0, textInfo.meshInfo[j].uvs0);
				textInfo.meshInfo[j].mesh.colors32 = textInfo.meshInfo[j].colors32;
				khk.UpdateGeometry(textInfo.meshInfo[j].mesh, j);
			}
			yield return new WaitForSeconds(0.1f);
		}
	}
}
