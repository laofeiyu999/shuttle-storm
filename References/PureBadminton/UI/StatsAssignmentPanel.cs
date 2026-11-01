using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class StatsAssignmentPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager speedSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager powerSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager precisionSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager defenseSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager staminaSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI remainingPointsLabel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterStats Stats;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int BuildBudget;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int BuildStatCap;

	private Dictionary<LeftRightSelectManager, CharacterStatsType> nlz;

	private bool nma;

	public int ptg
	{
		get
		{
			if (Stats != null)
			{
				return Mathf.RoundToInt(Stats.defense + Stats.power + Stats.precision + Stats.speed + Stats.stamina - 250f);
			}
			return 0;
		}
	}

	public int pth => BuildBudget - ptg;

	private static int pti => Mathf.RoundToInt(50f);

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		nlz = new Dictionary<LeftRightSelectManager, CharacterStatsType>
		{
			{
				speedSelect,
				CharacterStatsType.Speed
			},
			{
				powerSelect,
				CharacterStatsType.Power
			},
			{
				precisionSelect,
				CharacterStatsType.Precision
			},
			{
				defenseSelect,
				CharacterStatsType.Defense
			},
			{
				staminaSelect,
				CharacterStatsType.Stamina
			}
		};
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		if (Stats == null)
		{
			Stats = CharacterStats.pjp;
		}
		List<string> list = (from a in Enumerable.Range(pti, Mathf.Max(BuildStatCap + 1, 1))
			select a.ToString()).ToList();
		foreach (KeyValuePair<LeftRightSelectManager, CharacterStatsType> item in nlz)
		{
			item.Key.Options = list;
			int num = Mathf.Clamp(hjz(Stats.ftn(item.Value)), 0, list.Count - 1);
			item.Key.psa = num;
			hjy(item.Value, pti + num);
		}
		hka();
		speedSelect.njh += hjx;
		powerSelect.njh += hjx;
		precisionSelect.njh += hjx;
		defenseSelect.njh += hjx;
		staminaSelect.njh += hjx;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		speedSelect.njh -= hjx;
		powerSelect.njh -= hjx;
		precisionSelect.njh -= hjx;
		defenseSelect.njh -= hjx;
		staminaSelect.njh -= hjx;
	}

	public void hjw()
	{
		Stats = CharacterStats.pjp;
		foreach (KeyValuePair<LeftRightSelectManager, CharacterStatsType> item in nlz)
		{
			item.Key.psa = 0;
		}
		hka();
	}

	private void hjx(LeftRightSelectManager a, int b)
	{
		if (!nma)
		{
			CharacterStatsType a2 = nlz[a];
			float num = Stats.ftn(a2);
			int num2 = pti + b;
			if ((float)num2 - num > (float)pth)
			{
				AudioManager.fiw();
				nma = true;
				a.psa = hjz(num);
				nma = false;
			}
			else
			{
				hjy(a2, num2);
				hka();
			}
		}
	}

	private void hjy(CharacterStatsType a, float b)
	{
		Stats.fto(a, b - Stats.ftn(a));
	}

	private static int hjz(float a)
	{
		return Mathf.RoundToInt(a) - pti;
	}

	private void hka()
	{
		if (remainingPointsLabel != null)
		{
			remainingPointsLabel.text = pth.ToString();
		}
	}
}
