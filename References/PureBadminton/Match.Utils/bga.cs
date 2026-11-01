using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class bga
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum MatchRequirements
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SinglesOnly,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		DoublesOnly
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum GenderRequirements
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MensOnly,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		WomensOnly
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class bfw
	{
		public const float oqe = 0.4f;

		public const float oqf = 2f;

		public bfx oqj;

		public bfx oqk;

		public bfx oql;

		public float oqm;

		public float oqn;

		public bool oqu;

		public bool ora;

		public bool orb;

		public CourtArea orc;

		public bool orf;

		public string oqg { get; set; }

		public float oqh { get; set; }

		public float oqi { get; set; }

		public Vector2 oqo { get; set; }

		public (float, float) oqp { get; set; }

		public float oqq { get; set; } = 1f;


		public float oqr { get; set; } = 0.4f;


		public float oqs { get; set; } = 1f;


		public float oqt { get; set; } = 1f;


		public float oqv { get; set; }

		public float oqw { get; set; } = 2f;


		public float qam => oqw * (oqi - oqv);

		public (int, int)? oqx { get; set; }

		public float oqy { get; set; } = 1f;


		public float oqz { get; set; }

		public float ord { get; set; } = 0.7f;


		public float ore { get; set; } = 1.2f;


		public ShotAnimationStartPosition? org { get; set; }

		public MatchRequirements? orh { get; set; }

		public GenderRequirements? ori { get; set; }

		public bfw jxq()
		{
			return new bfw
			{
				oqg = oqg,
				oqh = oqh,
				oqi = oqi,
				oqj = oqj,
				oqk = oqk,
				oql = oql,
				oqm = oqm,
				oqn = oqn,
				oqo = oqo,
				oqp = oqp,
				oqq = oqq,
				oqr = oqr,
				oqs = oqs,
				oqt = oqt,
				oqu = oqu,
				oqv = oqv,
				oqw = oqw,
				oqx = oqx,
				oqy = oqy,
				oqz = oqz,
				ora = ora,
				orb = orb,
				orc = orc,
				org = org,
				orf = orf,
				orh = orh,
				ori = ori
			};
		}

		public bfw jxr(float a, int b, float c = 100f)
		{
			bfw bfw = jxq();
			if (oqg.Contains("Defense"))
			{
				bfw.oqy *= 1f - 0.2f * ((100f - c) / 50f).gtg(0f, 1f);
			}
			bfw.oqy *= 1f + ((180f - (float)b) / 15f).gtg(-1f, 1f) * bfw.oqz;
			bfw.oqi /= a * bfw.oqy;
			bfw.oqh /= a * bfw.oqy;
			if (bfw.oqj != null)
			{
				bfw.oqo = new Vector2(0f - bfw.oqj.jxt((float)b / 100f), 0f - bfw.oql.jxt((float)b / 100f));
				float num = bfw.oqk.jxt((float)b / 100f);
				bfw.oqp = (num - oqm, num + oqn);
			}
			return bfw;
		}

		public float jxs(Vector3 a)
		{
			if (!oqx.HasValue)
			{
				return 0f;
			}
			float num = Vector2.SignedAngle(a.jvn(), -oqo);
			if (Mathf.Abs(num) < 120f)
			{
				return num.gtg(oqx.Value.Item1, oqx.Value.Item2);
			}
			return 0f;
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class bfx
	{
		public float orj;

		public float ork;

		public bfx(float a, float b)
		{
			orj = a;
			ork = b;
		}

		public float jxt(float a)
		{
			return orj * a + ork;
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private class bfy
	{
		public bfx oro;

		public bfx orp;

		public bfx orq;

		public float orr;

		public float ors;

		public bool? orz;

		public bool? osc;

		public bool? osd;

		public CourtArea ose;

		public string orl { get; set; }

		public float? orm { get; set; }

		public float? orn { get; set; }

		public Vector2? ort { get; set; }

		public (float, float)? oru { get; set; }

		public float? orv { get; set; }

		public float? orw { get; set; }

		public float? orx { get; set; }

		public float? ory { get; set; }

		public float? osa { get; set; }

		public float? osb { get; set; }

		public (int, int)? osf { get; set; }

		public float? osg { get; set; }

		public float? osh { get; set; }

		public bool? osi { get; set; }

		public ShotAnimationStartPosition? osj { get; set; }

		public MatchRequirements? osk { get; set; }

		public GenderRequirements? osl { get; set; }

		public bfy[] osm { get; set; }
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum ShotAnimationStartPosition
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Facing,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RacketFootForward,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RacketFootBackward
	}

	[Flags]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum CourtArea
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Net = 1,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Midcourt = 2,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Backcourt = 4
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bfz
	{
		public bfy osn;

		internal bfw jzh(bfy a)
		{
			return new bfw
			{
				oqg = osn.orl + "-" + a.orl,
				oqh = (a.orm ?? osn.orm.Value),
				oqi = (a.orn ?? osn.orn.Value),
				oqj = (a.oro ?? osn.oro),
				oqk = (a.orp ?? osn.orp),
				oql = (a.orq ?? osn.orq),
				oqm = ((a.orr != 0f) ? a.orr : osn.orr),
				oqn = ((a.ors != 0f) ? a.ors : osn.ors),
				oqq = (a.orv ?? osn.orv ?? 1f),
				oqr = (a.orw ?? osn.orw ?? 0.4f),
				oqs = (a.orx ?? osn.orx ?? 1f),
				oqt = (a.ory ?? osn.ory ?? 1f),
				oqu = (a.orz ?? osn.orz.GetValueOrDefault()),
				oqv = (a.osa ?? osn.osa.GetValueOrDefault()),
				oqw = (a.osb ?? osn.osb ?? 2f),
				oqx = (a.osf ?? osn.osf),
				oqy = (a.osg ?? osn.osg ?? 1f),
				oqz = (a.osh ?? osn.osh.GetValueOrDefault()),
				ora = (a.osc ?? osn.osc.GetValueOrDefault()),
				orb = (a.osd ?? osn.osd.GetValueOrDefault()),
				orc = (a.ose | osn.ose),
				org = (a.osj ?? osn.osj),
				orf = (a.osi ?? osn.osi ?? true),
				orh = (a.osk ?? osn.osk),
				ori = (a.osl ?? osn.osl)
			};
		}
	}

	public const int oso = 6;

	public static bfw osp = new bfw
	{
		oqg = "BackhandServe",
		oqh = 1.3f,
		oqi = 1.18f,
		oqj = new bfx(0.158751f, -0.4927506f),
		oqk = new bfx(0.61f, -0.1849127f),
		oql = new bfx(0.312434f, 0.2364309f)
	};

	private static List<bfy> osq = new List<bfy>
	{
		new bfy
		{
			orl = "JumpSmashDoubles",
			orm = 2.15f,
			orn = 1.366f,
			ory = 2.2f,
			orv = 1.1f,
			osg = 1.3f,
			osa = 0.65f,
			osb = 3f,
			osj = ShotAnimationStartPosition.RacketFootBackward,
			osk = MatchRequirements.DoublesOnly,
			osl = GenderRequirements.MensOnly,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.1349993f, -0.184129f),
					orp = new bfx(1.3285f, 0.6200553f),
					orq = new bfx(0.09884202f, 0.3267616f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "JumpSmash",
			orm = 0.83f,
			orn = 0.577f,
			ory = 2f,
			orv = 0.9f,
			osd = true,
			osj = ShotAnimationStartPosition.RacketFootBackward,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.2318507f, -0.3137814f),
					orp = new bfx(1.489812f, 0.2594419f),
					orq = new bfx(0.2676635f, 0.2968147f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.2766811f, -0.3967177f),
					orp = new bfx(1.292963f, 0.3304965f),
					orq = new bfx(0.4817103f, -0.09917262f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ScissorSmash",
			orm = 0.8f,
			orn = 0.502f,
			osj = ShotAnimationStartPosition.RacketFootBackward,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.158681f, -0.2765128f),
					orp = new bfx(1.08162f, 0.5199175f),
					orq = new bfx(0.2500193f, 0.3630643f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "RightChinaJump",
			orm = 0.971f,
			orn = 0.555f,
			orv = 0.8f,
			orx = 0.8f,
			ory = 1.6f,
			osf = (-20, 30),
			osc = true,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(1.042607f, -0.6735509f),
					orp = new bfx(1.435527f, 0.2895714f),
					orq = new bfx(-0.0247097f, 0.1615701f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LeftChinaJump",
			orm = 0.983f,
			orn = 0.576f,
			orv = 0.8f,
			orx = 0.8f,
			ory = 1.6f,
			osf = (-25, 20),
			osc = true,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.4534881f, -0.6351807f),
					orp = new bfx(1.481812f, 0.09233788f),
					orq = new bfx(-0.02222061f, 0.1823625f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearRightChinaJump",
			orm = 1.27f,
			orn = 0.77f,
			orv = 0.8f,
			orx = 0.8f,
			ory = 1.6f,
			osf = (-35, 25),
			osh = 0.1f,
			osc = true,
			osj = ShotAnimationStartPosition.Facing,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.5249603f, 0.03660077f),
					orp = new bfx(1.136174f, 0.6194484f),
					orq = new bfx(-0.7691703f, 0.3951805f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Left",
					oro = new bfx(0.4965446f, -0.1262311f),
					orp = new bfx(1.141331f, 0.57569f),
					orq = new bfx(-0.729722f, 0.260204f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Right",
					oro = new bfx(0.5265145f, 0.2481355f),
					orp = new bfx(1.133249f, 0.5538352f),
					orq = new bfx(-0.7758007f, 0.4832921f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearRightLowChinaJump",
			orm = 0.94f,
			orn = 0.559f,
			orv = 0.8f,
			orx = 0.8f,
			ory = 1.6f,
			osf = (-35, 25),
			osh = 0.1f,
			osc = true,
			osj = ShotAnimationStartPosition.Facing,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.420294f, -0.0503286f),
					orp = new bfx(1.020736f, 0.6610674f),
					orq = new bfx(-0.6859703f, 0.2838095f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Left",
					oro = new bfx(0.4731832f, 0.05010108f),
					orp = new bfx(0.9850521f, 0.6414652f),
					orq = new bfx(-0.7369423f, 0.3743559f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Right",
					oro = new bfx(0.4376732f, -0.3671756f),
					orp = new bfx(1.044086f, 0.5686604f),
					orq = new bfx(-0.6840553f, 0.2034147f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RightSmallChinaJump",
			orm = 1.2f,
			orn = 0.462f,
			osg = 1.2f,
			orv = 0.7f,
			orx = 0.8f,
			ory = 1.3f,
			osc = true,
			osf = (-30, 25),
			osj = ShotAnimationStartPosition.Facing,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.7776346f, 0.2399697f),
					orp = new bfx(0.8388081f, 0.5334901f),
					orq = new bfx(-0.258666f, 0.32595f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "RearLeftChinaJump",
			orm = 1.04f,
			orn = 0.488f,
			orv = 0.8f,
			orx = 0.8f,
			ory = 1.6f,
			osh = 0.1f,
			osc = true,
			osf = (-20, 30),
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.2766407f, -0.4505412f),
					orp = new bfx(1.169612f, 0.3746374f),
					orq = new bfx(-0.5532379f, 0.2744996f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearRightForehandShot",
			orm = 1.25f,
			orn = 0.983f,
			osg = 1.2f,
			orv = 0.7f,
			orx = 0.9f,
			osf = (-35, 25),
			osc = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.5530276f, 0.1035128f),
					orp = new bfx(0.7100253f, 0.6253557f),
					orq = new bfx(-0.7387567f, 0.09409922f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Left",
					oro = new bfx(0.5148275f, 0.03969425f),
					orp = new bfx(0.8160524f, 0.683516f),
					orq = new bfx(-0.7749376f, 0.1870542f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Right",
					oro = new bfx(0.5420909f, 0.493578f),
					orp = new bfx(0.6575117f, 0.4243864f),
					orq = new bfx(-0.7223568f, 0.04618066f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "OverheadForehandShot",
			orm = 1.37f,
			orn = 0.921f,
			orv = 0.9f,
			orx = 0.7f,
			ory = 1.3f,
			osf = (-20, 15),
			osg = 1.2f,
			osh = 0.15f,
			osc = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.3310931f, -0.1183399f),
					orp = new bfx(1.038301f, 0.4402024f),
					orq = new bfx(-0.7766609f, 0.4116691f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "MalayStep",
			orm = 1.66f,
			orn = 1.07f,
			orv = 0.7f,
			orx = 0.7f,
			ory = 1.4f,
			osf = (-30, 30),
			osh = 0.1f,
			osc = true,
			osd = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.5674906f, -0.5000024f),
					orp = new bfx(1.110622f, 0.5130972f),
					orq = new bfx(-0.8498292f, 0.1471509f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.6676474f, -0.6809891f),
					orp = new bfx(1.10805f, 0.3303845f),
					orq = new bfx(-0.876461f, 0.04576733f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "OverheadForehandLateShot",
			orm = 1.37f,
			orn = 0.925f,
			orv = 0.5f,
			orx = 0.4f,
			ory = 1.3f,
			osf = (-20, 15),
			osg = 1.2f,
			osh = 0.15f,
			osc = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.6261344f, -0.1871233f),
					orp = new bfx(0.9948492f, 0.5671821f),
					orq = new bfx(-0.9924545f, 0.2089586f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandStick",
			orm = 0.375f,
			orn = 0.24f,
			orw = 0.3f,
			orv = 0.7f,
			ory = 0.8f,
			osh = 0.1f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.448982f, -0.4298439f),
					orp = new bfx(1.132886f, 0.173868f),
					orq = new bfx(0.1343155f, 0.1399708f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.3215398f, -0.5473021f),
					orp = new bfx(1.232166f, 0.005641645f),
					orq = new bfx(-0.1007461f, 0.4576702f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "ForehandLeftStick",
			orm = 0.375f,
			orn = 0.235f,
			orw = 0.3f,
			orv = 0.7f,
			orx = 0.8f,
			ory = 0.8f,
			osh = 0.15f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.266264f, -0.9395527f),
					orp = new bfx(1.452012f, -0.4820274f),
					orq = new bfx(-0.4839133f, 1.244281f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.006494372f, -0.2940476f),
					orp = new bfx(1.407148f, -0.1902275f),
					orq = new bfx(-0.7798193f, 1.692605f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.1343798f, -0.5608782f),
					orp = new bfx(1.151905f, -0.259632f),
					orq = new bfx(0.1357841f, 0.2909022f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandHeadStick",
			orm = 0.41f,
			orn = 0.24f,
			orw = 0.3f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.9f,
			osh = 0.15f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[7]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.1922783f, -0.4549923f),
					orp = new bfx(0.9405539f, -0.04943174f),
					orq = new bfx(-0.09794233f, 0.1015882f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.04798471f, -0.4441932f),
					orp = new bfx(0.9944812f, -0.3291414f),
					orq = new bfx(-0.2099418f, 0.1079244f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.2118721f, -0.365256f),
					orp = new bfx(0.9622452f, 0.1202444f),
					orq = new bfx(-0.1333999f, 0.2412891f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryHigh",
					oro = new bfx(0.179104f, -0.2427647f),
					orp = new bfx(0.9470347f, 0.1570622f),
					orq = new bfx(-0.09307859f, 0.3650436f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "LeftMiddle",
					oro = new bfx(0.1759627f, -0.2148523f),
					orp = new bfx(0.7166366f, 0.369311f),
					orq = new bfx(0.3186034f, -0.486656f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "LeftLow",
					oro = new bfx(0.2379026f, -0.4382414f),
					orp = new bfx(0.871353f, -0.03862421f),
					orq = new bfx(-0.1167679f, 0.2218647f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "LeftHigh",
					oro = new bfx(0.1126705f, 0.02906528f),
					orp = new bfx(0.667669f, 0.5237153f),
					orq = new bfx(0.3072738f, -0.3967875f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandFastStick",
			orm = 0.354f,
			orn = 0.212f,
			orw = 0.3f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.8f,
			osh = 0.1f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.2719099f, -0.04857465f),
					orp = new bfx(0.8738868f, 0.3330005f),
					orq = new bfx(0.05802153f, -0.05326268f),
					orr = 0.3f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.3279667f, -0.01731002f),
					orp = new bfx(0.7784263f, 0.269315f),
					orq = new bfx(0.120964f, -0.1096706f),
					orr = 0.3f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryLow",
					oro = new bfx(0.3408044f, 0.1527594f),
					orp = new bfx(0.7096998f, 0.1812248f),
					orq = new bfx(0.1647949f, -0.2856368f),
					orr = 0.3f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForwardNetRush",
			orm = 1.175f,
			orn = 0.71f,
			orw = 0.2f,
			orv = 0.3f,
			orx = 0.6f,
			ory = 1.6f,
			osc = true,
			osf = (-10, 10),
			ose = CourtArea.Backcourt,
			orz = true,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.1572766f, -0.1320602f),
					orp = new bfx(0.7555299f, 0.6003541f),
					orq = new bfx(2.115472f, 0.3978273f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandNetRush",
			orm = 1.175f,
			orn = 0.71f,
			orw = 0.2f,
			orv = 0.3f,
			orx = 0.6f,
			ory = 1.6f,
			osc = true,
			osf = (-10, 20),
			ose = CourtArea.Backcourt,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.89358f, -0.08123347f),
					orp = new bfx(0.7546659f, 0.498264f),
					orq = new bfx(1.982699f, 0.692045f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BackhandNetRush",
			orm = 1.208f,
			orn = 0.71f,
			orw = 0.2f,
			orv = 0.3f,
			orx = 0.6f,
			ory = 1.6f,
			osf = (-30, 0),
			osc = true,
			ose = CourtArea.Backcourt,
			osd = true,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.6332393f, -0.6125168f),
					orp = new bfx(0.7141628f, 0.5129004f),
					orq = new bfx(2.110432f, 0.1420644f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandKill",
			orm = 0.875f,
			orn = 0.32f,
			osg = 0.7f,
			orw = 0.2f,
			orv = 0.3f,
			orx = 0.6f,
			ory = 1.3f,
			osc = true,
			osf = (-35, 15),
			ose = CourtArea.Backcourt,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.6053834f, 0.06434637f),
					orp = new bfx(0.7931368f, 0.1580554f),
					orq = new bfx(0.5145262f, 0.3902819f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.6310115f, -0.08904563f),
					orp = new bfx(0.8649794f, 0.3022525f),
					orq = new bfx(0.5510329f, 0.3687956f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryHigh",
					oro = new bfx(0.642022f, -0.2944867f),
					orp = new bfx(1.011839f, 0.2480692f),
					orq = new bfx(0.5406188f, 0.4286349f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BackhandKill",
			orm = 0.875f,
			orn = 0.32f,
			osg = 0.7f,
			orw = 0.2f,
			orv = 0.3f,
			orx = 0.6f,
			ory = 1.3f,
			osf = (-25, 15),
			osc = true,
			ose = CourtArea.Backcourt,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.3239696f, -0.3378951f),
					orp = new bfx(0.7665001f, 0.3221708f),
					orq = new bfx(0.8136366f, 0.009550409f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.3125261f, -0.4082656f),
					orp = new bfx(0.8122538f, 0.1028895f),
					orq = new bfx(0.7740782f, 0.115578f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.3179633f, -0.3816805f),
					orp = new bfx(0.9119717f, 0.2831987f),
					orq = new bfx(0.7673262f, -0.001859352f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "BackhandDrive",
			orm = 0.45f,
			orn = 0.296f,
			orw = 0.3f,
			orv = 0.3f,
			orx = 0.5f,
			ory = 0.8f,
			osh = 0.15f,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.1038598f, -0.2916132f),
					orp = new bfx(0.9524564f, 0.1599065f),
					orq = new bfx(1.065674f, -1.468154f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.04191904f, -0.4322613f),
					orp = new bfx(0.7281939f, 0.4358493f),
					orq = new bfx(0.6428526f, -0.618858f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "VeryLow",
					oro = new bfx(0.07203279f, -0.6617414f),
					orp = new bfx(0.6531821f, 0.4152935f),
					orq = new bfx(0.6927488f, -0.5610043f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LateShortForehand",
			orm = 0.86f,
			orn = 0.588f,
			orv = 0.5f,
			orx = 0.6f,
			ory = 1.2f,
			osc = true,
			osf = (-35, 30),
			osg = 0.7f,
			osh = 0.15f,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.828232f, 0.08565925f),
					orp = new bfx(0.7504849f, 0.2675493f),
					orq = new bfx(-0.6127166f, 0.03451135f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					orv = 0.4f,
					oro = new bfx(0.7981471f, 0.5424898f),
					orp = new bfx(0.6607346f, -0.05269368f),
					orq = new bfx(-0.4936217f, -0.2115862f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LateForehand",
			orm = 1f,
			orn = 0.726f,
			orv = 0.5f,
			orx = 0.6f,
			ory = 1.5f,
			osc = true,
			osf = (-25, 30),
			osg = 0.8f,
			osh = 0.1f,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(1.430002f, 0.09250411f),
					orp = new bfx(0.7625447f, 0.2233741f),
					orq = new bfx(-1.27243f, 0.2681497f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					orv = 0.4f,
					oro = new bfx(1.404432f, 0.5221164f),
					orp = new bfx(0.7354931f, -0.08434935f),
					orq = new bfx(-1.138839f, -0.03361935f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearLateForehand",
			orm = 1.82f,
			orn = 0.912f,
			orw = 0.3f,
			orv = 0.4f,
			orx = 0.4f,
			ory = 1.8f,
			osh = 0.1f,
			osc = true,
			osj = ShotAnimationStartPosition.Facing,
			osf = (-15, 0),
			osm = new bfy[4]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.2667394f, 0.7684857f),
					orp = new bfx(0.2863898f, 0.1795498f),
					orq = new bfx(-1.957957f, -0.1609339f),
					orr = 0.15f,
					ors = 0.15f,
					orz = true
				},
				new bfy
				{
					orl = "Low",
					orn = 0.916f,
					oro = new bfx(0.2661629f, 0.7088901f),
					orp = new bfx(0.2658644f, -0.1329007f),
					orq = new bfx(-1.90875f, -0.2276572f),
					orr = 0.15f,
					ors = 0.15f,
					orz = true
				},
				new bfy
				{
					orl = "R1",
					orn = 0.895f,
					orv = 0.5f,
					orx = 0.5f,
					oro = new bfx(1.010239f, 0.8658074f),
					orp = new bfx(0.2790284f, 0.05914171f),
					orq = new bfx(-1.656898f, -0.05631949f),
					orr = 0.15f,
					ors = 0.15f,
					orz = false
				},
				new bfy
				{
					orl = "R1Low",
					orn = 0.9f,
					orv = 0.5f,
					orx = 0.5f,
					oro = new bfx(0.9909515f, 0.8143684f),
					orp = new bfx(0.2606627f, -0.1475387f),
					orq = new bfx(-1.610508f, -0.07297938f),
					orr = 0.15f,
					ors = 0.15f,
					orz = false
				}
			}
		},
		new bfy
		{
			orl = "SideShortBackhand",
			orm = 1.418f,
			orn = 0.76f,
			orv = 0.4f,
			orx = 0.4f,
			ory = 1f,
			osh = 0.1f,
			osc = true,
			osi = false,
			osf = (-20, 25),
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-1.066786f, -0.03379176f),
					orp = new bfx(0.8548317f, 0.662543f),
					orq = new bfx(-0.02540183f, -0.2572717f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					oro = new bfx(-1.088068f, -0.3407888f),
					orp = new bfx(0.776999f, 0.5711057f),
					orq = new bfx(-0.03025532f, -0.2789469f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearBackhand",
			orm = 0.925f,
			orn = 0.513f,
			orw = 0.3f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 1.2f,
			osh = 0.1f,
			osc = true,
			osi = false,
			osf = (-10, 30),
			osj = ShotAnimationStartPosition.RacketFootForward,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.6079841f, -0.02321928f),
					orp = new bfx(0.7605791f, 0.6437898f),
					orq = new bfx(-0.346204f, -0.09356347f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Left",
					oro = new bfx(-0.6058826f, -0.3756885f),
					orp = new bfx(0.7132254f, 0.4801291f),
					orq = new bfx(-0.3636017f, -0.1444316f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Right",
					oro = new bfx(-0.5730891f, 0.1515612f),
					orp = new bfx(0.827487f, 0.6579622f),
					orq = new bfx(-0.330925f, -0.1216893f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearLowBackhand",
			orm = 1.55f,
			orn = 0.866f,
			osg = 1.2f,
			osh = 0.1f,
			orw = 0.3f,
			orv = 0.4f,
			orx = 0.6f,
			ory = 1.4f,
			osc = true,
			osi = false,
			osf = (-25, 15),
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-1.078367f, -0.1372414f),
					orp = new bfx(0.6769333f, 0.5860615f),
					orq = new bfx(-0.675703f, -0.2735763f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					oro = new bfx(-1.075793f, -0.3810459f),
					orp = new bfx(0.5937591f, 0.5067753f),
					orq = new bfx(-0.6615095f, -0.1795173f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearLateBackhand",
			orm = 1.65f,
			orn = 1.1f,
			osg = 1.2f,
			osh = 0.1f,
			orw = 0.3f,
			orv = 0.35f,
			orx = 0.6f,
			ory = 1.8f,
			orz = true,
			osc = true,
			osi = false,
			osf = (-25, 40),
			osj = ShotAnimationStartPosition.RacketFootForward,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-1.159214f, -0.09017191f),
					orp = new bfx(0.4466777f, 0.6931456f),
					orq = new bfx(-1.547752f, -0.2732525f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Left",
					oro = new bfx(-1.163981f, -0.08191299f),
					orp = new bfx(0.4471078f, 0.6923479f),
					orq = new bfx(-1.554558f, -0.261526f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "FastBackhand",
			orm = 0.725f,
			orn = 0.315f,
			orv = 0.4f,
			orx = 0.5f,
			ory = 1.3f,
			osh = 0.1f,
			osi = false,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.6060635f, -0.03123322f),
					orp = new bfx(0.9244303f, 0.2824731f),
					orq = new bfx(0.006484984f, 0.02419663f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.616623f, -0.06819049f),
					orp = new bfx(1.049857f, 0.3213267f),
					orq = new bfx(0.1166534f, -0.3503608f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					oro = new bfx(-0.6117104f, -0.2736454f),
					orp = new bfx(0.8929811f, 0.1987772f),
					orq = new bfx(0.1244354f, -0.2126731f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RearFastBackhand",
			orm = 0.704f,
			orn = 0.215f,
			osg = 0.7f,
			orv = 0.2f,
			orx = 0.2f,
			ory = 1.2f,
			osh = 0.1f,
			osi = false,
			osf = (-20, 20),
			osj = ShotAnimationStartPosition.RacketFootForward,
			osk = MatchRequirements.SinglesOnly,
			ose = CourtArea.Backcourt,
			osd = true,
			osc = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.612673f, 0.09782729f),
					orp = new bfx(0.654748f, 0.6720763f),
					orq = new bfx(-0.4998093f, -0.2494952f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					orn = 0.221f,
					oro = new bfx(-0.5953755f, -0.2347769f),
					orp = new bfx(0.6108184f, 0.5254447f),
					orq = new bfx(-0.5274639f, -0.3920006f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "SprintBackhandNetShot",
			orm = 1.21f,
			orn = 0.73f,
			orv = 0.4f,
			ory = 1.3f,
			osf = (-70, 0),
			osc = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.3526633f, -0.6534376f),
					orp = new bfx(0.5653992f, 0.2523872f),
					orq = new bfx(1.725396f, 0.6726298f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.3172069f, -0.514363f),
					orp = new bfx(0.4461799f, -0.07805221f),
					orq = new bfx(1.674208f, 0.7103753f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "VeryLow",
					orn = 0.72f,
					oro = new bfx(0.2390291f, -0.4498489f),
					orp = new bfx(0.3916345f, -0.2972979f),
					orq = new bfx(1.60386f, 0.5701216f),
					orr = 0f,
					ors = 0.3f
				}
			}
		},
		new bfy
		{
			orl = "SprintForehandNetShot",
			orm = 1.21f,
			orn = 0.81f,
			orv = 0.4f,
			ory = 1.3f,
			osf = (0, 50),
			osc = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.3811777f, -0.03707474f),
					orp = new bfx(0.5073824f, 0.3058173f),
					orq = new bfx(1.656158f, 0.8015507f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "Low",
					orn = 0.82f,
					oro = new bfx(0.4076068f, 0.08776736f),
					orp = new bfx(0.4056525f, -0.02287058f),
					orq = new bfx(1.557526f, 0.8348525f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "VeryLow",
					orn = 0.82f,
					oro = new bfx(0.3123333f, -0.06255952f),
					orp = new bfx(0.3381933f, -0.3212342f),
					orq = new bfx(1.57901f, 0.7009462f),
					orr = 0f,
					ors = 0.3f
				}
			}
		},
		new bfy
		{
			orl = "ForehandNetShotFar",
			orm = 1f,
			orn = 0.692f,
			osg = 1.1f,
			orv = 0.4f,
			osf = (-20, 45),
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.3914685f, 0.1897872f),
					orp = new bfx(0.4818816f, 0.2404184f),
					orq = new bfx(1.175772f, 0.5818722f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.4063218f, 0.3330517f),
					orp = new bfx(0.4178429f, 0.06304249f),
					orq = new bfx(1.133639f, 0.5343795f),
					orr = 0f,
					ors = 0.3f
				}
			}
		},
		new bfy
		{
			orl = "ForehandNetShot",
			orm = 0.58f,
			orn = 0.33f,
			orv = 0.4f,
			ory = 0.8f,
			osf = (-35, 20),
			osm = new bfy[4]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.5520005f, 0.2299682f),
					orp = new bfx(0.5424004f, -0.0487022f),
					orq = new bfx(0.6101599f, 0.5085999f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.4048736f, 0.2522676f),
					orp = new bfx(0.5028718f, -0.2247306f),
					orq = new bfx(0.5759869f, 0.4139309f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "VeryLow",
					oro = new bfx(0.4075115f, 0.1631546f),
					orp = new bfx(0.4839302f, -0.3880803f),
					orq = new bfx(0.5334625f, 0.3583812f),
					orr = 0f,
					ors = 0.3f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.429117f, 0.1532197f),
					orp = new bfx(0.5938807f, 0.1116478f),
					orq = new bfx(0.6595097f, 0.53931f),
					orr = 0f,
					ors = 0.3f
				}
			}
		},
		new bfy
		{
			orl = "BackhandNetShotClose",
			orm = 0.867f,
			orn = 0.41f,
			osg = 0.9f,
			orv = 0.4f,
			ory = 0.8f,
			osf = (-35, 30),
			osb = 1f,
			orr = 0.1f,
			ors = 0.15f,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(-0.4795227f, -0.4726231f),
					orp = new bfx(0.5405278f, 0.05588429f),
					orq = new bfx(0.5046282f, 0.3415424f)
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.4876437f, -0.4116065f),
					orp = new bfx(0.6613865f, 0.1688182f),
					orq = new bfx(0.5056601f, 0.4189267f),
					osc = true,
					osd = true
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.4359932f, -0.4246094f),
					orp = new bfx(0.4660466f, -0.1907071f),
					orq = new bfx(0.4656906f, 0.3349155f)
				}
			}
		},
		new bfy
		{
			orl = "BackhandNetShot",
			orm = 0.96f,
			orn = 0.495f,
			osg = 0.9f,
			orv = 0.4f,
			ory = 0.9f,
			osf = (-35, 30),
			orr = 0.1f,
			ors = 0.15f,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(-0.4935646f, -0.4130447f),
					orp = new bfx(0.5866027f, -0.008549229f),
					orq = new bfx(0.7426748f, 0.4503641f)
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.5070181f, -0.4677829f),
					orp = new bfx(0.6467848f, 0.1627828f),
					orq = new bfx(0.7432737f, 0.3999638f),
					osc = true,
					osd = true
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.4415503f, -0.2661926f),
					orp = new bfx(0.4936786f, -0.3260366f),
					orq = new bfx(0.7025433f, 0.4000885f)
				}
			}
		},
		new bfy
		{
			orl = "LateForehandNetShot",
			orm = 0.663f,
			orn = 0.3f,
			orv = 0.4f,
			orx = 0.7f,
			ory = 1.2f,
			osf = (-30, 35),
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.4786454f, 0.2252957f),
					orp = new bfx(0.4236444f, -0.1493766f),
					orq = new bfx(0.6124877f, 0.3755648f),
					orr = 0.1f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.4826488f, 0.3109659f),
					orp = new bfx(0.3598268f, -0.2599081f),
					orq = new bfx(0.5435534f, 0.4219826f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.4842012f, 0.2360265f),
					orp = new bfx(0.4891767f, -0.03446536f),
					orq = new bfx(0.6509398f, 0.3728488f),
					orr = 0.1f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LateBackhandNetShot",
			orm = 0.625f,
			orn = 0.46f,
			orv = 0.4f,
			orx = 0.7f,
			ory = 1.2f,
			osf = (-50, 25),
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(-0.4400651f, -0.6986471f),
					orp = new bfx(0.4594234f, -0.2754205f),
					orq = new bfx(0.8930967f, -0.06162221f),
					orr = 0.1f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.3646248f, -0.6258463f),
					orp = new bfx(0.4547841f, -0.4874305f),
					orq = new bfx(0.9681699f, -0.1106334f),
					orr = 0.1f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.4828422f, -0.7279428f),
					orp = new bfx(0.494311f, -0.1858f),
					orq = new bfx(0.9085081f, -0.1369777f),
					orr = 0.1f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "RightFarForehand",
			orm = 1.125f,
			orn = 0.383f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.7f,
			orz = true,
			osf = (-30, 20),
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[1]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.6944246f, 0.4487715f),
					orp = new bfx(0.6457191f, 0.3735632f),
					orq = new bfx(-0.0876475f, -0.0231222f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "RightFarHighForehand",
			orm = 1.125f,
			orn = 0.454f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.7f,
			orz = true,
			osf = (-30, 20),
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.8625197f, 0.286123f),
					orp = new bfx(0.6080031f, 0.4552678f),
					orq = new bfx(-0.1726162f, 0.2744623f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.8430204f, 0.2515507f),
					orp = new bfx(0.6941633f, 0.556599f),
					orq = new bfx(-0.179594f, 0.2621379f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BackhandDefense",
			orm = 0.5f,
			orn = 0.28f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.7f,
			osf = (-30, 20),
			osh = 0.1f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[5]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(-0.08993673f, -0.8193237f),
					orp = new bfx(0.5982695f, 0.01971273f),
					orq = new bfx(0.382315f, -0.2713793f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.08420658f, -0.7749283f),
					orp = new bfx(0.5306942f, -0.1721337f),
					orq = new bfx(0.318615f, -0.2219914f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryLow",
					orn = 0.29f,
					oro = new bfx(-0.0895505f, -0.7184237f),
					orp = new bfx(0.5291133f, -0.3289518f),
					orq = new bfx(0.3134708f, -0.241152f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "UltraLow",
					orn = 0.29f,
					oro = new bfx(-0.06228566f, -0.6483328f),
					orp = new bfx(0.5023133f, -0.426972f),
					orq = new bfx(0.2961426f, -0.2077789f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.1237206f, -0.7271739f),
					orp = new bfx(0.636045f, 0.1339218f),
					orq = new bfx(0.371666f, -0.3489483f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "ForehandDefense",
			orm = 0.25f,
			orn = 0.15f,
			orv = 0.5f,
			orx = 0.8f,
			ory = 0.7f,
			osf = (0, 40),
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[5]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.286701f, 0.4750276f),
					orp = new bfx(0.4985268f, -0.02827136f),
					orq = new bfx(0.03255221f, -0.08537786f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.2714157f, 0.4391994f),
					orp = new bfx(0.5045984f, -0.2429756f),
					orq = new bfx(0.03634357f, -0.07678366f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryLow",
					oro = new bfx(0.230459f, 0.3667645f),
					orp = new bfx(0.4736676f, -0.3672677f),
					orq = new bfx(0.03757668f, -0.05332306f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.3277779f, 0.4817934f),
					orp = new bfx(0.5551305f, 0.1493957f),
					orq = new bfx(0.04227448f, -0.03957359f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Far",
					oro = new bfx(0.3181052f, 0.5167387f),
					orp = new bfx(0.557415f, -0.01580155f),
					orq = new bfx(0.060009f, -0.07944141f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BodyDefense",
			orm = 0.37f,
			orn = 0.26f,
			orv = 0.4f,
			orx = 0.4f,
			ory = 0.8f,
			osh = 0.1f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[11]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.2785346f, -0.4369924f),
					orp = new bfx(0.6991096f, -0.2201035f),
					orq = new bfx(0.1667785f, 0.1681138f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.2648493f, -0.3751033f),
					orp = new bfx(0.6694011f, -0.4277537f),
					orq = new bfx(0.1411438f, 0.1060715f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "VeryLow",
					oro = new bfx(0.2200809f, -0.2775595f),
					orp = new bfx(0.5988675f, -0.5908368f),
					orq = new bfx(0.1377868f, 0.1435013f),
					orr = 0.21f,
					ors = 0.21f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.2582093f, -0.5221739f),
					orp = new bfx(0.6989602f, -0.03382523f),
					orq = new bfx(0.1745605f, 0.03820809f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "RightMiddle",
					oro = new bfx(0.2829441f, -0.1429749f),
					orp = new bfx(0.7231055f, -0.3743131f),
					orq = new bfx(0.1760864f, 0.3054963f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "RightLow",
					oro = new bfx(0.3407713f, -0.1218078f),
					orp = new bfx(0.6997336f, -0.6055828f),
					orq = new bfx(0.1777648f, 0.1087571f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "RightHigh",
					oro = new bfx(0.2842934f, 0.026027f),
					orp = new bfx(0.8819166f, -0.5272847f),
					orq = new bfx(0.2302551f, 0.1014939f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "LeftMiddle",
					oro = new bfx(0.0437188f, -0.6467415f),
					orp = new bfx(0.6992821f, -0.322895f),
					orq = new bfx(0.1124572f, 0.2942124f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "LeftLow",
					oro = new bfx(0.0402513f, -0.5369824f),
					orp = new bfx(0.7213942f, -0.4684946f),
					orq = new bfx(0.1379394f, 0.404419f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "LeftVeryLow",
					oro = new bfx(0.04503219f, -0.4101435f),
					orp = new bfx(0.6753657f, -0.6186544f),
					orq = new bfx(0.1177978f, 0.3241273f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "LeftHigh",
					oro = new bfx(0.03662079f, -0.6656558f),
					orp = new bfx(0.7396982f, -0.2390275f),
					orq = new bfx(0.1457214f, 0.3279496f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BehindTheBackDefense",
			orm = 0.442f,
			orn = 0.175f,
			orv = 0.2f,
			orx = 0.2f,
			ory = 0.8f,
			osh = 0.1f,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.1346996f, -0.3255109f),
					orp = new bfx(0.5836244f, -0.4428023f),
					orq = new bfx(-0.3884032f, 0.2588961f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					orn = 0.2f,
					oro = new bfx(-0.2083921f, -0.5141555f),
					orp = new bfx(0.6209331f, -0.1543267f),
					orq = new bfx(-0.3889503f, 0.454322f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "LongForehandDefense",
			orm = 1f,
			orn = 0.32f,
			orv = 0.3f,
			orx = 0.4f,
			ory = 1.3f,
			orz = true,
			osh = 0.05f,
			osf = (-20, 30),
			ose = CourtArea.Net,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(0.6949f, 0.582266f),
					orp = new bfx(0.4251907f, -0.01928497f),
					orq = new bfx(0.2326778f, 0.004319281f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.6585622f, 0.3825434f),
					orp = new bfx(0.3961346f, -0.3896641f),
					orq = new bfx(0.2238007f, -0.1525169f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(0.7688942f, 0.5262483f),
					orp = new bfx(0.5000539f, 0.289989f),
					orq = new bfx(0.181181f, 0.04794028f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LongForehandDefenseFar",
			orm = 1f,
			orn = 0.655f,
			orv = 0.3f,
			orx = 0.3f,
			ory = 1.3f,
			orz = true,
			osh = 0.05f,
			osf = (-20, 30),
			ose = CourtArea.Net,
			osj = ShotAnimationStartPosition.Facing,
			osm = new bfy[4]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(1.02804f, 0.5896951f),
					orp = new bfx(0.344867f, 0.1916056f),
					orq = new bfx(0.2138596f, -0.002617566f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(0.9433746f, 0.5965619f),
					orp = new bfx(0.3109064f, -0.1035154f),
					orq = new bfx(0.1776009f, -0.03480331f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(1.105273f, 0.4841174f),
					orp = new bfx(0.4781146f, 0.4336966f),
					orq = new bfx(0.1840973f, 0.08821908f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "VeryHigh",
					oro = new bfx(1.108545f, 0.3542386f),
					orp = new bfx(0.5740023f, 0.5408367f),
					orq = new bfx(0.1522217f, 0.2493208f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "LongBackhandDefense",
			orm = 1f,
			orn = 0.25f,
			orv = 0.3f,
			orx = 0.4f,
			ory = 1.3f,
			osh = 0.1f,
			orz = true,
			osf = (-40, 20),
			osj = ShotAnimationStartPosition.Facing,
			osi = false,
			osm = new bfy[4]
			{
				new bfy
				{
					orl = "Middle",
					oro = new bfx(-0.2878904f, -0.7452055f),
					orp = new bfx(0.4264312f, -0.1327236f),
					orq = new bfx(0.7388685f, -0.8619172f),
					orr = 0.15f,
					ors = 0.15f,
					orn = 0.22f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.3548913f, -0.5672097f),
					orp = new bfx(0.3736801f, -0.3459089f),
					orq = new bfx(0.6747816f, -0.9330994f),
					orr = 0.15f,
					ors = 0.15f,
					orn = 0.27f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-0.3750967f, -0.6805503f),
					orp = new bfx(0.4807686f, 0.07761851f),
					orq = new bfx(0.7101057f, -0.8752114f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "VeryHigh",
					oro = new bfx(-0.4326986f, -0.5387495f),
					orp = new bfx(0.5356454f, 0.2425059f),
					orq = new bfx(0.6710814f, -0.9109036f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "ForehandNetDive",
			orm = 1.95f,
			orn = 0.8f,
			orw = 0.1f,
			orv = 0.04f,
			orx = 0.3f,
			ory = 1.8f,
			orz = true,
			osf = (-10, 45),
			osh = 0.05f,
			ose = CourtArea.Backcourt,
			osc = true,
			osi = false,
			osd = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(0.5688899f, 0.03512352f),
					orp = new bfx(0.2442033f, 0.02011793f),
					orq = new bfx(1.362266f, 0.6855307f),
					orr = 0.05f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					orn = 0.795f,
					oro = new bfx(0.5739598f, 0.1381852f),
					orp = new bfx(0.2119344f, -0.1507551f),
					orq = new bfx(1.353483f, 0.6662725f),
					orr = 0.05f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "BackhandNetDive",
			orm = 1.95f,
			orn = 0.835f,
			orw = 0.1f,
			orv = 0.04f,
			orx = 0.3f,
			ory = 1.8f,
			orz = true,
			osf = (-50, 0),
			osh = 0.05f,
			ose = CourtArea.Backcourt,
			osc = true,
			osi = false,
			osd = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.2195113f, -0.570898f),
					orp = new bfx(0.2881041f, 0.02734621f),
					orq = new bfx(1.579773f, 0.4318021f),
					orr = 0.05f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-0.2318137f, -0.4992613f),
					orp = new bfx(0.2700371f, -0.183203f),
					orq = new bfx(1.580555f, 0.5436626f),
					orr = 0.05f,
					ors = 0.2f
				}
			}
		},
		new bfy
		{
			orl = "ForehandDefenseDive",
			orm = 2f,
			orn = 0.68f,
			orw = 0.1f,
			orv = 0.04f,
			orx = 0.3f,
			ory = 1.8f,
			orz = true,
			osf = (-30, 25),
			osg = 1.2f,
			osh = 0.05f,
			osj = ShotAnimationStartPosition.Facing,
			osi = false,
			osc = true,
			osd = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(1.499021f, 0.6317838f),
					orp = new bfx(0.190944f, -0.1771825f),
					orq = new bfx(-0.1512222f, 0.3171793f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(1.472155f, 0.6390329f),
					orp = new bfx(0.2698563f, 0.02022459f),
					orq = new bfx(-0.180253f, 0.3799176f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "BackhandDefenseDive",
			orm = 2f,
			orn = 0.56f,
			orw = 0.1f,
			orv = 0.04f,
			orx = 0.3f,
			ory = 1.8f,
			orz = true,
			osg = 1.2f,
			osh = 0.1f,
			osf = (-25, 30),
			osj = ShotAnimationStartPosition.Facing,
			osi = false,
			osc = true,
			osd = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-1.230585f, -0.6432627f),
					orp = new bfx(0.2505875f, -0.2911165f),
					orq = new bfx(0.2886982f, -0.240244f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "High",
					oro = new bfx(-1.206247f, -0.6774145f),
					orp = new bfx(0.3173292f, -0.0471372f),
					orq = new bfx(0.2612724f, -0.3921385f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "SprintRightLateForehand",
			orm = 1.625f,
			orn = 0.819f,
			orv = 0.6f,
			ory = 1.4f,
			osf = (-20, 40),
			osc = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(1.844906f, 0.809509f),
					orp = new bfx(0.3328109f, 0.2332112f),
					orq = new bfx(-0.1542473f, 0.379974f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(1.723232f, 0.8480229f),
					orp = new bfx(0.2631676f, -0.04675125f),
					orq = new bfx(-0.1314926f, 0.2930452f),
					orr = 0.15f,
					ors = 0.15f,
					osd = true
				}
			}
		},
		new bfy
		{
			orl = "SprintLeftLateBackhand",
			orm = 1.27f,
			orn = 0.738f,
			orv = 0.4f,
			ory = 1.4f,
			osf = (-35, 30),
			osc = true,
			osm = new bfy[2]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-1.418026f, -0.8443102f),
					orp = new bfx(0.4381146f, 0.2944918f),
					orq = new bfx(0.242363f, -0.1933165f),
					orr = 0.15f,
					ors = 0.15f
				},
				new bfy
				{
					orl = "Low",
					oro = new bfx(-1.36391f, -0.8344409f),
					orp = new bfx(0.3473288f, -0.101348f),
					orq = new bfx(0.1791534f, -0.08884224f),
					orr = 0.15f,
					ors = 0.15f
				}
			}
		},
		new bfy
		{
			orl = "RearLateChinaJump",
			orm = 1.1f,
			orn = 0.52f,
			orv = 0.6f,
			orx = 0.4f,
			ory = 1.5f,
			osh = 0.05f,
			osc = true,
			osd = true,
			osm = new bfy[3]
			{
				new bfy
				{
					orl = "Default",
					oro = new bfx(-0.06539261f, -0.2053419f),
					orp = new bfx(1.116925f, 0.5693161f),
					orq = new bfx(-0.5944595f, 0.1077509f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Left",
					orn = 0.524f,
					oro = new bfx(0.04988885f, -0.2619576f),
					orp = new bfx(1.06972f, 0.5306779f),
					orq = new bfx(-0.6104507f, 0.1996732f),
					orr = 0.2f,
					ors = 0.2f
				},
				new bfy
				{
					orl = "Right",
					orn = 0.515f,
					oro = new bfx(-0.1345212f, -0.411395f),
					orp = new bfx(1.14932f, 0.4477173f),
					orq = new bfx(-0.5977249f, 0.183823f),
					orr = 0.2f,
					ors = 0.2f
				}
			}
		}
	};

	public static List<bfw> osr = osq.SelectMany((bfy a) => a.osm.Select((bfy a) => new bfw
	{
		oqg = a.orl + "-" + a.orl,
		oqh = (a.orm ?? a.orm.Value),
		oqi = (a.orn ?? a.orn.Value),
		oqj = (a.oro ?? a.oro),
		oqk = (a.orp ?? a.orp),
		oql = (a.orq ?? a.orq),
		oqm = ((a.orr != 0f) ? a.orr : a.orr),
		oqn = ((a.ors != 0f) ? a.ors : a.ors),
		oqq = (a.orv ?? a.orv ?? 1f),
		oqr = (a.orw ?? a.orw ?? 0.4f),
		oqs = (a.orx ?? a.orx ?? 1f),
		oqt = (a.ory ?? a.ory ?? 1f),
		oqu = (a.orz ?? a.orz.GetValueOrDefault()),
		oqv = (a.osa ?? a.osa.GetValueOrDefault()),
		oqw = (a.osb ?? a.osb ?? 2f),
		oqx = (a.osf ?? a.osf),
		oqy = (a.osg ?? a.osg ?? 1f),
		oqz = (a.osh ?? a.osh.GetValueOrDefault()),
		ora = (a.osc ?? a.osc.GetValueOrDefault()),
		orb = (a.osd ?? a.osd.GetValueOrDefault()),
		orc = (a.ose | a.ose),
		org = (a.osj ?? a.osj),
		orf = (a.osi ?? a.osi ?? true),
		orh = (a.osk ?? a.osk),
		ori = (a.osl ?? a.osl)
	})).ToList();
}
