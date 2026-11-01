using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Events;

namespace TMPro;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_TextEventHandler : MonoBehaviour, IPointerEnterHandler, IEventSystemHandler, IPointerExitHandler
{
	[Serializable]
	[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class CharacterSelectionEvent : UnityEvent<char, int>
	{
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class SpriteSelectionEvent : UnityEvent<char, int>
	{
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class WordSelectionEvent : UnityEvent<string, int, int>
	{
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class LineSelectionEvent : UnityEvent<string, int, int>
	{
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class LinkSelectionEvent : UnityEvent<string, string, int>
	{
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterSelectionEvent m_OnCharacterSelection = new CharacterSelectionEvent();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private SpriteSelectionEvent m_OnSpriteSelection = new SpriteSelectionEvent();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private WordSelectionEvent m_OnWordSelection = new WordSelectionEvent();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LineSelectionEvent m_OnLineSelection = new LineSelectionEvent();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LinkSelectionEvent m_OnLinkSelection = new LinkSelectionEvent();

	private TMP_Text jzu;

	private Camera jzv;

	private Canvas jzw;

	private int jzx = -1;

	private int jzy = -1;

	private int jzz = -1;

	private int kaa = -1;

	public CharacterSelectionEvent osy
	{
		get
		{
			return m_OnCharacterSelection;
		}
		set
		{
			m_OnCharacterSelection = value;
		}
	}

	public SpriteSelectionEvent osz
	{
		get
		{
			return m_OnSpriteSelection;
		}
		set
		{
			m_OnSpriteSelection = value;
		}
	}

	public WordSelectionEvent ota
	{
		get
		{
			return m_OnWordSelection;
		}
		set
		{
			m_OnWordSelection = value;
		}
	}

	public LineSelectionEvent otb
	{
		get
		{
			return m_OnLineSelection;
		}
		set
		{
			m_OnLineSelection = value;
		}
	}

	public LinkSelectionEvent otc
	{
		get
		{
			return m_OnLinkSelection;
		}
		set
		{
			m_OnLinkSelection = value;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		jzu = base.gameObject.GetComponent<TMP_Text>();
		if (jzu.GetType() == typeof(TextMeshProUGUI))
		{
			jzw = base.gameObject.GetComponentInParent<Canvas>();
			if (jzw != null)
			{
				if (jzw.renderMode == RenderMode.ScreenSpaceOverlay)
				{
					jzv = null;
				}
				else
				{
					jzv = jzw.worldCamera;
				}
			}
		}
		else
		{
			jzv = Camera.main;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		if (TMP_TextUtilities.IsIntersectingRectTransform(jzu.rectTransform, Input.mousePosition, jzv))
		{
			int num = TMP_TextUtilities.FindIntersectingCharacter(jzu, Input.mousePosition, jzv, visibleOnly: true);
			if (num != -1 && num != jzy)
			{
				jzy = num;
				switch (jzu.textInfo.characterInfo[num].elementType)
				{
				case TMP_TextElementType.Character:
					bgu(jzu.textInfo.characterInfo[num].character, num);
					break;
				case TMP_TextElementType.Sprite:
					bgv(jzu.textInfo.characterInfo[num].character, num);
					break;
				}
			}
			int num2 = TMP_TextUtilities.FindIntersectingWord(jzu, Input.mousePosition, jzv);
			if (num2 != -1 && num2 != jzz)
			{
				jzz = num2;
				TMP_WordInfo tMP_WordInfo = jzu.textInfo.wordInfo[num2];
				bgw(tMP_WordInfo.GetWord(), tMP_WordInfo.firstCharacterIndex, tMP_WordInfo.characterCount);
			}
			int num3 = TMP_TextUtilities.FindIntersectingLine(jzu, Input.mousePosition, jzv);
			if (num3 != -1 && num3 != kaa)
			{
				kaa = num3;
				TMP_LineInfo tMP_LineInfo = jzu.textInfo.lineInfo[num3];
				char[] array = new char[tMP_LineInfo.characterCount];
				for (int i = 0; i < tMP_LineInfo.characterCount && i < jzu.textInfo.characterInfo.Length; i++)
				{
					array[i] = jzu.textInfo.characterInfo[i + tMP_LineInfo.firstCharacterIndex].character;
				}
				string a = new string(array);
				bgx(a, tMP_LineInfo.firstCharacterIndex, tMP_LineInfo.characterCount);
			}
			int num4 = TMP_TextUtilities.FindIntersectingLink(jzu, Input.mousePosition, jzv);
			if (num4 != -1 && num4 != jzx)
			{
				jzx = num4;
				TMP_LinkInfo tMP_LinkInfo = jzu.textInfo.linkInfo[num4];
				bgy(tMP_LinkInfo.GetLinkID(), tMP_LinkInfo.GetLinkText(), num4);
			}
		}
		else
		{
			jzx = -1;
			jzy = -1;
			jzz = -1;
			kaa = -1;
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerEnter(PointerEventData eventData)
	{
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnPointerExit(PointerEventData eventData)
	{
	}

	private void bgu(char a, int b)
	{
		if (osy != null)
		{
			osy.Invoke(a, b);
		}
	}

	private void bgv(char a, int b)
	{
		if (osz != null)
		{
			osz.Invoke(a, b);
		}
	}

	private void bgw(string a, int b, int c)
	{
		if (ota != null)
		{
			ota.Invoke(a, b, c);
		}
	}

	private void bgx(string a, int b, int c)
	{
		if (otb != null)
		{
			otb.Invoke(a, b, c);
		}
	}

	private void bgy(string a, string b, int c)
	{
		if (otc != null)
		{
			otc.Invoke(a, b, c);
		}
	}
}
