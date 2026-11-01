using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShuttleManager : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnTrajectoryChanged();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void ShuttleEvent(ShuttleManager obj, Vector3 contactPoint, string contactTag);

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lw
	{
		public ShuttleManager mcq;

		public Vector3 mcr;

		internal void exk()
		{
			mcq.eyf(mcr);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lx
	{
		public CharacterShotManager.ib mcs;

		public ShuttleManager mct;

		public float mcu;

		public Action mcv;

		internal void exl()
		{
			if (!mcs.ljd)
			{
				mct.eyd(mcu, mcv);
			}
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ly
	{
		public float mcw;

		internal bool exm(CharacterShotManager.ib a)
		{
			if (a != null && a.ljc == CharacterShotManager.ShotPhase.Shooting && !a.ljb)
			{
				return a.lje <= mcw;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lz
	{
		public ShuttleManager mcx;

		public me.FloorBounce mcy;

		internal void exn()
		{
			mcx.eyf(mcy.Position);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ma
	{
		public ShuttleManager mcz;

		public Vector3 mda;

		internal void exo()
		{
			mcz.mdm?.Invoke(mcz, mda, "OutOfCourt");
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mb
	{
		public ShuttleManager mdb;

		public me mdc;

		public bool mdd;

		internal bool exp(KeyValuePair<float, Vector3> a)
		{
			if (!mdc.meg)
			{
				return mdd ^ (a.Value.z > mdb.mdf.Court.pci);
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mc
	{
		public float? mde;

		internal bool exq(KeyValuePair<float, Vector3> a)
		{
			if (mde.HasValue)
			{
				return a.Key <= mde.Value;
			}
			return true;
		}
	}

	[HideInInspector]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float lastHitTime;

	private GameManager mdf;

	private ShuttleTrajectoryRunner mdg;

	private Collider mdh;

	private NetDeformer mdi;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LineRenderer trajectoryLine;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool AlwaysShowTrajectories;

	private bool mdk;

	private bool mdn;

	private const float mdo = 0.12f;

	private const float mdp = 2.5f;

	private const float mdq = 0.6f;

	public me pgu
	{
		get
		{
			if (!(mdg == null))
			{
				return mdg.mei;
			}
			return null;
		}
	}

	public bool mdl { get; private set; }

	public Vector3 pgv
	{
		get
		{
			if (!(mdg != null) || !mdg.pgz)
			{
				return base.transform.position;
			}
			return mdg.mek;
		}
	}

	public Vector3 pgw
	{
		get
		{
			if (!(mdg != null))
			{
				return Vector3.zero;
			}
			return mdg.mej;
		}
	}

	public float pgx => pgw.magnitude;

	public bool pgy => mdn;

	public event OnTrajectoryChanged mdj;

	public event ShuttleEvent mdm;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		mdg = base.gameObject.GetComponent<ShuttleTrajectoryRunner>();
		mdh = base.gameObject.GetComponent<Collider>();
		mdf = GameManager.Current;
		mdg.met += eyg;
		mdg.mes += eyh;
		mdg.meu += eyc;
	}

	private void eyc()
	{
		if (!mdn)
		{
			Vector3 mcr = pgv;
			eyd(Time.time, delegate
			{
				eyf(mcr);
			});
		}
	}

	private void eyd(float a, Action b)
	{
		CharacterShotManager.ib mcs = eye(a);
		if (mcs == null)
		{
			b();
			return;
		}
		this.gvb(delegate
		{
			if (!mcs.ljd)
			{
				eyd(a, b);
			}
		});
	}

	private CharacterShotManager.ib eye(float a)
	{
		if (mdf == null)
		{
			return null;
		}
		return mdf.Characters.Select((CharacterManager a) => a.lhi?.lju).FirstOrDefault((CharacterShotManager.ib a) => a != null && a.ljc == CharacterShotManager.ShotPhase.Shooting && !a.ljb && a.lje <= a);
	}

	private void eyf(Vector3 a)
	{
		string contactTag = "Floor";
		RaycastHit[] array = Physics.RaycastAll(a + Vector3.up * 0.5f, Vector3.down, 1f);
		for (int i = 0; i < array.Length; i++)
		{
			RaycastHit raycastHit = array[i];
			if (!raycastHit.collider.transform.IsChildOf(base.transform) && !(raycastHit.collider.transform == base.transform) && (raycastHit.collider.CompareTag("Floor") || raycastHit.collider.CompareTag("OutOfCourt")))
			{
				contactTag = raycastHit.collider.tag;
				break;
			}
		}
		mdn = true;
		this.mdm?.Invoke(this, a, contactTag);
	}

	private void eyg(me.FloorBounce a)
	{
		if (!mdn)
		{
			eyd(a.Time, delegate
			{
				eyf(a.Position);
			});
		}
	}

	private void eyh(me.NetHit a)
	{
		if (mdi == null)
		{
			mdi = UnityEngine.Object.FindFirstObjectByType<NetDeformer>();
		}
		NetDeformer netDeformer = mdi;
		if (!(netDeformer == null))
		{
			Vector3 vector = netDeformer.transform.InverseTransformPoint(a.Position);
			Vector2 a2 = new Vector2((vector.x + netDeformer.width * 0.5f) / netDeformer.width, vector.y / netDeformer.height);
			netDeformer.elu(a2, Mathf.Abs(a.IncomingVelocity.z).gtg(8f, 30f));
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("OutOfCourt"))
		{
			Vector3 mda = base.transform.position;
			eyd(Time.time, delegate
			{
				this.mdm?.Invoke(this, mda, "OutOfCourt");
			});
		}
	}

	public void eyi()
	{
		eyk();
		mdg.ezl();
		mdn = false;
	}

	public void eyj()
	{
		lastHitTime = Time.time;
		if (mdk)
		{
			me mdc = pgu;
			if (mdc == null || mdc.meb.Count == 0)
			{
				this.mdj?.Invoke();
				return;
			}
			SortedList<float, Vector3> meb = mdc.meb;
			bool mdd = mdc.mdz.z < mdf.Court.pci;
			if (mdf.pdy.ShuttleTrajectory == rk.ShuttleTrajectoryOptions.Trajectory)
			{
				if (trajectoryLine == null)
				{
					GameObject gameObject = new GameObject("Trajectory line");
					trajectoryLine = gameObject.AddComponent<LineRenderer>();
					trajectoryLine.startWidth = 0.02f;
					trajectoryLine.endWidth = 0.02f;
					trajectoryLine.material = new Material(Shader.Find("Sprites/Default"));
					trajectoryLine.startColor = new Color(1f, 0.94f, 0.23f, 0.3f);
					trajectoryLine.endColor = new Color(1f, 0.61f, 0f, 0.3f);
				}
				trajectoryLine.gameObject.SetActive(value: true);
				float? mde = ((mdc.mee.Count > 0) ? new float?(mdc.mee[0].Time) : null);
				Vector3[] array = (from a in meb
					where mdc.meg || (mdd ^ (a.Value.z > mdf.Court.pci))
					where !mde.HasValue || a.Key <= mde.Value
					select a.Value).ToArray();
				trajectoryLine.positionCount = array.Length;
				trajectoryLine.SetPositions(array);
			}
			if (mdf.pdy.ShuttleTrajectory != rk.ShuttleTrajectoryOptions.None && mdc.meg && !mdf.Tutorial.pik)
			{
				Vector3 mef = mdc.mef;
				mdf.FallingPointDecal.transform.position = new Vector3(mef.x, mdf.FallingPointDecal.transform.position.y, mef.z);
				mdf.FallingPointDecal.enabled = true;
			}
		}
		else
		{
			eyk();
		}
		this.mdj?.Invoke();
	}

	public void eyk()
	{
		mdk = false;
		if (trajectoryLine != null)
		{
			trajectoryLine.gameObject.SetActive(value: false);
			trajectoryLine.positionCount = 0;
		}
		if (mdf != null && mdf.FallingPointDecal != null)
		{
			mdf.FallingPointDecal.enabled = false;
		}
	}

	public void eyl(Vector3 a, bool b, float? c = null, Vector3? d = null)
	{
		mdn = false;
		float a2 = c ?? Time.time;
		Vector3 b2 = d ?? pgv;
		me a3 = mf.eyt(a2, b2, a, ShuttleBounceParameters.pgt, mdf.Court.pci);
		mdg.ezk(a3);
		mdk = b || AlwaysShowTrajectories;
		eyj();
	}

	public void eym(Collider a)
	{
		Vector3 position = base.transform.position;
		Vector3 inDirection = pgw;
		Vector3 vector = Vector3.zero;
		if (inDirection.sqrMagnitude >= 0.01f)
		{
			if (Physics.ComputePenetration(mdh, base.transform.position, base.transform.rotation, a, a.transform.position, a.transform.rotation, out var direction, out var distance))
			{
				position += direction * (distance + 0.02f);
			}
			else
			{
				direction = -inDirection.normalized;
			}
			vector = Vector3.Reflect(inDirection, direction) * 0.12f;
			if (vector.magnitude > 2.5f)
			{
				vector = vector.normalized * 2.5f;
			}
			vector.y = Mathf.Max(vector.y, 0.6f);
		}
		eyl(vector, b: false, null, position);
		if (mdf.OnlineManager != null)
		{
			mdf.OnlineManager.etw(position, vector);
		}
	}

	public void eyn(float a, Vector3 b, Vector3 c, bool d)
	{
		mdn = false;
		me a2 = mf.eyt(a, b, c, ShuttleBounceParameters.pgt, mdf.Court.pci);
		mdg.ezk(a2, b: true);
		mdk = d || AlwaysShowTrajectories;
		eyj();
	}

	public void eyo(bool a = true)
	{
		if (a)
		{
			if (!mdl)
			{
				mdl = true;
				mdg.ezm();
			}
		}
		else if (mdl)
		{
			mdl = false;
			mdg.ezn();
		}
	}
}
