using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ChallengesPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gx
	{
		public List<AchievementInfo> ldl;

		public Table ldm;

		internal bool czd(CareerAchievement a)
		{
			return a.Type == ldl[ldm.pto].Type;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gy
	{
		public AchievementInfo ldn;

		internal bool cze(CareerAchievement a)
		{
			return a.Type == ldn.Type;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gz
	{
		public AchievementInfo ldo;

		internal bool czf(CareerAchievement a)
		{
			return a.Type == ldo.Type;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ha
	{
		public AchievementInfo ldp;

		internal bool czg(CareerAchievement a)
		{
			return a.Type == ldp.Type;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table allTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table tournamentsTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table trainingsTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table matchesTable;

	private List<AchievementInfo> ldq = new List<AchievementInfo>();

	private TabsManager oxu => GetComponent<TabsManager>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += czi;
		oxu.nmx += czj;
		this.guz(delegate
		{
			czj(oxu.ptp);
		});
		ldq = (from a in ne.pim
			orderby Career.Current.Achievements.Find((CareerAchievement a) => a.Type == a.Type)?.Uncollected ?? false descending, Career.Current.Achievements.Any((CareerAchievement a) => a.Type == a.Type), (!CareerAchievement.foi(a.Type).HasValue) ? new float?(0f) : ((float)CareerAchievement.foh(a.Type).Value / (float?)CareerAchievement.foi(a.Type)) descending
			select a).ToList();
		czk();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= czi;
		oxu.nmx -= czj;
	}

	private void czi(InputAction.CallbackContext a)
	{
		if (this.gus())
		{
			Table ldm = oxu.ptp switch
			{
				0 => allTable, 
				1 => tournamentsTable, 
				2 => trainingsTable, 
				_ => matchesTable, 
			};
			List<AchievementInfo> ldl = oxu.ptp switch
			{
				0 => ldq, 
				1 => ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Tournament).ToList(), 
				2 => ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Training).ToList(), 
				_ => ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Match).ToList(), 
			};
			CareerAchievement careerAchievement = Career.Current.Achievements.Find((CareerAchievement a) => a.Type == ldl[ldm.pto].Type);
			if (careerAchievement != null)
			{
				czo(careerAchievement);
			}
		}
	}

	private void czj(int a)
	{
		List<TabsManager.Tab> tabs = oxu.Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.transform.Find("Border").gameObject.SetActive(i == a);
		}
	}

	private void czk()
	{
		czl(allTable, ldq.ToList());
		czl(tournamentsTable, ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Tournament).ToList());
		czl(trainingsTable, ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Training).ToList());
		czl(matchesTable, ldq.Where((AchievementInfo a) => a.Category == AchievementCategory.Match).ToList());
	}

	private void czl(Table a, List<AchievementInfo> b)
	{
		a.Columns = new List<TableColumn>
		{
			new TableColumn("", czm, 150f)
		};
		a.BodyRowHeight = 100f;
		a.Rows = b.Select(czn).ToList();
		a.Refresh();
	}

	private void czm(GameObject a, vu b, int c, bool d, Table e)
	{
		ChallengeItem challengeItem = UnityEngine.Object.Instantiate(ChallengeItem.oxt, a.transform);
		challengeItem.GetComponent<RectTransform>().guk();
		challengeItem.cyt((AchievementType)b.nmq["Type"], (AchievementReward)b.nmq["Reward"], (bool)b.nmq["IsComplete"], (bool)b.nmq["IsCollected"], (int?)b.nmq["CurrentValue"], (int?)b.nmq["MaxValue"]);
	}

	private vu czn(AchievementInfo a)
	{
		CareerAchievement careerAchievement = Career.Current.Achievements.Find((CareerAchievement a) => a.Type == a.Type);
		return new vu
		{
			nmq = new Dictionary<string, object>
			{
				{ "Type", a.Type },
				{ "Reward", a.Reward },
				{
					"IsComplete",
					careerAchievement != null
				},
				{
					"IsCollected",
					careerAchievement != null && !careerAchievement.Uncollected
				},
				{
					"CurrentValue",
					CareerAchievement.foh(a.Type)
				},
				{
					"MaxValue",
					CareerAchievement.foi(a.Type)
				}
			}
		};
	}

	private void czo(CareerAchievement a)
	{
		AchievementInfo achievementInfo = ne.fhv(a.Type);
		if (achievementInfo.Reward == null || !a.Uncollected)
		{
			return;
		}
		a.Uncollected = false;
		pz.EquipmentType? equipmentType = achievementInfo.Reward?.fhz();
		if (equipmentType.HasValue)
		{
			Career.Current.UnlockedEquipments.Add(new CareerUnlockedEquipment
			{
				Type = equipmentType.Value,
				Id = achievementInfo.Reward.Id,
				Unread = true
			});
			AudioManager.fjb();
		}
		else
		{
			CharacterStats stats = Career.Current.MainCharacter.CharacterInfo.stats;
			CharacterStats a2 = Career.Current.MainCharacter.CharacterInfo.stats.ftl();
			if (achievementInfo.Reward.Type == AchievementRewardType.AllStats)
			{
				foreach (CharacterStatsType item in Enum.GetValues(typeof(CharacterStatsType)).Cast<CharacterStatsType>())
				{
					stats.fto(item, 0.5f);
				}
			}
			else
			{
				stats.fto((achievementInfo.Reward?.fia()).Value, 2f);
			}
			Career.Current.MainCharacter.StatsEvolution[Career.Current.MainCharacter.StatsEvolution.Last().Key] = stats;
			careerMenu.cxs(a2, stats);
		}
		czk();
		careerMenu.cxq();
	}

	[CompilerGenerated]
	private void czp()
	{
		czj(oxu.ptp);
	}
}
