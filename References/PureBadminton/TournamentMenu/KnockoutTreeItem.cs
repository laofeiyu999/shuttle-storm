using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class KnockoutTreeItem : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Lines;

	private bool odz;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject MatchContainer;

	public bool pwi
	{
		get
		{
			return odz;
		}
		set
		{
			odz = value;
			MatchContainer.GetComponent<Image>().color = (odz ? qh.mro : ((Color)new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 200)));
		}
	}
}
