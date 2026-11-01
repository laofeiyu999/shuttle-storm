using System;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ChatController : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_InputField ChatInputField;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_Text ChatDisplayOutput;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Scrollbar ChatScrollbar;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		ChatInputField.onSubmit.AddListener(bgd);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		ChatInputField.onSubmit.RemoveListener(bgd);
	}

	private void bgd(string a)
	{
		ChatInputField.text = string.Empty;
		DateTime now = DateTime.Now;
		string text = "[<#FFFF80>" + now.Hour.ToString("d2") + ":" + now.Minute.ToString("d2") + ":" + now.Second.ToString("d2") + "</color>] " + a;
		if (ChatDisplayOutput != null)
		{
			if (ChatDisplayOutput.text == string.Empty)
			{
				ChatDisplayOutput.text = text;
			}
			else
			{
				TMP_Text chatDisplayOutput = ChatDisplayOutput;
				chatDisplayOutput.text = chatDisplayOutput.text + "\n" + text;
			}
		}
		ChatInputField.ActivateInputField();
		ChatScrollbar.value = 0f;
	}
}
