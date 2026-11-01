using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterManager : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void EmptyEvent(CharacterManager obj);

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void ShotEvent(CharacterManager obj, ShotType shotType, bga.bfw shotAnimation, Vector3 shuttlePosition, Vector3 velocity);

	[Flags]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum PossibleAction
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		None = 1,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Drop = 2,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Clear = 4,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Smash = 8,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Midcourt = 0x10,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Move = 0x20,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		All = -1
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hs
	{
		public CharacterManager lgy;

		internal bool dki(KeyValuePair<float, Vector3> a)
		{
			return a.Key <= lgy.lhi.lju.lje;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MatchSettings.PlayerSettings Player;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool IsBot;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool IsLocallyControlled;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool teamA;

	private CapsuleCollider lhc;

	[HideInInspector]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool hasBeenTouched;

	private List<CharacterManager> lhu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public PossibleAction AllowedAction;

	private float? lhv;

	public CourtManager pal => Game.Court;

	public ShuttleManager pam => Game.Shuttle;

	public MatchSettings.PositionOnCourt pan
	{
		get
		{
			MatchSettings.PositionOnCourt positionOnCourt = ((teamA ? Game.lna : Game.lnb) ? MatchSettings.gcn(Player.Position) : Player.Position);
			if (!Game.lmx)
			{
				return MatchSettings.gcm(positionOnCourt);
			}
			return positionOnCourt;
		}
	}

	public bool pao => Player.CharacterInfo.leftHanded;

	public Animator lhb { get; private set; }

	public bool pap
	{
		get
		{
			if (IsLocallyControlled)
			{
				return !IsBot;
			}
			return false;
		}
	}

	public float? paq
	{
		get
		{
			if (!teamA)
			{
				return Game.pdy.TeamB.mst;
			}
			return Game.pdy.TeamA.mst;
		}
	}

	public bool par => Game.lmx ^ !teamA;

	public Rigidbody lhd { get; private set; }

	public CharacterControls lhe { get; private set; }

	public CharacterAnimationDriver lhf { get; private set; }

	public CharacterMovementManager lhg { get; private set; }

	public CharacterRotationManager lhh { get; private set; }

	public CharacterShotManager lhi { get; private set; }

	public CharacterNetworkSync lhj { get; set; }

	public CharacterEnergy lhk { get; private set; }

	public CharacterIntensity lhl { get; private set; }

	public CharacterShotAnimationFinder lhm { get; private set; }

	public CharacterBotAI lhn { get; private set; }

	public CharacterRacket lho { get; private set; }

	public CharacterMatchEmotions lhp { get; private set; }

	public CharacterAimPreview lhq { get; private set; }

	public bool lht { get; set; }

	public bool pas => pan == Game.pdz;

	public bool pat => pan == MatchSettings.gcm(Game.pdz);

	public bool pau
	{
		get
		{
			bool flag = Game.StatsManager.luc != null;
			if (flag)
			{
				flag = Game.pea switch
				{
					0 => pas, 
					1 => pat, 
					_ => teamA ^ MatchSettings.gcl(Game.pec.mvh), 
				};
			}
			return flag;
		}
	}

	public bool pav => Game.pec?.mvh == Player.Position;

	public CharacterManager paw => Game.Characters.Find((CharacterManager a) => a.teamA == teamA && a.name != base.name);

	public List<CharacterManager> pax => lhu ?? (lhu = Game.Characters.Where((CharacterManager a) => a.teamA != teamA).ToList());

	public bool pay => new PossibleAction[3]
	{
		PossibleAction.Clear,
		PossibleAction.Drop,
		PossibleAction.Smash
	}.Any((PossibleAction a) => AllowedAction.HasFlag(a));

	public bool paz => lhv.HasValue;

	public float pba => 1f / Game.pdy.plt;

	public Image lhw { get; private set; }

	public CharacterStats pbb
	{
		get
		{
			CharacterStats stats = Player.CharacterInfo.stats;
			int num = 0;
			if (Game.pdw)
			{
				if (IsBot)
				{
					return new CharacterStats
					{
						defense = 100f,
						power = 70f,
						precision = 80f,
						speed = 130f,
						stamina = 100f
					};
				}
				num = 100;
			}
			else if (IsBot)
			{
				num += hr.dds(Game.pdy.Difficulty);
			}
			return stats.ftm(num);
		}
	}

	public bool pbc
	{
		get
		{
			if (!Game.pdw)
			{
				return pax.Any((CharacterManager a) => a.pap);
			}
			return true;
		}
	}

	public event ShotEvent lhr;

	public event EmptyEvent lhs;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize()
	{
		base.gameObject.layer = dmw();
		pam.mdj += dmr;
		foreach (CharacterManager item in pax)
		{
			item.lhs += dmz;
			item.lhr += dna;
		}
		if (Game.pdy.IsDouble)
		{
			paw.lhr += dnb;
		}
		Game.lnc += dmq;
		lhb = GetComponent<Animator>();
		lhd = base.gameObject.AddComponent<Rigidbody>();
		lhd.mass = 70f;
		lhd.linearDamping = 0f;
		lhd.angularDamping = 0.05f;
		lhd.useGravity = true;
		lhd.isKinematic = false;
		lhd.interpolation = RigidbodyInterpolation.Interpolate;
		lhd.collisionDetectionMode = CollisionDetectionMode.Discrete;
		lhd.constraints = RigidbodyConstraints.FreezeRotation;
		lhc = base.gameObject.AddComponent<CapsuleCollider>();
		lhc.center = new Vector3(0f, (float)Player.CharacterInfo.height / 200f, 0f);
		lhc.radius = 0.3f;
		lhc.height = (float)Player.CharacterInfo.height / 100f;
		base.gameObject.AddComponent<AudioSource>();
		base.gameObject.SetActive(value: false);
		lhe = base.gameObject.AddComponent<CharacterControls>();
		lhf = base.gameObject.AddComponent<CharacterAnimationDriver>();
		lhg = base.gameObject.AddComponent<CharacterMovementManager>();
		lhi = base.gameObject.AddComponent<CharacterShotManager>();
		lhk = base.gameObject.AddComponent<CharacterEnergy>();
		lhl = base.gameObject.AddComponent<CharacterIntensity>();
		lhm = base.gameObject.AddComponent<CharacterShotAnimationFinder>();
		lhh = base.gameObject.AddComponent<CharacterRotationManager>();
		lhn = base.gameObject.AddComponent<CharacterBotAI>();
		base.gameObject.AddComponent<CharacterMatchLookAt>().Character = this;
		base.gameObject.SetActive(value: true);
		lho = base.gameObject.AddComponent<CharacterRacket>();
		lho.Initialize(pao);
		ty.grs(base.gameObject, Player.CharacterInfo);
		lhp = base.gameObject.AddComponent<CharacterMatchEmotions>();
		lhp.ozc = this;
		lhq = base.gameObject.AddComponent<CharacterAimPreview>();
		lhq.ozc = this;
		lhp?.dnt();
		GameObject gameObject = new GameObject();
		gameObject.name = "Player Indicator";
		RectTransform rectTransform = gameObject.AddComponent<RectTransform>();
		rectTransform.pivot = new Vector2(0.5f, 0.5f);
		rectTransform.anchorMin = Vector2.zero;
		rectTransform.anchorMax = Vector2.zero;
		lhw = gameObject.AddComponent<Image>();
		lhw.sprite = Resources.Load<Sprite>("Images/Triangle");
		lhw.rectTransform.sizeDelta = new Vector2(10f, 10f);
		lhw.enabled = false;
		gameObject.transform.SetParent(Game.PowerGaugesCanvas.transform, worldPositionStays: false);
		dnd();
	}

	private void dmq()
	{
		if (Game.pdt && IsBot && pas)
		{
			lhn.dgr();
		}
	}

	private void dmr()
	{
		if (lhi.lju != null)
		{
			if (lhi.lju.pbk || !IsLocallyControlled)
			{
				return;
			}
			if (lhi.dtg() && lhj != null)
			{
				lhj.emp(CancelShotReason.TrajectoryChanged);
			}
		}
		if (Game.pdt && IsBot)
		{
			lhn.dgw();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void OnTriggerEnter(Collider other)
	{
		if (!(other.gameObject == pam?.gameObject) || !Game.peb || Game.lmu || !Game.pdt)
		{
			return;
		}
		CharacterShotManager.ib ib = lhi.lju;
		if ((ib == null || !ib.pbk || lhi.lju.ljb || (!IsBot && !lhi.nextShotType.HasValue && !lhi.lju.ljd)) && !pav)
		{
			hasBeenTouched = true;
			if ((bool)paw && paw.lhi.dtg(a: true) && paw.lhj != null)
			{
				paw.lhj.emp(CancelShotReason.ShuttleTouched);
			}
			pam.eym(lhc);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void LateUpdate()
	{
		if (Game.StatsManager.luc != null && !Game.peb && pas)
		{
			if (pao)
			{
				lhb.GetBoneTransform(HumanBodyBones.RightThumbProximal).localEulerAngles = new Vector3(36.44f, 343.76f, 305.73f);
				lhb.GetBoneTransform(HumanBodyBones.RightThumbIntermediate).localEulerAngles = new Vector3(319.97f, 353.55f, 13.67f);
				lhb.GetBoneTransform(HumanBodyBones.RightThumbDistal).localEulerAngles = new Vector3(340.29f, 359.23f, 9.04f);
				lhb.GetBoneTransform(HumanBodyBones.RightIndexProximal).localEulerAngles = new Vector3(8.65f, 356.88f, 311.97f);
				lhb.GetBoneTransform(HumanBodyBones.RightIndexIntermediate).localEulerAngles = new Vector3(0.5f, 358.88f, 321.33f);
				lhb.GetBoneTransform(HumanBodyBones.RightIndexDistal).localEulerAngles = new Vector3(0.05f, 357.9f, 326.83f);
			}
			else
			{
				lhb.GetBoneTransform(HumanBodyBones.LeftThumbProximal).localEulerAngles = new Vector3(38.1f, 18.84f, 53.08f);
				lhb.GetBoneTransform(HumanBodyBones.LeftThumbIntermediate).localEulerAngles = new Vector3(320.03f, 6.43f, 346.35f);
				lhb.GetBoneTransform(HumanBodyBones.LeftThumbDistal).localEulerAngles = new Vector3(340.29f, 0.77f, 350.96f);
				lhb.GetBoneTransform(HumanBodyBones.LeftIndexProximal).localEulerAngles = new Vector3(9.01f, 3.39f, 23.44f);
				lhb.GetBoneTransform(HumanBodyBones.LeftIndexIntermediate).localEulerAngles = new Vector3(0.45f, 1.01f, 85.47f);
				lhb.GetBoneTransform(HumanBodyBones.LeftIndexDistal).localEulerAngles = new Vector3(0.14f, 1.83f, 10.68f);
			}
			Transform boneTransform = lhb.GetBoneTransform(pao ? HumanBodyBones.RightIndexDistal : HumanBodyBones.LeftIndexDistal);
			pam.transform.position = boneTransform.TransformPoint(pao ? new Vector3(0.0001f, 0.0002f, -3E-05f) : new Vector3(0.018f, 0.02f, 0f));
			pam.transform.rotation = boneTransform.rotation * (pao ? Quaternion.Euler(0f, 0f, 20f) : Quaternion.Euler(0f, 0f, 20f));
		}
	}

	public void dms(bool a = true, bool b = true)
	{
		lhd.linearVelocity = Vector3.zero;
		lhd.angularVelocity = Vector3.zero;
		if (a)
		{
			lhd.position = dmy();
			lhh.Reset();
		}
		lhg.CanRun = false;
		dmt(a: true);
		dmv();
		hasBeenTouched = false;
		lht = false;
		lhp?.dnt();
		if (!b)
		{
			return;
		}
		if (pas)
		{
			Rect a2 = pal.dvq(par, Game.ped);
			lhg.doy(a2.jvt(0.3f, 0.5f));
			Debug.Log($"[ServeDiag] placement: {base.name} {dmu()} charX={lhd.position.x:F2} zoneX=[{a2.xMin:F2};{a2.xMax:F2}]");
		}
		else
		{
			if (!IsBot)
			{
				return;
			}
			if (!pat)
			{
				CharacterManager characterManager = paw;
				if ((object)characterManager == null || !characterManager.pat)
				{
					CharacterManager characterManager2 = paw;
					if ((object)characterManager2 == null || !characterManager2.pas)
					{
						return;
					}
					if (Game.pdy.IsDouble && Player.CharacterInfo.gender == "f" && paw.Player.CharacterInfo.gender == "m")
					{
						if ((pan == MatchSettings.PositionOnCourt.SideARight || pan == MatchSettings.PositionOnCourt.SideBRight) ^ pao)
						{
							lhf.dfv("ServerPartnerMixedRight");
						}
						else
						{
							lhf.dfv("ServerPartnerMixedLeft");
						}
					}
					else
					{
						lhf.dfv("ServerPartner");
					}
					return;
				}
			}
			lhf.dfv($"ServeReceive{Player.CharacterInfo.serveReceiveId}");
		}
	}

	public void dmt(bool a = false)
	{
		lhn.dgu();
		lhg.dow();
		lhg.dox();
		if (lhi.lju != null)
		{
			lhi.dtg(a: true, a);
		}
		if (a)
		{
			lhf.dgb();
		}
		lhi.dtf();
	}

	public string dmu()
	{
		re re2 = Game.StatsManager.pew;
		return $"posOnCourt={pan} servePos={Game.pdz} isServing={pas} sideA={par}" + $" teamAServe={Game.lmy} teamAOnSideA={Game.lmx} evenScore={Game.ped}" + $" invA={Game.lna} invB={Game.lnb} score={re2?.pmi}-{re2?.pmj}" + $" rallyStarted={Game.peb} shotCount={Game.pea}";
	}

	public void dmv()
	{
		lhf.dfv();
	}

	public int dmw()
	{
		return Player.Position switch
		{
			MatchSettings.PositionOnCourt.SideARight => 10, 
			MatchSettings.PositionOnCourt.SideALeft => 11, 
			MatchSettings.PositionOnCourt.SideBRight => 12, 
			MatchSettings.PositionOnCourt.SideBLeft => 13, 
			_ => 0, 
		};
	}

	private int[] dmx()
	{
		return new int[4] { 10, 11, 12, 13 }.Where((int a) => a != dmw()).ToArray();
	}

	private Vector3 dmy()
	{
		int num = ((pan == MatchSettings.PositionOnCourt.SideARight || pan == MatchSettings.PositionOnCourt.SideBLeft) ? 1 : (-1));
		int num2 = ((!par) ? 1 : (-1));
		float y = base.transform.position.y;
		if (pas)
		{
			float num3 = ((!Game.pdy.IsDouble) ? 1.4f : ((Player.CharacterInfo.gender == "m" && paw.Player.CharacterInfo.gender == "f") ? 1.5f : 0.8f));
			return new Vector3(pal.pcj + (float)num * 0.45f, y, pal.pci + (CourtManager.frontZoneLength + num3) * (float)num2);
		}
		if (pat)
		{
			return new Vector3(pal.pcj + (float)num * (Game.pdy.IsDouble ? 0.45f : 1f), y, pal.pci + (CourtManager.frontZoneLength + (Game.pdy.IsDouble ? 0.8f : 1.4f)) * (float)num2);
		}
		CharacterManager characterManager = paw;
		if ((object)characterManager != null && characterManager.pas)
		{
			if (Game.pdy.IsDouble && Player.CharacterInfo.gender == "f" && paw.Player.CharacterInfo.gender == "m")
			{
				return new Vector3(pal.pcj + (float)num * 0.8f, y, pal.pci + (CourtManager.frontZoneLength - 0.1f) * (float)num2);
			}
			return new Vector3(pal.pcj + (float)num * 0.1f, y, pal.pci + (float)num2 * (CourtManager.frontZoneLength + 2f));
		}
		return new Vector3(pal.pcj + (float)num * 0.5f, y, pal.pci + (float)num2 * (CourtManager.frontZoneLength + 2f));
	}

	private void dmz(CharacterManager a)
	{
		if (!base.gameObject.activeInHierarchy || Game.pea <= 0 || !lhe.ozo || lhi.lju != null || pam?.pgu == null)
		{
			return;
		}
		KeyValuePair<float, Vector3> keyValuePair = pam.pgu.mec.LastOrDefault((KeyValuePair<float, Vector3> a) => a.Key <= a.lhi.lju.lje);
		Vector3 a2 = ((keyValuePair.Key != 0f) ? keyValuePair.Value : pam.pgv);
		string a3 = ((a2.y < 1.55f) ? "AttackSplitStep" : "DefenseSplitStep");
		if (a2.y > 1.55f && pal.dvu(a2) >= 12f)
		{
			a3 = "SmashDefenseSplitStep";
		}
		if (!lhg.lih.HasValue || (lhg.lih.Value.Position - base.transform.position).magnitude < 1f)
		{
			lhg.dow();
			if (lhj != null)
			{
				lhj.emf();
			}
			lhg.dpf(a3);
		}
	}

	private void dna(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (base.gameObject.activeInHierarchy)
		{
			lht = false;
			if (!lhg.CanRun)
			{
				lhg.CanRun = true;
			}
			if (Game.pea == 1)
			{
				dmv();
			}
			lhn.dgt(b);
		}
	}

	private void dnb(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (!lhg.CanRun)
		{
			lhg.CanRun = true;
		}
		if (Game.pea == 1)
		{
			dmv();
		}
		if (Game.pdt && IsBot)
		{
			lhn.dgv();
		}
		else if (IsLocallyControlled)
		{
			lhi.dtf();
		}
	}

	public void dnc()
	{
		IsBot = !Player.PlayerId.HasValue && Player.OnlinePlayerId == null;
	}

	public void dnd()
	{
		dnc();
		lhg.dou();
		lhm.dqj();
		lhw.enabled = pap && (!Game.pdy.ply || Game.pdy.IsDouble);
		if (pap && Player.PlayerId.HasValue)
		{
			lhw.color = TeamsSelection.hmw(Player.PlayerId.Value);
		}
		lhi.ljt.SetActive(pap);
		lhk.EnergyBar.gameObject.SetActive(pap && !Game.pdw && !Game.pdx);
		if (Game.pdt && IsBot && lhi.nextShotType.HasValue)
		{
			lhi.dtf();
		}
		lhe.dis();
		if (Game.pdt && IsBot && pas && !Game.peb && lhi.lju == null && pay)
		{
			lhn.dgr();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (paz || lhi.lju != null || !pau || !Game.pdt)
		{
			return;
		}
		if (!IsBot && pay && !Game.peb && pas && lhi.pbq)
		{
			MatchAbsenceWatcher matchAbsenceWatcher = MatchAbsenceWatcher.lxr;
			if ((object)matchAbsenceWatcher == null || !matchAbsenceWatcher.lxt)
			{
				lhi.dtj();
				return;
			}
		}
		if (lht)
		{
			return;
		}
		CharacterManager characterManager = paw;
		if (((object)characterManager != null && characterManager.lhi?.lju?.pbl == false) || pam?.pgu == null || !pam.pgu.meg || Game.pea == 0)
		{
			return;
		}
		if (!IsBot && pay)
		{
			lhm.dqo();
			lr lr2 = (lhi.pbq ? lhm.dqp() : lhm.dqq());
			lr lr3 = null;
			if (paw != null)
			{
				lr3 = paw.lhm.dqp();
				if (!dng(lr2, lr3))
				{
					return;
				}
			}
			if (lhi.pbq && lr2 == null && lr3 == null && lhm.dqp(a: true) == null)
			{
				lht = true;
				lr2 = lhm.dqx();
				if (paw != null)
				{
					lr3 = paw.lhm.dqx();
					paw.lht = true;
				}
				if (dng(lr2, lr3))
				{
					dne(lr2);
				}
				else if (paw != null)
				{
					paw.dne(lr3);
				}
				return;
			}
			if (lr2 == null)
			{
				return;
			}
			float num = Mathf.Max(0.5f, dnm() - (lr2.ljf - lr2.mbq).jvn().magnitude + 0.5f);
			if (!lhe.ozo && Vector2.Angle((lr2.mbq - base.transform.position).jvn(), lhe.ozq) < 60f)
			{
				num = Mathf.Max(1f, num);
			}
			if ((lr2.mbq - base.transform.position).magnitude < num && lr2.lje - Time.time - lr2.liz.oqi / lr2.liz.ord - lr2.mbr < 0.2f / Time.timeScale)
			{
				dne(lr2);
			}
		}
		if (IsBot)
		{
			lhn.dgq();
		}
	}

	public void dne(lr a)
	{
		lhg.dov(a.mbq, a.lje - a.liz.oqi);
		lhi.dtk(a);
		if (lhj != null)
		{
			lhj.emh(a);
		}
	}

	public void dnf(lr a)
	{
		lhg.dov(a.mbq, a.lje - a.liz.oqi);
		lhi.dtk(a);
	}

	public bool dng(lr a, lr b)
	{
		if (a == null)
		{
			return false;
		}
		if (b == null)
		{
			return true;
		}
		if (a.liz.oqg.Contains("Dive") && !b.liz.oqg.Contains("Dive"))
		{
			return false;
		}
		if (!a.liz.oqg.Contains("Dive") && b.liz.oqg.Contains("Dive"))
		{
			return true;
		}
		float num = 0.3f;
		if (a.lje < b.lje - num)
		{
			return true;
		}
		if (a.lje > b.lje + num)
		{
			return false;
		}
		float num2 = this.jvu(a.ljf);
		float num3 = paw.jvu(b.ljf);
		if (Mathf.Abs(num2 - num3) < 1.5f && Player.CharacterInfo.gender != paw.Player.CharacterInfo.gender)
		{
			bool flag = Mathf.Abs(a.ljf.z - pal.pci) < CourtManager.halfCourtLength / 2f;
			bool flag2 = Mathf.Abs(b.ljf.z - pal.pci) < CourtManager.halfCourtLength / 2f;
			if (Player.CharacterInfo.gender == "m")
			{
				if (flag2)
				{
					return false;
				}
				if (!flag)
				{
					return true;
				}
			}
			if (Player.CharacterInfo.gender == "f")
			{
				if (flag)
				{
					return true;
				}
				if (!flag2)
				{
					return false;
				}
			}
		}
		return num2 < num3;
	}

	public void dni(Vector3 a, ShotType b, bga.bfw c, float? d = null, Vector3? e = null, bool f = true)
	{
		Debug.Log($"Shot speed: {Math.Round(a.magnitude * 3.6f)}km/h");
		pam.eyl(a, f && pbc, d, e);
		hasBeenTouched = false;
		lhg.doy(null);
		lhg.CanRun = true;
		this.lhr?.Invoke(this, b, c, pam.pgv, a);
	}

	public void dnj()
	{
		this.lhs?.Invoke(this);
	}

	private IEnumerator dnk()
	{
		Time.timeScale = 0.2f;
		yield return new WaitForSeconds(1f);
		Time.timeScale = 1f;
	}

	public CharacterManager dnl()
	{
		return Game.Characters.Find((CharacterManager a) => a.pan == MatchSettings.gcm(pan));
	}

	public float dnm()
	{
		switch (Game.pdy.PlacementAssistance)
		{
		case rk.PlacementAssistanceLevel.High:
			if (!Game.pdy.IsDouble && !Game.pdx)
			{
				return 2f;
			}
			return 1.5f;
		case rk.PlacementAssistanceLevel.Low:
			return 1f;
		default:
			return 0.5f;
		}
	}

	public void dnn(bool a = true)
	{
		if (a)
		{
			if (!lhv.HasValue)
			{
				lhv = Time.time;
				lhb.speed = 0f;
			}
		}
		else if (lhv.HasValue)
		{
			lhb.speed = pba;
			lhg.dpg(lhv.Value);
			lhi.dtw(lhv.Value);
			lhv = null;
		}
	}

	[CompilerGenerated]
	private bool dno(CharacterManager a)
	{
		if (a.teamA == teamA)
		{
			return a.name != base.name;
		}
		return false;
	}

	[CompilerGenerated]
	private bool dnp(CharacterManager a)
	{
		return a.teamA != teamA;
	}

	[CompilerGenerated]
	private bool dnq(PossibleAction a)
	{
		return AllowedAction.HasFlag(a);
	}

	[CompilerGenerated]
	private bool dnr(int a)
	{
		return a != dmw();
	}

	[CompilerGenerated]
	private bool dns(CharacterManager a)
	{
		return a.pan == MatchSettings.gcm(pan);
	}
}
