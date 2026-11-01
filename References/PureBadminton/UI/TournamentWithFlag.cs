using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentWithFlag : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image flagImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image trophyImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro nameText;

	public static TournamentWithFlag ptw => Resources.Load<TournamentWithFlag>("UI/TournamentWithFlag");

	public void hnh(sz a, MedalType? b)
	{
		flagImage.sprite = Countries.fxd(a.CountryCode);
		nameText.plk = new LocalizedString("List_TournamentType", a.Id);
		if (b.HasValue && b != MedalType.None)
		{
			trophyImage.gameObject.SetActive(value: true);
			trophyImage.sprite = wf.hno(b);
			flagImage.GetComponent<RectTransform>().sizeDelta = new Vector2(75f, 50f);
		}
		else
		{
			trophyImage.gameObject.SetActive(value: false);
		}
	}
}
