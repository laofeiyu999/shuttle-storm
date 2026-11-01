using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerParticipant : ob
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oc
	{
		public Career mms;

		public CareerParticipant mmt;

		public IEnumerable<TournamentMatch> mmu;

		public Func<TournamentMatch, bool> mmv;

		public Func<TournamentMatch, qz> mmw;

		internal bool fpq((CareerDate, CareerTrainingScore) a)
		{
			return CareerDate.fow(a.Item1, mms.CurrentDate);
		}

		internal IEnumerable<TournamentMatch> fpr(Tournament a)
		{
			return a.pnu.Where((TournamentMatch a) => a.gof(mmt.CharacterId));
		}

		internal bool fpt(TournamentMatch a)
		{
			return a.gof(mmt.CharacterId);
		}

		internal float fpu(Func<qz, float> a)
		{
			od CS_0024_003C_003E8__locals0 = new od
			{
				mmx = a
			};
			List<float> source = (from a in mmu
				select a.Stats.Recap.get(mmt.CharacterId) into a
				where a.pmh > 0
				select CS_0024_003C_003E8__locals0.mmx(a) / (float)a.pmh).ToList();
			if (!source.Any())
			{
				return 0.3f;
			}
			return source.Average();
		}

		internal qz fpv(TournamentMatch a)
		{
			return a.Stats.Recap.get(mmt.CharacterId);
		}

		internal float fpw(TournamentMatch a)
		{
			return (float)a.Stats.Recap.get(mmt.CharacterId).PercentTimeAggressive / 10f;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class od
	{
		public Func<qz, float> mmx;

		internal float fpx(qz a)
		{
			return mmx(a) / (float)a.pmh;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oe
	{
		public Career mmy;

		public CareerTrainingScore mmz;

		internal bool fpy((CareerDate, CareerTrainingScore) a)
		{
			return CareerDate.fow(a.Item1, mmy.CurrentDate);
		}

		internal bool fpz((CareerDate, CareerTrainingScore) a)
		{
			if (CareerDate.fox(a.Item1, mmy.CurrentDate) && a.Item2.TrainingInfo.nca == mmz.TrainingInfo.nca)
			{
				return a.Item2.TrainingInfo.ncb == mmz.TrainingInfo.ncb;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string CharacterId;

	public string piz => CharacterId;

	[JsonProperty("CharacterInfo")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public CharacterInfo CharacterInfo
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Points")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int Points
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Rank")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? Rank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("PreviousRank")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? PreviousRank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("StatsEvolution")]
	[JsonConverter(typeof(oh))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Dictionary<CareerDate, CharacterStats> StatsEvolution
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	} = new Dictionary<CareerDate, CharacterStats>();


	[JsonProperty("ProgressionPotential")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public float ProgressionPotential
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	public TournamentCategory pjb
	{
		get
		{
			if (!(CharacterInfo.gender == "m"))
			{
				return TournamentCategory.WomenDoubles;
			}
			return TournamentCategory.MenDoubles;
		}
	}

	public int pjc
	{
		get
		{
			DateTime dateTime = Career.Current.CurrentDate.fos(DayOfWeek.Monday);
			int num = dateTime.Year - CharacterInfo.birthDate.Year;
			if (CharacterInfo.birthDate.Date > dateTime.AddYears(-num))
			{
				num--;
			}
			return num;
		}
	}

	[OnDeserialized]
	internal void fqc(StreamingContext a)
	{
		if (CharacterInfo == null)
		{
			CharacterInfo = os.fsk(CharacterId).fsp();
			CharacterInfo.stats = StatsEvolution.Last().Value;
			fqe();
		}
	}

	public virtual bool fqd()
	{
		return false;
	}

	[JsonConstructor]
	protected CareerParticipant()
	{
	}

	public CareerParticipant(CharacterInfo character)
	{
		CharacterId = character.id;
		CharacterInfo = character.fsp();
		ProgressionPotential = 0.5f + (Mathf.Pow(character.stats.pjo / 10f, 3f) / (float)CharacterInfo.pjn - 8f) / 48f;
		fqe();
	}

	private void fqe()
	{
		CharacterInfo.fsu(Countries.fxc(CharacterInfo.country).Outfit, b: false);
	}

	public void fqf(Career a)
	{
	}

	public void fqg(Career a)
	{
		float num = 0.2f;
		float num2 = 1f + ((25f - (float)pjc) / 10f).gtg(-0.5f, 0.5f);
		int num3 = ((pjc - 30) / 5).gth(0, 2);
		float num4 = fqj();
		if (this != a.MainCharacter)
		{
			float b = num * (ProgressionPotential * num2 * num4 - (float)num3);
			fqi(a.CurrentDate.fou(), new CharacterStats
			{
				defense = CharacterInfo.stats.defense + fqk(CharacterInfo.stats.defense, b),
				power = CharacterInfo.stats.power + fqk(CharacterInfo.stats.power, b),
				precision = CharacterInfo.stats.precision + fqk(CharacterInfo.stats.precision, b),
				speed = CharacterInfo.stats.speed + fqk(CharacterInfo.stats.speed, b),
				stamina = CharacterInfo.stats.stamina + fqk(CharacterInfo.stats.stamina, b)
			});
		}
		else if (a.Trainings.Any(((CareerDate, CareerTrainingScore) a) => CareerDate.fow(a.Item1, a.CurrentDate)))
		{
			fqh(a);
		}
		else
		{
			if (!a.CurrentRegisteredTournaments.Any())
			{
				return;
			}
			IEnumerable<TournamentMatch> source = a.CurrentRegisteredTournaments.SelectMany((Tournament a) => a.pnu.Where((TournamentMatch a) => a.gof(CharacterId)));
			float num5 = (1f + (float)source.Count() / 20f).gtg(1f, 1.5f);
			Dictionary<string, float> dictionary = new Dictionary<string, float>
			{
				{ "defense", 1f },
				{ "power", 1f },
				{ "precision", 1f },
				{ "speed", 1f },
				{ "stamina", 1f }
			};
			IEnumerable<TournamentMatch> mmu = source.Where((TournamentMatch a) => !a.Stats.HasBeenGenerated);
			if (mmu.Any())
			{
				Func<Func<qz, float>, float> func = delegate(Func<qz, float> a)
				{
					List<float> source2 = (from a in mmu
						select a.Stats.Recap.get(CharacterId) into a
						where a.pmh > 0
						select a(a) / (float)a.pmh).ToList();
					return (!source2.Any()) ? 0.3f : source2.Average();
				};
				pn.fya(a.MainCharacter.Energy);
				dictionary = new Dictionary<string, float>
				{
					{
						"defense",
						func((qz a) => a.TotalDefense).gtg(0f, 0.4f) + 0.8f
					},
					{
						"power",
						func((qz a) => a.TotalSmash).gtg(0f, 0.5f) + 0.7f
					},
					{
						"precision",
						func((qz a) => a.TotalDrop).gtg(0f, 0.5f) + 0.7f
					},
					{
						"speed",
						mmu.Average((TournamentMatch a) => (float)a.Stats.Recap.get(CharacterId).PercentTimeAggressive / 10f).gtg(0f, 1f) * 0.5f + 0.7f
					},
					{
						"stamina",
						mmu.Average((TournamentMatch a) => (float)a.Stats.Recap.AverageRallyLength / 8f).gtg(0f, 1f) * 0.5f + 0.7f
					}
				};
				float num6 = dictionary.Values.Average();
				float num7 = 1f - num6;
				foreach (string item in dictionary.Keys.ToList())
				{
					dictionary[item] += num7;
				}
			}
			Dictionary<string, float> dictionary2 = new Dictionary<string, float>
			{
				{
					"defense",
					CharacterInfo.stats.defense
				},
				{
					"power",
					CharacterInfo.stats.power
				},
				{
					"precision",
					CharacterInfo.stats.precision
				},
				{
					"speed",
					CharacterInfo.stats.speed
				},
				{
					"stamina",
					CharacterInfo.stats.stamina
				}
			};
			foreach (string item2 in dictionary2.Keys.ToList())
			{
				float b2 = num * (ProgressionPotential * num2 * num4 * num5 * dictionary[item2] - (float)num3);
				b2 = fqk(dictionary2[item2], b2);
				dictionary2[item2] += b2;
			}
			fqi(a.CurrentDate.fou(), new CharacterStats
			{
				defense = dictionary2["defense"],
				power = dictionary2["power"],
				precision = dictionary2["precision"],
				speed = dictionary2["speed"],
				stamina = dictionary2["stamina"]
			});
		}
	}

	private void fqh(Career a)
	{
		CareerTrainingScore mmz = a.Trainings.Find(((CareerDate, CareerTrainingScore) a) => CareerDate.fow(a.Item1, a.CurrentDate)).Item2;
		IEnumerable<(CareerDate, CareerTrainingScore)> source = a.Trainings.Where(((CareerDate, CareerTrainingScore) a) => CareerDate.fox(a.Item1, a.CurrentDate) && a.Item2.TrainingInfo.nca == mmz.TrainingInfo.nca && a.Item2.TrainingInfo.ncb == mmz.TrainingInfo.ncb);
		float num = 1f;
		if (source.Count() == 1)
		{
			num = 0.5f;
		}
		else if (source.Count() > 1)
		{
			num = 0.3f;
		}
		float num2 = (float)mmz.Scores.Count((int? a) => a.HasValue) / (float)mmz.TrainingInfo.ncc.Count;
		float num3 = 0f;
		for (int i = 0; i < mmz.TrainingInfo.ncc.Count; i++)
		{
			if (mmz.Scores[i].HasValue)
			{
				switch (mmz.TrainingInfo.ncc[i].gqz(mmz.Scores[i].Value))
				{
				case MedalType.Gold:
					num3 += 1f;
					break;
				case MedalType.Silver:
					num3 += 2f / 3f;
					break;
				case MedalType.Bronze:
					num3 += 1f / 3f;
					break;
				}
			}
		}
		float num4 = num3 / (float)mmz.TrainingInfo.ncc.Count;
		float num5 = 1f + num4 * 0.5f;
		float num6 = 2.5f * num2 * num5 * num * fqj();
		CharacterStats characterStats = CharacterInfo.stats.ftl();
		foreach (KeyValuePair<CharacterStatsType, float> item in mmz.TrainingInfo.nce)
		{
			float a2 = CharacterInfo.stats.ftn(item.Key);
			float b = fqk(a2, num6 * item.Value);
			characterStats.fto(item.Key, b);
		}
		fqi(a.CurrentDate.fou(), characterStats);
	}

	private void fqi(CareerDate a, CharacterStats b)
	{
		StatsEvolution.Add(a, b);
		CharacterInfo.stats = b;
	}

	private float fqj()
	{
		CareerParticipant careerParticipant = Career.Current.flo(this, pjb).FirstOrDefault()?.fpg(CharacterId);
		CareerParticipant careerParticipant2 = Career.Current.flo(this, TournamentCategory.MixedDoubles).FirstOrDefault()?.fpg(CharacterId);
		return 1f + ((((careerParticipant != null && careerParticipant.CharacterInfo.stats.pjo > (careerParticipant2?.CharacterInfo?.stats?.pjo).GetValueOrDefault()) ? careerParticipant : careerParticipant2)?.CharacterInfo?.stats?.pjo).GetValueOrDefault() - CharacterInfo.stats.pjo).gtg(0f, 10f) * 0.03f;
	}

	private float fqk(float a, float b)
	{
		if (!(b > 0f))
		{
			return b;
		}
		return b *= ((100f - a) / 20f).gtg(0f, 1f);
	}
}
