using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class KnockoutMatchItem : KnockoutTreeItem
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject TeamsID;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamAID;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamBID;

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

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject TeamBContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image TeamBCountryAImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image TeamBCountryBImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamBText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<GameObject> TeamBSetsText = new List<GameObject>();

	public static GameObject pwc => Resources.Load<GameObject>("UI/KnockoutTreeItem");

	public void iuv(int a, int b)
	{
		TeamsID.SetActive(value: true);
		TeamAID.text = a.ToString();
		TeamBID.text = b.ToString();
	}

	public void iuw(TournamentMatch a)
	{
		if (a.TeamA == null)
		{
			TeamACountryAImage.gameObject.SetActive(value: false);
			TeamACountryBImage.gameObject.SetActive(value: false);
			TeamAText.text = "???";
		}
		else
		{
			TeamACountryAImage.gameObject.SetActive(value: true);
			TeamACountryAImage.sprite = Countries.fxd(a.TeamA.pof.country);
			TeamACountryBImage.gameObject.SetActive(a.TeamA.pog != null);
			if (a.TeamA.pog != null)
			{
				TeamACountryBImage.sprite = Countries.fxd(a.TeamA.pog.country);
			}
			TeamAText.text = ((a.TeamA.pog != null) ? (a.TeamA.pof.lastName.gti(5) + " / " + a.TeamA.pog.lastName.gti(5)) : a.TeamA.pof.lastName.gti(10)).ToUpper();
			TeamAText.fontStyle = ((a.poc == a.TeamA) ? FontStyles.Bold : FontStyles.Normal);
		}
		if (a.TeamB == null)
		{
			TeamBCountryAImage.gameObject.SetActive(value: false);
			TeamBCountryBImage.gameObject.SetActive(value: false);
			TeamBText.text = "???";
		}
		else
		{
			TeamBCountryAImage.gameObject.SetActive(value: true);
			TeamBCountryAImage.sprite = Countries.fxd(a.TeamB.pof.country);
			TeamBCountryBImage.gameObject.SetActive(a.TeamB.pog != null);
			if (a.TeamB.pog != null)
			{
				TeamBCountryBImage.sprite = Countries.fxd(a.TeamB.pog.country);
			}
			TeamBText.text = ((a.TeamB.pog != null) ? (a.TeamB.pof.lastName.gti(5) + " / " + a.TeamB.pog.lastName.gti(5)) : a.TeamB.pof.lastName.gti(10)).ToUpper();
			TeamBText.fontStyle = ((a.poc == a.TeamB) ? FontStyles.Bold : FontStyles.Normal);
		}
		if (a.Stats == null || (TeamASetsText.Count != 0 && TeamBSetsText.Count != 0))
		{
			return;
		}
		TeamASetsText.ForEach(delegate(GameObject a)
		{
			Object.Destroy(a);
		});
		TeamBSetsText.ForEach(delegate(GameObject a)
		{
			Object.Destroy(a);
		});
		TeamASetsText.Clear();
		TeamBSetsText.Clear();
		foreach (qx item in a.Stats.Recap.SetsScore)
		{
			GameObject gameObject = new GameObject("Set score");
			gameObject.transform.SetParent(TeamAContainer.transform);
			gameObject.transform.localScale = Vector3.one;
			TeamASetsText.Add(gameObject);
			float num2 = (gameObject.AddComponent<LayoutElement>().minWidth = 28f);
			TextMeshProUGUI textMeshProUGUI = gameObject.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI.font = TeamAText.font;
			textMeshProUGUI.fontSize = TeamAText.fontSize;
			textMeshProUGUI.fontStyle = (item.pmg ? FontStyles.Bold : FontStyles.Normal);
			textMeshProUGUI.color = (item.pmg ? Color.black : Color.grey);
			textMeshProUGUI.text = item.muk.ToString();
			gameObject = Object.Instantiate(gameObject, TeamBContainer.transform);
			gameObject.transform.localScale = Vector3.one;
			TeamBSetsText.Add(gameObject);
			TextMeshProUGUI component = gameObject.GetComponent<TextMeshProUGUI>();
			component.fontStyle = ((!item.pmg) ? FontStyles.Bold : FontStyles.Normal);
			component.color = (item.pmg ? Color.grey : Color.black);
			component.text = item.mul.ToString();
		}
	}
}
