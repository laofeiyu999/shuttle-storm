using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_TextEventCheck : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_TextEventHandler TextEventHandler;

	private TMP_Text kcp;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		if (TextEventHandler != null)
		{
			kcp = TextEventHandler.GetComponent<TMP_Text>();
			TextEventHandler.osy.AddListener(bhu);
			TextEventHandler.osz.AddListener(bhv);
			TextEventHandler.ota.AddListener(bhw);
			TextEventHandler.otb.AddListener(bhx);
			TextEventHandler.otc.AddListener(bhy);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		if (TextEventHandler != null)
		{
			TextEventHandler.osy.RemoveListener(bhu);
			TextEventHandler.osz.RemoveListener(bhv);
			TextEventHandler.ota.RemoveListener(bhw);
			TextEventHandler.otb.RemoveListener(bhx);
			TextEventHandler.otc.RemoveListener(bhy);
		}
	}

	private void bhu(char a, int b)
	{
		Debug.Log("Character [" + a + "] at Index: " + b + " has been selected.");
	}

	private void bhv(char a, int b)
	{
		Debug.Log("Sprite [" + a + "] at Index: " + b + " has been selected.");
	}

	private void bhw(string a, int b, int c)
	{
		Debug.Log("Word [" + a + "] with first character index of " + b + " and length of " + c + " has been selected.");
	}

	private void bhx(string a, int b, int c)
	{
		Debug.Log("Line [" + a + "] with first character index of " + b + " and length of " + c + " has been selected.");
	}

	private void bhy(string a, string b, int c)
	{
		if (kcp != null)
		{
			_ = ref kcp.textInfo.linkInfo[c];
		}
		Debug.Log("Link Index: " + c + " with ID [" + a + "] and Text \"" + b + "\" has been selected.");
	}
}
