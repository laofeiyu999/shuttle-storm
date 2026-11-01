using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qm
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum HintType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_SERVICE_DIAGONAL,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_RIGHT_LEFT_SERVE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_DOUBLE_TOUCH,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_SCORE_SERVE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_SET_SCORE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RULE_SET_MATCH,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_ANTICIPATE_SHOT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SHOOT_FORWARD,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SHOOT_EARLY,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SMASH_DANGEROUS,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_CHOOSE_SHOT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_INTENSITY_AGGRESSIVE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_INTENSITY_EFFICIENT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_INTENSITY_TEMPORARY,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SERVE_IMPORTANT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SERVE_RETURN,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SINGLES_REPOSITION,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_DOUBLES_REPOSITION,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_COVER_FRONT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_NET_DISTANCE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_DOUBLES_ATTACK,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_CROSS_NET,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_DEFENSE_POSITIONNING,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_FRONTBACK_ROTATE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_DEFENSE_LEFTRIGHT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_VARIETY_WIN,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_LOOK_OPPONENT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_TEMPO_CHANGE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_SMASH_BODY,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MATCH_TALL_PLAYERS,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_PROGRESSION,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_WATCH_ENERGY,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_TOURNAMENT_SERIES,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_TOURNAMENT_QUALIFICATIONS,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_WATCH_CALENDAR,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_TOURNAMENTS_DRAW,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_TOURNAMENT_POINTS,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_PARTNER_PROGRESSION,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_PARTNER_STYLE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_PARTNER_COMPLICITY,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_RESULTS_COUNT,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CAREER_WORLD_TOUR_FINALS,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ONLINE_NO_CHEATING
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ql
	{
		public Dictionary<HintType, int> msm;

		public Func<HintType, bool> msn;

		internal bool gat(HintType a)
		{
			return msm[a] == 0;
		}
	}

	public const string mso = "lastShownHints";

	public static List<HintType> msp;

	public static bool msq;

	public static List<HintType> gau()
	{
		if (msp == null)
		{
			msp = PlayerPrefs.GetString("lastShownHints", "").Split(',').Select(delegate(string a)
			{
				Enum.TryParse<HintType>(a, out var result);
				return result;
			})
				.ToList();
		}
		Dictionary<HintType, int> msm = Enum.GetValues(typeof(HintType)).Cast<HintType>().ToDictionary((HintType a) => a, (HintType a) => 100);
		foreach (HintType item in msm.Keys.Where((HintType a) => a.ToString().StartsWith("RULE_")).ToList())
		{
			msm[item] = (int)Math.Round((float)msm[item] * Mathf.Lerp(3f, 0f, (float)qj.plj / 20f));
		}
		foreach (HintType item2 in msm.Keys.Where((HintType a) => a.ToString().StartsWith("CAREER_")).ToList())
		{
			msm[item2] *= ((Career.Current != null) ? 2 : 0);
		}
		if (MatchSettings.Current != null)
		{
			if (MatchSettings.Current.IsDouble)
			{
				msm[HintType.MATCH_SINGLES_REPOSITION] = 0;
			}
			else
			{
				msm[HintType.MATCH_DOUBLES_ATTACK] = 0;
				msm[HintType.MATCH_DOUBLES_REPOSITION] = 0;
			}
		}
		if (!msq)
		{
			msm[HintType.ONLINE_NO_CHEATING] = 0;
		}
		if (qj.plj < 5)
		{
			msm[HintType.MATCH_ANTICIPATE_SHOT] *= 10;
		}
		else if (qj.plj < 10)
		{
			msm[HintType.MATCH_ANTICIPATE_SHOT] *= 5;
			msm[HintType.MATCH_INTENSITY_AGGRESSIVE] *= 3;
			msm[HintType.MATCH_INTENSITY_EFFICIENT] *= 3;
			msm[HintType.MATCH_INTENSITY_TEMPORARY] *= 3;
			msm[HintType.MATCH_NET_DISTANCE] /= 2;
			msm[HintType.MATCH_SINGLES_REPOSITION] /= 2;
			msm[HintType.MATCH_DOUBLES_REPOSITION] /= 2;
			msm[HintType.MATCH_CROSS_NET] /= 2;
		}
		if (qj.plj < 30)
		{
			msm[HintType.MATCH_VARIETY_WIN] /= 5;
			msm[HintType.MATCH_LOOK_OPPONENT] /= 5;
			msm[HintType.MATCH_TEMPO_CHANGE] /= 5;
			msm[HintType.MATCH_SMASH_BODY] /= 5;
			msm[HintType.MATCH_TALL_PLAYERS] /= 5;
			msm[HintType.MATCH_DEFENSE_POSITIONNING] /= 5;
			msm[HintType.MATCH_FRONTBACK_ROTATE] /= 5;
			msm[HintType.MATCH_DEFENSE_LEFTRIGHT] /= 5;
		}
		else
		{
			msm[HintType.MATCH_ANTICIPATE_SHOT] /= 2;
		}
		if (Career.Current != null)
		{
			int num = Career.Current.CurrentDate.fot(new CareerDate(2026, 1));
			if (num < 20)
			{
				msm[HintType.CAREER_TOURNAMENT_POINTS] /= 5;
			}
			if (num < 20)
			{
				msm[HintType.CAREER_PARTNER_COMPLICITY] /= 5;
			}
			if (num < 30)
			{
				msm[HintType.CAREER_WORLD_TOUR_FINALS] /= 5;
			}
			if (num < 30)
			{
				msm[HintType.CAREER_WORLD_TOUR_FINALS] /= 5;
			}
			if (num > 80)
			{
				msm[HintType.CAREER_TOURNAMENT_QUALIFICATIONS] /= 5;
			}
		}
		foreach (HintType item3 in msp)
		{
			msm[item3] = 0;
		}
		foreach (HintType item4 in msm.Keys.Where((HintType a) => msm[a] == 0).ToList())
		{
			msm.Remove(item4);
		}
		int num2 = 3;
		List<HintType> list = new List<HintType>();
		while (list.Count < num2)
		{
			HintType hintType = msm.gtm();
			list.Add(hintType);
			msm.Remove(hintType);
		}
		return list;
	}

	public static void gav(HintType a)
	{
		if (msp.Contains(a))
		{
			msp.Remove(a);
		}
		msp.Insert(0, a);
		msp = msp.Take(10).ToList();
		PlayerPrefs.SetString("lastShownHints", string.Join(',', msp.Select((HintType a) => a.ToString())));
	}
}
