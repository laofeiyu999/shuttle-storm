using System;
using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CareerMenuPanel : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum CareerPanelTabs
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Home,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Rankings,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Calendar,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Player
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication StartButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI SinglesLabelText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI DoublesLabelText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI SinglesRankingText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI DoublesRankingText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI MixedRankingText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI MainTitleText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI DateText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private HomeTab HomeTab;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private RankingTab RankingTab;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CalendarTab CalendarTab;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PlayerTab PlayerTab;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject PlayerTabBadge;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		cyp();
		GetComponent<TabsManager>().nmx += cyo;
		cyo(GetComponent<TabsManager>().ptp);
	}

	private void cyo(int a)
	{
		List<TabsManager.Tab> tabs = GetComponent<TabsManager>().Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.transform.Find("Border").gameObject.SetActive(i == a);
		}
		StartButtonIndication.gameObject.SetActive(a == 0 || a == 1 || a == 3);
	}

	public void cyp()
	{
		CharacterInfo characterInfo = Career.Current.MainCharacter.CharacterInfo;
		SinglesLabelText.text = ((characterInfo.gender == "m") ? "MS" : "WS");
		DoublesLabelText.text = ((characterInfo.gender == "m") ? "MD" : "WD");
		cyq(SinglesRankingText, Career.Current.MainCharacter);
		cyq(DoublesRankingText, Career.Current.piw);
		cyq(MixedRankingText, Career.Current.pix);
		MainTitleText.text = characterInfo.pjm;
		DateText.text = Career.Current.CurrentDate.fos(DayOfWeek.Monday).ToString("D", LocalizationSettings.SelectedLocale.Identifier.CultureInfo);
		HomeTab.dam();
		RankingTab.dbn();
		CalendarTab.cvq();
		PlayerTab.dap();
	}

	private void cyq(TextMeshProUGUI a, ob b)
	{
		a.text = Career.flr(b?.Rank, b?.PreviousRank, "N/A");
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		PlayerTabBadge.SetActive(Career.Current.Achievements.Any((CareerAchievement a) => a.Uncollected) || Career.Current.UnlockedEquipments.Any((CareerUnlockedEquipment a) => a.Unread));
	}

	protected override void cyr()
	{
		base.cyr();
		careerMenu.CharactersPreview.hbi();
	}
}
