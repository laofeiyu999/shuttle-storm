using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class ne
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nb
	{
		public AchievementType mkq;

		internal bool fhp(AchievementInfo a)
		{
			return a.Type == mkq;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nc
	{
		public pz.EquipmentType mkr;

		public string mks;

		internal bool fhq(AchievementInfo a)
		{
			AchievementReward reward = a.Reward;
			if (reward != null && reward.fhz() == mkr)
			{
				return a.Reward.Id == mks;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nd
	{
		public pz.EquipmentType mkt;

		public string mku;

		internal bool fhr(CareerUnlockedEquipment a)
		{
			if (a.Type == mkt)
			{
				return a.Id == mku;
			}
			return false;
		}

		internal bool fhs(AchievementInfo a)
		{
			AchievementReward reward = a.Reward;
			if (reward != null && reward.fhz() == mkt && a.Reward.Id == mku)
			{
				return ry.pnt.gjo(a.Type);
			}
			return false;
		}
	}

	private static AchievementInfo[] mkv;

	public static IEnumerable<AchievementInfo> pil
	{
		get
		{
			if (mkv == null)
			{
				mkv = JsonConvert.DeserializeObject<AchievementInfo[]>(Resources.Load<TextAsset>("Achievements").text);
			}
			return mkv;
		}
	}

	public static List<AchievementInfo> pim => pil.Where((AchievementInfo a) => a.Type.ToString().StartsWith("CAREER_")).ToList();

	public static AchievementInfo fhv(AchievementType a)
	{
		return pil.FirstOrDefault((AchievementInfo a) => a.Type == a);
	}

	public static bool fhw(pz.EquipmentType a, string b)
	{
		return pil.Any(delegate(AchievementInfo a)
		{
			AchievementReward reward = a.Reward;
			return reward != null && reward.fhz() == a && a.Reward.Id == b;
		});
	}

	public static bool fhx(pz.EquipmentType a, string b)
	{
		if (Career.Current != null)
		{
			return Career.Current.UnlockedEquipments.Any((CareerUnlockedEquipment a) => a.Type == a && a.Id == b);
		}
		return pil.Any(delegate(AchievementInfo a)
		{
			AchievementReward reward = a.Reward;
			return reward != null && reward.fhz() == a && a.Reward.Id == b && ry.pnt.gjo(a.Type);
		});
	}

	public static Sprite fhy(AchievementType a, bool b)
	{
		return Resources.Load<Sprite>(string.Format("Images/Achievements/{0}{1}", a, b ? "_d" : ""));
	}
}
