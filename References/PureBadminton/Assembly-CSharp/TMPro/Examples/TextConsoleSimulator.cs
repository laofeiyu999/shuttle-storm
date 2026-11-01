using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextConsoleSimulator : MonoBehaviour
{
	private TMP_Text ker;

	private bool kes;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		ker = base.gameObject.GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(biq(ker));
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Add(bip);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		TMPro_EventManager.TEXT_CHANGED_EVENT.Remove(bip);
	}

	private void bip(Object a)
	{
		kes = true;
	}

	private IEnumerator biq(TMP_Text a)
	{
		a.ForceMeshUpdate();
		TMP_TextInfo textInfo = a.textInfo;
		int characterCount = textInfo.characterCount;
		int num = 0;
		while (true)
		{
			if (kes)
			{
				characterCount = textInfo.characterCount;
				kes = false;
			}
			if (num > characterCount)
			{
				yield return new WaitForSeconds(1f);
				num = 0;
			}
			a.maxVisibleCharacters = num;
			num++;
			yield return null;
		}
	}

	private IEnumerator bir(TMP_Text a)
	{
		a.ForceMeshUpdate();
		int wordCount = a.textInfo.wordCount;
		int characterCount = a.textInfo.characterCount;
		int num = 0;
		int num2 = 0;
		while (true)
		{
			int num3 = num % (wordCount + 1);
			if (num3 == 0)
			{
				num2 = 0;
			}
			else if (num3 < wordCount)
			{
				num2 = a.textInfo.wordInfo[num3 - 1].lastCharacterIndex + 1;
			}
			else if (num3 == wordCount)
			{
				num2 = characterCount;
			}
			a.maxVisibleCharacters = num2;
			if (num2 >= characterCount)
			{
				yield return new WaitForSeconds(1f);
			}
			num++;
			yield return new WaitForSeconds(0.1f);
		}
	}
}
