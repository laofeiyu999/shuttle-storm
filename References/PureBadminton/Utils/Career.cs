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
public class Career : qb
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nh
	{
		public sz mlr;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ni
	{
		public TournamentCategory mls;

		public nh mlt;

		internal bool fke(Tournament a)
		{
			if (a.Properties.Id == mlt.mlr.Id)
			{
				return a.Category == mls;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nj
	{
		public CareerPair mlu;

		internal bool fkf(CareerParticipant a)
		{
			return a.CharacterId == mlu.CharacterBId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nk
	{
		public CareerParticipant mlv;

		public Career mlw;

		internal bool fkg(CareerPair a)
		{
			if (a.fpf(mlv.CharacterId))
			{
				return a.fpf(mlw.MainCharacter.CharacterId);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nl
	{
		public float mlx;

		internal void fkh(CareerParticipant a)
		{
			a.Points = Mathf.RoundToInt((float)a.CharacterInfo.singlePoints.GetValueOrDefault() * mlx);
		}

		internal void fki(CareerPair a)
		{
			a.Points = Mathf.RoundToInt((float)(pd.ftx(a.piz)?.points ?? 0) * mlx);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nm
	{
		public string mly;

		internal bool fkj(CareerPair a)
		{
			return a.PairId == mly;
		}

		internal bool fkk(CareerParticipant a)
		{
			return a.CharacterId == mly;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nn
	{
		public string mlz;

		internal bool fkl(CareerPair a)
		{
			if (a.piz == mlz && a.Complicity.HasValue)
			{
				return a.Complicity < 1f;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class no
	{
		public CareerParticipant mma;

		internal bool fkm(CareerPair a)
		{
			return a.fpf(mma.CharacterId);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class np
	{
		public CareerPair mmb;

		internal bool fkn(CareerPair a)
		{
			return a.PairId == mmb.PairId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nq
	{
		public AchievementInfo mmc;

		internal bool fko(CareerAchievement a)
		{
			return a.Type == mmc.Type;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class nr
	{
		public AchievementType mmd;

		internal bool fkp(CareerAchievement a)
		{
			return a.Type == mmd;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ns
	{
		public CareerMainParticipant mme;

		internal bool fkq(CareerPair a)
		{
			return a.fpf(mme.CharacterId);
		}

		internal bool fkr(CareerParticipant a)
		{
			if (a.CharacterId != mme.CharacterId)
			{
				return a.CharacterInfo.country == mme.CharacterInfo.country;
			}
			return false;
		}

		internal int fks(CareerParticipant a)
		{
			return Math.Abs(mme.Points - a.Points);
		}

		internal bool fkt(CareerParticipant a)
		{
			return a.CharacterId != mme.CharacterId;
		}

		internal int fku(CareerParticipant a)
		{
			return Math.Abs(mme.Points - a.Points);
		}
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const ushort SAVE_FILE_LATEST_VERSION = 2;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const int START_YEAR = 2026;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const int MAX_PENDING_INVITATIONS = 5;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const float PAIR_COMPLICITY_INCREASE_PER_MATCH = 1f / 15f;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public static Career Current;

	[JsonProperty("CurrentDate")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CareerDate CurrentDate;

	[JsonProperty("CurrentRegisteredTournaments")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public List<Tournament> CurrentRegisteredTournaments = new List<Tournament>();

	[JsonProperty("CurrentTraining")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CareerTrainingScore CurrentTraining;

	[JsonIgnore]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Dictionary<TournamentCategory, List<ob>> Rankings = new Dictionary<TournamentCategory, List<ob>>
	{
		{
			TournamentCategory.MenSingles,
			new List<ob>()
		},
		{
			TournamentCategory.WomenSingles,
			new List<ob>()
		},
		{
			TournamentCategory.MenDoubles,
			new List<ob>()
		},
		{
			TournamentCategory.WomenDoubles,
			new List<ob>()
		},
		{
			TournamentCategory.MixedDoubles,
			new List<ob>()
		}
	};

	[JsonProperty("Achievements")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public List<CareerAchievement> Achievements = new List<CareerAchievement>();

	[JsonProperty("UnlockedEquipments")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public List<CareerUnlockedEquipment> UnlockedEquipments = new List<CareerUnlockedEquipment>();

	[JsonProperty("Messages")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Stack<string> Messages = new Stack<string>();

	[JsonProperty("StartedDate")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public DateTime StartedDate
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("LastSavedDate")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public DateTime LastSavedDate
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	public string pio => MainCharacter.CharacterInfo.pjm + "_" + StartedDate.ToString("yyyy-MM-dd_HH-mm-ss");

	public qc pip => new ng
	{
		mlp = MainCharacter.CharacterInfo.pjm,
		mlq = LastSavedDate,
		mlo = 2
	};

	[JsonProperty("MainCharacter")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public CareerMainParticipant MainCharacter
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Characters")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<CareerParticipant> Characters
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Pairs")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<CareerPair> Pairs
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Settings")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public qg Settings
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Tournaments")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<(CareerDate, te)> Tournaments
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	} = new List<(CareerDate, te)>();


	[JsonProperty("Trainings")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<(CareerDate, CareerTrainingScore)> Trainings
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	} = new List<(CareerDate, CareerTrainingScore)>();


	[JsonIgnore]
	public sz[] piq => tk.gqk(CurrentDate).ToArray();

	[JsonIgnore]
	public List<CareerParticipant> pir => Rankings[piu].Cast<CareerParticipant>().ToList();

	[JsonIgnore]
	public List<CareerPair> pis => Rankings[piv].Cast<CareerPair>().ToList();

	[JsonIgnore]
	public List<CareerPair> pit => Rankings[TournamentCategory.MixedDoubles].Cast<CareerPair>().ToList();

	[JsonIgnore]
	public TournamentCategory piu
	{
		get
		{
			if (!(MainCharacter.CharacterInfo.gender == "m"))
			{
				return TournamentCategory.WomenSingles;
			}
			return TournamentCategory.MenSingles;
		}
	}

	[JsonIgnore]
	public TournamentCategory piv
	{
		get
		{
			if (!(MainCharacter.CharacterInfo.gender == "m"))
			{
				return TournamentCategory.WomenDoubles;
			}
			return TournamentCategory.MenDoubles;
		}
	}

	[JsonIgnore]
	public CareerPair piw => pis.FirstOrDefault((CareerPair a) => a.fpf(MainCharacter.CharacterId));

	[JsonIgnore]
	public CareerPair pix => pit.FirstOrDefault((CareerPair a) => a.fpf(MainCharacter.CharacterId));

	public string piy => $"{MainCharacter.Rank}-{piw?.Rank}-{pix?.Rank}";

	[JsonConstructor]
	private Career()
	{
	}

	public Career(CharacterInfo character, qg settings)
	{
		StartedDate = DateTime.Now;
		Settings = settings;
		settings.mrh = MatchSettings.gci();
		CurrentDate = new CareerDate(2026, 1);
		Characters = os.pjl.Select((CharacterInfo a) => new CareerParticipant(a)).ToList();
		MainCharacter = new CareerMainParticipant(character);
		Characters.Add(MainCharacter);
		Characters.ForEach(delegate(CareerParticipant a)
		{
			a.StatsEvolution.Add(CurrentDate, a.CharacterInfo.stats);
		});
		Pairs = (from a in pd.pjr.ToList()
			select new CareerPair(a, this)).ToList();
		flk();
	}

	[OnDeserialized]
	internal void flg(StreamingContext a)
	{
		Settings.mrh = MatchSettings.gci();
		int index = Characters.FindIndex((CareerParticipant a) => a.CharacterId == MainCharacter.CharacterId);
		Characters[index] = MainCharacter;
		Pairs.ForEach(delegate(CareerPair a)
		{
			a.fpe(this);
		});
		MainCharacter.PendingPairs.ForEach(delegate(CareerPair a)
		{
			a.fpe(this);
		});
		fll();
		Tournament tournament = CurrentRegisteredTournaments.Find((Tournament a) => a.Participants.Count != a.Properties.pom || a.QualificationParticipants.Count != a.Properties.pon);
		if (tournament != null)
		{
			Debug.LogException(new Exception($"Invalid number of participants in a tournament, reset the current week | Tournament type: {tournament.Properties.Id} | Parcitipants: {tournament.Participants.Count} | Expected Participants: {tournament.Properties.pom} | Qualif. Parcitipants: {tournament.QualificationParticipants.Count} | Expected Qualif. Participants: {tournament.Properties.pon}"));
			CurrentRegisteredTournaments.Clear();
		}
	}

	public void flh()
	{
		Messages.Clear();
		sz[] array = piq;
		foreach (sz mlr in array)
		{
			foreach (TournamentCategory mls in Enum.GetValues(typeof(TournamentCategory)))
			{
				Tournament tournament = CurrentRegisteredTournaments.Find((Tournament a) => a.Properties.Id == mlr.Id && a.Category == mls);
				if (tournament == null)
				{
					tournament = new Tournament(mlr, mls);
					tournament.gnk(null);
				}
				Tournaments.Add((CurrentDate, tournament.gnq()));
			}
		}
		flm();
		fln();
		MainCharacter.fqo(this);
		CurrentRegisteredTournaments.Clear();
		flk();
		CurrentDate = CurrentDate.fou();
		fli();
		fls();
	}

	private void fli()
	{
		MainCharacter.PendingPairs.RemoveAll((CareerPair a) => a.InvitationStatus == PairInvitationStatus.InvitationRefused);
		System.Random random = new System.Random();
		foreach (CareerPair mlu in MainCharacter.PendingPairs.Where((CareerPair a) => a.InvitationStatus == PairInvitationStatus.InvitationSent).ToList())
		{
			if (UnityEngine.Random.Range(1, 3) <= CurrentDate.fot(mlu.InvitationDate.Value))
			{
				int num = flq(MainCharacter);
				int num2 = flq(Characters.Find((CareerParticipant a) => a.CharacterId == mlu.CharacterBId));
				float num3 = 10f + (float)num * 0.1f;
				float num4 = ((float)(num - num2) / (num3 * 2f) + 0.5f).gtg(0f, 1f);
				bool flag = random.NextDouble() > (double)num4;
				if (flag)
				{
					AcceptPartnerInvitation(mlu);
				}
				else
				{
					DeclinePartnerInvitation(mlu);
				}
				Messages.Push(tt.gra("CareerMenu", flag ? "InvitationAcceptedModal" : "InvitationRefusedModal", mlu.mmr.CharacterInfo.pjm));
			}
		}
		if (MainCharacter.Points <= 0 || !(random.NextDouble() < 0.10000000149011612))
		{
			return;
		}
		Dictionary<CareerParticipant, int> source = Characters.Where((CareerParticipant a) => a.CharacterId != MainCharacter.CharacterId && a.CharacterInfo.country == MainCharacter.CharacterInfo.country && !Pairs.Concat(MainCharacter.PendingPairs).Any((CareerPair a) => a.fpf(a.CharacterId) && a.fpf(MainCharacter.CharacterId))).ToDictionary((CareerParticipant a) => a, (CareerParticipant a) => flq(a));
		IEnumerable<KeyValuePair<CareerParticipant, int>> enumerable = source.Where((KeyValuePair<CareerParticipant, int> a) => a.Value < MainCharacter.Rank + 10 && a.Value > MainCharacter.Rank - 30);
		if (!enumerable.Any())
		{
			enumerable = source.Where((KeyValuePair<CareerParticipant, int> a) => a.Value < MainCharacter.Rank + 20 && a.Value > MainCharacter.Rank - 50);
		}
		if (!enumerable.Any())
		{
			enumerable = source.Where((KeyValuePair<CareerParticipant, int> a) => a.Value < MainCharacter.Rank + 30 && a.Value > MainCharacter.Rank - 100);
		}
		if (enumerable.Any())
		{
			CareerParticipant key = enumerable.gtk().Key;
			MainCharacter.PendingPairs.Add(new CareerPair(MainCharacter, key, (key.CharacterInfo.gender == MainCharacter.CharacterInfo.gender) ? piv : TournamentCategory.MixedDoubles, CurrentDate, PairInvitationStatus.InvitationReceived));
			Messages.Push(tt.gra("CareerMenu", "InvitationReceivedModal", key.CharacterInfo.pjm));
		}
	}

	private void flj()
	{
		float mlx = ((CurrentDate.Year == 2026) ? ((float)(54 - CurrentDate.WeekNumber) / 53f) : 0f);
		Characters.ForEach(delegate(CareerParticipant a)
		{
			a.Points = Mathf.RoundToInt((float)a.CharacterInfo.singlePoints.GetValueOrDefault() * mlx);
		});
		Pairs.ForEach(delegate(CareerPair a)
		{
			a.Points = Mathf.RoundToInt((float)(pd.ftx(a.piz)?.points ?? 0) * mlx);
		});
		Dictionary<ob, List<int>> dictionary = new Dictionary<ob, List<int>>();
		ob key;
		foreach (var (careerDate, te2) in Tournaments)
		{
			if (careerDate.Year < CurrentDate.Year - 1 || (careerDate.Year == CurrentDate.Year - 1 && careerDate.WeekNumber <= CurrentDate.WeekNumber))
			{
				continue;
			}
			string[] participants = te2.Participants;
			foreach (string mly in participants)
			{
				ob obj;
				if (!te2.por)
				{
					key = Characters.Find((CareerParticipant a) => a.CharacterId == mly);
					obj = key;
				}
				else
				{
					key = Pairs.Find((CareerPair a) => a.PairId == mly);
					obj = key;
				}
				ob key2 = obj;
				if (!dictionary.ContainsKey(key2))
				{
					dictionary.Add(key2, new List<int>());
				}
				dictionary[key2].Add(te2.gqe(mly));
			}
		}
		foreach (KeyValuePair<ob, List<int>> item in dictionary)
		{
			item.Deconstruct(out key, out var value);
			ob obj2 = key;
			List<int> source = value;
			obj2.Points += source.OrderByDescending((int a) => a).Take(10).Sum();
		}
	}

	private void flk()
	{
		flj();
		fll();
		foreach (List<ob> value in Rankings.Values)
		{
			int num = 1;
			foreach (ob item in value)
			{
				item.PreviousRank = item.Rank;
				item.Rank = num;
				num++;
			}
		}
	}

	private void fll()
	{
		Rankings[TournamentCategory.MenSingles] = (from a in Characters
			where a.CharacterInfo.gender == "m" && (a.Points > 0 || a.CharacterId == MainCharacter.CharacterId)
			orderby a.Points descending
			select a).Cast<ob>().ToList();
		Rankings[TournamentCategory.WomenSingles] = (from a in Characters
			where a.CharacterInfo.gender == "f" && (a.Points > 0 || a.CharacterId == MainCharacter.CharacterId)
			orderby a.Points descending
			select a).Cast<ob>().ToList();
		Rankings[TournamentCategory.MenDoubles] = (from a in Pairs
			where a.Category == TournamentCategory.MenDoubles
			orderby a.Points descending
			select a).Cast<ob>().ToList();
		Rankings[TournamentCategory.WomenDoubles] = (from a in Pairs
			where a.Category == TournamentCategory.WomenDoubles
			orderby a.Points descending
			select a).Cast<ob>().ToList();
		Rankings[TournamentCategory.MixedDoubles] = (from a in Pairs
			where a.Category == TournamentCategory.MixedDoubles
			orderby a.Points descending
			select a).Cast<ob>().ToList();
	}

	private void flm()
	{
		Characters.ForEach(delegate(CareerParticipant a)
		{
			a.fqg(this);
		});
	}

	private void fln()
	{
		IEnumerable<Tournament> enumerable = CurrentRegisteredTournaments.Where((Tournament a) => a.pny);
		if (!enumerable.Any())
		{
			return;
		}
		foreach (Tournament item in enumerable)
		{
			string mlz = item.PlayerParticipantId;
			CareerPair careerPair = Pairs.Find((CareerPair a) => a.piz == mlz && a.Complicity.HasValue && a.Complicity < 1f);
			if (careerPair != null)
			{
				careerPair.Complicity = Mathf.Min(1f, careerPair.Complicity.Value + 1f / 15f * item.pnu.Where((TournamentMatch a) => a.gof(MainCharacter.CharacterId)).Sum((TournamentMatch a) => (!a.Stats.HasBeenGenerated) ? 1f : 0.5f));
			}
		}
	}

	public List<CareerPair> flo(CareerParticipant a, TournamentCategory b)
	{
		return (from CareerPair a in Rankings[b]
			where a.fpf(a.CharacterId)
			select a).ToList();
	}

	public CareerPair flp(CareerParticipant a, TournamentCategory b)
	{
		return flo(a, b).FirstOrDefault();
	}

	public int flq(CareerParticipant a)
	{
		return new int[3]
		{
			a.Rank ?? 9999,
			flp(a, a.pjb)?.Rank ?? 9999,
			flp(a, TournamentCategory.MixedDoubles)?.Rank ?? 9999
		}.Min();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void InvitePartner(CareerParticipant participant, TournamentCategory category)
	{
		MainCharacter.PendingPairs.Add(new CareerPair(MainCharacter, participant, category, CurrentDate, PairInvitationStatus.InvitationSent));
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void AcceptPartnerInvitation(CareerPair pair)
	{
		pair.InvitationStatus = null;
		pair.InvitationDate = null;
		MainCharacter.PendingPairs.RemoveAll((CareerPair a) => a.PairId == pair.PairId);
		pair.Points = 0;
		pair.Rank = Rankings[pair.Category].Last().Rank + 1;
		pair.Complicity = 0f;
		Pairs.Add(pair);
		Rankings[pair.Category].Add(pair);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void DeclinePartnerInvitation(CareerPair pair)
	{
		pair.InvitationStatus = PairInvitationStatus.InvitationRefused;
	}

	public static string flr(int? a, int? b = null, string c = "")
	{
		if (!a.HasValue)
		{
			return c;
		}
		if (b.HasValue && b != a)
		{
			return string.Format("#{0}  <color={1}>{2}{3}</color>", a, (b > a) ? "#74b958" : "#e8947b", b - a, (b > a) ? "▲" : "▼");
		}
		return $"#{a}";
	}

	public void fls()
	{
		if (Tournaments.Any(((CareerDate, te) a) => a.Item2.poq))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_TOURNAMENT);
		}
		if (CareerAchievement.fob(TournamentSeries.Super100))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_SUPER_100);
		}
		if (CareerAchievement.fob(TournamentSeries.Super300))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_SUPER_300);
		}
		if (CareerAchievement.fob(TournamentSeries.Super500))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_SUPER_500);
		}
		if (CareerAchievement.fob(TournamentSeries.Super750))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_SUPER_750);
		}
		if (CareerAchievement.fob(TournamentSeries.Super1000))
		{
			flt(AchievementType.CAREER_PLAY_FIRST_SUPER_1000);
		}
		if (Tournaments.Any(((CareerDate, te) a) => CareerAchievement.foe(a.Item2)))
		{
			flt(AchievementType.CAREER_WIN_FIRST_TOURNAMENT);
		}
		if (CareerAchievement.fod(TournamentSeries.Super100))
		{
			flt(AchievementType.CAREER_WIN_FIRST_SUPER_100);
		}
		if (CareerAchievement.fod(TournamentSeries.Super300))
		{
			flt(AchievementType.CAREER_WIN_FIRST_SUPER_300);
		}
		if (CareerAchievement.fod(TournamentSeries.Super500))
		{
			flt(AchievementType.CAREER_WIN_FIRST_SUPER_500);
		}
		if (CareerAchievement.fod(TournamentSeries.Super750))
		{
			flt(AchievementType.CAREER_WIN_FIRST_SUPER_750);
		}
		if (CareerAchievement.fod(TournamentSeries.Super1000))
		{
			flt(AchievementType.CAREER_WIN_FIRST_SUPER_1000);
		}
		if (Trainings.Any())
		{
			flt(AchievementType.CAREER_FINISH_FIRST_TRAINING);
		}
		if (MainCharacter.Rank <= 500)
		{
			flt(AchievementType.CAREER_TOP_500_SINGLES);
		}
		if (MainCharacter.Rank <= 100)
		{
			flt(AchievementType.CAREER_TOP_100_SINGLES);
		}
		if (MainCharacter.Rank <= 50)
		{
			flt(AchievementType.CAREER_TOP_50_SINGLES);
		}
		if (MainCharacter.Rank <= 20)
		{
			flt(AchievementType.CAREER_TOP_20_SINGLES);
		}
		if (MainCharacter.Rank <= 10)
		{
			flt(AchievementType.CAREER_TOP_10_SINGLES);
		}
		if (MainCharacter.Rank == 1)
		{
			flt(AchievementType.CAREER_TOP_1_SINGLES);
		}
		int? num = flp(MainCharacter, piv)?.Rank;
		if (num <= 500)
		{
			flt(AchievementType.CAREER_TOP_500_DOUBLES);
		}
		if (num <= 100)
		{
			flt(AchievementType.CAREER_TOP_100_DOUBLES);
		}
		if (num <= 50)
		{
			flt(AchievementType.CAREER_TOP_50_DOUBLES);
		}
		if (num <= 20)
		{
			flt(AchievementType.CAREER_TOP_20_DOUBLES);
		}
		if (num <= 10)
		{
			flt(AchievementType.CAREER_TOP_10_DOUBLES);
		}
		if (num == 1)
		{
			flt(AchievementType.CAREER_TOP_1_DOUBLES);
		}
		int? num2 = flp(MainCharacter, TournamentCategory.MixedDoubles)?.Rank;
		if (num2 <= 500)
		{
			flt(AchievementType.CAREER_TOP_500_MIXED);
		}
		if (num2 <= 100)
		{
			flt(AchievementType.CAREER_TOP_100_MIXED);
		}
		if (num2 <= 50)
		{
			flt(AchievementType.CAREER_TOP_50_MIXED);
		}
		if (num2 <= 20)
		{
			flt(AchievementType.CAREER_TOP_20_MIXED);
		}
		if (num2 <= 10)
		{
			flt(AchievementType.CAREER_TOP_10_MIXED);
		}
		if (num2 == 1)
		{
			flt(AchievementType.CAREER_TOP_1_MIXED);
		}
		if (MainCharacter.Rank == 1 && num == 1 && num2 == 1)
		{
			flt(AchievementType.CAREER_TOP_1_ALL);
		}
		foreach (AchievementInfo mmc in ne.pim)
		{
			if (!Achievements.Any((CareerAchievement a) => a.Type == mmc.Type))
			{
				int? num3 = CareerAchievement.foi(mmc.Type);
				if (num3.HasValue && CareerAchievement.foh(mmc.Type) >= num3)
				{
					flt(mmc.Type);
				}
			}
		}
	}

	public void flt(AchievementType a)
	{
		if (!Achievements.Any((CareerAchievement a) => a.Type == a))
		{
			Achievements.Add(new CareerAchievement
			{
				Type = a,
				UnlockDate = CurrentDate,
				Uncollected = (ne.fhv(a)?.Reward != null)
			});
		}
		ry.pnt.gjn(a);
	}

	public MatchSettings flu()
	{
		MatchSettings matchSettings = MatchSettings.gcf(Settings, b: true);
		matchSettings.Stadium = "Gymnasium";
		matchSettings.IsDouble = false;
		CareerMainParticipant mme = MainCharacter;
		matchSettings.TeamA.PlayerA.CharacterInfo = mme.CharacterInfo;
		CharacterInfo characterInfo = (from a in Pairs
			where a.fpf(mme.CharacterId)
			orderby a.Complicity descending
			select a).FirstOrDefault()?.fpg(mme.CharacterId).CharacterInfo;
		if (characterInfo == null)
		{
			characterInfo = (from a in pir
				where a.CharacterId != mme.CharacterId && a.CharacterInfo.country == mme.CharacterInfo.country
				orderby Math.Abs(mme.Points - a.Points)
				select a).FirstOrDefault()?.CharacterInfo;
		}
		if (characterInfo == null)
		{
			characterInfo = (from a in pir
				where a.CharacterId != mme.CharacterId
				orderby Math.Abs(mme.Points - a.Points)
				select a).FirstOrDefault()?.CharacterInfo;
		}
		matchSettings.TeamB.PlayerA.CharacterInfo = characterInfo;
		return matchSettings;
	}

	[CompilerGenerated]
	private bool flv(CareerPair a)
	{
		return a.fpf(MainCharacter.CharacterId);
	}

	[CompilerGenerated]
	private bool flw(CareerPair a)
	{
		return a.fpf(MainCharacter.CharacterId);
	}

	[CompilerGenerated]
	private void flx(CareerParticipant a)
	{
		a.StatsEvolution.Add(CurrentDate, a.CharacterInfo.stats);
	}

	[CompilerGenerated]
	private CareerPair fly(PairInfo a)
	{
		return new CareerPair(a, this);
	}

	[CompilerGenerated]
	private bool flz(CareerParticipant a)
	{
		return a.CharacterId == MainCharacter.CharacterId;
	}

	[CompilerGenerated]
	private void fma(CareerPair a)
	{
		a.fpe(this);
	}

	[CompilerGenerated]
	private void fmb(CareerPair a)
	{
		a.fpe(this);
	}

	[CompilerGenerated]
	private bool fmc(CareerParticipant a)
	{
		if (a.CharacterId != MainCharacter.CharacterId && a.CharacterInfo.country == MainCharacter.CharacterInfo.country)
		{
			return !Pairs.Concat(MainCharacter.PendingPairs).Any((CareerPair a) => a.fpf(a.CharacterId) && a.fpf(MainCharacter.CharacterId));
		}
		return false;
	}

	[CompilerGenerated]
	private int fmd(CareerParticipant a)
	{
		return flq(a);
	}

	[CompilerGenerated]
	private bool fme(KeyValuePair<CareerParticipant, int> a)
	{
		if (a.Value < MainCharacter.Rank + 10)
		{
			return a.Value > MainCharacter.Rank - 30;
		}
		return false;
	}

	[CompilerGenerated]
	private bool fmf(KeyValuePair<CareerParticipant, int> a)
	{
		if (a.Value < MainCharacter.Rank + 20)
		{
			return a.Value > MainCharacter.Rank - 50;
		}
		return false;
	}

	[CompilerGenerated]
	private bool fmg(KeyValuePair<CareerParticipant, int> a)
	{
		if (a.Value < MainCharacter.Rank + 30)
		{
			return a.Value > MainCharacter.Rank - 100;
		}
		return false;
	}

	[CompilerGenerated]
	private bool fmh(CareerParticipant a)
	{
		if (a.CharacterInfo.gender == "m")
		{
			if (a.Points <= 0)
			{
				return a.CharacterId == MainCharacter.CharacterId;
			}
			return true;
		}
		return false;
	}

	[CompilerGenerated]
	private bool fmi(CareerParticipant a)
	{
		if (a.CharacterInfo.gender == "f")
		{
			if (a.Points <= 0)
			{
				return a.CharacterId == MainCharacter.CharacterId;
			}
			return true;
		}
		return false;
	}

	[CompilerGenerated]
	private void fmj(CareerParticipant a)
	{
		a.fqg(this);
	}

	[CompilerGenerated]
	private bool fmk(TournamentMatch a)
	{
		return a.gof(MainCharacter.CharacterId);
	}
}
