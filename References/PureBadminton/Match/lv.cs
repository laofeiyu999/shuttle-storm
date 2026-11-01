using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class lv
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ls
	{
		public Vector3 mbu;

		public mi mbv;

		public float mbw;

		public Vector3 mbx;

		public CourtGeometry mby;

		public float mbz;

		public float mca;

		public bool mcb;

		public bool mcc;

		public float mcd;

		internal Vector3 ewv()
		{
			return exa(mby.NetZ, mbu, mbw, mbz - mca * (float)(mcb ? 1 : (-1)), 0f, out mcc, 1.55f + mcd);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lt
	{
		public float mce;

		public float mcf;

		public ls mcg;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lu
	{
		public Vector3 mch;

		public lt mci;

		internal Vector3? eww(float a)
		{
			Vector2 c = ((mch - mci.mcg.mbu).normalized * mci.mce).jvn();
			float? num = mci.mcg.mbv.ezw(mci.mcg.mbu, new Vector3(mci.mcg.mbw, 0f, mci.mcf), c);
			if (!num.HasValue || num > 2f)
			{
				return null;
			}
			mci.mcg.mbx = new Vector3(c.x, num.Value, c.y);
			if (!exb(mci.mcg.mby.NetZ, mci.mcg.mbu, mci.mcg.mbv, mci.mcg.mbx))
			{
				return null;
			}
			return mci.mcg.mbx;
		}
	}

	public const float mcj = 140f;

	public const float mck = 0.7f;

	private const float mcl = 0.06f;

	public const float mcm = 0.03f;

	private const float mcn = 0.6f;

	private const float mco = 0.8f;

	private const float mcp = 3f;

	public static IdealPowerZone ewx(ShotType a, float b)
	{
		if (a != ShotType.Drop && a != ShotType.Midcourt)
		{
			return new IdealPowerZone(0.7f, 0.7f);
		}
		return new IdealPowerZone(0.5f, 0.7f);
	}

	public static float ewy(float a, float b)
	{
		float num = 1f + 3f * b;
		float b2 = 0.03f * ((b - 0.6f) / 0.19999999f).gtg(0f, 1f);
		float num2 = a - 0.7f;
		float num3 = ((num2 > 0f) ? Mathf.Max(num2 * num, b2) : (0f - Mathf.Max((0f - num2) * num, b2)));
		return (0.7f + num3).gtg(0f, 1f);
	}

	public static Vector3 ewz(ShotContext a, Vector3 b, float c, ShotType d, float e, Vector2 f, bga.bfw g = null, CharacterStats h = null, float i = 1f, bool j = false, rk.DifficultyLevel? k = null)
	{
		CourtGeometry mby = a.Court;
		float t = g?.oqq ?? 1f;
		float num = g?.oqr ?? 0f;
		if (h == null)
		{
			h = CharacterStats.pjq;
		}
		bool mcb = b.z < mby.NetZ;
		mi mbv = mi.mey;
		float num2 = c * 3.6f;
		float num3 = Mathf.Lerp(1f, 0.1f, CharacterStats.ftj(h.precision));
		float num4 = ((num2 - 30f) / 40f).gtg(0f, 1f) * Mathf.Lerp(1f, 0.3f, CharacterStats.ftj(h.defense));
		float num5 = ewy(e, num4);
		float num6 = Mathf.Pow((num5 - 0.7f).gtg(0f, 0.3f) * 10f, 2f) / 9f;
		float num7 = 1f - (g?.oqs ?? 1f);
		float num8 = num6 * 1.5f + (num3 + num7) * RandomHelper.gjc();
		num8 = (num8 / 3f).gtg(0f, 1f);
		bool flag = k.HasValue && exe(k.Value, g, i, num4);
		float num9 = num6;
		float num10 = num8 * 0.5f;
		if (d == ShotType.Smash)
		{
			num10 *= 1.5f;
		}
		float a2 = f.x.gtg(-1f + num10 * (1f - num9), 1f - num10 * (1f - num9)) + num10 * RandomHelper.giz(-1f, 1f);
		float num11 = mby.duq(b);
		if (g != null && g.oqu)
		{
			float num12 = Mathf.Lerp(0.4f, 1.2f, CharacterStats.ftj(h.precision));
			a2 = a2.gtg(num11 - num12, num11 + num12);
		}
		float mbw = a.ewt(a2, 0.05f);
		float num13 = 140f * Mathf.Lerp(1f - num, 1f, CharacterStats.ftj(h.power));
		num13 *= Mathf.Lerp(0.1f, 1f, t);
		num13 *= Mathf.Lerp(0.8f, 1f, i);
		if (!j)
		{
			num13 *= 0.9f;
		}
		float num14 = Mathf.Pow(num13, 2f);
		float mbz = (mcb ? mby.pbw : mby.pbv);
		if (!a.RallyStarted && a.pgr)
		{
			mbz -= CourtManager.rearZoneLength * (float)(mcb ? 1 : (-1));
		}
		float mca = 0f;
		float num15 = 0f;
		Vector3 mbx = Vector3.zero;
		Vector2 vector = new Vector2(b.x, b.z);
		float mcd = 0f;
		float num16 = 1.55f;
		bool mcc = false;
		switch (d)
		{
		case ShotType.Clear:
		{
			mca = exf(num5, num3);
			if (!a.pgr && k.HasValue)
			{
				mca = hr.ddy(k.Value) * Mathf.Lerp(0.7f, 1f, num3) * Mathf.Lerp(1f, 2f, num4);
			}
			Vector2 vector2 = new Vector2(mbw, mbz - mca * (float)(mcb ? 1 : (-1)));
			_ = vector2 - vector;
			float num18 = 12f + 7f * (f.y + 1f) / 2f;
			if (k.HasValue && hr.ddz(k.Value))
			{
				num18 = Math.Max(num18, RandomHelper.giz(16f, 18f));
			}
			num18 -= b.y * 1.4f;
			mbx = exa(mby.NetZ, b, vector2.x, vector2.y, num18, out mcc);
			while (num18 > 12f && mbx.sqrMagnitude > num14)
			{
				num18 -= 1f;
				mbx = exa(mby.NetZ, b, vector2.x, vector2.y, num18, out mcc);
			}
			while (!mcc && Math.Abs(vector2.y - mby.NetZ) > 2f)
			{
				vector2.y -= 0.5f * (float)(mcb ? 1 : (-1));
				mbx = exa(mby.NetZ, b, vector2.x, vector2.y, num18, out mcc);
			}
			if (mbx.sqrMagnitude > num14)
			{
				mbx = mbx.normalized * num13;
				while (mbx.y < 5f && mbv.ezz(mby.NetZ, b, mbx) < 1.65f)
				{
					mbx.y += 1f;
				}
			}
			return mbx;
		}
		case ShotType.Smash:
		{
			if (b.y > 1.55f)
			{
				float mce = num13 * Mathf.Lerp(0.6f, 1f, e);
				mce *= RandomHelper.giz(0.9f, 1.1f);
				Dictionary<float, Vector3> dictionary = new Dictionary<float, Vector3>();
				for (float mcf = mby.NetZ + (mcb ? 2f : (-2f)); Math.Abs(mcf - mby.NetZ) < CourtManager.halfCourtLength; mcf += (mcb ? 0.2f : (-0.2f)))
				{
					Vector3 mch = new Vector3(mbw, 0f, mcf);
					Func<float, Vector3?> func = delegate
					{
						Vector2 c2 = ((mch - b).normalized * mce).jvn();
						float? num22 = mbv.ezw(b, new Vector3(mbw, 0f, mcf), c2);
						if (!num22.HasValue || num22 > 2f)
						{
							return (Vector3?)null;
						}
						mbx = new Vector3(c2.x, num22.Value, c2.y);
						return (!exb(mby.NetZ, b, mbv, mbx)) ? null : new Vector3?(mbx);
					};
					Vector3? vector3 = func(mce);
					if (!vector3.HasValue)
					{
						vector3 = func(mce * 0.9f);
					}
					if (vector3.HasValue)
					{
						dictionary.Add(mcf, mbx);
					}
				}
				if (dictionary.Any())
				{
					float num20 = Mathf.Lerp(0.1f, 0.5f, (num5 - 0.3f) / 0.7f);
					int num21 = (int)Mathf.Floor((0.3f + ((f.y < 0f) ? (f.y * 0.3f) : (f.y * 0.7f)) + (RandomHelper.giy(num20) - num20 / 2f)).gtg(0f, 1f) * (float)dictionary.Count).gtg(0f, dictionary.Count - 1);
					bool flag2 = false;
					bool flag3 = false;
					if (flag)
					{
						if (f.y > 0f)
						{
							flag3 = true;
						}
						else if (f.y < 0f)
						{
							flag2 = true;
						}
						else if (RandomHelper.gja())
						{
							flag3 = true;
						}
						else
						{
							flag2 = true;
						}
					}
					else if (num5 > 0.72999996f)
					{
						bool flag4 = num21 < 3;
						bool flag5 = num21 >= dictionary.Count - 3;
						if (RandomHelper.giy() < num5 - 0.7f - 0.03f)
						{
							if (flag4 && flag5)
							{
								if (RandomHelper.gja())
								{
									flag2 = true;
								}
								else
								{
									flag3 = true;
								}
							}
							else if (flag4)
							{
								flag2 = true;
							}
							else if (flag5)
							{
								flag3 = true;
							}
						}
					}
					if (flag2)
					{
						return Quaternion.Euler(RandomHelper.giz(2f, 6f) * (float)(mcb ? 1 : (-1)), 0f, 0f) * dictionary.Values.First();
					}
					if (flag3)
					{
						return dictionary.Values.Last() + new Vector3(0f, RandomHelper.giz(1f, 3f), 0f);
					}
					return dictionary.Values.ElementAt(num21);
				}
			}
			mca = exf(num5, num3);
			if (b.y < 1.55f && f.y < 0f)
			{
				mca -= f.y;
			}
			if (flag)
			{
				mcd = -0.3f;
			}
			else if (num5 < 0.4f && (double)b.y < 1.3499999523162842)
			{
				mcd = 0f - Mathf.Lerp(0.2f, 0.5f, (0.4f - num5) * 2.5f);
			}
			else if (Mathf.Abs(b.z - mby.NetZ) > 2f)
			{
				mcd = RandomHelper.giz(0.2f, 1f) * ((num5 - 0.7f) / 0.3f).gtg(0.1f, 1f) * num3;
			}
			Func<Vector3> func2 = () => exa(mby.NetZ, b, mbw, mbz - mca * (float)(mcb ? 1 : (-1)), 0f, out mcc, 1.55f + mcd);
			mbx = func2();
			while (mca < CourtManager.halfCourtLength && mbx.sqrMagnitude > num14)
			{
				mca += 0.3f;
				mbx = func2();
			}
			while (!mcc && mca < CourtManager.halfCourtLength)
			{
				mca += 0.3f;
				mbx = func2();
			}
			if ((num5 > 0.75f && num5 < RandomHelper.giz(0.75f, 1.05f)) || flag)
			{
				mbx.y += RandomHelper.giz(-3f, 3f) * (flag ? 0.3f : (num5 - 0.7f));
			}
			return mbx;
		}
		case ShotType.Drop:
			if (flag)
			{
				mcd = -0.3f;
			}
			else if (exd(num5))
			{
				mcd = 0f - Mathf.Lerp(0.2f, 0.5f, (0.5f - num5) * 2f);
			}
			else
			{
				mcd = num8 * Mathf.Lerp(0.6f, 1f, Math.Abs(mby.NetZ - b.z) / CourtManager.halfCourtLength);
			}
			if (k.HasValue && a.RallyStarted && mcd < 0.5f)
			{
				mcd += hr.dea(k.Value, a.pgr) * 0.2f;
			}
			num16 = 1.55f + mcd;
			if (Mathf.Abs(mby.NetZ - b.z) < 1.5f)
			{
				num15 = Mathf.Abs(mby.NetZ - b.z) * Mathf.Lerp(1.3f, 0.9f, Mathf.Abs(num16 - b.y)) * ((f.y < 0f) ? Mathf.Lerp(0.5f, 1f, f.y + 1f) : Mathf.Lerp(1f, 1.6f, f.y));
				num15 = Mathf.Max(num15, 0.3f);
			}
			else
			{
				float num19 = (0.4f * Mathf.Abs(mby.NetZ - b.z)).gtg(0.4f, 1f) + 0.2f * Mathf.Abs(mbw - b.x) / CourtManager.doubleCourtWidth + (num4 * 2f).gtg(0f, 1f) * Mathf.Lerp(2f, 3f, (num5 - 0.7f) / 0.3f);
				if (!a.RallyStarted)
				{
					num19 = CourtManager.frontZoneLength + 0.05f + num8 * RandomHelper.giy();
					f.y = (f.y * 2f - 1f).gtg(-1f, 1f);
				}
				num15 = Mathf.Lerp(num19, (num19 + 1.5f).gtg(2.5f, 3.5f), (f.y + 1f) / 2f);
				num15 = Mathf.Max(num15, num19 + mcd);
			}
			mbx = exa(mby.NetZ, b, mbw, mby.NetZ + (float)(mcb ? 1 : (-1)) * num15, (1.55f - b.y) * Mathf.Lerp(2f, 4f, Mathf.Abs(mby.NetZ - b.z) / 2f), out mcc, num16, 0.2f);
			return mbx;
		case ShotType.Midcourt:
		{
			num15 = CourtManager.halfCourtLength / 2f + num8 * RandomHelper.giz(-1f, 1f) + Mathf.Lerp(-1f, 1f, (f.y + 1f) / 2f);
			if (flag)
			{
				mcd = -0.3f;
			}
			else if (exd(num5))
			{
				mcd = 0f - Mathf.Lerp(0.2f, 0.5f, (0.5f - num5) * 2f);
			}
			else
			{
				mcd = num8 * Mathf.Lerp(0.6f, 1f, Math.Abs(mby.NetZ - b.z) / CourtManager.halfCourtLength);
			}
			num16 = 1.55f + mcd;
			if (k.HasValue && a.RallyStarted && mcd < 0.5f)
			{
				mcd += hr.dea(k.Value, a.pgr) * 0.1f;
			}
			float num17 = Mathf.Atan2(num16 - b.y, Mathf.Abs(mby.NetZ - b.z)) * 57.29578f;
			if (num17 > 40f)
			{
				num15 = Mathf.Min(num15, Mathf.Lerp(2f, 0.5f, (num17 - 40f) / 50f));
			}
			mbx = exa(mby.NetZ, b, mbw, mby.NetZ + (float)(mcb ? 1 : (-1)) * num15, 1.55f - b.y, out mcc, num16, 0.2f);
			return mbx;
		}
		default:
			return Vector3.zero;
		}
	}

	private static Vector3 exa(float a, Vector3 b, float c, float d, float e, out bool f, float g = 1.55f, float h = 0.5f)
	{
		mi mey = mi.mey;
		Vector3? vector = null;
		f = true;
		for (float num = e; num <= e + 20f; num += h)
		{
			vector = mey.ezv(b, new Vector3(c, 0f, d), num);
			if (vector.HasValue && exb(a, b, mey, vector.Value, g))
			{
				return vector.Value;
			}
		}
		if (!vector.HasValue)
		{
			throw new Exception("Trajectory not found");
		}
		f = false;
		return vector.Value;
	}

	private static bool exb(float a, Vector3 b, mi c, Vector3 d, float e = 1.55f)
	{
		if (exc(c, b, d, a - 0.03f, e) && exc(c, b, d, a + 0.03f, e))
		{
			return exc(c, b, d, a, e + 0.06f);
		}
		return false;
	}

	private static bool exc(mi a, Vector3 b, Vector3 c, float d, float e)
	{
		if ((d - b.z) * c.z <= 0f)
		{
			return b.y > e;
		}
		return a.ezz(d, b, c) > e;
	}

	private static bool exd(float a)
	{
		return RandomHelper.giy() < Mathf.InverseLerp(0.6f, 0.45f, a);
	}

	private static bool exe(rk.DifficultyLevel a, bga.bfw b, float c, float d)
	{
		float num = hr.deb(a);
		num *= Mathf.Lerp(1f, 4f, d);
		num *= Mathf.Lerp(2f, 0.7f, b?.oqs ?? 1f);
		num *= Mathf.Lerp(1.5f, 1f, c);
		return RandomHelper.giy() < num;
	}

	private static float exf(float a, float b)
	{
		if (Mathf.Abs(a - 0.7f) <= 0.03f)
		{
			return 0.05f;
		}
		float num = (a - 0.7f).gtg(-0.5f, 0.3f) * 2f * Mathf.Lerp(0.8f, 1f, b);
		if (!(num > 0f))
		{
			return RandomHelper.giz(0f - num, (0f - num) * 2f);
		}
		return RandomHelper.giz(0f - num, 0.2f);
	}
}
