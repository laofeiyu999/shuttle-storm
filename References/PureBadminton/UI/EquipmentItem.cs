using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class EquipmentItem : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image lockIcon;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image badge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image image;

	public static EquipmentItem prj => Resources.Load<EquipmentItem>("UI/EquipmentItem");

	public void hcq(pz.EquipmentType a, pz.pq b, bool c, bool d)
	{
		lockIcon.gameObject.SetActive(c);
		image.gameObject.SetActive(!c);
		if (!c)
		{
			image.sprite = pz.fyv(a, b.Id);
		}
		badge.gameObject.SetActive(d);
	}

	public void hcr()
	{
		badge.gameObject.SetActive(value: false);
	}
}
