using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterMovementManager : CharacterComponent
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct MoveTarget
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 Position;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float? Time;

		public MoveTarget(Vector3 pos, float? time = null)
		{
			Position = pos;
			Time = time;
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class hu
	{
		public string lhz { get; set; }

		public (int, int)[] lia { get; set; }

		public (int, int)[] lib { get; set; }

		public int lic { get; set; }

		public float lid { get; set; }
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hv
	{
		public string lie;

		internal bool doi(string a)
		{
			return lie.StartsWith(a);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float FORWARD_TO_BACKWARD_LEFT_DURATION = 0.5f;

	private float? lif;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool CanRun;

	private AudioSource lii;

	private float lij;

	private float lik;

	private Rect lil;

	private Rect? lim;

	private List<AudioClip> lin;

	private Vector3 lio;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<hu> walkAnimations = new List<hu>
	{
		new hu
		{
			lhz = "Walking",
			lia = new(int, int)[1] { (-60, 70) },
			lib = new(int, int)[1] { (-90, 90) }
		},
		new hu
		{
			lhz = "WalkingRight",
			lia = new(int, int)[1] { (70, 120) },
			lib = new(int, int)[1] { (60, 160) },
			lic = -90
		},
		new hu
		{
			lhz = "WalkingLeft",
			lia = new(int, int)[1] { (-120, -70) },
			lib = new(int, int)[1] { (-160, -60) },
			lic = 90
		},
		new hu
		{
			lhz = "WalkingBackwards",
			lia = new(int, int)[2]
			{
				(-180, -120),
				(120, 180)
			},
			lib = new(int, int)[2]
			{
				(-180, -120),
				(120, 180)
			},
			lic = 180
		}
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<hu> runAnimations = dot();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static readonly float MaxRunAnimationSpeed = dot().Max((hu a) => a.lid);

	public float lig { get; private set; }

	public MoveTarget? lih { get; private set; }

	public float lip { get; private set; } = 1f;


	public float pbe => jd.edh(base.ozc.lhk?.ozx ?? 1f);

	public float pbf => lip * pbe * base.ozc.lhl.pah;

	public float pbg => jd.edj(lip, base.ozc.lhk?.ozx ?? 1f, base.ozc.lhl.paa, base.ozc.pba);

	public bool pbh
	{
		get
		{
			if (base.ozc.lhf.oyu != null)
			{
				return runAnimations.Any((hu a) => a.lhz == base.ozc.lhf.oyu);
			}
			return false;
		}
	}

	public static List<hu> dot()
	{
		List<hu> list = new List<hu>();
		list.Add(new hu
		{
			lhz = "Running",
			lia = new(int, int)[1] { (-60, 70) },
			lib = new(int, int)[1] { (-90, 90) },
			lid = 4.0414f
		});
		list.Add(new hu
		{
			lhz = "StrafeRight",
			lia = new(int, int)[1] { (70, 113) },
			lib = new(int, int)[1] { (60, 113) },
			lic = -90,
			lid = 3.453f
		});
		list.Add(new hu
		{
			lhz = "StrafeRight-45",
			lia = new(int, int)[1] { (112, 158) },
			lib = new(int, int)[1] { (112, 158) },
			lic = -135,
			lid = 3.453f
		});
		list.Add(new hu
		{
			lhz = "StrafeRight-90",
			lia = new(int, int)[2]
			{
				(-180, -170),
				(157, 180)
			},
			lib = new(int, int)[2]
			{
				(-180, -160),
				(157, 180)
			},
			lic = -180,
			lid = 3.453f
		});
		list.Add(new hu
		{
			lhz = "StrafeLeft",
			lia = new(int, int)[1] { (-120, -60) },
			lib = new(int, int)[1] { (-140, -60) },
			lic = 90,
			lid = 3.408f
		});
		list.Add(new hu
		{
			lhz = "RunningBackwards",
			lia = new(int, int)[1] { (-170, -120) },
			lib = new(int, int)[1] { (-180, -120) },
			lic = 180,
			lid = 3.31f
		});
		return list;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		lii = GetComponent<AudioSource>();
		lil = base.oze.pck.jvq(2f);
		lin = new List<AudioClip>
		{
			Resources.Load<AudioClip>("Sounds/feet-noise-1"),
			Resources.Load<AudioClip>("Sounds/feet-noise-2"),
			Resources.Load<AudioClip>("Sounds/feet-noise-3"),
			Resources.Load<AudioClip>("Sounds/feet-noise-4"),
			Resources.Load<AudioClip>("Sounds/feet-noise-5"),
			Resources.Load<AudioClip>("Sounds/feet-noise-6"),
			Resources.Load<AudioClip>("Sounds/feet-noise-7"),
			Resources.Load<AudioClip>("Sounds/feet-noise-8"),
			Resources.Load<AudioClip>("Sounds/feet-noise-9"),
			Resources.Load<AudioClip>("Sounds/feet-noise-10")
		};
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (base.ozc.paz || (base.ozc.lhe.lgi && !lih.HasValue && base.ozc.lhi.lju == null))
		{
			return;
		}
		if (!base.ozc.AllowedAction.HasFlag(CharacterManager.PossibleAction.Move) && !lih.HasValue)
		{
			if (base.ozc.lhf.oys)
			{
				dox();
			}
			return;
		}
		lig += (base.transform.position - lio).magnitude;
		lio = base.transform.position;
		CharacterShotManager.ib ib = base.ozc.lhi.lju;
		if (ib != null && ib.pbk)
		{
			return;
		}
		if (lif.HasValue)
		{
			if (lif > Time.time)
			{
				return;
			}
			lif = null;
		}
		lij = (lik = 0f);
		Vector3? vector = null;
		if (lih.HasValue)
		{
			Vector3 a2 = lih.Value.Position - base.transform.position;
			a2.y = 0f;
			doz(a2.jvn());
			if (a2.magnitude < 0.15f)
			{
				a2 = Vector3.zero;
				lih = null;
				dox();
			}
			else
			{
				a2 = a2.normalized;
			}
			lij = a2.x;
			lik = a2.z;
		}
		else if (!base.ozi && base.ozc.lhi.lju == null && !base.ozc.lhe.ozo)
		{
			lij = base.ozc.lhe.ozq.x;
			lik = base.ozc.lhe.ozq.y;
			if (base.ozc.lhm.NextPotentialShots != null)
			{
				Vector2 to = new Vector2(lij, lik);
				foreach (lr nextPotentialShot in base.ozc.lhm.NextPotentialShots)
				{
					Vector2 from = (nextPotentialShot.mbq - base.transform.position).jvn();
					if (Vector2.Angle(from, to) < 60f)
					{
						to = from.normalized * to.magnitude;
						lij = to.x;
						lik = to.y;
						break;
					}
				}
			}
		}
		Rect rect = (lim ?? lil).jvt(0.05f, 0.25f);
		if (lij < 0f && base.transform.position.x <= rect.xMin + 0.2f)
		{
			lij = 0f;
		}
		if (lij > 0f && base.transform.position.x >= rect.xMax - 0.2f)
		{
			lij = 0f;
		}
		if (lik < 0f && base.transform.position.z <= rect.yMin + 0.2f)
		{
			lik = 0f;
		}
		if (lik > 0f && base.transform.position.z >= rect.yMax - 0.2f)
		{
			lik = 0f;
		}
		if (lij == 0f && lik < 0.3f && lik > -0.3f)
		{
			lik = 0f;
		}
		if (lik == 0f && lij < 0.3f && lij > -0.3f)
		{
			lij = 0f;
		}
		if (lij == 0f && lik == 0f && !rect.Contains(base.transform.position.jvn()))
		{
			base.transform.position = new Vector3(base.transform.position.x.gtg(rect.xMin + 0.1f, rect.xMax - 0.1f), 0f, base.transform.position.z.gtg(rect.yMin + 0.1f, rect.yMax - 0.1f));
		}
		if (vector.HasValue)
		{
			base.transform.position = vector.Value.jvp();
			dox();
			return;
		}
		float num = base.oze.pci + (base.ozl ? (-0.5f) : 0.5f);
		if (base.ozl ^ (base.transform.position.z < num))
		{
			base.transform.gtu(num);
		}
		Vector2 a3 = new Vector2(lij * (float)(base.ozl ? 1 : (-1)), lik * (float)(base.ozl ? 1 : (-1)));
		var (hu, num2) = dpc(a3, CanRun);
		if (hu?.lhz != base.ozc.lhf.oyu)
		{
			base.ozc.lhf.dfu(hu, dpa());
			base.ozc.lhh.dpm(num2, (hu?.lhz == "StrafeRight") ? 0.05f : 0.2f);
		}
		else
		{
			base.ozc.lhh.liq = num2;
		}
		if (CanRun && new Vector2(lij, lik).magnitude > 0.8f && !lii.isPlaying && !base.ozd.Characters.Any((CharacterManager a) => a.GetComponent<AudioSource>().isPlaying))
		{
			lii.PlayOneShot(lin.gtk());
		}
	}

	public void dou()
	{
		lip = jd.edf(base.ozc.pbb.speed, base.ozc.Player.CharacterInfo.height, base.ozi);
	}

	public void dov(Vector3? a, float? b = null)
	{
		lih = (a.HasValue ? new MoveTarget?(new MoveTarget(a.Value.jvp(), b)) : null);
	}

	public void dow()
	{
		lih = null;
	}

	public void dox()
	{
		bool flag = false;
		float num = (base.ozc.lhh.liq.HasValue ? Mathf.Abs(Mathf.DeltaAngle(0f, base.ozc.lhh.liq.Value)) : 0f);
		if (base.ozc.lhf.oyu == "StrafeRight-90" || (base.ozc.lhf.oyu == "RunningBackwards" && num > 30f))
		{
			string lie = base.ozc.lhi.lju?.liz?.oqg;
			if (lie == null)
			{
				lie = base.ozc.lhm.dqp()?.liz.oqg;
			}
			if (lie != null && new string[3] { "JumpSmash", "ScissorSmash", "RearRight" }.Any((string a) => lie.StartsWith(a)))
			{
				base.ozc.lhf.dfv("IdleSideways", 0.05f);
				base.ozc.lhh.dpm(num - 90f, 0.05f);
				flag = true;
			}
		}
		if (!flag && base.ozc.lhi.lju == null && !base.ozh.GetCurrentAnimatorStateInfo(0).IsName("Idle"))
		{
			base.ozc.lhf.dfv();
			base.ozc.lhh.liq = 0f;
		}
		lij = 0f;
		lik = 0f;
	}

	public void doy(Rect? a)
	{
		lim = a;
	}

	private (float, hu) doz(Vector2 a)
	{
		a *= (float)(base.ozl ? 1 : (-1));
		string text = dpc(a, b: true).Item1?.lhz;
		float num = base.ozc.pba * pbf;
		hu hu = null;
		for (int i = 0; i < runAnimations.Count; i++)
		{
			if (runAnimations[i].lhz == text)
			{
				hu = runAnimations[i];
				break;
			}
		}
		return ((hu?.lid ?? 3.5f) * num, hu);
	}

	private bool dpa()
	{
		if (!(base.ozd.OnlineManager == null) && !base.ozd.pdt)
		{
			MoveTarget? moveTarget = lih;
			if (moveTarget.HasValue && moveTarget.GetValueOrDefault().Time.HasValue)
			{
				return Time.time + dpb(lih.Value.Position) > lih.Value.Time.Value;
			}
		}
		return false;
	}

	public float dpb(Vector3 a)
	{
		Vector2 a2 = a.jvn() - base.transform.position.jvn();
		float magnitude = a2.magnitude;
		var (num, hu) = doz(a2);
		if (hu.lhz != base.ozc.lhf.oyu)
		{
			float num2 = (0.1f * num).gtg(0f, magnitude);
			bool flag = base.ozc.lhf.dfo(hu.lhz);
			return (num2 + magnitude) / num + (flag ? 0.5f : 0f);
		}
		return magnitude / num;
	}

	private (hu, float) dpc(Vector2 a, bool b)
	{
		if (a.magnitude == 0f)
		{
			return (null, 0f);
		}
		float num = Vector2.SignedAngle(a, new Vector2(0f, 1f));
		List<hu> list = (b ? runAnimations : walkAnimations);
		string text = base.ozc.lhf.oyu;
		hu hu = null;
		for (int i = 0; i < list.Count; i++)
		{
			if (text == list[i].lhz)
			{
				hu = list[i];
				break;
			}
		}
		if (hu != null && dpd(hu.lib, num))
		{
			return (hu, num + (float)(hu.lic * ((!base.ozm) ? 1 : (-1))));
		}
		for (int j = 0; j < list.Count; j++)
		{
			hu hu2 = list[j];
			if (dpd(hu2.lia, num))
			{
				return (hu2, num + (float)(hu2.lic * ((!base.ozm) ? 1 : (-1))));
			}
		}
		return (null, 0f);
	}

	private bool dpd((int, int)[] a, float b)
	{
		for (int i = 0; i < a.Length; i++)
		{
			if (dpe(a[i], b))
			{
				return true;
			}
		}
		return false;
	}

	private bool dpe((int, int) a, float b)
	{
		if (base.ozm)
		{
			if (b >= (float)(-a.Item2))
			{
				return b <= (float)(-a.Item1);
			}
			return false;
		}
		if (b >= (float)a.Item1)
		{
			return b <= (float)a.Item2;
		}
		return false;
	}

	public void dpf(string a)
	{
		base.ozc.lhh.liq = 0f;
		base.ozc.lhf.dfz(a);
		lif = Time.time + 0.25f;
	}

	public void dpg(float a)
	{
		if (lif.HasValue)
		{
			lif += Time.time - a;
		}
	}

	[CompilerGenerated]
	private bool dph(hu a)
	{
		return a.lhz == base.ozc.lhf.oyu;
	}
}
