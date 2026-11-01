using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_TextSelector_A : MonoBehaviour, IPointerEnterHandler, IEventSystemHandler, IPointerExitHandler
{
	private TextMeshPro kcq;

	private Camera kcr;

	private bool kcs;

	private int kct = -1;

	private int kcu = -1;

	private int kcv = -1;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kcq = base.gameObject.GetComponent<TextMeshPro>();
		kcr = Camera.main;
		kcq.ForceMeshUpdate();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		kcs = false;
		if (TMP_TextUtilities.IsIntersectingRectTransform(kcq.rectTransform, Input.mousePosition, Camera.main))
		{
			kcs = true;
		}
		if (!kcs)
		{
			return;
		}
		int num = TMP_TextUtilities.FindIntersectingCharacter(kcq, Input.mousePosition, Camera.main, visibleOnly: true);
		if (num != -1 && num != kcu && (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift)))
		{
			kcu = num;
			int materialReferenceIndex = kcq.textInfo.characterInfo[num].materialReferenceIndex;
			int vertexIndex = kcq.textInfo.characterInfo[num].vertexIndex;
			Color32 color = new Color32((byte)Random.Range(0, 255), (byte)Random.Range(0, 255), (byte)Random.Range(0, 255), byte.MaxValue);
			Color32[] colors = kcq.textInfo.meshInfo[materialReferenceIndex].colors32;
			colors[vertexIndex] = color;
			colors[vertexIndex + 1] = color;
			colors[vertexIndex + 2] = color;
			colors[vertexIndex + 3] = color;
			kcq.textInfo.meshInfo[materialReferenceIndex].mesh.colors32 = colors;
		}
		int num2 = TMP_TextUtilities.FindIntersectingLink(kcq, Input.mousePosition, kcr);
		if ((num2 == -1 && kct != -1) || num2 != kct)
		{
			kct = -1;
		}
		if (num2 != -1 && num2 != kct)
		{
			kct = num2;
			TMP_LinkInfo tMP_LinkInfo = kcq.textInfo.linkInfo[num2];
			RectTransformUtility.ScreenPointToWorldPointInRectangle(kcq.rectTransform, Input.mousePosition, kcr, out var _);
			string linkID = tMP_LinkInfo.GetLinkID();
			if (!(linkID == "id_01"))
			{
				_ = linkID == "id_02";
			}
		}
		int num3 = TMP_TextUtilities.FindIntersectingWord(kcq, Input.mousePosition, Camera.main);
		if (num3 != -1 && num3 != kcv)
		{
			kcv = num3;
			TMP_WordInfo tMP_WordInfo = kcq.textInfo.wordInfo[num3];
			Vector3 position = kcq.transform.TransformPoint(kcq.textInfo.characterInfo[tMP_WordInfo.firstCharacterIndex].bottomLeft);
			position = Camera.main.WorldToScreenPoint(position);
			Color32[] colors2 = kcq.textInfo.meshInfo[0].colors32;
			Color32 color2 = new Color32((byte)Random.Range(0, 255), (byte)Random.Range(0, 255), (byte)Random.Range(0, 255), byte.MaxValue);
			for (int i = 0; i < tMP_WordInfo.characterCount; i++)
			{
				int vertexIndex2 = kcq.textInfo.characterInfo[tMP_WordInfo.firstCharacterIndex + i].vertexIndex;
				colors2[vertexIndex2] = color2;
				colors2[vertexIndex2 + 1] = color2;
				colors2[vertexIndex2 + 2] = color2;
				colors2[vertexIndex2 + 3] = color2;
			}
			kcq.mesh.colors32 = colors2;
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerEnter(PointerEventData eventData)
	{
		Debug.Log("OnPointerEnter()");
		kcs = true;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerExit(PointerEventData eventData)
	{
		Debug.Log("OnPointerExit()");
		kcs = false;
	}
}
