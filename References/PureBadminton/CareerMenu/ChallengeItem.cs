using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ChallengeItem : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image image;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro titleText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro descriptionText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Gauge gauge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI gaugeText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject collectButton;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CanvasGroup rewardContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image rewardEquipmentImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image rewardStatImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject rewardAllStatsContainer;

	public static ChallengeItem oxt => Resources.Load<ChallengeItem>("UI/Career/ChallengeItem");

	public void cyt(AchievementType a, AchievementReward b, bool c, bool d, int? e, int? f)
	{
		image.sprite = ne.fhy(a, !c);
		titleText.plk = new LocalizedString("List_Achievements", a.ToString());
		descriptionText.plk = new LocalizedString("List_Achievements", $"{a}_Description");
		if (e.HasValue && f.HasValue && !c)
		{
			gauge.gameObject.SetActive(value: true);
			gauge.prm = (float)e.Value / (float)f.Value;
			gaugeText.text = $"{e} / {f}";
		}
		else
		{
			gauge.gameObject.SetActive(value: false);
		}
		collectButton.SetActive(c && !d);
		rewardContainer.gameObject.SetActive(b != null);
		rewardContainer.alpha = (c ? 1f : 0.8f);
		if (b == null)
		{
			return;
		}
		pz.EquipmentType? equipmentType = b.fhz();
		if (equipmentType.HasValue)
		{
			rewardEquipmentImage.gameObject.SetActive(value: true);
			rewardAllStatsContainer.gameObject.SetActive(value: false);
			rewardStatImage.gameObject.SetActive(value: false);
			rewardEquipmentImage.sprite = pz.fyv(equipmentType.Value, b.Id);
			return;
		}
		rewardEquipmentImage.gameObject.SetActive(value: false);
		rewardAllStatsContainer.gameObject.SetActive(b.Type == AchievementRewardType.AllStats);
		rewardStatImage.gameObject.SetActive(b.Type != AchievementRewardType.AllStats);
		if (b.Type != AchievementRewardType.AllStats)
		{
			rewardStatImage.sprite = CharacterStats.ftk(b.fia().Value);
		}
	}
}
