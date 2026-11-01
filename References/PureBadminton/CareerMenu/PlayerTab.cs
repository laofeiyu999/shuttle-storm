using System;
using System.Linq;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class PlayerTab : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

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
	public GameObject AppearanceBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public GameObject AchievementBadge;

	public void dap()
	{
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
		careerMenu.CharactersPreview.hbg(CharactersPreviewScenePosition.Center, Career.Current.MainCharacter.CharacterInfo, CharacterIdlePose.CrossedArms);
		AppearanceBadge.SetActive(Career.Current.UnlockedEquipments.Any((CareerUnlockedEquipment a) => a.Unread));
		AchievementBadge.SetActive(Career.Current.Achievements.Any((CareerAchievement a) => a.Uncollected));
	}

	protected override void cyr()
	{
		base.cyr();
		careerMenu.CharactersPreview.hbi();
	}
}
