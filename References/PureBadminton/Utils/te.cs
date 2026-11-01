using System;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class te
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class td
	{
		public string nbq;

		internal bool gpy(string a)
		{
			return gqb(a, nbq);
		}
	}

	[JsonProperty("Properties")]
	[JsonConverter(typeof(ta))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public sz Properties;

	[JsonProperty("Category")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public TournamentCategory Category;

	[JsonProperty("PlayerMatches")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public tf[] PlayerMatches;

	[JsonProperty("Participants")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public string[] Participants;

	[JsonIgnore]
	public bool poq
	{
		get
		{
			if (PlayerMatches != null)
			{
				return PlayerMatches.Any();
			}
			return false;
		}
	}

	[JsonIgnore]
	public bool por => Tournament.gmy(Category);

	public static bool gqb(string a, string b)
	{
		if (a == b)
		{
			return true;
		}
		if (a.Contains(b))
		{
			return a.Split("-").Contains(b);
		}
		return false;
	}

	public bool gqc(string a)
	{
		return Participants.Any((string a) => gqb(a, a));
	}

	public TournamentResultPosition gqd(string a)
	{
		int num = Array.IndexOf(Participants, a);
		if (num == 0)
		{
			return TournamentResultPosition.Winner;
		}
		if (num == 1)
		{
			return TournamentResultPosition.Finalist;
		}
		if (num < 4 && Properties.RoundCount >= 2)
		{
			return TournamentResultPosition.SemiFinalist;
		}
		if (num < 8 && Properties.RoundCount >= 3)
		{
			return TournamentResultPosition.QuarterFinalist;
		}
		if (num < 16 && Properties.RoundCount >= 4)
		{
			return TournamentResultPosition.R16;
		}
		if (num < 32 && Properties.RoundCount >= 5)
		{
			return TournamentResultPosition.R32;
		}
		if (num < 64 && Properties.RoundCount >= 6)
		{
			return TournamentResultPosition.R64;
		}
		double num2 = Math.Pow(2.0, Properties.RoundCount);
		if (Properties.QualificationRounds.HasValue)
		{
			if (Properties.QualifiedPlayers != 4)
			{
				throw new Exception($"Qualification format not handled (qualified players: {Properties.QualifiedPlayers}");
			}
			if ((double)num < num2 + 4.0)
			{
				return TournamentResultPosition.QualifR16;
			}
			if ((double)num < num2 + 12.0 && Properties.RoundCount >= 2)
			{
				return TournamentResultPosition.QualifR32;
			}
		}
		else if (Properties.GroupCount.HasValue)
		{
			return TournamentResultPosition.Pool;
		}
		throw new Exception("Participant result not found, participant " + a + " in " + Properties.Id);
	}

	public int gqe(string a)
	{
		TournamentResultPosition tournamentResultPosition = gqd(a);
		switch (tournamentResultPosition)
		{
		case TournamentResultPosition.QualifR16:
		case TournamentResultPosition.QualifR32:
			return Properties.WinPoints[Properties.RoundCount + ((tournamentResultPosition == TournamentResultPosition.QualifR16) ? 1 : 2)];
		case TournamentResultPosition.Pool:
		{
			int num = Array.IndexOf(Participants, a);
			int num2 = (int)Math.Pow(2.0, Properties.RoundCount);
			return Properties.WinPoints[Properties.RoundCount + 1 + (num - num2) / Properties.GroupCount.Value];
		}
		default:
			return Properties.WinPoints[(int)tournamentResultPosition];
		}
	}
}
