using System;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerAchievement
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nt
	{
		public string mmf;

		internal bool fnt((CareerDate, te) a)
		{
			if (a.Item2.Properties.Id == mmf)
			{
				return a.Item2.poq;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nu
	{
		public TournamentSeries mmg;

		internal bool fnu((CareerDate, te) a)
		{
			if (a.Item2.Properties.Series == mmg)
			{
				return a.Item2.poq;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nv
	{
		public string mmh;

		internal bool fnv((CareerDate, te) a)
		{
			if (a.Item2.Properties.Id == mmh)
			{
				return foe(a.Item2);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nw
	{
		public TournamentSeries mmi;

		internal bool fnw((CareerDate, te) a)
		{
			if (a.Item2.Properties.Series == mmi)
			{
				return foe(a.Item2);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nx
	{
		public tn mmj;

		internal bool fnx((CareerDate, CareerTrainingScore) a)
		{
			if (a.Item2.TrainingInfo.nca == mmj.nca)
			{
				return a.Item2.TrainingInfo.ncb == mmj.ncb;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ny
	{
		public tn mmk;

		public int[] mml;

		internal bool fny((CareerDate, CareerTrainingScore) a)
		{
			if (a.Item2.TrainingInfo.nca == mmk.nca)
			{
				return a.Item2.TrainingInfo.ncb == mmk.ncb;
			}
			return false;
		}

		internal bool fnz(tp a, int b)
		{
			return a.gqz(mml[b]) == MedalType.Gold;
		}
	}

	private static readonly string[] mmm = new string[3] { "WorldNationsGames", "WorldChampionships", "EnglandOpen" };

	[JsonProperty("Type")]
	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public AchievementType Type
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("UnlockDate")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public CareerDate? UnlockDate
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Uncollected", DefaultValueHandling = DefaultValueHandling.Ignore)]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public bool Uncollected
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	private static bool foa(string a)
	{
		return Career.Current.Tournaments.Any(((CareerDate, te) a) => a.Item2.Properties.Id == a && a.Item2.poq);
	}

	public static bool fob(TournamentSeries a)
	{
		return Career.Current.Tournaments.Any(((CareerDate, te) a) => a.Item2.Properties.Series == a && a.Item2.poq);
	}

	public static bool foc(string a)
	{
		return Career.Current.Tournaments.Any(((CareerDate, te) a) => a.Item2.Properties.Id == a && foe(a.Item2));
	}

	public static bool fod(TournamentSeries a)
	{
		return Career.Current.Tournaments.Any(((CareerDate, te) a) => a.Item2.Properties.Series == a && foe(a.Item2));
	}

	public static bool foe(te a)
	{
		return te.gqb(a.Participants[0], Career.Current.MainCharacter.piz);
	}

	public static bool fof(tn a)
	{
		return Career.Current.Trainings.Any(((CareerDate, CareerTrainingScore) a) => a.Item2.TrainingInfo.nca == a.nca && a.Item2.TrainingInfo.ncb == a.ncb);
	}

	public static int fog(tn a)
	{
		int[] mml = new int[a.ncc.Count];
		foreach (var item in Career.Current.Trainings.Where(((CareerDate, CareerTrainingScore) a) => a.Item2.TrainingInfo.nca == a.nca && a.Item2.TrainingInfo.ncb == a.ncb))
		{
			for (int i = 0; i < a.ncc.Count; i++)
			{
				mml[i] = Math.Max(mml[i], (item.Item2.Scores?[i]).GetValueOrDefault());
			}
		}
		return a.ncc.Where((tp a, int b) => a.gqz(mml[b]) == MedalType.Gold).Count();
	}

	public static int? foh(AchievementType a)
	{
		return a switch
		{
			AchievementType.CAREER_PLAY_ALL_INTERNATIONAL_CHALLENGES => tk.pos.Count((sz a) => a.Series == TournamentSeries.InternationalChallenge && foa(a.Id)), 
			AchievementType.CAREER_PLAY_ALL_SUPER_100 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super100 && foa(a.Id)), 
			AchievementType.CAREER_PLAY_ALL_SUPER_300 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super300 && foa(a.Id)), 
			AchievementType.CAREER_PLAY_ALL_SUPER_500 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super500 && foa(a.Id)), 
			AchievementType.CAREER_PLAY_ALL_SUPER_750 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super750 && foa(a.Id)), 
			AchievementType.CAREER_PLAY_ALL_SUPER_1000 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super1000 && foa(a.Id)), 
			AchievementType.CAREER_WIN_ALL_INTERNATIONAL_CHALLENGES => tk.pos.Count((sz a) => a.Series == TournamentSeries.InternationalChallenge && foc(a.Id)), 
			AchievementType.CAREER_WIN_ALL_SUPER_100 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super100 && foc(a.Id)), 
			AchievementType.CAREER_WIN_ALL_SUPER_300 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super300 && foc(a.Id)), 
			AchievementType.CAREER_WIN_ALL_SUPER_500 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super500 && foc(a.Id)), 
			AchievementType.CAREER_WIN_ALL_SUPER_750 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super750 && foc(a.Id)), 
			AchievementType.CAREER_WIN_ALL_SUPER_1000 => tk.pos.Count((sz a) => a.Series == TournamentSeries.Super1000 && foc(a.Id)), 
			AchievementType.CAREER_GRAND_SLAM => tk.pos.Count((sz a) => mmm.Contains(a.Id) && foc(a.Id)), 
			AchievementType.CAREER_FINISH_ALL_LEVEL1_TRAINING => tn.ncf.Count((tn a) => a.ncb == 1 && fof(a)), 
			AchievementType.CAREER_FINISH_ALL_LEVEL2_TRAINING => tn.ncf.Count((tn a) => a.ncb == 2 && fof(a)), 
			AchievementType.CAREER_FINISH_ALL_LEVEL3_TRAINING => tn.ncf.Count((tn a) => a.ncb == 3 && fof(a)), 
			AchievementType.CAREER_GOLD_ALL_LEVEL1_TRAINING => tn.ncf.Where((tn a) => a.ncb == 1).Sum((Func<tn, int>)fog), 
			AchievementType.CAREER_GOLD_ALL_LEVEL2_TRAINING => tn.ncf.Where((tn a) => a.ncb == 2).Sum((Func<tn, int>)fog), 
			AchievementType.CAREER_GOLD_ALL_LEVEL3_TRAINING => tn.ncf.Where((tn a) => a.ncb == 3).Sum((Func<tn, int>)fog), 
			_ => null, 
		};
	}

	public static int? foi(AchievementType a)
	{
		switch (a)
		{
		case AchievementType.CAREER_PLAY_ALL_INTERNATIONAL_CHALLENGES:
		case AchievementType.CAREER_WIN_ALL_INTERNATIONAL_CHALLENGES:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.InternationalChallenge);
		case AchievementType.CAREER_PLAY_ALL_SUPER_100:
		case AchievementType.CAREER_WIN_ALL_SUPER_100:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.Super100);
		case AchievementType.CAREER_PLAY_ALL_SUPER_300:
		case AchievementType.CAREER_WIN_ALL_SUPER_300:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.Super300);
		case AchievementType.CAREER_PLAY_ALL_SUPER_500:
		case AchievementType.CAREER_WIN_ALL_SUPER_500:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.Super500);
		case AchievementType.CAREER_PLAY_ALL_SUPER_750:
		case AchievementType.CAREER_WIN_ALL_SUPER_750:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.Super750);
		case AchievementType.CAREER_PLAY_ALL_SUPER_1000:
		case AchievementType.CAREER_WIN_ALL_SUPER_1000:
			return tk.pos.Count((sz a) => a.Week.HasValue && a.Series == TournamentSeries.Super1000);
		case AchievementType.CAREER_GRAND_SLAM:
			return mmm.Length;
		case AchievementType.CAREER_FINISH_ALL_LEVEL1_TRAINING:
			return tn.ncf.Count((tn a) => a.ncb == 1);
		case AchievementType.CAREER_FINISH_ALL_LEVEL2_TRAINING:
			return tn.ncf.Count((tn a) => a.ncb == 2);
		case AchievementType.CAREER_FINISH_ALL_LEVEL3_TRAINING:
			return tn.ncf.Count((tn a) => a.ncb == 3);
		case AchievementType.CAREER_GOLD_ALL_LEVEL1_TRAINING:
			return tn.ncf.Where((tn a) => a.ncb == 1).Sum((tn a) => a.ncc.Count);
		case AchievementType.CAREER_GOLD_ALL_LEVEL2_TRAINING:
			return tn.ncf.Where((tn a) => a.ncb == 2).Sum((tn a) => a.ncc.Count);
		case AchievementType.CAREER_GOLD_ALL_LEVEL3_TRAINING:
			return tn.ncf.Where((tn a) => a.ncb == 3).Sum((tn a) => a.ncc.Count);
		default:
			return null;
		}
	}
}
