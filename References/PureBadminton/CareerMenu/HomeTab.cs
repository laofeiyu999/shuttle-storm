using System;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class HomeTab : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject NextWeeksContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI PlayerNameText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public Gauge EnergyGauge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI SpeedText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI PowerText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI PrecisionText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI DefenseText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI StaminaText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI AgeText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public TextMeshProUGUI HeightText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image PartnersBadge;

	public void dam()
	{
		NextWeeksContainer.transform.guj();
		PartnersBadge.gameObject.SetActive(Career.Current.MainCharacter.PendingPairs.Any((CareerPair a) => a.InvitationStatus == PairInvitationStatus.InvitationReceived));
		int value = Career.Current.flq(Career.Current.MainCharacter);
		for (int i = 0; i < 4; i++)
		{
			CareerDate a2 = Career.Current.CurrentDate.fov(i);
			sz[] b = tk.gqk(a2).ToArray();
			WeekTournaments weekTournaments = UnityEngine.Object.Instantiate(WeekTournaments.puf, NextWeeksContainer.transform);
			weekTournaments.hog(a2, b, value, (i == 0) ? Color.white : qh.mrs, (i == 0) ? new FontStyles?(FontStyles.Bold) : null);
			if (i % 2 > 0)
			{
				weekTournaments.gameObject.AddComponent<Image>().color = new Color32(0, 0, 0, 80);
			}
		}
		CharacterInfo characterInfo = Career.Current.MainCharacter.CharacterInfo;
		PlayerNameText.text = characterInfo.pjm;
		EnergyGauge.hdu(characterInfo.stats);
		EnergyGauge.prm = Career.Current.MainCharacter.Energy;
		SpeedText.text = Math.Floor(characterInfo.stats.speed).ToString();
		PowerText.text = Math.Floor(characterInfo.stats.power).ToString();
		PrecisionText.text = Math.Floor(characterInfo.stats.precision).ToString();
		DefenseText.text = Math.Floor(characterInfo.stats.defense).ToString();
		StaminaText.text = Math.Floor(characterInfo.stats.stamina).ToString();
		AgeText.text = Career.Current.MainCharacter.pjc.ToString();
		HeightText.text = characterInfo.height.ToString().Insert(1, "m");
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		careerMenu.CharactersPreview.hbg(CharactersPreviewScenePosition.Right, Career.Current.MainCharacter.CharacterInfo, CharacterIdlePose.CrossedArms);
	}

	protected override void cyr()
	{
		base.cyr();
		careerMenu.CharactersPreview.hbi();
	}
}
