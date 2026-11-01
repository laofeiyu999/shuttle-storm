using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class rj
{
	public static ScoreCheck ggh(qu a)
	{
		re re2 = a.mui.LastOrDefault();
		ScoreCheck result = default(ScoreCheck);
		result.SetIndex = a.mui.Count - 1;
		result.TeamAScore = re2?.pmi ?? 0;
		result.TeamBScore = re2?.pmj ?? 0;
		result.TotalRallies = a.mui.Sum((re a) => a.mus.Count);
		return result;
	}

	public static bool ggi(qu a, ScoreCheck b)
	{
		return b.TotalRallies == a.mui.Sum((re a) => a.mus.Count) + 1;
	}

	public static bool ggj(qu a, ScoreCheck b)
	{
		ScoreCheck scoreCheck = ggh(a);
		if (scoreCheck.SetIndex == b.SetIndex && scoreCheck.TeamAScore == b.TeamAScore && scoreCheck.TeamBScore == b.TeamBScore)
		{
			return scoreCheck.TotalRallies == b.TotalRallies;
		}
		return false;
	}

	public static MatchSnapshot ggk(qu a, bool b, bool c, bool d, bool e)
	{
		List<bool> list = new List<bool>();
		int[] array = new int[a.mui.Count];
		float[] array2 = new float[a.mui.Count];
		SetSummaryStats[] array3 = new SetSummaryStats[a.mui.Count];
		bool[] array4 = new bool[a.mui.Count];
		for (int i = 0; i < a.mui.Count; i++)
		{
			re re2 = a.mui[i];
			array[i] = re2.mus.Count;
			array2[i] = re2.muu;
			foreach (rf mu in re2.mus)
			{
				list.Add(mu.pmo == true);
			}
			if (re2.pml)
			{
				array3[i] = re2.gft();
				array4[i] = true;
			}
		}
		MatchSnapshot result = default(MatchSnapshot);
		result.RallyWinners = list.ToArray();
		result.SetRallyCounts = array;
		result.SetDurations = array2;
		result.SetSummaries = array3;
		result.SetHasSummary = array4;
		result.TeamAServe = b;
		result.IsTeamAOnSideA = c;
		result.IsTeamAInverted = d;
		result.IsTeamBInverted = e;
		return result;
	}

	public static void ggl(qu a, MatchSnapshot b)
	{
		if (b.SetRallyCounts == null || b.SetRallyCounts.Length == 0)
		{
			return;
		}
		a.mui.Clear();
		int num = 0;
		for (int i = 0; i < b.SetRallyCounts.Length; i++)
		{
			re re2 = a.gek();
			re2.muu = b.SetDurations[i];
			if (b.SetHasSummary[i])
			{
				re2.mut = b.SetSummaries[i];
			}
			for (int j = 0; j < b.SetRallyCounts[i]; j++)
			{
				re2.mus.Add(ggm(a, b.RallyWinners[num++]));
			}
		}
	}

	private static rf ggm(qu a, bool b)
	{
		rf rf2 = new rf
		{
			muw = true,
			mvb = b
		};
		foreach (MatchSettings.PlayerSettings item in a.muh.plv)
		{
			rf2.mvd[item.Position] = 0;
			rf2.mve[item.Position] = 0f;
		}
		return rf2;
	}
}
