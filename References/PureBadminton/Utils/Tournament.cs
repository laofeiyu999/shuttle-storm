using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class Tournament : qb
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sc
	{
		public TournamentMatch myz;

		internal bool gli(TournamentParticipant a)
		{
			if (myz.TeamA.PairId == null)
			{
				return a.CharacterAId == myz.TeamA.CharacterAId;
			}
			return a.PairId == myz.TeamA.PairId;
		}

		internal bool glj(TournamentParticipant a)
		{
			if (myz.TeamB.PairId == null)
			{
				return a.CharacterAId == myz.TeamB.CharacterAId;
			}
			return a.PairId == myz.TeamB.PairId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sd
	{
		public TournamentParticipant mza;

		internal bool glk(TournamentMatch a)
		{
			if (a.TeamA != mza)
			{
				return a.TeamB == mza;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class se
	{
		public Tournament mzb;

		public ISet<string> mzc;

		internal bool gll(CharacterInfo a)
		{
			if (a.singlePoints > 0)
			{
				return a.gender == ((mzb.Category == TournamentCategory.MenSingles) ? "m" : "f");
			}
			return false;
		}

		internal bool glm(TournamentParticipant a)
		{
			return !a.poh.Any(mzc.Contains);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sf
	{
		public List<TournamentParticipant> mzd;

		public List<TournamentParticipant> mze;

		public int mzf;

		public Action<TournamentParticipant> mzg;

		internal void gln(TournamentParticipant a)
		{
			sg CS_0024_003C_003E8__locals0 = new sg
			{
				mzh = a
			};
			if (!mzd.Any((TournamentParticipant a) => a.goy(CS_0024_003C_003E8__locals0.mzh)))
			{
				mzd.Add(CS_0024_003C_003E8__locals0.mzh);
			}
		}

		internal void glo(int? a, int b, int c)
		{
			List<TournamentParticipant> list = mze.Skip(b - 1).Take(c - b + 1).gtq()
				.ToList();
			int num = (a.HasValue ? Math.Min(mzf, mzd.Count + a.Value) : mzf);
			foreach (TournamentParticipant item in list)
			{
				mzg(item);
				if (mzd.Count >= num)
				{
					break;
				}
			}
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sg
	{
		public TournamentParticipant mzh;

		internal bool glp(TournamentParticipant a)
		{
			return a.goy(mzh);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sh
	{
		public Func<TournamentParticipant, Continent?> mzi;

		public List<TournamentParticipant> mzj;

		public List<TournamentParticipant> mzk;

		public Tournament mzl;

		public TournamentParticipant mzm;

		public Func<TournamentParticipant, int> mzn;

		public Func<TournamentParticipant, bool> mzo;

		internal int glq(TournamentParticipant a)
		{
			return mzk.IndexOf(a);
		}

		internal bool glr(TournamentParticipant a)
		{
			sl CS_0024_003C_003E8__locals0 = new sl
			{
				mzu = this,
				mzt = a
			};
			if (!mzl.gnn(CS_0024_003C_003E8__locals0.mzt))
			{
				return mzj.Count((TournamentParticipant a) => CS_0024_003C_003E8__locals0.mzu.mzi(a) == CS_0024_003C_003E8__locals0.mzu.mzi(CS_0024_003C_003E8__locals0.mzt)) > 1;
			}
			return false;
		}

		internal bool gls(TournamentParticipant a)
		{
			return a.goy(mzm);
		}

		internal int glt(TournamentParticipant a)
		{
			return mzk.IndexOf(a);
		}

		internal bool glu(TournamentParticipant a)
		{
			sm CS_0024_003C_003E8__locals0 = new sm
			{
				mzw = this,
				mzv = a
			};
			return mzj.Count((TournamentParticipant a) => CS_0024_003C_003E8__locals0.mzw.mzi(a) == CS_0024_003C_003E8__locals0.mzw.mzi(CS_0024_003C_003E8__locals0.mzv)) > 1;
		}

		internal int glv(TournamentParticipant a)
		{
			return mzk.IndexOf(a);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class si
	{
		public TournamentParticipant mzp;

		internal bool glw(TournamentParticipant a)
		{
			return a.pof.country == mzp.pof.country;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sj
	{
		public Continent mzq;

		public sh mzr;

		internal bool glx(TournamentParticipant a)
		{
			return mzr.mzi(a) == mzq;
		}

		internal bool gly(TournamentParticipant a)
		{
			sk CS_0024_003C_003E8__locals0 = new sk
			{
				mzs = a
			};
			if (mzr.mzi(CS_0024_003C_003E8__locals0.mzs) == mzq)
			{
				return !mzr.mzj.Any((TournamentParticipant a) => a.goy(CS_0024_003C_003E8__locals0.mzs));
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sk
	{
		public TournamentParticipant mzs;

		internal bool glz(TournamentParticipant a)
		{
			return a.goy(mzs);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sl
	{
		public TournamentParticipant mzt;

		public sh mzu;

		internal bool gma(TournamentParticipant a)
		{
			return mzu.mzi(a) == mzu.mzi(mzt);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sm
	{
		public TournamentParticipant mzv;

		public sh mzw;

		internal bool gmb(TournamentParticipant a)
		{
			return mzw.mzi(a) == mzw.mzi(mzv);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sn
	{
		public int mzx;

		internal bool gmc(TournamentParticipant a)
		{
			return a.GroupId == mzx;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class so
	{
		public Tournament mzy;

		public TournamentMatch mzz;

		public Func<TournamentMatch, bool> naa;

		public Func<TournamentMatch, bool> nab;

		public Func<TournamentMatch, bool> nac;

		public Func<TournamentMatch, bool> nad;

		public Func<TournamentMatch, bool> nae;

		public Func<TournamentMatch, bool> naf;

		internal bool gmd(TournamentMatch a)
		{
			if (a.Stats == null)
			{
				if (!mzy.gnn(a.TeamA))
				{
					return mzy.gnn(a.TeamB);
				}
				return true;
			}
			return false;
		}

		internal bool gme(TournamentMatch a)
		{
			if (a.RoundId == mzz.RoundId)
			{
				return a.Stats == null;
			}
			return false;
		}

		internal bool gmf(TournamentMatch a)
		{
			return a.RoundId == mzz.RoundId - 1;
		}

		internal bool gmg(TournamentMatch a)
		{
			if (a.RoundId == mzz.RoundId)
			{
				return a.Stats == null;
			}
			return false;
		}

		internal bool gmh(TournamentMatch a)
		{
			return a.RoundId == mzz.RoundId + 1;
		}

		internal bool gmi(TournamentParticipant a)
		{
			return mzy.gnn(a);
		}

		internal bool gmj(TournamentMatch a)
		{
			if (a.RoundId == mzz.RoundId)
			{
				return a.Stats == null;
			}
			return false;
		}

		internal bool gmk(TournamentMatch a)
		{
			return a.RoundId == mzz.RoundId - 1;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sp
	{
		public int nag;

		internal TournamentParticipant gml(KeyValuePair<int, List<TournamentParticipant>> a)
		{
			return a.Value[nag];
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sq
	{
		public TournamentParticipant nah;

		internal bool gmm(TournamentMatch a)
		{
			if (a.TeamA != nah)
			{
				return a.TeamB == nah;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sr
	{
		public Func<TournamentParticipant, string> nai;

		public List<string> naj;

		public Tournament nak;

		internal void gmn(TournamentParticipant a)
		{
			string item = nai(a);
			if (!naj.Contains(item))
			{
				naj.Add(item);
			}
		}

		internal bool gmo(TournamentMatch a)
		{
			if (nak.PlayerParticipantId == null || a.TeamA != nak.pnv)
			{
				return a.TeamB == nak.pnv;
			}
			return true;
		}

		internal tf gmp(TournamentMatch a)
		{
			return new tf
			{
				nbr = ((a.TeamA == nak.pnv) ? nai(a.TeamB) : nai(a.TeamA)),
				nbs = (a.poc == nak.pnv),
				nbt = a.Stats.HasBeenGenerated
			};
		}
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const ushort SAVE_FILE_LATEST_VERSION = 3;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public static Tournament Current;

	[JsonProperty("Properties")]
	[JsonConverter(typeof(ta))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public sz Properties;

	[JsonProperty("Category")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TournamentCategory Category;

	[JsonProperty("Settings")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public qg Settings;

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

	public string pio => string.Format("{0}_{1}_{2}", Properties.Id, Category, StartedDate.ToString("yyyy-MM-dd_HH-mm-ss"));

	public qc pip => new sb
	{
		myv = Properties.Id,
		myw = Category,
		mlq = LastSavedDate,
		mlo = 3
	};

	[JsonProperty("Participants")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<TournamentParticipant> Participants
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	} = new List<TournamentParticipant>();


	[JsonProperty("QualificationParticipants")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<TournamentParticipant> QualificationParticipants
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	} = new List<TournamentParticipant>();


	[JsonProperty("PlayerParticipantId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string PlayerParticipantId
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	}

	[JsonProperty("QualificationMatches")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<TournamentMatch> QualificationMatches
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	} = new List<TournamentMatch>();


	[JsonProperty("PoolMatches")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<TournamentMatch> PoolMatches
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	} = new List<TournamentMatch>();


	[JsonProperty("RoundMatches")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<TournamentMatch> RoundMatches
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	} = new List<TournamentMatch>();


	[JsonIgnore]
	public List<TournamentMatch> pnu => QualificationMatches.Concat(PoolMatches).Concat(RoundMatches).ToList();

	public TournamentParticipant pnv => QualificationParticipants.Concat(Participants).FirstOrDefault((TournamentParticipant a) => gnn(a));

	public TournamentMatch pnw => pnu.FirstOrDefault((TournamentMatch a) => a.Stats == null && (gnn(a.TeamA) || gnn(a.TeamB)));

	public TournamentMatch pnx => pnu.LastOrDefault((TournamentMatch a) => a.Stats != null && (gnn(a.TeamA) || gnn(a.TeamB)));

	public bool pny => gmy(Category);

	public int? pnz
	{
		get
		{
			TournamentMatch tournamentMatch = pnu.FirstOrDefault((TournamentMatch a) => a.poc == null);
			if (tournamentMatch == null)
			{
				return 0;
			}
			if (tournamentMatch.GroupId.HasValue)
			{
				return null;
			}
			return tournamentMatch.RoundId;
		}
	}

	public TournamentPhase poa => ss.gnw(pnz, QualificationMatches.Contains(pnu.FirstOrDefault((TournamentMatch a) => a.poc == null)));

	public bool pob => poa == TournamentPhase.Finished;

	public static bool gmy(TournamentCategory a)
	{
		return new TournamentCategory[3]
		{
			TournamentCategory.MenDoubles,
			TournamentCategory.WomenDoubles,
			TournamentCategory.MixedDoubles
		}.Contains(a);
	}

	public static string gmz(int a)
	{
		return (new string[8] { "A", "B", "C", "D", "E", "F", "G", "H" })[a];
	}

	public static int gna(sz.TournamentParticipantsSelection[] a)
	{
		return a?.Sum((sz.TournamentParticipantsSelection a) => a.PlayersCount ?? (a.EndRange - a.StartRange + 1)) ?? 0;
	}

	[JsonConstructor]
	private Tournament()
	{
	}

	public Tournament(sz properties, TournamentCategory category, TournamentParticipant playerParticipant = null, bool placePlayerInSecondPosition = false, bool playerIsInQualification = false)
	{
		StartedDate = DateTime.Now;
		Properties = properties;
		Category = category;
		HashSet<string> hashSet = new HashSet<string>();
		if (playerParticipant != null)
		{
			PlayerParticipantId = playerParticipant.PairId ?? playerParticipant.pof.id;
		}
		else if (Career.Current != null)
		{
			hashSet.Add(Career.Current.MainCharacter.piz);
		}
		if (Properties.Id == "WorldNationsGames")
		{
			Participants = gnf(playerParticipant, hashSet);
		}
		else
		{
			Participants = gne(Properties.ParticipantsSelection, playerIsInQualification ? null : playerParticipant, (playerParticipant != null && playerIsInQualification) ? hashSet.Concat(playerParticipant.poh).ToHashSet() : hashSet);
			if (Properties.QualifiedPlayers.HasValue)
			{
				QualificationParticipants = gne(Properties.QualificationParticipantsSelection, playerIsInQualification ? playerParticipant : null, hashSet.Concat(Participants.SelectMany((TournamentParticipant a) => a.poh)).ToHashSet());
			}
		}
		gng(placePlayerInSecondPosition);
		if (Properties.QualifiedPlayers.HasValue && !playerIsInQualification)
		{
			gnk(null);
		}
	}

	[OnDeserialized]
	internal void gnb(StreamingContext a)
	{
		List<TournamentParticipant> list = QualificationParticipants.Concat(Participants).ToList();
		foreach (TournamentMatch myz in pnu)
		{
			if (myz.TeamA != null)
			{
				myz.TeamA = list.Find((TournamentParticipant a) => (myz.TeamA.PairId == null) ? (a.CharacterAId == myz.TeamA.CharacterAId) : (a.PairId == myz.TeamA.PairId));
			}
			if (myz.TeamB != null)
			{
				myz.TeamB = list.Find((TournamentParticipant a) => (myz.TeamB.PairId == null) ? (a.CharacterAId == myz.TeamB.CharacterAId) : (a.PairId == myz.TeamB.PairId));
			}
		}
		if (!Properties.GroupCount.HasValue)
		{
			return;
		}
		foreach (TournamentParticipant mza in Participants)
		{
			mza.GroupId = PoolMatches.FirstOrDefault((TournamentMatch a) => a.TeamA == mza || a.TeamB == mza)?.GroupId;
		}
	}

	public void gnc()
	{
		foreach (TournamentParticipant item in Participants.Concat(QualificationParticipants))
		{
			item.gov();
		}
	}

	private List<TournamentParticipant> gnd(ISet<string> a)
	{
		List<TournamentParticipant> list = new List<TournamentParticipant>();
		list = ((Career.Current != null) ? Career.Current.Rankings[Category].Select((ob a) => new TournamentParticipant(a.piz)).ToList() : ((!gmy(Category)) ? (from a in os.pji
			where a.singlePoints > 0 && a.gender == ((Category == TournamentCategory.MenSingles) ? "m" : "f")
			orderby a.singlePoints descending
			select a).Select((CharacterInfo a, int b) => new TournamentParticipant(a)).ToList() : (from a in pd.fua(Category)
			orderby a.points descending
			select a).Select((PairInfo a, int b) => new TournamentParticipant(a)).ToList()));
		return list.Where((TournamentParticipant a) => !a.poh.Any(a.Contains)).ToList();
	}

	private List<TournamentParticipant> gne(sz.TournamentParticipantsSelection[] a, TournamentParticipant b, ISet<string> c)
	{
		List<TournamentParticipant> mze = gnd(c);
		List<TournamentParticipant> mzd = new List<TournamentParticipant>();
		int mzf = gna(a);
		if (b != null)
		{
			mzd.Add(b);
		}
		Action<TournamentParticipant> mzg = delegate(TournamentParticipant a)
		{
			if (!mzd.Any((TournamentParticipant a) => a.goy(a)))
			{
				mzd.Add(a);
			}
		};
		Action<int?, int, int> action = delegate(int? a, int b, int c)
		{
			List<TournamentParticipant> list = mze.Skip(b - 1).Take(c - b + 1).gtq()
				.ToList();
			int num3 = (a.HasValue ? Math.Min(mzf, mzd.Count + a.Value) : mzf);
			foreach (TournamentParticipant item in list)
			{
				mzg(item);
				if (mzd.Count >= num3)
				{
					break;
				}
			}
		};
		for (int i = 0; i < a.Length; i++)
		{
			sz.TournamentParticipantsSelection tournamentParticipantsSelection = a[i];
			action(tournamentParticipantsSelection.PlayersCount, tournamentParticipantsSelection.StartRange, tournamentParticipantsSelection.EndRange);
		}
		int num = mzf - mzd.Count;
		if (num > 0)
		{
			sz.TournamentParticipantsSelection tournamentParticipantsSelection2 = a.Last();
			if (tournamentParticipantsSelection2.PlayersCount.HasValue)
			{
				action(num, tournamentParticipantsSelection2.StartRange, tournamentParticipantsSelection2.EndRange);
			}
			int num2 = tournamentParticipantsSelection2.EndRange;
			while (mzd.Count < mzf && num2 < mze.Count)
			{
				mzg(mze[num2]);
				num2++;
			}
		}
		return mzd.OrderByDescending((TournamentParticipant a) => a.gor().GetValueOrDefault()).ToList();
	}

	private List<TournamentParticipant> gnf(TournamentParticipant a, ISet<string> b)
	{
		List<TournamentParticipant> mzk = gnd(b).Take(100).ToList();
		List<TournamentParticipant> mzj = new List<TournamentParticipant>();
		for (int i = 0; i < mzk.Count; i++)
		{
			if (mzj.Count >= 16)
			{
				break;
			}
			TournamentParticipant mzp = mzk[i];
			int num = mzj.Count((TournamentParticipant a) => a.pof.country == mzp.pof.country);
			if (num < 2 && (num != 1 || i < 8))
			{
				mzj.Add(mzp);
			}
		}
		Func<TournamentParticipant, Continent?> mzi = (TournamentParticipant a) => Countries.fxc(a.pof.country)?.pkz;
		foreach (Continent mzq in Enum.GetValues(typeof(Continent)).Cast<Continent>())
		{
			if (mzj.Any((TournamentParticipant a) => mzi(a) == mzq))
			{
				continue;
			}
			TournamentParticipant tournamentParticipant = mzk.FirstOrDefault((TournamentParticipant a) => mzi(a) == mzq && !mzj.Any((TournamentParticipant a) => a.goy(a)));
			if (tournamentParticipant == null)
			{
				continue;
			}
			TournamentParticipant tournamentParticipant2 = mzj.OrderByDescending((TournamentParticipant a) => mzk.IndexOf(a)).FirstOrDefault((TournamentParticipant a) => !gnn(a) && mzj.Count((TournamentParticipant a) => mzi(a) == mzi(a)) > 1);
			if (tournamentParticipant2 != null)
			{
				mzj.Remove(tournamentParticipant2);
				mzj.Add(tournamentParticipant);
			}
		}
		if (a != null && !mzj.Any((TournamentParticipant a) => a.goy(a)))
		{
			TournamentParticipant item = mzj.OrderByDescending((TournamentParticipant a) => mzk.IndexOf(a)).FirstOrDefault((TournamentParticipant a) => mzj.Count((TournamentParticipant a) => mzi(a) == mzi(a)) > 1) ?? mzj.OrderByDescending((TournamentParticipant a) => mzk.IndexOf(a)).First();
			mzj.Remove(item);
			mzj.Add(a);
		}
		return mzj.OrderByDescending((TournamentParticipant a) => a.gor().GetValueOrDefault()).ToList();
	}

	private void gng(bool a)
	{
		List<TournamentParticipant> list = Participants.OrderByDescending((TournamentParticipant a) => a.gor().GetValueOrDefault()).ToList();
		if (a)
		{
			list = list.Where((TournamentParticipant a) => !gnn(a)).ToList();
			list.Insert(1, pnv);
		}
		int num = 1;
		if (Properties.QualifiedPlayers.HasValue)
		{
			QualificationParticipants = QualificationParticipants.gtq().ToList();
			for (int i = 0; (double)i < Math.Pow(2.0, Properties.QualificationRounds.Value - 1) * (double)Properties.QualifiedPlayers.Value; i++)
			{
				QualificationMatches.Add(new TournamentMatch
				{
					RoundId = Properties.QualificationRounds.Value,
					RoundMatchId = i,
					MatchId = num,
					TeamA = QualificationParticipants[i * 2],
					TeamB = QualificationParticipants[i * 2 + 1]
				});
				num++;
			}
			for (int num2 = Properties.QualificationRounds.Value - 1; num2 >= 1; num2--)
			{
				for (int j = 0; (double)j < Math.Pow(2.0, num2 - 1) * (double)Properties.QualifiedPlayers.Value; j++)
				{
					QualificationMatches.Add(new TournamentMatch
					{
						RoundId = num2,
						RoundMatchId = j,
						MatchId = num,
						TeamARequirements = ((num2 == Properties.RoundCount) ? null : new su
						{
							RoundId = num2 + 1,
							RoundMatchId = j * 2,
							Winner = true
						}),
						TeamBRequirements = ((num2 == Properties.RoundCount) ? null : new su
						{
							RoundId = num2 + 1,
							RoundMatchId = j * 2 + 1,
							Winner = true
						})
					});
					num++;
				}
			}
		}
		if (Properties.GroupCount.HasValue)
		{
			for (int k = 0; k < list.Count; k++)
			{
				list[k].GroupId = k % Properties.GroupCount.Value;
			}
			int mzx;
			for (mzx = 0; mzx < Properties.GroupCount; mzx++)
			{
				List<TournamentParticipant> b = list.Where((TournamentParticipant a) => a.GroupId == mzx).ToList();
				PoolMatches.AddRange(gnh(mzx, b));
			}
			PoolMatches = PoolMatches.OrderBy((TournamentMatch a) => a.RoundId).ToList();
			foreach (TournamentMatch poolMatch in PoolMatches)
			{
				poolMatch.MatchId = num++;
			}
		}
		for (int num3 = Properties.RoundCount; num3 >= 1; num3--)
		{
			for (int l = 0; (double)l < Math.Pow(2.0, num3 - 1); l++)
			{
				RoundMatches.Add(new TournamentMatch
				{
					RoundId = num3,
					RoundMatchId = l,
					MatchId = num,
					TeamARequirements = ((num3 == Properties.RoundCount) ? null : new su
					{
						RoundId = num3 + 1,
						RoundMatchId = l * 2,
						Winner = true
					}),
					TeamBRequirements = ((num3 == Properties.RoundCount) ? null : new su
					{
						RoundId = num3 + 1,
						RoundMatchId = l * 2 + 1,
						Winner = true
					})
				});
				num++;
			}
		}
		if (!Properties.QualifiedPlayers.HasValue && !Properties.GroupCount.HasValue)
		{
			gnj(list);
		}
	}

	private List<TournamentMatch> gnh(int a, List<TournamentParticipant> b)
	{
		return b.Count switch
		{
			3 => new List<TournamentMatch>
			{
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 1,
					TeamA = b[1],
					TeamB = b[2]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 2,
					TeamA = b[0],
					TeamBRequirements = new su
					{
						GroupId = a,
						RoundId = 1,
						Winner = false
					}
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 3,
					TeamA = b[0],
					TeamBRequirements = new su
					{
						GroupId = a,
						RoundId = 1,
						Winner = true
					}
				}
			}, 
			4 => new List<TournamentMatch>
			{
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 1,
					TeamA = b[0],
					TeamB = b[3]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 1,
					TeamA = b[1],
					TeamB = b[2]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 2,
					TeamA = b[0],
					TeamB = b[2]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 2,
					TeamA = b[1],
					TeamB = b[3]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 3,
					TeamA = b[0],
					TeamB = b[1]
				},
				new TournamentMatch
				{
					GroupId = a,
					RoundId = 3,
					TeamA = b[2],
					TeamB = b[3]
				}
			}, 
			_ => throw new NotImplementedException(), 
		};
	}

	private List<int> gni(int a)
	{
		Func<List<int>, List<int>> func = delegate(List<int> a)
		{
			List<int> list2 = new List<int>();
			int num2 = a.Count * 2 + 1;
			foreach (int item in a)
			{
				list2.Add(item);
				list2.Add(num2 - item);
			}
			return list2;
		};
		double num = Math.Log(a) / Math.Log(2.0) - 1.0;
		List<int> list = new List<int> { 1, 2 };
		for (int i = 0; (double)i < num; i++)
		{
			list = func(list);
		}
		return list.Select((int a) => a - 1).ToList();
	}

	private void gnj(List<TournamentParticipant> a)
	{
		List<TournamentMatch> list = RoundMatches.Where((TournamentMatch a) => a.RoundId == Properties.RoundCount).ToList();
		List<int> list2 = gni(a.Count);
		for (int i = 0; i < list.Count; i++)
		{
			list[i].TeamA = a[list2[i * 2]];
			list[i].TeamB = a[list2[i * 2 + 1]];
		}
	}

	public void gnk(qu a)
	{
		TournamentMatch mzz = pnu.FirstOrDefault((TournamentMatch a) => a.Stats == null && (gnn(a.TeamA) || gnn(a.TeamB)));
		if (mzz != null)
		{
			mzz.goh(a);
		}
		else
		{
			mzz = pnu.FirstOrDefault((TournamentMatch a) => a.Stats == null);
		}
		if (QualificationMatches.Contains(mzz))
		{
			foreach (TournamentMatch item in QualificationMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId && a.Stats == null))
			{
				item.goh(ri.ggc(gnm(item), item.TeamA.poi, item.TeamB.poi));
			}
			if (mzz.RoundId > 1)
			{
				foreach (TournamentMatch item2 in QualificationMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId - 1))
				{
					item2.god(QualificationMatches);
				}
				if (!gnn(mzz.poc))
				{
					gnk(null);
				}
			}
			else
			{
				gnj(Participants.Concat(from a in QualificationMatches
					where a.RoundId == 1
					select a.poc).ToList());
				if (QualificationParticipants.Contains(pnv) && !gnn(mzz.poc))
				{
					gnk(null);
				}
			}
			return;
		}
		if (mzz.GroupId.HasValue)
		{
			foreach (TournamentMatch item3 in PoolMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId && a.Stats == null))
			{
				item3.goh(ri.ggc(gnm(item3), item3.TeamA.poi, item3.TeamB.poi));
			}
			foreach (TournamentParticipant participant in Participants)
			{
				participant.gow(PoolMatches.Where((TournamentMatch a) => a.poc != null));
			}
			int? num = PoolMatches.Max((TournamentMatch a) => a.RoundId);
			if (mzz.RoundId < num)
			{
				foreach (TournamentMatch item4 in PoolMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId + 1))
				{
					item4.god(PoolMatches);
				}
				if (PlayerParticipantId == null)
				{
					gnk(null);
				}
				return;
			}
			Dictionary<int, List<TournamentParticipant>> source = gnl();
			List<TournamentParticipant> list = new List<TournamentParticipant>();
			int nag;
			for (nag = 0; nag < Properties.NumberQualifiedPerGroup; nag++)
			{
				list.AddRange(source.Select((KeyValuePair<int, List<TournamentParticipant>> a) => a.Value[nag]));
			}
			gnj(list);
			if (!list.Any((TournamentParticipant a) => gnn(a)))
			{
				gnk(null);
			}
			return;
		}
		foreach (TournamentMatch item5 in RoundMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId && a.Stats == null))
		{
			item5.goh(ri.ggc(gnm(item5), item5.TeamA.poi, item5.TeamB.poi));
		}
		if (!(mzz.RoundId > 1))
		{
			return;
		}
		foreach (TournamentMatch item6 in RoundMatches.Where((TournamentMatch a) => a.RoundId == mzz.RoundId - 1))
		{
			item6.god(RoundMatches);
		}
		if (!gnn(mzz.poc))
		{
			gnk(null);
		}
	}

	public Dictionary<int, List<TournamentParticipant>> gnl()
	{
		if (Participants.Any((TournamentParticipant a) => a.PoolResults == null))
		{
			foreach (TournamentParticipant participant in Participants)
			{
				participant.gow(PoolMatches.Where((TournamentMatch a) => a.poc != null));
			}
		}
		return (from a in Participants
			orderby a.GroupId
			group a by a.GroupId.Value).ToDictionary((IGrouping<int, TournamentParticipant> a) => a.Key, (IGrouping<int, TournamentParticipant> a) => (from a in a
			orderby a.PoolResults.VictoryPoints descending, a.PoolResults.Sets descending, a.PoolResults.Points descending
			select a).ToList());
	}

	public MatchSettings gnm(TournamentMatch a)
	{
		MatchSettings matchSettings = MatchSettings.gcf(Career.Current?.Settings ?? Settings, gnn(a.TeamA));
		matchSettings.Stadium = Properties.Stadium;
		matchSettings.IsDouble = pny;
		matchSettings.TeamA.PlayerA.CharacterInfo = a.TeamA.pof;
		matchSettings.TeamA.PlayerA.Energy = pn.fxz(a.TeamA.CharacterAEnergy);
		matchSettings.TeamB.PlayerA.CharacterInfo = a.TeamB.pof;
		matchSettings.TeamB.PlayerA.Energy = pn.fxz(a.TeamB.CharacterAEnergy);
		if (pny)
		{
			matchSettings.TeamA.mst = a.TeamA.PairComplicity;
			matchSettings.TeamA.PlayerB.CharacterInfo = a.TeamA.pog;
			matchSettings.TeamA.PlayerB.Energy = pn.fxz(a.TeamA.CharacterBEnergy);
			matchSettings.TeamB.mst = a.TeamB.PairComplicity;
			matchSettings.TeamB.PlayerB.CharacterInfo = a.TeamB.pog;
			matchSettings.TeamB.PlayerB.Energy = pn.fxz(a.TeamB.CharacterBEnergy);
		}
		return matchSettings;
	}

	public bool gnn(TournamentParticipant a)
	{
		if (a == null)
		{
			return false;
		}
		if (a.PairId == null)
		{
			return a.CharacterAId == PlayerParticipantId;
		}
		return a.PairId == PlayerParticipantId;
	}

	public bool gno(string a)
	{
		if (a == null)
		{
			return false;
		}
		return pnv?.gox(a) ?? false;
	}

	public TournamentResultPosition gnp(TournamentParticipant a)
	{
		TournamentMatch tournamentMatch = pnu.LastOrDefault((TournamentMatch a) => a.TeamA == a || a.TeamB == a);
		if (tournamentMatch.poc == a)
		{
			return TournamentResultPosition.Winner;
		}
		if (QualificationMatches.Contains(tournamentMatch))
		{
			if (tournamentMatch.RoundId != 1)
			{
				return TournamentResultPosition.QualifR32;
			}
			return TournamentResultPosition.QualifR16;
		}
		if (Properties.Id == "WorldTourFinals" && tournamentMatch.GroupId.HasValue)
		{
			return TournamentResultPosition.Pool;
		}
		return tournamentMatch.RoundId switch
		{
			1 => TournamentResultPosition.Finalist, 
			2 => TournamentResultPosition.SemiFinalist, 
			3 => TournamentResultPosition.QuarterFinalist, 
			4 => TournamentResultPosition.R16, 
			5 => TournamentResultPosition.R32, 
			_ => TournamentResultPosition.R64, 
		};
	}

	public te gnq()
	{
		List<string> naj = new List<string>();
		Func<TournamentParticipant, string> nai = (TournamentParticipant a) => a.PairId ?? a.CharacterAId;
		Action<TournamentParticipant> action = delegate(TournamentParticipant a)
		{
			string item = nai(a);
			if (!naj.Contains(item))
			{
				naj.Add(item);
			}
		};
		action(RoundMatches.Last().poc);
		foreach (TournamentMatch item2 in Enumerable.Reverse(RoundMatches))
		{
			action(item2.pod);
		}
		foreach (TournamentMatch item3 in Enumerable.Reverse(QualificationMatches))
		{
			action(item3.pod);
		}
		if (PoolMatches.Any())
		{
			Dictionary<int, List<TournamentParticipant>> dictionary = gnl();
			int num = dictionary.Max((KeyValuePair<int, List<TournamentParticipant>> a) => a.Value.Count);
			for (int i = 0; i < num; i++)
			{
				foreach (KeyValuePair<int, List<TournamentParticipant>> item4 in dictionary)
				{
					if (item4.Value.Count > i)
					{
						action(item4.Value[i]);
					}
				}
			}
		}
		return new te
		{
			Properties = Properties,
			Category = Category,
			Participants = naj.ToArray(),
			PlayerMatches = (from a in pnu
				where (PlayerParticipantId != null && a.TeamA == pnv) || a.TeamB == pnv
				select new tf
				{
					nbr = ((a.TeamA == pnv) ? nai(a.TeamB) : nai(a.TeamA)),
					nbs = (a.poc == pnv),
					nbt = a.Stats.HasBeenGenerated
				}).ToArray()
		};
	}

	[CompilerGenerated]
	private bool gnr(TournamentParticipant a)
	{
		return gnn(a);
	}

	[CompilerGenerated]
	private bool gns(TournamentMatch a)
	{
		if (a.Stats == null)
		{
			if (!gnn(a.TeamA))
			{
				return gnn(a.TeamB);
			}
			return true;
		}
		return false;
	}

	[CompilerGenerated]
	private bool gnt(TournamentMatch a)
	{
		if (a.Stats != null)
		{
			if (!gnn(a.TeamA))
			{
				return gnn(a.TeamB);
			}
			return true;
		}
		return false;
	}

	[CompilerGenerated]
	private bool gnu(TournamentParticipant a)
	{
		return !gnn(a);
	}

	[CompilerGenerated]
	private bool gnv(TournamentMatch a)
	{
		return a.RoundId == Properties.RoundCount;
	}
}
