using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterShotManager : CharacterComponent
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum ShotPhase
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Planned,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Shooting,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FollowThrough
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class ib : lq
	{
		public bga.bfw liz { get; set; }

		public bool lja { get; set; }

		public bool ljb { get; set; }

		public ShotPhase ljc { get; set; }

		public bool ljd { get; set; }

		public bool pbk => ljc != ShotPhase.Planned;

		public bool pbl => ljc == ShotPhase.FollowThrough;

		public float lje { get; set; }

		public Vector3 ljf { get; set; }

		public float ljg { get; set; } = 1f;


		public float pbm => lje + (liz.oqh - liz.oqi) / ljg;

		public float ljh { get; set; }

		public float lji { get; set; } = 1f;


		public bool ljj { get; set; }

		public AuthoritativeShot? ljk { get; set; }
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct AuthoritativeShot
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float ContactTime;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 StartPosition;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 Velocity;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public ShotType ShotType;

		public AuthoritativeShot(float contactTime, Vector3 startPosition, Vector3 velocity, ShotType shotType)
		{
			ContactTime = contactTime;
			StartPosition = startPosition;
			Velocity = velocity;
			ShotType = shotType;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ic
	{
		public bool ljl;

		internal AudioClip[] dsi(AudioManager a)
		{
			if (!ljl)
			{
				return a.mlg;
			}
			return a.mlh;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ie
	{
		public float ljm;

		public float ljn;

		public float ljo;

		internal bool dsj(CharacterManager a)
		{
			return a.jvu(new Vector3(ljm, 0f, a.par ? (0f - ljn) : ljn)) > ljo;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float SHOT_POWER_FILL_DURATION = 0.3f;

	private CharacterControls ljv;

	private CharacterMovementManager ljw;

	private CanvasGroup ljx;

	private Image ljy;

	private Image ljz;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ShotType? nextShotType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float nextShotPower;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Vector2? nextShotDirection;

	private float lka = -999f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float? LimitShotPower;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float ONLINE_CLIENT_MAX_SWING_SPEED_FACTOR = 4f;

	public GameObject ljt { get; private set; }

	public ib lju { get; private set; }

	public bool pbp => lju?.pbk ?? false;

	public bool pbq
	{
		get
		{
			if (nextShotType.HasValue)
			{
				return nextShotPower > 0f;
			}
			return false;
		}
	}

	private bool pbr => base.ozc.IsLocallyControlled;

	public ShotInputsSnapshot lkb { get; private set; }

	public void dsv(float a)
	{
		if (a > nextShotPower + 0.0001f)
		{
			lka = Time.time;
		}
		nextShotPower = a;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		ljv = GetComponent<CharacterControls>();
		ljw = GetComponent<CharacterMovementManager>();
		ljt = new GameObject();
		ljt.name = "Power Gauge";
		RectTransform rectTransform = ljt.AddComponent<RectTransform>();
		rectTransform.pivot = new Vector2(0.5f, 0.5f);
		rectTransform.anchorMin = Vector2.zero;
		rectTransform.anchorMax = Vector2.zero;
		ljt.transform.SetParent(base.ozd.PowerGaugesCanvas.transform, worldPositionStays: false);
		ljx = ljt.AddComponent<CanvasGroup>();
		GameObject gameObject = new GameObject();
		gameObject.name = "Power Gauge Background";
		gameObject.AddComponent<RectTransform>();
		gameObject.AddComponent<CanvasRenderer>();
		ljz = gameObject.AddComponent<Image>();
		ljz.sprite = Resources.Load<Sprite>("Images/PowerGaugeBackground");
		ljz.rectTransform.sizeDelta = new Vector2(50f, 25f);
		ljz.color = new Color32(0, 0, 0, 160);
		ljz.enabled = false;
		gameObject.transform.SetParent(ljt.transform, worldPositionStays: false);
		GameObject gameObject2 = new GameObject();
		gameObject2.name = "Power Gauge Foreground";
		gameObject2.AddComponent<RectTransform>();
		gameObject2.AddComponent<CanvasRenderer>();
		ljy = gameObject2.AddComponent<Image>();
		ljy.sprite = Resources.Load<Sprite>("Images/PowerGaugeForeground");
		ljy.rectTransform.sizeDelta = new Vector2(50f, 25f);
		ljy.type = Image.Type.Filled;
		ljy.fillMethod = Image.FillMethod.Radial180;
		ljy.fillOrigin = 0;
		ljy.fillClockwise = true;
		ljy.enabled = false;
		gameObject2.transform.SetParent(ljt.transform, worldPositionStays: false);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		Gamepad.all.ToList().ForEach(delegate(Gamepad a)
		{
			a.SetMotorSpeeds(0f, 0f);
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (base.ozc.paz || Time.deltaTime == 0f || !base.ozc.pap)
		{
			return;
		}
		bool flag = base.ozc.pay;
		if (base.ozd.pea == 0)
		{
			CharacterManager characterManager = base.ozc;
			if ((object)characterManager != null && characterManager.paw?.pas == true)
			{
				flag = false;
			}
		}
		if (base.ozd.pea <= 1)
		{
			CharacterManager characterManager2 = base.ozc;
			if ((object)characterManager2 != null && characterManager2.paw?.pat == true)
			{
				flag = false;
			}
		}
		if (flag)
		{
			dth(ShotType.Clear, ljv.ozs.Value.pjw, CharacterManager.PossibleAction.Clear);
			dth(ShotType.Drop, ljv.ozs.Value.pjz, CharacterManager.PossibleAction.Drop);
			dth(ShotType.Smash, ljv.ozs.Value.pjx, CharacterManager.PossibleAction.Smash);
			dth(ShotType.Midcourt, ljv.ozs.Value.pjy, CharacterManager.PossibleAction.Midcourt);
		}
		dti();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (!base.ozc.paz && lju != null)
		{
			switch (lju.ljc)
			{
			case ShotPhase.Planned:
				dsw();
				break;
			case ShotPhase.Shooting:
				dta();
				break;
			case ShotPhase.FollowThrough:
				dte();
				break;
			}
		}
	}

	private void dsw()
	{
		float num = lju.lje;
		if (!(num <= Time.time) && !base.ozf.mdl && !base.ozd.lmu)
		{
			bga.bfw bfw = lju.liz;
			bool flag = Time.time > num - bfw.oqi - Time.fixedDeltaTime;
			if (!flag && Time.time > num - bfw.oqi / bfw.ord)
			{
				flag = (base.ozc.lhm.dqs(bfw, lju.ljf) - base.transform.position).jvn().magnitude < 0.3f;
			}
			if (flag)
			{
				dsz();
			}
			if (lju != null)
			{
				dsx();
			}
		}
	}

	private void dsx()
	{
		if (lju.lje - Time.time < 0.18f && !lju.ljj)
		{
			base.ozc.dnj();
			lju.ljj = true;
		}
	}

	public static float dsy(bga.bfw a, float b, float c, bool d)
	{
		if (d)
		{
			c = Mathf.Max(c, 4f);
		}
		return a.oqy * (a.oqi / b).gtg(a.ord, c);
	}

	private void dsz()
	{
		ljw.dow();
		if (!lju.lja)
		{
			base.ozc.lhp?.dnu();
			float c = lju.liz.ore * base.ozc.lhl.pag;
			bool d = base.ozd.OnlineManager != null && !base.ozd.pdt;
			lju.lji = dsy(lju.liz, lju.lje - Time.time, c, d);
			Debug.Log($"Calculated animation speed: {lju.liz.oqi / (lju.lje - Time.time)}. Adjusted Speed: {lju.lji}");
			var (vector, a) = base.ozc.lhm.dqt(lju.liz, lju.ljf);
			lju.ljh = a;
			Vector2 vector2 = (vector - base.transform.position).jvn();
			float num = (lju.liz.oqi - lju.liz.oqv) / lju.lji;
			float a2 = vector2.magnitude / Mathf.Max(num, 0.001f);
			Vector2 vector3 = vector2 * Mathf.Min(1f, lju.liz.oqw / Mathf.Max(a2, 0.001f));
			if (base.ozd.pdt && (vector2 - vector3).magnitude > 0.5f)
			{
				Debug.Log($"Cancel shot at {Time.time} (too far from the shot): total {vector2.magnitude} possible {vector3.magnitude}");
				lju = null;
				base.ozc.lhh.liq = 0f;
				if (base.ozc.lhj != null)
				{
					base.ozc.lhj.emp(CancelShotReason.TooFar);
				}
				return;
			}
			float c2 = lju.lje - num;
			base.ozc.lhf.dgc(vector3.jvo(), num, c2);
		}
		base.ozc.lhf.dfx(lju.liz);
		base.ozc.lhh.dpm(lju.ljh, 0.1f);
		base.ozc.lhf.dfy(lju.lji);
		lju.ljc = ShotPhase.Shooting;
	}

	private void dta()
	{
		float num = lju.lje;
		if (num > Time.time)
		{
			if (!base.ozf.mdl)
			{
				dsx();
				if (base.ozi && base.ozd.OnlineManager != null && base.ozd.pdt && !lju.ljb && num - Time.time <= 0.25f)
				{
					dts();
				}
				if (base.ozd.OnlineManager == null && !base.ozi && lju.liz.orf && !lju.ljb && num - Time.time < 0.1f && !nextShotType.HasValue)
				{
					base.ozc.lhf.dga();
					Debug.Log($"Cancel shot at {Time.time}");
					lju = null;
				}
			}
		}
		else
		{
			dtb();
		}
	}

	private void dtb()
	{
		if (!lju.ljb && !(base.ozl ^ (base.ozf.pgv.z < base.oze.pci)) && !base.ozd.lmu)
		{
			CharacterManager characterManager = base.ozn;
			if (((object)characterManager == null || !characterManager.pav) && (base.ozi || nextShotType.HasValue))
			{
				base.ozc.lhf.dfy(lju.liz.oqy);
				Vector3? e = null;
				float? d = null;
				Vector3 vector;
				ShotType shotType;
				if (lju.ljk.HasValue)
				{
					AuthoritativeShot value = lju.ljk.Value;
					vector = value.Velocity;
					shotType = value.ShotType;
					e = value.StartPosition;
					d = value.ContactTime;
					if (lju.lja)
					{
						Debug.Log($"Serve contact: {Vector3.Distance(base.ozf.pgv, value.StartPosition) * 100f:0.0}cm between the hand and the precomputed point");
					}
				}
				else
				{
					vector = dtr();
					shotType = nextShotType.Value;
					if (base.ozd.OnlineManager != null && base.ozd.pdt)
					{
						base.ozc.lhj?.ems(Time.time, base.ozf.pgv, vector, shotType);
					}
				}
				StartCoroutine(dtm(shotType));
				float num = Mathf.Abs(base.ozf.pgv.z - base.oze.pci);
				ShotType? shotType2 = shotType;
				string text = lju.liz.oqg;
				float num2 = vector.magnitude * 3.6f;
				if (shotType == ShotType.Smash && num2 < 150f)
				{
					shotType2 = ShotType.Clear;
				}
				Debug.Log($"Player {base.name} shot of type {shotType} ({Mathf.Round(num2)}km/h) with anim {lju.liz.oqg}, at {Mathf.Round(num * 10f) / 10f} from the net");
				switch (shotType2)
				{
				case ShotType.Clear:
					if (num < CourtManager.halfCourtLength / 2f && base.ozf.pgv.y < 1.55f)
					{
						dtl((AudioManager a) => a.mlk);
					}
					else
					{
						dtl((AudioManager a) => a.mll, Mathf.Lerp(0.4f, 1f, (num2 - 100f) / 50f));
					}
					break;
				case ShotType.Drop:
				case ShotType.Midcourt:
					if (num < CourtManager.halfCourtLength / 2f)
					{
						dtl((AudioManager a) => a.mli, (num2 / 50f).gtg(0.5f, 1.1f));
					}
					else if (RandomHelper.giy() < 0.7f)
					{
						dtl((AudioManager a) => a.mlj, (num2 / 90f).gtg(0.5f, 1f) * RandomHelper.giz(0.7f, 1f));
					}
					else
					{
						dtl((AudioManager a) => a.mli, (num2 / 70f).gtg(0.8f, 1.2f));
					}
					break;
				case ShotType.Smash:
				{
					bool ljl = !text.Contains("Late") && (text.Contains("Smash") || text.Contains("Jump") || text.Contains("Malay") || text.Contains("Overhead"));
					dtl((AudioManager a) => (!ljl) ? a.mlg : a.mlh, Mathf.Lerp(0.4f, 1f, (num2 - 150f) / 300f));
					break;
				}
				}
				bool f = base.ozd.OnlineManager == null || base.ozd.pdt || lju.ljk.HasValue;
				dtf();
				base.ozc.dni(vector, shotType, lju.liz, d, e, f);
				lju.ljd = true;
				base.ozc.lhq.dfb();
				float num3 = base.ozc.lhl.pag;
				lju.ljg = num3;
				base.ozc.lhf.dfy(lju.liz.oqy * num3);
				lju.ljc = ShotPhase.FollowThrough;
				return;
			}
		}
		dtc();
	}

	private void dtc()
	{
		CancelShotReason cancelShotReason = CancelShotReason.Unknown;
		if (lju.ljb)
		{
			cancelShotReason = CancelShotReason.Missed;
		}
		else if (base.ozl ^ (base.ozf.pgv.z < base.oze.pci))
		{
			cancelShotReason = CancelShotReason.NotOverNet;
		}
		else if (base.ozd.lmu)
		{
			cancelShotReason = CancelShotReason.RallyEnded;
		}
		else
		{
			CharacterManager characterManager = base.ozn;
			if ((object)characterManager != null && characterManager.pav)
			{
				cancelShotReason = CancelShotReason.TeammatePlayed;
			}
			else if (!base.ozi && !nextShotType.HasValue)
			{
				cancelShotReason = CancelShotReason.NoInput;
			}
		}
		Debug.Log($"Cancel shot at shot time ({cancelShotReason})");
		if (base.ozd.pdt && lju.ljk.HasValue)
		{
			base.ozc.lhj?.emp(cancelShotReason);
		}
		if (!lju.liz.orf)
		{
			lju.ljc = ShotPhase.FollowThrough;
			return;
		}
		dtd();
		lju = null;
	}

	private void dtd()
	{
		base.ozc.lhh.liq = 0f;
		base.ozc.lhq.dfb();
		base.ozc.lhf.dfy(1f);
		base.ozc.lhp?.dnt();
	}

	private void dte()
	{
		if (lju.pbm - 0.2f > Time.time)
		{
			return;
		}
		bool flag = base.ozc.lhe.lgi;
		bool num = lju.ljd;
		lju = null;
		dtd();
		if (!num || flag)
		{
			return;
		}
		if (base.ozi)
		{
			if (base.ozc.pau)
			{
				base.ozc.lhn.dgw();
				return;
			}
			(Vector3, float?)? tuple = base.ozc.lhn.dgx();
			if (tuple.HasValue)
			{
				ljw.dov(tuple.Value.Item1, tuple.Value.Item2);
				if (base.ozc.lhj != null)
				{
					base.ozc.lhj.emd(tuple.Value.Item1, tuple.Value.Item2);
				}
			}
			else
			{
				ljw.dow();
				if (base.ozc.lhj != null)
				{
					base.ozc.lhj.emf();
				}
			}
		}
		else
		{
			ljw.dow();
			if (base.ozc.lhj != null)
			{
				base.ozc.lhj.emf();
			}
		}
	}

	public void dtf()
	{
		base.ozc.lhm.NextPotentialShots = null;
		nextShotType = null;
		nextShotPower = 0f;
		nextShotDirection = null;
		dti();
	}

	public bool dtg(bool a = false, bool b = false)
	{
		if (lju == null)
		{
			return false;
		}
		if (!a && lju.pbk)
		{
			return false;
		}
		if (!b && lju.pbk && !lju.liz.orf)
		{
			lju.ljc = ShotPhase.FollowThrough;
			return true;
		}
		lju = null;
		base.ozc.lhf.dfy(1f);
		return true;
	}

	private void dth(ShotType a, InputAction b, CharacterManager.PossibleAction c)
	{
		if (base.ozc.AllowedAction.HasFlag(c) && b.IsPressed() && (base.ozd.Tutorial.pik || a == nextShotType || b.WasPressedThisFrame()))
		{
			if (a != nextShotType)
			{
				nextShotType = a;
				nextShotPower = 0f;
			}
			float num = Time.deltaTime / (Time.timeScale * 0.3f);
			if (nextShotPower >= 0.6f)
			{
				num /= 2f;
			}
			num = num.gtg(0f, 0.2f);
			dsv((nextShotPower + num).gtg(0f, LimitShotPower ?? 1f));
		}
	}

	private void dti()
	{
		ljx.alpha = Mathf.Lerp(0.2f, 1f, nextShotPower / 0.5f);
		Image image = ljz;
		bool flag2 = (ljy.enabled = nextShotType.HasValue && nextShotPower > 0f);
		image.enabled = flag2;
		ljy.fillAmount = nextShotPower;
		float max = lv.ewx(nextShotType.GetValueOrDefault(), base.ozf.pgv.y).Max;
		if (nextShotPower > 0.8f)
		{
			ljy.color = Color.Lerp(Color.yellow, Color.red, (nextShotPower - 0.75f) / 0.1f);
		}
		else if (nextShotPower > max)
		{
			ljy.color = Color.Lerp(qh.mrr, Color.yellow, (nextShotPower - max) / 0.05f);
		}
		else if (nextShotType != ShotType.Drop && nextShotType != ShotType.Midcourt)
		{
			ljy.color = Color.Lerp(Color.white, qh.mrr, (nextShotPower - 0.3f) / 0.3f);
		}
		else if (nextShotPower < 0.525f)
		{
			ljy.color = Color.Lerp(Color.red, Color.yellow, (nextShotPower - 0.45f) / 0.075f);
		}
		else
		{
			ljy.color = Color.Lerp(Color.yellow, qh.mrr, (nextShotPower - 0.525f) / 0.075f);
		}
	}

	public void dtj(float? a = null)
	{
		bga.bfw bfw = bga.osp.jxr(base.ozc.pba, base.ozc.Player.CharacterInfo.height);
		int num = (base.ozd.ped ? (-10) : 10);
		lju = new ib
		{
			liz = bfw,
			lja = true,
			ljh = num,
			lje = (a ?? (Time.time + bfw.oqi)),
			ljf = base.ozc.lhm.dqu(bfw, num)
		};
		if (!base.ozi && !nextShotType.HasValue)
		{
			nextShotType = ShotType.Clear;
			nextShotPower = 0.6f;
		}
		if (base.ozc.lhj != null)
		{
			base.ozc.lhj.emn();
		}
	}

	public void dtk(lr a)
	{
		Debug.Log("Player " + base.name + " started animation " + a.liz.oqg + (a.mbs ? " (Missed shot)" : ""));
		lju = new ib
		{
			liz = a.liz,
			lje = a.lje,
			ljf = a.ljf,
			ljb = a.mbs
		};
	}

	private void dtl(Func<AudioManager, AudioClip[]> a, float b = 1f)
	{
		AudioSource component = base.ozf.GetComponent<AudioSource>();
		component.pitch = RandomHelper.giz(0.95f, 1.1f);
		AudioClip clip = a(AudioManager.instance).gtk();
		component.PlayOneShot(clip, b);
	}

	private IEnumerator dtm(ShotType a)
	{
		if (pbr)
		{
			ljv.dit()?.SetMotorSpeeds(0f, 1f);
			switch (a)
			{
			case ShotType.Smash:
				yield return new WaitForSecondsRealtime(0.12f);
				break;
			case ShotType.Clear:
				yield return new WaitForSecondsRealtime(0.08f);
				break;
			default:
				yield return new WaitForSecondsRealtime(0.05f);
				break;
			}
			Gamepad.all.ToList().ForEach(delegate(Gamepad a)
			{
				a.SetMotorSpeeds(0f, 0f);
			});
		}
	}

	public void dtn()
	{
		if (lju == null || lju.ljk.HasValue || lju.ljb || lju.pbl)
		{
			return;
		}
		if (!base.ozi && !nextShotType.HasValue)
		{
			dtg(a: true);
			if (base.ozc.lhj != null)
			{
				base.ozc.lhj.emp(CancelShotReason.NoInput);
			}
		}
		else
		{
			Vector3 vector = dtr(lju.ljf, dto());
			lju.ljk = new AuthoritativeShot(lju.lje, lju.ljf, vector, nextShotType.Value);
			base.ozc.lhj?.ems(lju.lje, lju.ljf, vector, nextShotType.Value);
		}
	}

	private float dto()
	{
		if (nextShotPower <= 0f || nextShotPower >= 0.7f)
		{
			return nextShotPower;
		}
		if (!(Time.time - lka < 0.12f))
		{
			return nextShotPower;
		}
		float num = Mathf.Max(0f, lju.lje - Time.time);
		float num2 = nextShotPower + num / 0.3f;
		float num3 = RandomHelper.giz(0.7f, 0.75f);
		return Mathf.Min(num2, num3, LimitShotPower ?? 1f);
	}

	private Vector3 dtr(Vector3? a = null, float? b = null)
	{
		if (!base.ozi && (base.ozj || base.ozd.pdt) && !nextShotDirection.HasValue)
		{
			nextShotDirection = ljv.diu();
		}
		else if (base.ozi && base.ozd.pdt)
		{
			dts();
		}
		Vector3 b2 = a ?? base.ozf.pgv;
		float num = b ?? nextShotPower;
		lkb = new ShotInputsSnapshot
		{
			ArrivalSpeed = base.ozf.pgx,
			Power = num,
			PowerProjected = (b.HasValue && !Mathf.Approximately(b.Value, nextShotPower)),
			Direction = (nextShotDirection ?? Vector2.zero),
			EnergyFactor = base.ozc.lhk.ozx,
			Aggressive = base.ozc.lhl.paf,
			Animation = lju.liz?.oqg,
			RallyStarted = base.ozd.peb
		};
		Vector3 result = lv.ewz(ShotContext.ewu(base.ozd), b2, base.ozf.pgx, nextShotType.GetValueOrDefault(), num, nextShotDirection ?? Vector2.zero, lju.liz, base.ozc.pbb, base.ozc.lhk.ozx, base.ozc.lhl.paf, (base.ozi && !base.ozd.pdw) ? new rk.DifficultyLevel?(base.ozd.pdy.Difficulty) : null);
		result.z = (float)(base.ozl ? 1 : (-1)) * Math.Abs(result.z);
		return result;
	}

	private void dts()
	{
		if (!nextShotType.HasValue)
		{
			nextShotType = dtt();
		}
		if (nextShotPower == 0f)
		{
			nextShotPower = (base.ozd.pdw ? 0.7f : hr.dec(nextShotType.Value, base.ozd.pdy.Difficulty));
		}
		if (!nextShotDirection.HasValue)
		{
			nextShotDirection = new Vector2(dtu(), 0f);
		}
	}

	private ShotType dtt()
	{
		Dictionary<ShotType, int> dictionary = new Dictionary<ShotType, int>
		{
			{
				ShotType.Clear,
				100
			},
			{
				ShotType.Drop,
				100
			},
			{
				ShotType.Smash,
				100
			},
			{
				ShotType.Midcourt,
				0
			}
		};
		float num = hr.ddw(base.ozd.pdy.Difficulty);
		CharacterManager characterManager = base.ozc.dnl();
		bool flag = base.oze.dvu(base.ozf.pgv) >= 12f;
		if (!base.ozd.peb)
		{
			if (Math.Abs(characterManager.transform.position.z - base.oze.pci) > CourtManager.halfCourtLength / 2f)
			{
				dictionary[ShotType.Drop] += (int)Math.Round(100f * num);
			}
			if (Math.Abs(characterManager.transform.position.z - base.oze.pci) < CourtManager.frontZoneLength + 0.8f)
			{
				dictionary[ShotType.Clear] += (int)Math.Round(100f * num);
			}
		}
		else if (base.ozd.pdy.IsDouble)
		{
			dictionary[ShotType.Clear] = 30;
			if (flag)
			{
				dictionary[ShotType.Smash] += (int)Math.Round(150f * num);
				dictionary[ShotType.Drop] += (int)Math.Round(50f * num);
			}
			if (base.ozc.pax.Any((CharacterManager a) => Mathf.Abs(a.transform.position.z - base.oze.pci) < 2f))
			{
				dictionary[ShotType.Smash] += (int)Math.Round(200f * num);
			}
			float[] source = new float[3]
			{
				base.oze.pce,
				base.oze.pcc.x,
				base.oze.pcg
			};
			if (source.Any((float a) => dtv(a, 0f, 4f)))
			{
				dictionary[ShotType.Drop] += (int)Math.Round(200f * num);
			}
			if (source.Any((float a) => dtv(a, CourtManager.halfCourtLength, 5f)))
			{
				dictionary[ShotType.Clear] += (int)Math.Round(200f * num);
			}
			if (source.Any((float a) => a != base.oze.pcc.x && dtv(a, 0f, CourtManager.halfCourtLength / 2f)))
			{
				if (base.ozf.pgv.y > 1.75f)
				{
					dictionary[ShotType.Smash] += (int)Math.Round(200f * num);
				}
				else
				{
					dictionary[ShotType.Midcourt] += (int)Math.Round(200f * num);
				}
			}
		}
		else
		{
			if (flag)
			{
				dictionary[ShotType.Smash] += (int)Math.Round(100f * num);
				dictionary[ShotType.Drop] += (int)Math.Round(50f * num);
			}
			if (Math.Abs(characterManager.transform.position.z - base.oze.pci) > CourtManager.halfCourtLength / 2f)
			{
				dictionary[ShotType.Drop] += (int)Math.Round(100f * num);
			}
			else if (Math.Abs(base.ozf.pgv.x - base.oze.transform.position.x) > 1.5f)
			{
				dictionary[ShotType.Smash] += (int)Math.Round(100f * num);
			}
			else
			{
				dictionary[ShotType.Clear] += (int)Math.Round(100f * num);
			}
		}
		if (!base.ozd.peb || !base.ozd.pdy.IsDouble)
		{
			if (characterManager.lhd.linearVelocity.z > 1.5f * (float)(characterManager.par ? 1 : (-1)))
			{
				dictionary[ShotType.Clear] += (int)Math.Round(100f * num);
			}
			if (characterManager.lhd.linearVelocity.z < -1.5f * (float)(characterManager.par ? 1 : (-1)))
			{
				dictionary[ShotType.Drop] += (int)Math.Round(100f * num);
			}
		}
		string text = lju.liz.oqg;
		if (text.Contains("JumpSmashDoubles"))
		{
			dictionary[ShotType.Smash] += (int)Math.Round(200f * num);
		}
		else if (text.Contains("Jump") && !text.Contains("Late"))
		{
			dictionary[ShotType.Smash] += (int)Math.Round(100f * num);
			dictionary[ShotType.Drop] += (int)Math.Round(50f * num);
		}
		else if (text.Contains("Late") || text.Contains("Dive"))
		{
			dictionary[ShotType.Drop] += (int)Math.Round(150f * num);
		}
		else if (text.Contains("Kill"))
		{
			dictionary[ShotType.Smash] += (int)Math.Round(150f * num);
			dictionary[ShotType.Drop] += (int)Math.Round(50f * num);
		}
		else if (text.Contains("Defense"))
		{
			if (text.Contains("Long"))
			{
				dictionary[ShotType.Drop] += (int)Math.Round(100f * num);
			}
			else if (!base.ozd.pdy.IsDouble)
			{
				dictionary[ShotType.Drop] += (int)Math.Round(50f * num);
			}
		}
		if (1.55f - base.ozf.pgv.y > Mathf.Abs(base.ozf.pgv.z - base.oze.pci) * 1.5f)
		{
			dictionary[ShotType.Drop] += 100;
		}
		if (!base.ozd.pdy.IsDouble && hr.ddx(base.ozd.pdy.Difficulty) && Math.Abs(base.ozf.pgv.z - base.oze.pci) < CourtManager.halfCourtLength / 2f)
		{
			dictionary[ShotType.Smash] /= 10;
		}
		return dictionary.gtm();
	}

	private float dtu()
	{
		float num = base.oze.dvs(base.ozf.pgv);
		Dictionary<float, int> dictionary = new Dictionary<float, int>
		{
			{ 0f, 50 },
			{ -1f, 50 },
			{ 1f, 50 }
		};
		dictionary.gtl(num, 100);
		if (!base.ozd.peb)
		{
			bool flag = base.ozl ^ !base.ozd.ped;
			dictionary = new Dictionary<float, int>
			{
				{ 0f, 50 },
				{
					-1f,
					flag ? 50 : 200
				},
				{
					1f,
					flag ? 200 : 50
				}
			};
		}
		else
		{
			float num2 = hr.ddw(base.ozd.pdy.Difficulty);
			if (base.ozd.pdy.IsDouble)
			{
				bool flag2 = dtv(base.oze.pce, 0f, 4f);
				bool flag3 = dtv(base.oze.pcf, 0f, 4f);
				bool flag4 = dtv(base.oze.pce, 3f, 4f);
				bool flag5 = dtv(base.oze.pcf, 3f, 4f);
				bool flag6 = dtv(base.oze.pce, CourtManager.halfCourtLength, 5f);
				bool flag7 = dtv(base.oze.pcf, CourtManager.halfCourtLength, 5f);
				switch (nextShotType)
				{
				case ShotType.Smash:
				{
					CharacterManager characterManager = (from a in base.ozc.pax
						where Mathf.Abs(a.transform.position.z - base.oze.pci) < 2f
						orderby Mathf.Abs(a.transform.position.z - base.oze.pci)
						select a).FirstOrDefault();
					if (characterManager != null)
					{
						dictionary.gtl(base.oze.dvs(characterManager.transform.position), 500);
					}
					else if (flag4)
					{
						dictionary.gtl(-1f, (int)Math.Round(200f * num2));
					}
					else if (flag5)
					{
						dictionary.gtl(1f, (int)Math.Round(200f * num2));
					}
					else
					{
						dictionary.gtl(0f, (int)Math.Round(200f * num2));
					}
					break;
				}
				case ShotType.Drop:
					if (flag2 || flag3)
					{
						if (flag2)
						{
							dictionary.gtl(-1f, (int)Math.Round(200f * num2));
						}
						if (flag3)
						{
							dictionary.gtl(1f, (int)Math.Round(200f * num2));
						}
					}
					else if (Mathf.Abs(base.ozf.pgv.z - base.oze.pci) > 2f)
					{
						dictionary.gtl(0f, (int)Math.Round(200f * num2));
					}
					else
					{
						dictionary[num] = (int)Math.Round(200f * num2);
					}
					break;
				case ShotType.Clear:
					if (flag6)
					{
						dictionary.gtl(-1f, (int)Math.Round(200f * num2));
					}
					else if (flag7)
					{
						dictionary.gtl(1f, (int)Math.Round(200f * num2));
					}
					else
					{
						dictionary.gtl(0f, (int)Math.Round(200f * num2));
					}
					break;
				case ShotType.Midcourt:
					if (flag4)
					{
						dictionary.gtl(-1f, (int)Math.Round(200f * num2));
					}
					else if (flag5)
					{
						dictionary.gtl(1f, (int)Math.Round(200f * num2));
					}
					break;
				}
			}
			else
			{
				CharacterManager characterManager2 = base.ozc.dnl();
				float num3 = base.oze.dvs(characterManager2.transform.position);
				if ((double)num3 < -0.3)
				{
					dictionary.gtl(1f, (int)Math.Round(200f * num2));
				}
				else if ((double)num3 > 0.3)
				{
					dictionary.gtl(-1f, (int)Math.Round(200f * num2));
				}
				if (characterManager2.lhd.linearVelocity.x < -2f)
				{
					dictionary.gtl(1f, (int)Math.Round(100f * num2));
				}
				else if (characterManager2.lhd.linearVelocity.x > 2f)
				{
					dictionary.gtl(-1f, (int)Math.Round(100f * num2));
				}
				if (!base.ozd.pdy.IsDouble && hr.ddx(base.ozd.pdy.Difficulty) && (nextShotType == ShotType.Smash || nextShotType == ShotType.Drop))
				{
					return (num3 + RandomHelper.giz(-0.2f, 0.2f)).gtg(-1f, 1f);
				}
			}
		}
		return dictionary.gtm();
	}

	private bool dtv(float a, float b, float c = 3f)
	{
		return base.ozc.pax.All((CharacterManager a) => a.jvu(new Vector3(a, 0f, a.par ? (0f - b) : b)) > c);
	}

	public void dtw(float a)
	{
		if (lju != null)
		{
			lju.lje += Time.time - a;
		}
	}

	[CompilerGenerated]
	private bool dtx(CharacterManager a)
	{
		return Mathf.Abs(a.transform.position.z - base.oze.pci) < 2f;
	}

	[CompilerGenerated]
	private bool dty(float a)
	{
		return dtv(a, 0f, 4f);
	}

	[CompilerGenerated]
	private bool dtz(float a)
	{
		return dtv(a, CourtManager.halfCourtLength, 5f);
	}

	[CompilerGenerated]
	private bool dua(float a)
	{
		if (a != base.oze.pcc.x)
		{
			return dtv(a, 0f, CourtManager.halfCourtLength / 2f);
		}
		return false;
	}

	[CompilerGenerated]
	private bool dub(CharacterManager a)
	{
		return Mathf.Abs(a.transform.position.z - base.oze.pci) < 2f;
	}

	[CompilerGenerated]
	private float duc(CharacterManager a)
	{
		return Mathf.Abs(a.transform.position.z - base.oze.pci);
	}
}
