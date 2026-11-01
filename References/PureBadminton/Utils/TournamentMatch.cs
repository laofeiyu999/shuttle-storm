using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class TournamentMatch
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class st
	{
		public su nal;

		internal bool gnz(TournamentMatch a)
		{
			if (nal.GroupId.HasValue && a.GroupId != nal.GroupId)
			{
				return false;
			}
			if (nal.RoundId.HasValue && a.RoundId != nal.RoundId)
			{
				return false;
			}
			if (nal.RoundMatchId.HasValue && a.RoundMatchId != nal.RoundMatchId)
			{
				return false;
			}
			return true;
		}
	}

	[JsonProperty("GroupId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int? GroupId;

	[JsonProperty("RoundId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int? RoundId;

	[JsonProperty("RoundMatchId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int RoundMatchId;

	[JsonProperty("MatchId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int MatchId;

	[JsonProperty("Stats")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public qu Stats;

	[JsonProperty("TeamA")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TournamentParticipant TeamA;

	[JsonProperty("TeamB")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TournamentParticipant TeamB;

	[JsonProperty("TeamARequirements")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public su TeamARequirements;

	[JsonProperty("TeamBRequirements")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public su TeamBRequirements;

	public TournamentParticipant poc
	{
		get
		{
			if (Stats?.Recap == null)
			{
				return null;
			}
			if (!Stats.Recap.pmf)
			{
				return TeamB;
			}
			return TeamA;
		}
	}

	public TournamentParticipant pod
	{
		get
		{
			if (Stats?.Recap == null)
			{
				return null;
			}
			if (!Stats.Recap.pmf)
			{
				return TeamA;
			}
			return TeamB;
		}
	}

	public string poe
	{
		get
		{
			if (poc == null)
			{
				return null;
			}
			return string.Join("  ", Stats.Recap.SetsScore.Select((qx a) => (poc != TeamA) ? $"{a.mul}-{a.muk}" : $"{a.muk}-{a.mul}"));
		}
	}

	public void god(List<TournamentMatch> a)
	{
		if (TeamARequirements != null)
		{
			TeamA = goe(TeamARequirements, a);
		}
		if (TeamBRequirements != null)
		{
			TeamB = goe(TeamBRequirements, a);
		}
		TeamARequirements = null;
		TeamBRequirements = null;
	}

	private TournamentParticipant goe(su a, List<TournamentMatch> b)
	{
		TournamentMatch tournamentMatch = b.Find(delegate(TournamentMatch a)
		{
			if (a.GroupId.HasValue && a.GroupId != a.GroupId)
			{
				return false;
			}
			if (a.RoundId.HasValue && a.RoundId != a.RoundId)
			{
				return false;
			}
			return (!a.RoundMatchId.HasValue || a.RoundMatchId == a.RoundMatchId) ? true : false;
		});
		if (!a.Winner)
		{
			return tournamentMatch.pod;
		}
		return tournamentMatch.poc;
	}

	public bool gof(string a)
	{
		TournamentParticipant teamA = TeamA;
		if (teamA == null || !teamA.gox(a))
		{
			return TeamB?.gox(a) ?? false;
		}
		return true;
	}

	public bool gog(Tournament a)
	{
		return a.QualificationMatches.Contains(this);
	}

	public void goh(qu a)
	{
		Stats = a;
		TeamA.CharacterAEnergy = (TeamA.CharacterAEnergy - pn.fyc(a, TeamA.CharacterAId, TeamA.pof.stats.stamina)).gtg(0f, 1f);
		TeamB.CharacterAEnergy = (TeamB.CharacterAEnergy - pn.fyc(a, TeamB.CharacterAId, TeamB.pof.stats.stamina)).gtg(0f, 1f);
		if (a.muh.IsDouble)
		{
			TeamA.CharacterBEnergy = (TeamA.CharacterBEnergy - pn.fyc(a, TeamA.CharacterBId, TeamA.pog.stats.stamina)).gtg(0f, 1f);
			TeamB.CharacterBEnergy = (TeamB.CharacterBEnergy - pn.fyc(a, TeamB.CharacterBId, TeamB.pog.stats.stamina)).gtg(0f, 1f);
		}
	}

	[CompilerGenerated]
	private string goi(qx a)
	{
		if (poc != TeamA)
		{
			return $"{a.mul}-{a.muk}";
		}
		return $"{a.muk}-{a.mul}";
	}
}
