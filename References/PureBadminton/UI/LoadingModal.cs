using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class LoadingModal : ModalManager
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float SHOW_DELAY_SECONDS = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI MessageText;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static LoadingModal Open(string text)
	{
		LoadingModal component = Object.Instantiate(Resources.Load<GameObject>("UI/LoadingModal")).GetComponent<LoadingModal>();
		component.AutoClose = true;
		component.CloseOnBack = false;
		component.DestroyOnClose = true;
		component.MessageText.text = text;
		component.nky = 1f;
		component.Open();
		return component;
	}
}
