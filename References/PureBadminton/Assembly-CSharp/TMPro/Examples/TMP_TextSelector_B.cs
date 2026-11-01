using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_TextSelector_B : MonoBehaviour, IPointerEnterHandler, IEventSystemHandler, IPointerExitHandler, IPointerClickHandler, IPointerUpHandler
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public RectTransform TextPopup_Prefab_01;

	private RectTransform kcw;

	private TextMeshProUGUI kcx;

	private const string kcy = "You have selected link <#ffff00>";

	private const string kcz = "Word Index: <#ffff00>";

	private TextMeshProUGUI kda;

	private Canvas kdb;

	private Camera kdc;

	private bool kdd;

	private int kde = -1;

	private int kdf = -1;

	private int kdg = -1;

	private Matrix4x4 kdh;

	private TMP_MeshInfo[] kdi;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kda = base.gameObject.GetComponent<TextMeshProUGUI>();
		kdb = base.gameObject.GetComponentInParent<Canvas>();
		if (kdb.renderMode == RenderMode.ScreenSpaceOverlay)
		{
			kdc = null;
		}
		else
		{
			kdc = kdb.worldCamera;
		}
		kcw = Object.Instantiate(TextPopup_Prefab_01);
		kcw.SetParent(kdb.transform, worldPositionStays: false);
		kcx = kcw.GetComponentInChildren<TextMeshProUGUI>();
		kcw.gameObject.SetActive(value: false);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bhz);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bhz);
	}

	private void bhz(Object a)
	{
		if (a == kda)
		{
			kdi = kda.textInfo.CopyMeshInfoVertexData();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		if (kdd)
		{
			int num = TMP_TextUtilities.FindIntersectingCharacter(kda, Input.mousePosition, kdc, visibleOnly: true);
			if (num == -1 || num != kdg)
			{
				bia(kdg);
				kdg = -1;
			}
			if (num != -1 && num != kdg && (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift)))
			{
				kdg = num;
				int materialReferenceIndex = kda.textInfo.characterInfo[num].materialReferenceIndex;
				int vertexIndex = kda.textInfo.characterInfo[num].vertexIndex;
				Vector3[] vertices = kda.textInfo.meshInfo[materialReferenceIndex].vertices;
				Vector3 vector = (Vector2)((vertices[vertexIndex] + vertices[vertexIndex + 2]) / 2f);
				vertices[vertexIndex] -= vector;
				vertices[vertexIndex + 1] -= vector;
				vertices[vertexIndex + 2] -= vector;
				vertices[vertexIndex + 3] -= vector;
				float num2 = 1.5f;
				kdh = Matrix4x4.TRS(Vector3.zero, Quaternion.identity, Vector3.one * num2);
				vertices[vertexIndex] = kdh.MultiplyPoint3x4(vertices[vertexIndex]);
				vertices[vertexIndex + 1] = kdh.MultiplyPoint3x4(vertices[vertexIndex + 1]);
				vertices[vertexIndex + 2] = kdh.MultiplyPoint3x4(vertices[vertexIndex + 2]);
				vertices[vertexIndex + 3] = kdh.MultiplyPoint3x4(vertices[vertexIndex + 3]);
				vertices[vertexIndex] += vector;
				vertices[vertexIndex + 1] += vector;
				vertices[vertexIndex + 2] += vector;
				vertices[vertexIndex + 3] += vector;
				Color32 color = new Color32(byte.MaxValue, byte.MaxValue, 192, byte.MaxValue);
				Color32[] colors = kda.textInfo.meshInfo[materialReferenceIndex].colors32;
				colors[vertexIndex] = color;
				colors[vertexIndex + 1] = color;
				colors[vertexIndex + 2] = color;
				colors[vertexIndex + 3] = color;
				TMP_MeshInfo tMP_MeshInfo = kda.textInfo.meshInfo[materialReferenceIndex];
				int dst = vertices.Length - 4;
				tMP_MeshInfo.SwapVertexData(vertexIndex, dst);
				kda.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
			}
			int num3 = TMP_TextUtilities.FindIntersectingWord(kda, Input.mousePosition, kdc);
			if (kcw != null && kde != -1 && (num3 == -1 || num3 != kde))
			{
				TMP_WordInfo tMP_WordInfo = kda.textInfo.wordInfo[kde];
				for (int i = 0; i < tMP_WordInfo.characterCount; i++)
				{
					int num4 = tMP_WordInfo.firstCharacterIndex + i;
					int materialReferenceIndex2 = kda.textInfo.characterInfo[num4].materialReferenceIndex;
					int vertexIndex2 = kda.textInfo.characterInfo[num4].vertexIndex;
					Color32[] colors2 = kda.textInfo.meshInfo[materialReferenceIndex2].colors32;
					colors2[vertexIndex2 + 3] = (colors2[vertexIndex2 + 2] = (colors2[vertexIndex2 + 1] = (colors2[vertexIndex2] = colors2[vertexIndex2].Tint(1.33333f))));
				}
				kda.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
				kde = -1;
			}
			if (num3 != -1 && num3 != kde && !Input.GetKey(KeyCode.LeftShift) && !Input.GetKey(KeyCode.RightShift))
			{
				kde = num3;
				TMP_WordInfo tMP_WordInfo2 = kda.textInfo.wordInfo[num3];
				for (int j = 0; j < tMP_WordInfo2.characterCount; j++)
				{
					int num5 = tMP_WordInfo2.firstCharacterIndex + j;
					int materialReferenceIndex3 = kda.textInfo.characterInfo[num5].materialReferenceIndex;
					int vertexIndex3 = kda.textInfo.characterInfo[num5].vertexIndex;
					Color32[] colors3 = kda.textInfo.meshInfo[materialReferenceIndex3].colors32;
					colors3[vertexIndex3 + 3] = (colors3[vertexIndex3 + 2] = (colors3[vertexIndex3 + 1] = (colors3[vertexIndex3] = colors3[vertexIndex3].Tint(0.75f))));
				}
				kda.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
			}
			int num6 = TMP_TextUtilities.FindIntersectingLink(kda, Input.mousePosition, kdc);
			if ((num6 == -1 && kdf != -1) || num6 != kdf)
			{
				kcw.gameObject.SetActive(value: false);
				kdf = -1;
			}
			if (num6 == -1 || num6 == kdf)
			{
				return;
			}
			kdf = num6;
			TMP_LinkInfo tMP_LinkInfo = kda.textInfo.linkInfo[num6];
			RectTransformUtility.ScreenPointToWorldPointInRectangle(kda.rectTransform, Input.mousePosition, kdc, out var worldPoint);
			string linkID = tMP_LinkInfo.GetLinkID();
			if (!(linkID == "id_01"))
			{
				if (linkID == "id_02")
				{
					kcw.position = worldPoint;
					kcw.gameObject.SetActive(value: true);
					kcx.text = "You have selected link <#ffff00> ID 02";
				}
			}
			else
			{
				kcw.position = worldPoint;
				kcw.gameObject.SetActive(value: true);
				kcx.text = "You have selected link <#ffff00> ID 01";
			}
		}
		else if (kdg != -1)
		{
			bia(kdg);
			kdg = -1;
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerEnter(PointerEventData eventData)
	{
		kdd = true;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerExit(PointerEventData eventData)
	{
		kdd = false;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerClick(PointerEventData eventData)
	{
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerUp(PointerEventData eventData)
	{
	}

	private void bia(int a)
	{
		if (a != -1 && a <= kda.textInfo.characterCount - 1)
		{
			int materialReferenceIndex = kda.textInfo.characterInfo[a].materialReferenceIndex;
			int vertexIndex = kda.textInfo.characterInfo[a].vertexIndex;
			Vector3[] vertices = kdi[materialReferenceIndex].vertices;
			Vector3[] vertices2 = kda.textInfo.meshInfo[materialReferenceIndex].vertices;
			vertices2[vertexIndex] = vertices[vertexIndex];
			vertices2[vertexIndex + 1] = vertices[vertexIndex + 1];
			vertices2[vertexIndex + 2] = vertices[vertexIndex + 2];
			vertices2[vertexIndex + 3] = vertices[vertexIndex + 3];
			Color32[] colors = kda.textInfo.meshInfo[materialReferenceIndex].colors32;
			Color32[] colors2 = kdi[materialReferenceIndex].colors32;
			colors[vertexIndex] = colors2[vertexIndex];
			colors[vertexIndex + 1] = colors2[vertexIndex + 1];
			colors[vertexIndex + 2] = colors2[vertexIndex + 2];
			colors[vertexIndex + 3] = colors2[vertexIndex + 3];
			Vector4[] uvs = kdi[materialReferenceIndex].uvs0;
			Vector4[] uvs2 = kda.textInfo.meshInfo[materialReferenceIndex].uvs0;
			uvs2[vertexIndex] = uvs[vertexIndex];
			uvs2[vertexIndex + 1] = uvs[vertexIndex + 1];
			uvs2[vertexIndex + 2] = uvs[vertexIndex + 2];
			uvs2[vertexIndex + 3] = uvs[vertexIndex + 3];
			Vector2[] uvs3 = kdi[materialReferenceIndex].uvs2;
			Vector2[] uvs4 = kda.textInfo.meshInfo[materialReferenceIndex].uvs2;
			uvs4[vertexIndex] = uvs3[vertexIndex];
			uvs4[vertexIndex + 1] = uvs3[vertexIndex + 1];
			uvs4[vertexIndex + 2] = uvs3[vertexIndex + 2];
			uvs4[vertexIndex + 3] = uvs3[vertexIndex + 3];
			int num = (vertices.Length / 4 - 1) * 4;
			vertices2[num] = vertices[num];
			vertices2[num + 1] = vertices[num + 1];
			vertices2[num + 2] = vertices[num + 2];
			vertices2[num + 3] = vertices[num + 3];
			colors2 = kdi[materialReferenceIndex].colors32;
			Color32[] colors3 = kda.textInfo.meshInfo[materialReferenceIndex].colors32;
			colors3[num] = colors2[num];
			colors3[num + 1] = colors2[num + 1];
			colors3[num + 2] = colors2[num + 2];
			colors3[num + 3] = colors2[num + 3];
			uvs = kdi[materialReferenceIndex].uvs0;
			Vector4[] uvs5 = kda.textInfo.meshInfo[materialReferenceIndex].uvs0;
			uvs5[num] = uvs[num];
			uvs5[num + 1] = uvs[num + 1];
			uvs5[num + 2] = uvs[num + 2];
			uvs5[num + 3] = uvs[num + 3];
			uvs3 = kdi[materialReferenceIndex].uvs2;
			Vector2[] uvs6 = kda.textInfo.meshInfo[materialReferenceIndex].uvs2;
			uvs6[num] = uvs3[num];
			uvs6[num + 1] = uvs3[num + 1];
			uvs6[num + 2] = uvs3[num + 2];
			uvs6[num + 3] = uvs3[num + 3];
			kda.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
		}
	}
}
