using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterIntensityIcon : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image Image;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Sprite AggresiveSprite;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Sprite EfficientSprite;

	public void hat()
	{
		Image.sprite = AggresiveSprite;
		Image.gameObject.SetActive(value: true);
	}

	public void hau()
	{
		Image.sprite = EfficientSprite;
		Image.gameObject.SetActive(value: true);
	}

	public void hav()
	{
		Image.gameObject.SetActive(value: false);
	}
}
