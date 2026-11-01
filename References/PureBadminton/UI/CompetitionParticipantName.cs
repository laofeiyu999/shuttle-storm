using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CompetitionParticipantName : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject CharacterAContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image CharacterAImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI CharacterAText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject CharacterBContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image CharacterBImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI CharacterBText;

	public static GameObject prd => Resources.Load<GameObject>("UI/CompetitionParticipantName");

	public void hbl(TournamentParticipant a)
	{
		hbn(a.pof.country, a.pof.pjm, a.pog?.country, a.pog?.pjm);
	}

	public void hbm(string a, string b)
	{
		hbn(a, b, null, null);
	}

	public void hbn(string a, string b, string c, string d)
	{
		bool flag = c != null && d != null;
		CharacterAContainer.GetComponent<RectTransform>().anchorMin = new Vector2(0f, flag ? 0.5f : 0f);
		CharacterBContainer.SetActive(flag);
		CharacterAText.text = b;
		CharacterAImage.sprite = Countries.fxd(a);
		CharacterAImage.enabled = CharacterAImage.sprite != null;
		if (flag)
		{
			CharacterBText.text = d;
			CharacterBImage.sprite = Countries.fxd(c);
		}
	}

	public void hbo(float a)
	{
		CharacterAImage.GetComponent<RectTransform>().sizeDelta = new Vector2(a * 1.5f, a);
		CharacterAImage.GetComponent<LayoutElement>().minWidth = a * 1.5f;
		CharacterAText.fontSize = a;
		CharacterBImage.GetComponent<RectTransform>().sizeDelta = new Vector2(a * 1.5f, a);
		CharacterBImage.GetComponent<LayoutElement>().minWidth = a * 1.5f;
		CharacterBText.fontSize = a;
	}

	public void hbp(Color a)
	{
		CharacterAText.color = a;
		CharacterBText.color = a;
	}

	public static void hbq(GameObject a, vu b, int c, bool d, Table e)
	{
		GameObject obj = Object.Instantiate(prd, a.transform);
		CompetitionParticipantName component = obj.GetComponent<CompetitionParticipantName>();
		e.hlc(component.CharacterAText, b, d);
		e.hlc(component.CharacterBText, b, d);
		component.hbo(e.BodyFontSize);
		component.hbn((string)b.nmq["Country1"], (string)b.nmq["Name1"], (string)b.nmq["Country2"], (string)b.nmq["Name2"]);
		obj.GetComponent<RectTransform>().guk(0f, 10f);
	}
}
