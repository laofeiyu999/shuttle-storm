using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class KnockoutWinnerItem : KnockoutTreeItem
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject TeamAContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image TeamACountryAImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image TeamACountryBImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamAText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<GameObject> TeamASetsText = new List<GameObject>();

	public static GameObject pwj => Resources.Load<GameObject>("UI/KnockoutWinnerItem");

	public void ivo(TournamentParticipant a)
	{
		if (a == null)
		{
			TeamACountryAImage.gameObject.SetActive(value: false);
			TeamACountryBImage.gameObject.SetActive(value: false);
			TeamAText.text = "???";
			return;
		}
		TeamACountryAImage.gameObject.SetActive(value: true);
		TeamACountryAImage.sprite = Countries.fxd(a.pof.country);
		TeamACountryBImage.gameObject.SetActive(a.pog != null);
		if (TeamACountryBImage.gameObject.activeInHierarchy)
		{
			TeamACountryBImage.sprite = Countries.fxd(a.pog.country);
		}
		TeamAText.text = ((a.pog != null) ? (a.pof.lastName.gti(5) + " / " + a.pog.lastName.gti(5)) : a.pof.lastName.gti(10)).ToUpper();
	}
}
