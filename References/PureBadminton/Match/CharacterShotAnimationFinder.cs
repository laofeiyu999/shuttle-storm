using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterShotAnimationFinder : CharacterComponent
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hw
	{
		public CharacterInfo lis;

		public CharacterShotAnimationFinder lit;

		internal bool dqd(bga.bfw a)
		{
			if (a.orh == bga.MatchRequirements.SinglesOnly && MatchSettings.Current.IsDouble)
			{
				return false;
			}
			if (a.orh == bga.MatchRequirements.DoublesOnly && !MatchSettings.Current.IsDouble)
			{
				return false;
			}
			if (a.ori == bga.GenderRequirements.MensOnly && lis.gender != "m")
			{
				return false;
			}
			if (a.ori == bga.GenderRequirements.WomensOnly && lis.gender != "f")
			{
				return false;
			}
			return true;
		}

		internal bga.bfw dqe(bga.bfw a)
		{
			return a.jxr(lit.ozc.pba, lis.height, lis.stats.defense);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hx
	{
		public string liu;

		internal bool dqf(bga.bfw a)
		{
			return a.oqg == liu;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hy
	{
		public string[] liv;

		internal bool dqg(bga.bfw a)
		{
			hz CS_0024_003C_003E8__locals0 = new hz
			{
				liw = a
			};
			return !liv.Any((string a) => CS_0024_003C_003E8__locals0.liw.oqg.Contains(a));
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hz
	{
		public bga.bfw liw;

		internal bool dqh(string a)
		{
			return liw.oqg.Contains(a);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ia
	{
		public Regex lix;

		internal bool dqi(bga.bfw a)
		{
			return lix.IsMatch(a.oqg);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MISSED_SHOT_TIME_OFFSET = 0.2f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float SHOT_MIN_DISTANCE_FROM_NET = 0.1f;

	private List<bga.bfw> liy;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<lr> NextPotentialShots;

	public void dqj()
	{
		CharacterInfo lis = base.ozc.Player.CharacterInfo;
		liy = (from a in bga.osr.Where(delegate(bga.bfw a)
			{
				if (a.orh == bga.MatchRequirements.SinglesOnly && MatchSettings.Current.IsDouble)
				{
					return false;
				}
				if (a.orh == bga.MatchRequirements.DoublesOnly && !MatchSettings.Current.IsDouble)
				{
					return false;
				}
				if (a.ori == bga.GenderRequirements.MensOnly && lis.gender != "m")
				{
					return false;
				}
				return (a.ori != bga.GenderRequirements.WomensOnly || !(lis.gender != "f")) ? true : false;
			})
			select a.jxr(base.ozc.pba, lis.height, lis.stats.defense)).ToList();
		if (base.ozi)
		{
			List<string> list = hr.ddv(base.ozd.pdy.Difficulty);
			if (list.Any())
			{
				dql(list.ToArray());
			}
		}
	}

	public bga.bfw dqk(string a)
	{
		return liy?.Find((bga.bfw a) => a.oqg == a);
	}

	public void dql(params string[] keywords)
	{
		liy = liy.Where((bga.bfw a) => !keywords.Any((string a) => a.oqg.Contains(a))).ToList();
	}

	public void dqm(Regex a)
	{
		liy = liy.Where((bga.bfw a) => a.IsMatch(a.oqg)).ToList();
	}

	public void dqn()
	{
		if (base.ozf?.pgu == null)
		{
			NextPotentialShots = null;
			return;
		}
		NextPotentialShots = new List<lr>();
		float num = Time.time + (from a in liy
			select a.oqi into a
			orderby a
			select a).First();
		float num2 = (from a in liy
			select a.oqp.Item2 into a
			orderby a descending
			select a).First();
		foreach (KeyValuePair<float, Vector3> item in base.ozf.pgu.mec)
		{
			if ((base.ozl ? (item.Value.z >= base.oze.pci - 0.1f) : (item.Value.z <= base.oze.pci + 0.1f)) || item.Key < num || item.Value.y > num2 || (NextPotentialShots.Any() && Mathf.Abs(NextPotentialShots.Last().ljf.z - item.Value.z) < 1f))
			{
				continue;
			}
			float key = item.Key;
			Vector3 value = item.Value;
			foreach (bga.bfw item2 in liy)
			{
				var (vector, a2) = dqr(key, value, item2, d: true);
				if (vector.HasValue)
				{
					NextPotentialShots.Add(new lr
					{
						liz = item2,
						lje = key,
						ljf = value,
						mbq = vector.Value,
						mbr = a2
					});
				}
			}
		}
	}

	public void dqo()
	{
		if (NextPotentialShots == null || NextPotentialShots.Any((lr a) => !dqr(a.lje, a.ljf, a.liz, d: true).Item1.HasValue))
		{
			dqn();
		}
	}

	public lr dqp(bool a = false)
	{
		if (base.ozf?.pgu == null)
		{
			return null;
		}
		float num = Time.time + (from a in liy
			select a.oqi into a
			orderby a
			select a).First();
		float num2 = (from a in liy
			select a.oqp.Item2 into a
			orderby a descending
			select a).First();
		foreach (KeyValuePair<float, Vector3> item in base.ozf.pgu.mec)
		{
			if ((base.ozl ? (item.Value.z >= base.oze.pci - 0.1f) : (item.Value.z <= base.oze.pci + 0.1f)) || item.Key < num || item.Value.y > num2)
			{
				continue;
			}
			float key = item.Key;
			Vector3 value = item.Value;
			foreach (bga.bfw item2 in liy)
			{
				var (vector, a2) = dqr(key, value, item2, a);
				if (vector.HasValue)
				{
					return new lr
					{
						liz = item2,
						lje = key,
						ljf = value,
						mbq = vector.Value,
						mbr = a2
					};
				}
			}
		}
		return null;
	}

	public lr dqq()
	{
		if (base.ozf?.pgu == null)
		{
			return null;
		}
		IEnumerable<bga.bfw> enumerable = liy.Where((bga.bfw a) => !a.orb);
		float num = Time.time + (from a in enumerable
			select a.oqi into a
			orderby a
			select a).First();
		float num2 = (from a in enumerable
			select a.oqp.Item2 into a
			orderby a descending
			select a).First();
		foreach (KeyValuePair<float, Vector3> item in base.ozf.pgu.mec)
		{
			if ((base.ozl ? (item.Value.z >= base.oze.pci - 0.1f) : (item.Value.z <= base.oze.pci + 0.1f)) || item.Key < num || item.Value.y > num2)
			{
				continue;
			}
			float key = item.Key;
			Vector3 value = item.Value;
			foreach (bga.bfw item2 in enumerable)
			{
				var (vector, num3) = dqr(key, value, item2);
				if (vector.HasValue)
				{
					if (key - item2.oqi - num3 - Time.time > 10f * Time.fixedDeltaTime * Time.timeScale)
					{
						return null;
					}
					return new lr
					{
						liz = item2,
						lje = key,
						ljf = value,
						mbq = vector.Value,
						mbr = num3
					};
				}
			}
		}
		return null;
	}

	private (Vector3?, float) dqr(float a, Vector3 b, bga.bfw c, bool d = false, bool e = false)
	{
		float num = a;
		if (e)
		{
			num += 0.2f;
		}
		if (Time.time + c.oqi > num)
		{
			return (null, 0f);
		}
		if (b.y < c.oqp.Item1 || b.y > c.oqp.Item2)
		{
			return (null, 0f);
		}
		bga.CourtArea courtArea = dqw(Mathf.Abs(b.z - base.oze.pci));
		if (c.orc.HasFlag(courtArea))
		{
			return (null, 0f);
		}
		if (base.ozc.lhl.pae && (c.oqg.Contains("Jump") || c.oqg.Contains("Kill") || c.oqg.Contains("Rush") || c.oqg.Contains("Overhead") || c.oqg.Contains("Malay")))
		{
			return (null, 0f);
		}
		if (base.ozc.lhl.pad && !base.ozd.pdw && !base.ozd.pdx && (c.oqg.Contains("Rush") || c.oqg.Contains("JumpSmashDoubles") || c.oqg.Contains("Overhead") || (c.oqg.Contains("Jump") && courtArea == bga.CourtArea.Backcourt)))
		{
			return (null, 0f);
		}
		Vector3 vector = dqs(c, b);
		if (!base.ozi && !d && base.ozc.lhe.ozo && this.jvu(vector) > 1f)
		{
			return (null, 0f);
		}
		if (c.ora || e)
		{
			Vector2 to = (b - vector).jvn();
			Vector2 from = (vector - base.transform.position).jvn();
			bool flag = false;
			Vector2 vector2 = (b - base.transform.position).jvn();
			if (c.oqg.Contains("Late") && Vector2.Angle(vector2 * (base.ozl ? 1 : (-1)), new Vector2(0f, -1f)) < 45f)
			{
				flag = true;
			}
			if (!flag && (double)from.magnitude > 0.3 && Vector2.Angle(from, to) > 45f)
			{
				return (null, 0f);
			}
			if (!base.ozi && !d && !base.ozd.pdw && (base.ozc.lhe.ozo || Vector2.Angle(base.ozc.lhe.ozq, to) > 60f))
			{
				return (null, 0f);
			}
		}
		float num2 = base.ozc.lhg.dpb(vector);
		if ((vector - base.transform.position).jvn().magnitude < c.qam)
		{
			return (vector, num2);
		}
		float num3 = c.oqi / base.ozc.lhl.pag;
		if (Time.time + num2 + num3 <= num)
		{
			return (vector, num2);
		}
		return (null, 0f);
	}

	public Vector3 dqs(bga.bfw a, Vector3 b)
	{
		return dqt(a, b).Item1;
	}

	public (Vector3, float) dqt(bga.bfw a, Vector3 b)
	{
		Vector3 vector = a.oqo.jvo();
		float num = 0f;
		if (a.oqx.HasValue)
		{
			Vector3 a2 = b - base.transform.position;
			if (!base.ozl)
			{
				a2 *= -1f;
			}
			if (base.ozm)
			{
				a2.x *= -1f;
			}
			num = a.jxs(a2);
			vector = a.oqo.gug(0f - num).jvo();
		}
		if (!base.ozl)
		{
			vector *= -1f;
		}
		if (base.ozm)
		{
			vector.x = 0f - vector.x;
			num *= -1f;
		}
		return (b.jvp() + vector, num);
	}

	public Vector3 dqu(bga.bfw a, float b)
	{
		float num = (base.ozm ? (0f - b) : b);
		Vector3 vector = a.oqo.gug(0f - num).jvo();
		if (!base.ozl)
		{
			vector *= -1f;
		}
		if (base.ozm)
		{
			vector.x = 0f - vector.x;
		}
		Vector3 result = base.transform.position.jvp() - vector;
		result.y = a.oqp.Item1 + a.oqm;
		return result;
	}

	private void dqv()
	{
		List<(bga.bfw, Vector3, float, float)> list = new List<(bga.bfw, Vector3, float, float)>();
		foreach (KeyValuePair<float, Vector3> item2 in base.ozf.pgu.mec)
		{
			if (base.ozl ? (item2.Value.z >= base.oze.pci - 0.01f) : (item2.Value.z <= base.oze.pci + 0.01f))
			{
				continue;
			}
			float key = item2.Key;
			Vector3 value = item2.Value;
			foreach (bga.bfw item3 in liy)
			{
				var (vector, item) = dqr(key, value, item3);
				if (vector.HasValue)
				{
					list.Add((item3, vector.Value, key, item));
				}
			}
		}
		Debug.Log(list.Count);
		if (list.Count > 0)
		{
			return;
		}
		(bga.bfw, Vector3, float, float) tuple2 = (null, Vector3.zero, 0f, 0f);
		foreach (KeyValuePair<float, Vector3> item4 in base.ozf.pgu.mec)
		{
			if (base.ozl ? (item4.Value.z >= base.oze.pci - 0.01f) : (item4.Value.z <= base.oze.pci + 0.01f))
			{
				continue;
			}
			float key2 = item4.Key;
			Vector3 value2 = item4.Value;
			foreach (bga.bfw item5 in liy)
			{
				var (vector2, num) = dqr(key2 + 5f, value2, item5);
				if (vector2.HasValue)
				{
					float num2 = Time.time + num + item5.oqi;
					if (tuple2.Item1 == null || num2 < tuple2.Item4)
					{
						tuple2 = (item5, vector2.Value, key2, num2);
					}
				}
			}
		}
	}

	private static bga.CourtArea dqw(float a)
	{
		if (a < 2f)
		{
			return bga.CourtArea.Net;
		}
		if (a < 5.8f)
		{
			return bga.CourtArea.Midcourt;
		}
		return bga.CourtArea.Backcourt;
	}

	public lr dqx()
	{
		if (base.ozf?.pgu == null)
		{
			return null;
		}
		IEnumerable<bga.bfw> enumerable = liy.Where(delegate(bga.bfw a)
		{
			if (a.oqg.Contains("Dive"))
			{
				return true;
			}
			rg rg2 = base.ozd.StatsManager.luc?.mvg.LastOrDefault();
			return (rg2 != null && rg2.mvi == ShotType.Smash && rg2.mvj.y < 0f && a.oqg.Contains("Defense")) ? true : false;
		});
		if (!enumerable.Any())
		{
			return null;
		}
		float num = (from a in enumerable
			select a.oqp.Item2 into a
			orderby a descending
			select a).First();
		foreach (KeyValuePair<float, Vector3> item in base.ozf.pgu.mec)
		{
			if ((base.ozl ? (item.Value.z >= base.oze.pci - 0.1f) : (item.Value.z <= base.oze.pci + 0.1f)) || item.Value.y > num)
			{
				continue;
			}
			float num2 = item.Key;
			Vector3 value = item.Value;
			foreach (bga.bfw item2 in enumerable)
			{
				if (!item2.oqg.Contains("Defense") && num2 < Time.time + item2.oqi)
				{
					continue;
				}
				var (vector, a2) = dqr(num2, value, item2, d: false, e: true);
				if (vector.HasValue)
				{
					Debug.Log("Use Missing shot animation: " + item2.oqg);
					if (item2.oqg.Contains("Dive") && (base.transform.position - value).magnitude > item2.oqo.magnitude + 0.3f)
					{
						value += (base.transform.position - value).normalized * 0.3f;
					}
					else
					{
						num2 += 0.1f;
					}
					return new lr
					{
						liz = item2,
						lje = num2,
						ljf = value,
						mbq = vector.Value,
						mbr = a2,
						mbs = true
					};
				}
			}
		}
		return null;
	}

	[CompilerGenerated]
	private bool dqy(lr a)
	{
		return !dqr(a.lje, a.ljf, a.liz, d: true).Item1.HasValue;
	}

	[CompilerGenerated]
	private bool dqz(bga.bfw a)
	{
		if (a.oqg.Contains("Dive"))
		{
			return true;
		}
		rg rg2 = base.ozd.StatsManager.luc?.mvg.LastOrDefault();
		if (rg2 != null && rg2.mvi == ShotType.Smash && rg2.mvj.y < 0f && a.oqg.Contains("Defense"))
		{
			return true;
		}
		return false;
	}
}
