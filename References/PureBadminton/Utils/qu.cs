using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qu
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qr
	{
		public HashSet<string> mto;

		public qu mtp;

		public float mtq;

		internal string gdh(MatchSettings.PlayerSettings a)
		{
			if (!mto.Contains(a.CharacterInfo.id))
			{
				return a.CharacterInfo.id;
			}
			return gel(a.CharacterInfo.id, a.Position);
		}

		internal qz gdi(MatchSettings.PlayerSettings a)
		{
			qs CS_0024_003C_003E8__locals0 = new qs
			{
				mtr = a
			};
			return new qz
			{
				TotalDistance = mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mvd[CS_0024_003C_003E8__locals0.mtr.Position])),
				PercentTimeAggressive = Mathf.RoundToInt(100f * mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mve[CS_0024_003C_003E8__locals0.mtr.Position])) / mtq),
				TotalClear = mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == CS_0024_003C_003E8__locals0.mtr.Position && a.mvi == ShotType.Clear))),
				TotalSmash = mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == CS_0024_003C_003E8__locals0.mtr.Position && a.mvi == ShotType.Smash))),
				TotalMidcourt = mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == CS_0024_003C_003E8__locals0.mtr.Position && a.mvi == ShotType.Midcourt))),
				TotalDrop = mtp.mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == CS_0024_003C_003E8__locals0.mtr.Position && a.mvi == ShotType.Drop))),
				TotalDefense = mtp.mui.Sum((re a) => a.mus.Sum(delegate(rf a)
				{
					qt CS_0024_003C_003E8__locals1 = new qt
					{
						muf = CS_0024_003C_003E8__locals0,
						mue = a
					};
					return CS_0024_003C_003E8__locals1.mue.mvg.Select((rg a, int b) => a.mvh == CS_0024_003C_003E8__locals1.muf.mtr.Position && b > 0 && CS_0024_003C_003E8__locals1.mue.mvg[b - 1].mvi == ShotType.Smash && CS_0024_003C_003E8__locals1.mue.mvg[b - 1].mvj.y < 0f).Count((bool a) => a);
				}))
			};
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qs
	{
		public MatchSettings.PlayerSettings mtr;

		public Func<rf, int> mts;

		public Func<rf, float> mtt;

		public Func<rg, bool> mtv;

		public Func<rf, int> mtw;

		public Func<rg, bool> mtx;

		public Func<rf, int> mty;

		public Func<rg, bool> mtz;

		public Func<rf, int> mua;

		public Func<rg, bool> mub;

		public Func<rf, int> muc;

		public Func<rf, int> mud;

		internal int gdj(re a)
		{
			return a.mus.Sum((rf a) => a.mvd[mtr.Position]);
		}

		internal int gdk(rf a)
		{
			return a.mvd[mtr.Position];
		}

		internal float gdl(re a)
		{
			return a.mus.Sum((rf a) => a.mve[mtr.Position]);
		}

		internal float gdm(rf a)
		{
			return a.mve[mtr.Position];
		}

		internal int gdn(re a)
		{
			return a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Clear));
		}

		internal int gdo(rf a)
		{
			return a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Clear);
		}

		internal bool gdp(rg a)
		{
			if (a.mvh == mtr.Position)
			{
				return a.mvi == ShotType.Clear;
			}
			return false;
		}

		internal int gdq(re a)
		{
			return a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Smash));
		}

		internal int gdr(rf a)
		{
			return a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Smash);
		}

		internal bool gds(rg a)
		{
			if (a.mvh == mtr.Position)
			{
				return a.mvi == ShotType.Smash;
			}
			return false;
		}

		internal int gdt(re a)
		{
			return a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Midcourt));
		}

		internal int gdu(rf a)
		{
			return a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Midcourt);
		}

		internal bool gdv(rg a)
		{
			if (a.mvh == mtr.Position)
			{
				return a.mvi == ShotType.Midcourt;
			}
			return false;
		}

		internal int gdw(re a)
		{
			return a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Drop));
		}

		internal int gdx(rf a)
		{
			return a.mvg.Count((rg a) => a.mvh == mtr.Position && a.mvi == ShotType.Drop);
		}

		internal bool gdy(rg a)
		{
			if (a.mvh == mtr.Position)
			{
				return a.mvi == ShotType.Drop;
			}
			return false;
		}

		internal int gdz(re a)
		{
			return a.mus.Sum(delegate(rf a)
			{
				qt CS_0024_003C_003E8__locals0 = new qt
				{
					muf = this,
					mue = a
				};
				return CS_0024_003C_003E8__locals0.mue.mvg.Select((rg a, int b) => a.mvh == CS_0024_003C_003E8__locals0.muf.mtr.Position && b > 0 && CS_0024_003C_003E8__locals0.mue.mvg[b - 1].mvi == ShotType.Smash && CS_0024_003C_003E8__locals0.mue.mvg[b - 1].mvj.y < 0f).Count((bool a) => a);
			});
		}

		internal int gea(rf a)
		{
			qt CS_0024_003C_003E8__locals0 = new qt
			{
				muf = this,
				mue = a
			};
			return CS_0024_003C_003E8__locals0.mue.mvg.Select((rg a, int b) => a.mvh == CS_0024_003C_003E8__locals0.muf.mtr.Position && b > 0 && CS_0024_003C_003E8__locals0.mue.mvg[b - 1].mvi == ShotType.Smash && CS_0024_003C_003E8__locals0.mue.mvg[b - 1].mvj.y < 0f).Count((bool a) => a);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qt
	{
		public rf mue;

		public qs muf;

		internal bool geb(rg a, int b)
		{
			if (a.mvh == muf.mtr.Position && b > 0 && mue.mvg[b - 1].mvi == ShotType.Smash)
			{
				return mue.mvg[b - 1].mvj.y < 0f;
			}
			return false;
		}
	}

	public static qu mug;

	[JsonIgnore]
	public MatchSettings muh;

	[JsonProperty("Generated")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public bool HasBeenGenerated;

	[JsonIgnore]
	public List<re> mui = new List<re>();

	[JsonProperty("Recap")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public qw Recap;

	public bool plz
	{
		get
		{
			if (mui.All((re a) => a.pml))
			{
				if (mui.Count((re a) => a.pmk) < muh.WinningSets)
				{
					return mui.Count((re a) => !a.pmk) >= muh.WinningSets;
				}
				return true;
			}
			return false;
		}
	}

	public bool pma
	{
		get
		{
			if (mui.Count > 1 && !mui.Last().mus.Any())
			{
				return true;
			}
			int? num = ged(muh.SetPoints);
			if (num.HasValue && (muh.WinningSets == 1 || mui.Count == 3))
			{
				re re2 = mui.LastOrDefault();
				rf rf2 = re2.mus.LastOrDefault();
				if (re2.pmi <= re2.pmj || rf2.pmo != true || re2.pmi != num)
				{
					if (re2.pmj > re2.pmi && rf2.pmo == false)
					{
						return re2.pmj == num;
					}
					return false;
				}
				return true;
			}
			return false;
		}
	}

	public bool pmb
	{
		get
		{
			if (!mui.Any())
			{
				return false;
			}
			re re2 = mui.Last();
			if (Math.Max(re2.pmi, re2.pmj) == muh.pls - 1)
			{
				return true;
			}
			if (Math.Max(re2.pmi, re2.pmj) >= muh.SetPoints - 1 && re2.pmi != re2.pmj)
			{
				return true;
			}
			return false;
		}
	}

	public bool pmc
	{
		get
		{
			if (!pmb)
			{
				return false;
			}
			if (muh.WinningSets == 1)
			{
				return true;
			}
			re re2 = mui.Last();
			IEnumerable<re> source = mui.SkipLast(1);
			if (re2.pmi > re2.pmj)
			{
				return source.Any((re a) => a.pmi > a.pmj);
			}
			if (re2.pmi < re2.pmj)
			{
				return source.Any((re a) => a.pmi < a.pmj);
			}
			return source.Any();
		}
	}

	public MatchSettings.PositionOnCourt pmd
	{
		get
		{
			if (!mui.Any() || (mui.Count == 1 && !mui[0].mus.Any()))
			{
				return MatchSettings.PositionOnCourt.SideARight;
			}
			if (mui.Last().pml || !mui.Last().mus.Any())
			{
				if (!mui.Last((re a) => a.pml).pmk)
				{
					return MatchSettings.PositionOnCourt.SideBRight;
				}
				return MatchSettings.PositionOnCourt.SideARight;
			}
			re re2 = mui.Last();
			if (re2.mus.Last().pmo != true)
			{
				if (re2.pmj % 2 != 0)
				{
					return MatchSettings.PositionOnCourt.SideBLeft;
				}
				return MatchSettings.PositionOnCourt.SideBRight;
			}
			if (re2.pmi % 2 != 0)
			{
				return MatchSettings.PositionOnCourt.SideALeft;
			}
			return MatchSettings.PositionOnCourt.SideARight;
		}
	}

	public int pme
	{
		get
		{
			if (!mui.Any())
			{
				return 0;
			}
			return mui.Max((re a) => a.mus.Any() ? a.mus.Max((rf a) => a.mvg.Count) : 0);
		}
	}

	public static int gec(int a)
	{
		return a switch
		{
			11 => 15, 
			15 => 21, 
			21 => 30, 
			_ => a, 
		};
	}

	public static int? ged(int a)
	{
		return a switch
		{
			11 => 6, 
			15 => 8, 
			21 => 11, 
			_ => null, 
		};
	}

	public re gek()
	{
		re re2 = new re(this);
		mui.Add(re2);
		return re2;
	}

	internal static string gel(string a, MatchSettings.PositionOnCourt b)
	{
		return $"{a}#{b}";
	}

	public void gem()
	{
		float mtq = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvf));
		HashSet<string> mto = new HashSet<string>(from a in muh.plv
			group a by a.CharacterInfo.id into a
			where a.Count() > 1
			select a.Key);
		Recap = new qw
		{
			SetsScore = mui.Select((re a) => new qx(a.pmi, a.pmj)).ToList(),
			AverageRallyLength = (int)Math.Round(mui.Average((re a) => a.mus.Average((rf a) => a.mvg.Count))),
			PlayersStats = muh.plv.ToDictionary((MatchSettings.PlayerSettings a) => (!mto.Contains(a.CharacterInfo.id)) ? a.CharacterInfo.id : gel(a.CharacterInfo.id, a.Position), (MatchSettings.PlayerSettings a) => new qz
			{
				TotalDistance = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvd[a.Position])),
				PercentTimeAggressive = Mathf.RoundToInt(100f * mui.Sum((re a) => a.mus.Sum((rf a) => a.mve[a.Position])) / mtq),
				TotalClear = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == a.Position && a.mvi == ShotType.Clear))),
				TotalSmash = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == a.Position && a.mvi == ShotType.Smash))),
				TotalMidcourt = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == a.Position && a.mvi == ShotType.Midcourt))),
				TotalDrop = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Count((rg a) => a.mvh == a.Position && a.mvi == ShotType.Drop))),
				TotalDefense = mui.Sum((re a) => a.mus.Sum((rf a) => a.mvg.Select((rg a, int b) => a.mvh == a.Position && b > 0 && a.mvg[b - 1].mvi == ShotType.Smash && a.mvg[b - 1].mvj.y < 0f).Count((bool a) => a)))
			})
		};
	}

	public void geo()
	{
		mui.Clear();
	}
}
