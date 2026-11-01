using OPS.Obfuscator.Attribute;
using UnityEngine.Localization;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class ss
{
	public static TournamentPhase gnw(int? a, bool b = false)
	{
		if (b)
		{
			return TournamentPhase.Qualifications;
		}
		if (!a.HasValue)
		{
			return TournamentPhase.Groups;
		}
		return a switch
		{
			0 => TournamentPhase.Finished, 
			1 => TournamentPhase.Final, 
			2 => TournamentPhase.Half, 
			3 => TournamentPhase.Quarter, 
			_ => TournamentPhase.OtherRound, 
		};
	}

	public static LocalizedString gnx(Tournament a, int? b, bool c = false)
	{
		return new LocalizedString("TournamentMenu_Phases", gny(a, b, c));
	}

	public static string gny(Tournament a, int? b, bool c = false)
	{
		if (c)
		{
			return $"QualificationsRound{a.Properties.QualificationRounds - b + 1}";
		}
		if (!b.HasValue)
		{
			return "Groups";
		}
		return b switch
		{
			0 => "Results", 
			1 => "Final", 
			2 => "SemiFinals", 
			3 => "QuarterFinals", 
			_ => $"Round{a.Properties.RoundCount - b + 1}", 
		};
	}
}
