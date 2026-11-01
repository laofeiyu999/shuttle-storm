using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class sz
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct TournamentParticipantsSelection
	{
		[JsonProperty("take")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public int? PlayersCount;

		[JsonProperty("from")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public int StartRange;

		[JsonProperty("to")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public int EndRange;

		public TournamentParticipantsSelection(int startRange, int endRange)
		{
			PlayersCount = null;
			StartRange = startRange;
			EndRange = endRange;
		}

		public TournamentParticipantsSelection(int playersCount, int startRange, int endRange)
		{
			PlayersCount = playersCount;
			StartRange = startRange;
			EndRange = endRange;
		}
	}

	public const string nar = "WorldTourFinals";

	public const string nas = "WorldNationsGames";

	public const string nat = "WorldChampionships";

	public const string nau = "EnglandOpen";

	[JsonProperty("series")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public TournamentSeries Series;

	[JsonProperty("id")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Id;

	[JsonProperty("stadium")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string Stadium = "GenericStadium";

	[JsonProperty("countryCode")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string CountryCode;

	[JsonProperty("location")]
	[JsonConverter(typeof(tb))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public (float, float) Location;

	[JsonProperty("week")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? Week;

	[JsonProperty("yearCondition")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public th YearCondition;

	[JsonProperty("roundCount")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int RoundCount;

	[JsonProperty("groupCount")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? GroupCount;

	[JsonProperty("numberQualifiedPerGroup")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? NumberQualifiedPerGroup;

	[JsonProperty("participantsSelection")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public TournamentParticipantsSelection[] ParticipantsSelection;

	[JsonProperty("qualificationRounds")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? QualificationRounds;

	[JsonProperty("qualifiedPlayers")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? QualifiedPlayers;

	[JsonProperty("qualificationParticipantsSelection")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public TournamentParticipantsSelection[] QualificationParticipantsSelection;

	[JsonProperty("winPoints")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int[] WinPoints;

	public static int[] nav = new int[8] { 13000, 11000, 9200, 7200, 5200, 3200, 1300, 650 };

	public static int[] naw = new int[5] { 14000, 12000, 10000, 7800, 5700 };

	public static int[] nax = new int[8] { 12000, 10200, 8400, 6600, 4800, 3000, 1200, 600 };

	public static int[] nay = new int[8] { 11000, 9350, 7700, 6050, 4320, 2660, 1060, 520 };

	public static int[] naz = new int[8] { 9200, 7800, 6420, 5040, 3600, 2220, 880, 430 };

	public static int[] nba = new int[8] { 7000, 5950, 4900, 3850, 2750, 1670, 660, 320 };

	public static int[] nbb = new int[8] { 5500, 4680, 3850, 3030, 2110, 1290, 510, 240 };

	public static int[] nbc = new int[8] { 4000, 3400, 2800, 2200, 1520, 920, 360, 170 };

	public static TournamentParticipantsSelection[] nbd = new TournamentParticipantsSelection[3]
	{
		new TournamentParticipantsSelection(1, 16),
		new TournamentParticipantsSelection(20, 17, 50),
		new TournamentParticipantsSelection(28, 51, 150)
	};

	public static TournamentParticipantsSelection[] nbe = new TournamentParticipantsSelection[1]
	{
		new TournamentParticipantsSelection(1, 8)
	};

	public static TournamentParticipantsSelection[] nbf = new TournamentParticipantsSelection[3]
	{
		new TournamentParticipantsSelection(1, 10),
		new TournamentParticipantsSelection(15, 11, 40),
		new TournamentParticipantsSelection(7, 41, 60)
	};

	public static TournamentParticipantsSelection[] nbg = new TournamentParticipantsSelection[3]
	{
		new TournamentParticipantsSelection(1, 10),
		new TournamentParticipantsSelection(12, 11, 40),
		new TournamentParticipantsSelection(10, 41, 80)
	};

	public static TournamentParticipantsSelection[] nbh = new TournamentParticipantsSelection[3]
	{
		new TournamentParticipantsSelection(8, 1, 16),
		new TournamentParticipantsSelection(10, 17, 40),
		new TournamentParticipantsSelection(10, 41, 100)
	};

	public static TournamentParticipantsSelection[] nbi = new TournamentParticipantsSelection[1]
	{
		new TournamentParticipantsSelection(16, 101, 150)
	};

	public static TournamentParticipantsSelection[] nbj = new TournamentParticipantsSelection[3]
	{
		new TournamentParticipantsSelection(8, 1, 20),
		new TournamentParticipantsSelection(10, 21, 60),
		new TournamentParticipantsSelection(10, 61, 120)
	};

	public static TournamentParticipantsSelection[] nbk = new TournamentParticipantsSelection[1]
	{
		new TournamentParticipantsSelection(16, 121, 200)
	};

	public static TournamentParticipantsSelection[] nbl = new TournamentParticipantsSelection[2]
	{
		new TournamentParticipantsSelection(8, 40, 100),
		new TournamentParticipantsSelection(20, 101, 200)
	};

	public static TournamentParticipantsSelection[] nbm = new TournamentParticipantsSelection[1]
	{
		new TournamentParticipantsSelection(16, 201, 500)
	};

	public static TournamentParticipantsSelection[] nbn = new TournamentParticipantsSelection[2]
	{
		new TournamentParticipantsSelection(8, 100, 200),
		new TournamentParticipantsSelection(20, 201, 300)
	};

	public static TournamentParticipantsSelection[] nbo = new TournamentParticipantsSelection[1]
	{
		new TournamentParticipantsSelection(16, 301, 1500)
	};

	public static Dictionary<TournamentSeries, sz> nbp = new Dictionary<TournamentSeries, sz>
	{
		{
			TournamentSeries.Super1000,
			new sz
			{
				RoundCount = 5,
				WinPoints = nax,
				ParticipantsSelection = nbf
			}
		},
		{
			TournamentSeries.Super750,
			new sz
			{
				RoundCount = 5,
				WinPoints = nay,
				ParticipantsSelection = nbg
			}
		},
		{
			TournamentSeries.Super500,
			new sz
			{
				RoundCount = 5,
				QualificationRounds = 2,
				QualifiedPlayers = 4,
				WinPoints = naz,
				ParticipantsSelection = nbh,
				QualificationParticipantsSelection = nbi
			}
		},
		{
			TournamentSeries.Super300,
			new sz
			{
				RoundCount = 5,
				QualificationRounds = 2,
				QualifiedPlayers = 4,
				WinPoints = nba,
				ParticipantsSelection = nbj,
				QualificationParticipantsSelection = nbk
			}
		},
		{
			TournamentSeries.Super100,
			new sz
			{
				RoundCount = 5,
				QualificationRounds = 2,
				QualifiedPlayers = 4,
				WinPoints = nbb,
				ParticipantsSelection = nbl,
				QualificationParticipantsSelection = nbm
			}
		},
		{
			TournamentSeries.InternationalChallenge,
			new sz
			{
				RoundCount = 5,
				QualificationRounds = 2,
				QualifiedPlayers = 4,
				WinPoints = nbc,
				ParticipantsSelection = nbn,
				QualificationParticipantsSelection = nbo
			}
		}
	};

	public Country pol => Countries.fxc(CountryCode);

	public int pom => Tournament.gna(ParticipantsSelection);

	public int pon => Tournament.gna(QualificationParticipantsSelection);

	public int poo => ParticipantsSelection.Last().EndRange;

	public int? pop => QualificationParticipantsSelection?.Last().EndRange;

	public void gpq()
	{
		if (nbp.ContainsKey(Series))
		{
			sz sz2 = nbp[Series];
			if (RoundCount == 0)
			{
				RoundCount = sz2.RoundCount;
			}
			if (!QualificationRounds.HasValue)
			{
				QualificationRounds = sz2.QualificationRounds;
			}
			if (!QualifiedPlayers.HasValue)
			{
				QualifiedPlayers = sz2.QualifiedPlayers;
			}
			if (WinPoints == null)
			{
				WinPoints = sz2.WinPoints;
			}
			if (ParticipantsSelection == null)
			{
				ParticipantsSelection = sz2.ParticipantsSelection;
			}
			if (QualificationParticipantsSelection == null)
			{
				QualificationParticipantsSelection = sz2.QualificationParticipantsSelection;
			}
		}
	}

	public Sprite gpr()
	{
		return rr.gjk(Stadium);
	}
}
