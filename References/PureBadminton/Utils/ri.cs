using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ri
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class rh
	{
		public System.Random mvm;

		public float mvn;

		internal bool gga()
		{
			return mvm.NextDouble() < (double)mvn;
		}
	}

	public static qu ggb(MatchSettings a, float b, float c)
	{
		qu qu2 = new qu
		{
			HasBeenGenerated = true,
			muh = a
		};
		float a2 = ggd(b, a.TeamA.plm, a.TeamA.mst);
		float b2 = ggd(c, a.TeamB.plm, a.TeamB.mst);
		float mvn = gge(a2, b2);
		System.Random mvm = new System.Random();
		Func<bool> func = () => mvm.NextDouble() < (double)mvn;
		while (!qu2.plz)
		{
			re re2 = qu2.gek();
			while (!re2.pml)
			{
				int num = (int)Math.Floor(Math.Pow(UnityEngine.Random.Range(1, (int)Math.Pow(40.0, 0.5)), 2.0));
				rf rf2 = new rf
				{
					muv = qu2.pmd,
					mvg = new List<rg>(),
					mvf = (float)num * UnityEngine.Random.Range(0.9f, 1.2f),
					mvd = new Dictionary<MatchSettings.PositionOnCourt, int>(),
					mve = new Dictionary<MatchSettings.PositionOnCourt, float>()
				};
				MatchSettings.PositionOnCourt[] array = qu2.muh.plr;
				foreach (MatchSettings.PositionOnCourt key in array)
				{
					rf2.mvd[key] = num * UnityEngine.Random.Range(1, 5);
					rf2.mve[key] = rf2.mvf * UnityEngine.Random.Range(0.2f, 0.2f);
				}
				for (int j = 0; j < num; j++)
				{
					rf2.mvg.Add(new rg
					{
						mvh = ((qu2.pmd != 0 && qu2.pmd != MatchSettings.PositionOnCourt.SideBRight) ? ((qu2.muh.IsDouble && RandomHelper.gja()) ? MatchSettings.PositionOnCourt.SideALeft : MatchSettings.PositionOnCourt.SideARight) : ((qu2.muh.IsDouble && RandomHelper.gja()) ? MatchSettings.PositionOnCourt.SideBLeft : MatchSettings.PositionOnCourt.SideBRight))
					});
				}
				rf2.mvb = MatchSettings.gcl(rf2.mvg.Last().mvh);
				if (func() ^ rf2.mvb)
				{
					if (RandomHelper.gja())
					{
						rf2.mux = true;
					}
					else
					{
						rf2.muy = true;
					}
				}
				rf2.muw = true;
				re2.mus.Add(rf2);
				re2.muu = (float)re2.mus.Count * UnityEngine.Random.Range(0.5f, 0.6f) * 60f;
			}
		}
		qu2.gem();
		return qu2;
	}

	public static qu ggc(MatchSettings a, float b, float c)
	{
		qu qu2 = new qu();
		qu2.HasBeenGenerated = true;
		qu2.muh = a;
		float a2 = ggd(b, a.TeamA.plm, a.TeamA.mst);
		float b2 = ggd(c, a.TeamB.plm, a.TeamB.mst);
		float num = gge(a2, b2);
		System.Random random = new System.Random();
		List<qx> list = new List<qx>();
		while ((a.WinningSets == 2) ? (Math.Max(list.Count((qx a) => a.pmg), list.Count((qx a) => !a.pmg)) < 2) : (!list.Any()))
		{
			float num2 = (float)random.NextDouble() * num;
			float num3 = (float)random.NextDouble() * (1f - num);
			float num4 = a.SetPoints;
			float num5 = Mathf.Min(num2, num3) / Mathf.Max(num2, num3) * (float)a.SetPoints;
			if (num4 - num5 < 2f)
			{
				int num6 = a.pls - a.SetPoints;
				num4 += (float)num6 - Mathf.Ceil((float)num6 * 0.5f * (num4 - num5));
				num5 = ((num4 == (float)a.pls) ? (num4 - 1f) : (num4 - 2f));
			}
			else
			{
				num5 = Mathf.Round(num5);
			}
			if (num2 > num3)
			{
				list.Add(new qx((int)num4, (int)num5));
			}
			else
			{
				list.Add(new qx((int)num5, (int)num4));
			}
		}
		list.Sum((qx a) => a.muk + a.mul);
		if ((from a in a.plv
			group a by a.CharacterInfo?.id).Any((IGrouping<string, MatchSettings.PlayerSettings> a) => a.Count() > 1))
		{
			Debug.Log("Error");
		}
		qu2.HasBeenGenerated = true;
		qu2.Recap = new qw
		{
			SetsScore = list
		};
		return qu2;
	}

	private static float ggd(float a, float b, float? c)
	{
		return a * (0.9f + b.gtg(0f, 0.5f) * 0.2f) * (0.9f + 0.1f * (c ?? 1f));
	}

	private static float gge(float a, float b)
	{
		float a2 = Math.Abs(a - b);
		return 0.5f + a2.gtg(0f, 10f) * 0.04f * (float)((a > b) ? 1 : (-1));
	}
}
