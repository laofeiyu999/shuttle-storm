using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class re
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ra
	{
		public MatchSettings.PositionOnCourt[] mum;

		internal bool gfe(rf a)
		{
			if (mum.Contains(a.muv) && a.mvg.Count == 1)
			{
				if (!a.muy)
				{
					return a.mux;
				}
				return true;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class rb
	{
		public MatchSettings.PositionOnCourt[] mun;

		internal bool gff(rf a)
		{
			if (a.mux)
			{
				return mun.Contains(a.mvg.Last().mvh);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class rc
	{
		public MatchSettings.PositionOnCourt[] muo;

		internal bool gfg(rf a)
		{
			if (a.muy)
			{
				return muo.Contains(a.mvg.Last().mvh);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class rd
	{
		public MatchSettings.PositionOnCourt[] mup;

		public Func<KeyValuePair<MatchSettings.PositionOnCourt, int>, bool> muq;

		internal int gfh(rf a)
		{
			return (from a in a.mvd
				where mup.Contains(a.Key)
				select a.Value).Sum();
		}

		internal bool gfi(KeyValuePair<MatchSettings.PositionOnCourt, int> a)
		{
			return mup.Contains(a.Key);
		}
	}

	private qu mur;

	public List<rf> mus = new List<rf>();

	public SetSummaryStats? mut;

	public float muu;

	public int pmi => mus.Count((rf a) => a.pmo == true);

	public int pmj => mus.Count((rf a) => a.pmo == false);

	public bool pmk => pmi > pmj;

	public bool pml
	{
		get
		{
			if (pmi < mur.muh.pls && pmj < mur.muh.pls)
			{
				if (pmi >= mur.muh.SetPoints || pmj >= mur.muh.SetPoints)
				{
					return Math.Abs(pmi - pmj) >= 2;
				}
				return false;
			}
			return true;
		}
	}

	public int pmm => mut?.AverageShotsPerRally ?? ((int)Math.Round(mus?.Average((rf a) => a.mvg.Count) ?? 0.0));

	public int pmn => mut?.MaxShotsPerRally ?? mus?.Max((rf a) => a.mvg.Count) ?? 0;

	public re(qu a)
	{
		mur = a;
	}

	public int gfp(bool a)
	{
		if (mut.HasValue)
		{
			if (!a)
			{
				return mut.Value.BadServeCountB;
			}
			return mut.Value.BadServeCountA;
		}
		MatchSettings.PositionOnCourt[] mum = MatchSettings.gck(a);
		return mus?.Count((rf a) => mum.Contains(a.muv) && a.mvg.Count == 1 && (a.muy || a.mux)) ?? 0;
	}

	public int gfq(bool a)
	{
		if (mut.HasValue)
		{
			if (!a)
			{
				return mut.Value.OutCountB;
			}
			return mut.Value.OutCountA;
		}
		MatchSettings.PositionOnCourt[] mun = MatchSettings.gck(a);
		return mus?.Count((rf a) => a.mux && mun.Contains(a.mvg.Last().mvh)) ?? 0;
	}

	public int gfr(bool a)
	{
		if (mut.HasValue)
		{
			if (!a)
			{
				return mut.Value.NetCountB;
			}
			return mut.Value.NetCountA;
		}
		MatchSettings.PositionOnCourt[] muo = MatchSettings.gck(a);
		return mus?.Count((rf a) => a.muy && muo.Contains(a.mvg.Last().mvh)) ?? 0;
	}

	public int gfs(bool a)
	{
		if (mut.HasValue)
		{
			if (!a)
			{
				return mut.Value.TotalDistanceB;
			}
			return mut.Value.TotalDistanceA;
		}
		MatchSettings.PositionOnCourt[] mup = MatchSettings.gck(a);
		return mus?.Sum((rf a) => (from a in a.mvd
			where mup.Contains(a.Key)
			select a.Value).Sum()) ?? 0;
	}

	public SetSummaryStats gft()
	{
		SetSummaryStats result = default(SetSummaryStats);
		result.Duration = muu;
		result.AverageShotsPerRally = pmm;
		result.MaxShotsPerRally = pmn;
		result.BadServeCountA = gfp(a: true);
		result.BadServeCountB = gfp(a: false);
		result.OutCountA = gfq(a: true);
		result.OutCountB = gfq(a: false);
		result.NetCountA = gfr(a: true);
		result.NetCountB = gfr(a: false);
		result.TotalDistanceA = gfs(a: true);
		result.TotalDistanceB = gfs(a: false);
		return result;
	}
}
