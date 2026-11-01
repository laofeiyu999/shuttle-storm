using System;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class WeekTournaments : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI day;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI month;

	public static WeekTournaments puf => Resources.Load<WeekTournaments>("UI/WeekTournaments");

	public void hog(CareerDate a, sz[] b, int? c = null, Color? d = null, FontStyles? e = null)
	{
		DateTime dateTime = a.fos(DayOfWeek.Tuesday);
		day.text = dateTime.Day.ToString();
		month.text = dateTime.ToString("MMM", LocalizationSettings.SelectedLocale.Identifier.CultureInfo);
		if (d.HasValue)
		{
			TextMeshProUGUI textMeshProUGUI = day;
			Color color = (month.color = d.Value);
			textMeshProUGUI.color = color;
		}
		if (e.HasValue)
		{
			TextMeshProUGUI textMeshProUGUI2 = day;
			FontStyles fontStyle = (month.fontStyle = e.Value);
			textMeshProUGUI2.fontStyle = fontStyle;
		}
		foreach (sz sz2 in b)
		{
			TournamentItem tournamentItem = UnityEngine.Object.Instantiate(TournamentItem.ptv, base.transform);
			tournamentItem.hnf(sz2);
			if (c.HasValue && c > (sz2.pop ?? sz2.poo))
			{
				tournamentItem.gameObject.AddComponent<CanvasGroup>().alpha = 0.3f;
			}
			tournamentItem.gameObject.AddComponent<LayoutElement>().preferredWidth = 9999f;
		}
		if (!b.Any())
		{
			GameObject obj = new GameObject("NoTournamentsText");
			obj.transform.SetParent(base.transform, worldPositionStays: false);
			obj.AddComponent<RectTransform>().guk();
			TextMeshProUGUI textMeshProUGUI3 = obj.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI3.fontSize = 24f;
			textMeshProUGUI3.alignment = TextAlignmentOptions.Center;
			obj.AddComponent<LocalizedTextMeshPro>().plk = new LocalizedString("CareerMenu", "NoTournament");
			obj.AddComponent<LayoutElement>().preferredWidth = 9999f;
		}
	}
}
