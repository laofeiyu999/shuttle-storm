using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using FishNet;
using FishNet.Managing;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Rendering.Universal;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class GameManager : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnGameStart();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnRallyStart();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnPointScored(CancelEventArgs args);

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnSwitchCourtSide();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnMatchEnd();

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class im
	{
		public MatchSettings.PlayerSettings llk;

		internal bool dxt(InputDevice a)
		{
			return a.deviceId == llk.DeviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class @in
	{
		public bool lll;

		internal bool dxu(CharacterManager a)
		{
			if (a.teamA == lll)
			{
				return a.hasBeenTouched;
			}
			return false;
		}

		internal bool dxv(CharacterManager a)
		{
			if (a.teamA == !lll)
			{
				return a.hasBeenTouched;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static GameManager Current;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimatedPanel FadePanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimatedPanel ScoresPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ScorePanel TeamAScore;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ScorePanel TeamBScore;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CourtManager Court;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ShuttleManager Shuttle;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CamerasManager Cameras;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Stadium Stadium;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public EnvironmentAudio EnvironmentAudio;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TutorialManager Tutorial;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TrainingManager TrainingManager;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Canvas HudCanvas;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Canvas PowerGaugesCanvas;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public EnergyPanel EnergyPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public FatigueEffectManager FatigueEffect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CountdownPanel ServeCountdownPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public DecalProjector FallingPointDecal;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public DecalProjector TargetDecal;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public DecalProjector AimingDecal;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MatchStatsManager StatsManager;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MatchMenuManager MenuManager;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private SummaryPanel summaryPopup;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel toastPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel smashSpeedPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel rallyLengthPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public FlyingText FlyingText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public JudgeManager Judge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public NetworkManager NetworkManager;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public OnlineMatchManager OnlineManager;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<CharacterManager> Characters = new List<CharacterManager>();

	private const int lmt = 15;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Coroutine shuttleShouldFallTimeoutCoroutine;

	private int lmv = -10;

	private bool lmw;

	public bool pdt
	{
		get
		{
			if (!(OnlineManager == null))
			{
				return OnlineManager.IsServerStarted;
			}
			if (pdy.Online != null)
			{
				return pdy.Online.pln;
			}
			return true;
		}
	}

	public bool lmu { get; private set; } = true;


	public bool pdu
	{
		get
		{
			if ((!(OnlineManager == null) || !MenuManager.pfc) && !summaryPopup.pqc && (!pdx || TrainingManager.pid))
			{
				return ModalManager.Current != null;
			}
			return true;
		}
	}

	public bool pdv
	{
		get
		{
			if (summaryPopup != null)
			{
				return summaryPopup.pqc;
			}
			return false;
		}
	}

	public bool pdw => Tutorial.gameObject.activeInHierarchy;

	public bool pdx => TrainingManager.gameObject.activeInHierarchy;

	public MatchSettings pdy
	{
		get
		{
			if (!pdw)
			{
				return MatchSettings.Current;
			}
			return MatchSettings.plq;
		}
	}

	public bool lmx { get; private set; } = true;


	[HideInInspector]
	public bool lmy { get; private set; } = true;


	[HideInInspector]
	public bool? lmz { get; private set; }

	public MatchSettings.PositionOnCourt pdz
	{
		get
		{
			if (!(lmy ^ lmx))
			{
				if (!ped)
				{
					return MatchSettings.PositionOnCourt.SideALeft;
				}
				return MatchSettings.PositionOnCourt.SideARight;
			}
			if (!ped)
			{
				return MatchSettings.PositionOnCourt.SideBLeft;
			}
			return MatchSettings.PositionOnCourt.SideBRight;
		}
	}

	public int pea => (StatsManager.luc?.mvg?.Count).GetValueOrDefault();

	public bool peb => StatsManager.luc?.mvg.Any() ?? false;

	public rg pec
	{
		get
		{
			if (!peb)
			{
				return null;
			}
			return StatsManager.luc.mvg.Last();
		}
	}

	public bool lna { get; private set; }

	public bool lnb { get; private set; }

	[HideInInspector]
	public bool ped => ((!lmy) ? StatsManager.pew?.pmj : StatsManager.pew?.pmi).GetValueOrDefault() % 2 == 0;

	public event OnGameStart lnc;

	public event OnRallyStart lnd;

	public event OnPointScored lne;

	public event OnSwitchCourtSide lnf;

	public event OnMatchEnd lng;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		Current = this;
		RefreshRateManager.gje();
		mi.Initialize();
		StatsManager.Initialize();
		OnlineMatchEndService.iml(pdy.Online);
		if (rk.png)
		{
			rk.png = false;
			Tutorial.gameObject.SetActive(value: true);
		}
		else if (Career.Current?.CurrentTraining != null)
		{
			TrainingManager.gameObject.SetActive(value: true);
		}
		ebg();
		eau();
		if (pdy.Online != null)
		{
			NetworkManager.gameObject.AddComponent<OnlineMatchLifecycle>();
			NetworkManager.gameObject.AddComponent<OnlineMatchBootstrap>();
			NetworkManager.gameObject.AddComponent<MatchAbsenceWatcher>();
			NetworkManager.gameObject.AddComponent<MatchLogDriver>();
			OnlineMatchBootstrap.ere(NetworkManager);
			NetworkManager.gameObject.SetActive(value: true);
			NetworkManager.ServerManager.SetStartOnHeadless(value: false);
			LoadingScreen.psj.hgb(this, eaj());
			LoadingScreen.psj.AutoClose = true;
		}
		jc.ede(this);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		FadePanel.gxr();
		if (LoadingScreen.psk)
		{
			LoadingScreen.nkb += eak;
		}
		else
		{
			eal();
		}
	}

	private IEnumerator eaj()
	{
		yield return new WaitUntil(() => NetworkManager.IsClientStarted || OnlineMatchExit.pfy);
		if (!OnlineMatchExit.pfy)
		{
			if (NetworkManager.IsServerStarted)
			{
				UnityEngine.Object.Instantiate(Resources.Load<OnlineMatchManager>("Prefabs/NetworkMatch"));
				InstanceFinder.ServerManager.Spawn(OnlineManager);
			}
			yield return new WaitUntil(delegate
			{
				OnlineMatchManager onlineManager = OnlineManager;
				return ((object)onlineManager != null && onlineManager.pgj) || OnlineMatchExit.pfy;
			});
		}
	}

	private void eak()
	{
		LoadingScreen.nkb -= eak;
		eal();
	}

	private void eal()
	{
		Time.timeScale = pdy.plt;
		StatsManager.eif();
		StartCoroutine(ebb(a: true, 0f));
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pkm.performed += eaq;
		qi.pli.pkk.performed += ear;
		InputSystem.onDeviceChange += eam;
		if (pdt)
		{
			Shuttle.mdm += ean;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkm.performed -= eaq;
		qi.pli.pkk.performed -= ear;
		InputSystem.onDeviceChange -= eam;
		Shuttle.mdm -= ean;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		LoadingScreen.nkb -= eak;
		Current = null;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (OnlineManager != null)
		{
			OnlineManager.eto();
		}
	}

	private void eam(InputDevice a, InputDeviceChange b)
	{
		if (pdy.Online == null && !pdu && pdy.plv.Any((MatchSettings.PlayerSettings a) => a.DeviceId.HasValue && !InputSystem.devices.Any((InputDevice a) => a.deviceId == a.DeviceId)))
		{
			MenuManager.OpenTeamsMenu(showDisconnectedMessage: true);
		}
	}

	private void ean(ShuttleManager a, Vector3 b, string c)
	{
		if (lmu || !peb)
		{
			return;
		}
		lmu = true;
		ebp();
		if (pdw)
		{
			Tutorial.fhb();
			return;
		}
		rg rg2 = pec;
		bool lll = MatchSettings.gcl(rg2.mvh);
		RallyEndInfo rallyEndInfo = default(RallyEndInfo);
		rallyEndInfo.LastShotByTeamA = lll;
		rallyEndInfo.TouchedPartner = Characters.Any((CharacterManager a) => a.teamA == lll && a.hasBeenTouched);
		rallyEndInfo.TouchedOpponent = Characters.Any((CharacterManager a) => a.teamA == !lll && a.hasBeenTouched);
		rallyEndInfo.EndedOut = c == "OutOfCourt" || eaz(b);
		rallyEndInfo.EndedInNet = !rg2.mvl;
		RallyEndInfo a2 = rallyEndInfo;
		StatsManager.eie(a2, b);
		eao();
		if (OnlineManager != null)
		{
			OnlineManager.ety(a2, rj.ggh(qu.mug));
			if (StatsManager.pew.pml)
			{
				OnlineManager.eua(qu.mug.mui.Count - 1, StatsManager.pew.gft());
			}
		}
	}

	public void eao()
	{
		lmu = true;
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.dmt();
		});
		rf rf2 = StatsManager.pew.mus.Last();
		rg rg2 = rf2.mvg.Last();
		bool flag = rf2.pmo == true;
		bool flag2 = rf2.mvb == flag;
		if (rf2.muz || rf2.muy)
		{
			ebj(this.gut("Match", "Fault"), b: true, 1f);
			if (Judge != null)
			{
				Judge.edb();
			}
		}
		else if (!rf2.mva && rf2.mux)
		{
			ebj(this.gut("Match", "Out"), b: true, 1f);
			if (Judge != null)
			{
				Judge.eda();
			}
		}
		if (!pdw && !pdx)
		{
			if (rf2.mvg.Count > 20)
			{
				StartCoroutine(ebn(rf2.mvg.Count, rf2.mvg.Count > qu.mug.pme));
			}
			if (rg2 != null && flag2 && rg2.mvi == ShotType.Smash && rg2.mvj.magnitude >= 83.333336f)
			{
				StartCoroutine(ebo(Mathf.RoundToInt(rg2.mvj.magnitude * 3.6f)));
			}
		}
		if (Stadium != null)
		{
			StartCoroutine(eba(rf2.mvg.Count > 10 || StatsManager.pew.pmi >= 19 || StatsManager.pew.pmj >= 19));
		}
		lmz = lmy;
		lmy = flag;
		CancelEventArgs cancelEventArgs = new CancelEventArgs();
		this.lne?.Invoke(cancelEventArgs);
		if (cancelEventArgs.Cancel)
		{
			return;
		}
		if (pdy.IsDouble)
		{
			if (flag && lmz.Value)
			{
				lna = !lna;
			}
			if (!flag && !lmz.Value)
			{
				lnb = !lnb;
			}
		}
		else
		{
			bool a2 = (lnb = !ped);
			lna = a2;
		}
		if (!pdw && !pdx && StatsManager.pew.pml)
		{
			Characters.ForEach(delegate(CharacterManager a)
			{
				a.AllowedAction = CharacterManager.PossibleAction.Move;
			});
			StatsManager.eig();
			summaryPopup.hko(qu.mug);
			OnlineMatchEndService.imm(qu.mug);
			StartCoroutine(ebc());
		}
		else
		{
			StartCoroutine(ebb(a: false));
		}
	}

	public void eap()
	{
		if (pdy.Online == null || !pdt || lmu || !peb)
		{
			return;
		}
		MatchSettings.PlayerSettings playerSettings = pdy.plw;
		if (playerSettings != null)
		{
			RallyEndInfo a = yr.ifo(MatchSettings.gcl(playerSettings.Position));
			ebp();
			StatsManager.eie(a);
			eao();
			OnlineManager?.ety(a, rj.ggh(qu.mug));
			if (StatsManager.pew.pml)
			{
				OnlineManager?.eua(qu.mug.mui.Count - 1, StatsManager.pew.gft());
			}
		}
	}

	private void eaq(InputAction.CallbackContext a)
	{
		if (summaryPopup.pqc && !FadePanel.pqc && Time.frameCount - lmv > 1)
		{
			if (qu.mug.plz)
			{
				eas();
			}
			else if (!(OnlineManager != null))
			{
				eat();
			}
		}
	}

	private void ear(InputAction.CallbackContext a)
	{
		if (!summaryPopup.pqc || FadePanel.pqc || !summaryPopup.ptm || !qu.mug.plz || Time.frameCount - lmv <= 1)
		{
			return;
		}
		MatchReportFlow.eki(pdy, delegate
		{
			lmw = true;
			if (this != null)
			{
				summaryPopup.ptm = false;
			}
		}, delegate
		{
			lmv = Time.frameCount;
		});
	}

	private void eas()
	{
		foreach (CharacterManager character in Characters)
		{
			qz qz2 = qu.mug.Recap.geu(character.Player);
			if (qz2 != null)
			{
				qz2.EnergySpent = character.Player.Energy - character.GetComponent<CharacterEnergy>().ozv;
			}
		}
		wn.hpo(pdy, qu.mug);
		qj.plj++;
		if (Career.Current != null)
		{
			bool flag = Career.Current.MainCharacter.piz == pdy.TeamA.PlayerA.CharacterInfo.id || Career.Current.MainCharacter.piz == pdy.TeamA.PlayerB?.CharacterInfo?.id;
			bool num = qu.mug.Recap.pmf ^ !flag;
			IEnumerable<tf> source = Career.Current.Tournaments.Where(((CareerDate, te) a) => a.Item2.poq).SelectMany(((CareerDate, te) a) => a.Item2.PlayerMatches.Where((tf a) => !a.nbt));
			int num2 = source.Count();
			int num3 = source.Count((tf a) => a.nbs);
			if (num2 >= 10)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_10_MATCHES);
			}
			if (num2 >= 100)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_100_MATCHES);
			}
			if (num)
			{
				if (num3 >= 10)
				{
					Career.Current.flt(AchievementType.CAREER_WIN_10_MATCHES);
				}
				if (num3 >= 100)
				{
					Career.Current.flt(AchievementType.CAREER_WIN_100_MATCHES);
				}
			}
		}
		if (qu.mug.Recap.pmf ^ (!pdy.TeamA.PlayerA.PlayerId.HasValue && !pdy.TeamA.PlayerB.PlayerId.HasValue))
		{
			ry.pnt.gjn(AchievementType.COMMON_WIN_FIRST_MATCH);
		}
		if (pdy.Online != null)
		{
			OnlineMatchExit.erj(a: false);
		}
		else if (Tournament.Current != null)
		{
			LoadingScreen.hfx("TournamentMenu");
		}
		else
		{
			LoadingScreen.hfx("MainMenu");
		}
		Time.timeScale = 1f;
	}

	public void eat()
	{
		lmz = null;
		lna = false;
		lnb = false;
		StatsManager.eif();
		StartCoroutine(ebb(a: false, 0f));
	}

	public void eau()
	{
		foreach (MatchSettings.PlayerSettings item in pdy.plv)
		{
			Characters.Add(ebh(item));
		}
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.lhr += eax;
		});
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.Initialize();
			a.AllowedAction = CharacterManager.PossibleAction.Move;
		});
		EnergyPanel.Initialize(Characters);
		RectTransform component = ScoresPanel.GetComponent<RectTransform>();
		component.sizeDelta = new Vector2(pdy.IsDouble ? 420 : 350, component.sizeDelta.y);
		CharacterInfo characterInfo = pdy.gcg(MatchSettings.PositionOnCourt.SideARight).CharacterInfo;
		CharacterInfo characterInfo2 = pdy.gcg(MatchSettings.PositionOnCourt.SideBRight).CharacterInfo;
		TeamAScore.pgn = Countries.fxd(characterInfo.country);
		TeamBScore.pgn = Countries.fxd(characterInfo2.country);
		bool a2 = true;
		if (pdy.IsDouble)
		{
			CharacterInfo characterInfo3 = pdy.gcg(MatchSettings.PositionOnCourt.SideALeft).CharacterInfo;
			CharacterInfo characterInfo4 = pdy.gcg(MatchSettings.PositionOnCourt.SideBLeft).CharacterInfo;
			TeamAScore.pgl = characterInfo.lastName.ToUpper() + " / " + characterInfo3.lastName.ToUpper();
			TeamBScore.pgl = characterInfo2.lastName.ToUpper() + " / " + characterInfo4.lastName.ToUpper();
			a2 = characterInfo.country == characterInfo3.country && characterInfo2.country == characterInfo4.country;
		}
		else
		{
			TeamAScore.pgl = characterInfo.lastName.ToUpper();
			TeamBScore.pgl = characterInfo2.lastName.ToUpper();
		}
		TeamAScore.pgm = a2;
		TeamBScore.pgm = a2;
	}

	private void eav()
	{
		Shuttle.eyi();
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.dms();
		});
		StatsManager.eic();
		ebi();
		AimingDecal.enabled = false;
	}

	public void eaw()
	{
		lmx = true;
		lmy = true;
		lmz = null;
		lna = false;
		lnb = false;
		StatsManager.eib();
		lmu = false;
		ebp();
	}

	private void eax(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (StatsManager.luc == null)
		{
			return;
		}
		bool num = !StatsManager.luc.mvg.Any();
		StatsManager.eii(a, b, d, e);
		if (num)
		{
			this.lnd?.Invoke();
		}
		ebp();
		if (pdt && !pdw)
		{
			shuttleShouldFallTimeoutCoroutine = this.gux(5f, delegate
			{
				Debug.LogWarning("Shuttle didn't fall after 5s, reset the rally...");
				shuttleShouldFallTimeoutCoroutine = null;
				eay(0f);
			});
		}
		if (!pdw && !pdx && pea == 1 && qu.mug.mui.Count == 1 && qu.mug.mui.First().pmi + qu.mug.mui.First().pmj == 4 && base.gameObject.GetComponent<FpsCounter>() == null && FpsCounter.dxb())
		{
			base.gameObject.AddComponent<FpsCounter>();
		}
	}

	public void eay(float a, Action b = null)
	{
		StartCoroutine(ebb(a: false, a, b));
	}

	public bool eaz(Vector3 a)
	{
		return !((pea == 1) ? Court.dvq(lmy ^ lmx, ped) : Court.pck).Contains(a.jvn());
	}

	private IEnumerator eba(bool a)
	{
		Stadium.phc.fbh(a: true, a);
		EnvironmentAudio.dwg(a);
		yield return this.guu(5.5f);
		Stadium.phc.fbh(a: false);
	}

	private IEnumerator ebb(bool a, float b = 1f, Action c = null)
	{
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.Move;
		});
		lmu = true;
		if (b > 0f)
		{
			yield return this.guu(b);
		}
		else
		{
			yield return new WaitForEndOfFrame();
		}
		if (!a)
		{
			yield return FadePanel.gxj();
		}
		c?.Invoke();
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.None;
			a.GetComponent<CharacterEnergy>()?.djg();
		});
		if (OnlineManager != null && pdt)
		{
			OnlineManager.eti();
		}
		if (qu.mug.pma)
		{
			lmx = !lmx;
			this.lnf?.Invoke();
		}
		ebi();
		eav();
		Cameras.dex();
		AudioManager.fit();
		if (summaryPopup.pqc)
		{
			summaryPopup.gxs();
			ScoresPanel.gxr();
			EnergyPanel.gxr();
		}
		yield return this.guu(a ? 0.1f : 0.5f);
		lmu = false;
		yield return FadePanel.gxk();
		if (a)
		{
			MenuManager.ekc();
			yield return this.guu(1f);
		}
		else
		{
			yield return this.guu(0.5f);
		}
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.Move;
		});
		if (pdw)
		{
			Tutorial.StartTutorial();
		}
		else if (Judge != null && (pdy.Online != null || rk.pnc))
		{
			ebj($"{StatsManager.pew.pmi} - {StatsManager.pew.pmj}", b: false, null);
			yield return Judge.ecx(qu.mug, StatsManager.pew, lmy, lmz);
			ebk();
		}
		if (Stadium != null)
		{
			Stadium.phc.phj = pdy.plv.Any((MatchSettings.PlayerSettings a) => a.DeviceId > 0 && (lmx ^ !MatchSettings.gcl(a.Position)));
			Stadium.phc.phk = pdy.plv.Any((MatchSettings.PlayerSettings a) => a.DeviceId > 0 && (lmx ^ MatchSettings.gcl(a.Position)));
		}
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.All;
		});
		this.lnc?.Invoke();
		if (OnlineManager != null)
		{
			OnlineManager.etg();
		}
	}

	private IEnumerator ebc()
	{
		Shuttle.eyk();
		yield return this.guu(1f);
		if (Judge != null)
		{
			if (qu.mug.plz)
			{
				this.lng?.Invoke();
				StartCoroutine(Judge.ecz(qu.mug));
			}
			else
			{
				StartCoroutine(Judge.ecy(qu.mug));
			}
		}
		yield return this.guu(2f);
		Characters.ForEach(delegate(CharacterManager a)
		{
			a.dmt();
			a.AllowedAction = CharacterManager.PossibleAction.None;
		});
		ScoresPanel.FadeOut();
		EnergyPanel.FadeOut();
		summaryPopup.hko(qu.mug);
		if (OnlineManager != null && !qu.mug.plz)
		{
			summaryPopup.ptl = 15;
			if (pdt)
			{
				StartCoroutine(ebd());
			}
		}
		else
		{
			summaryPopup.ptl = null;
		}
		if (qu.mug.plz && MenuManager.pfc)
		{
			MenuManager.Close();
		}
		summaryPopup.ptm = qu.mug.plz && !lmw && MatchReportFlow.ekh(pdy);
		summaryPopup.FadeIn();
	}

	private IEnumerator ebd()
	{
		yield return this.guu(15f);
		OnlineManager.euc();
		eat();
	}

	public void ebe()
	{
		if (summaryPopup.pqc)
		{
			summaryPopup.hko(qu.mug);
		}
	}

	public void ebf(MatchSnapshot a)
	{
		lmy = a.TeamAServe;
		lna = a.IsTeamAInverted;
		lnb = a.IsTeamBInverted;
		if (lmx != a.IsTeamAOnSideA)
		{
			lmx = a.IsTeamAOnSideA;
			this.lnf?.Invoke();
		}
		StatsManager.eic();
		lmu = false;
		ebi();
		ebe();
	}

	public ShuttleManager ebg()
	{
		GameObject gameObject = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("Shuttle"), Court.transform.position, Quaternion.identity);
		gameObject.SetActive(value: false);
		Shuttle = gameObject.GetComponent<ShuttleManager>();
		gameObject.SetActive(value: true);
		return Shuttle;
	}

	private CharacterManager ebh(MatchSettings.PlayerSettings a)
	{
		Vector3 position;
		string text;
		switch (a.Position)
		{
		case MatchSettings.PositionOnCourt.SideARight:
			position = Court.pcp.center.jvo();
			text = "Team A - Player A";
			break;
		case MatchSettings.PositionOnCourt.SideALeft:
			position = Court.pcq.center.jvo();
			text = "Team A - Player B";
			break;
		case MatchSettings.PositionOnCourt.SideBRight:
			position = Court.pcr.center.jvo();
			text = "Team B - Player A";
			break;
		default:
			position = Court.pcs.center.jvo();
			text = "Team B - Player B";
			break;
		}
		bool flag = a.Position == MatchSettings.PositionOnCourt.SideALeft || a.Position == MatchSettings.PositionOnCourt.SideARight;
		GameObject obj = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("Characters/" + a.CharacterInfo.modelId), position, Quaternion.Euler(0f, (!flag) ? 180 : 0, 0f));
		obj.name = text;
		obj.tag = "Player";
		CharacterManager characterManager = obj.AddComponent<CharacterManager>();
		characterManager.Game = this;
		characterManager.Player = a;
		characterManager.teamA = flag;
		characterManager.IsLocallyControlled = pdy.Online == null;
		characterManager.dnc();
		return characterManager;
	}

	private void ebi()
	{
		TeamAScore.pgo = lmy;
		TeamBScore.pgo = !lmy;
		TeamAScore.pgp = qu.mug.mui.Count((re a) => a.pml && a.pmk);
		TeamBScore.pgp = qu.mug.mui.Count((re a) => a.pml && !a.pmk);
		TeamAScore.pgq = StatsManager.pew.pmi;
		TeamBScore.pgq = StatsManager.pew.pmj;
	}

	public void ebj(string a, bool b = false, float? c = 1f)
	{
		if (!toastPanel.pqc)
		{
			toastPanel.GetComponent<Image>().color = (b ? new Color32(185, 43, 43, 220) : new Color32(48, 48, 48, 240));
			StartCoroutine(ebl(a, c));
		}
	}

	public void ebk()
	{
		toastPanel.FadeOut();
	}

	private IEnumerator ebl(string a, float? b)
	{
		toastPanel.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = a;
		yield return toastPanel.gxj();
		if (b.HasValue)
		{
			yield return new WaitForSecondsRealtime(1f);
			toastPanel.FadeOut();
		}
	}

	public void ebm(string a, Color b, Vector3 c, Vector2 d)
	{
		FlyingText.hcs(a, b, Cameras.lfv.First(), c, d);
	}

	private IEnumerator ebn(int a, bool b)
	{
		rallyLengthPanel.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = this.gut("Match", b ? "LongestRally" : "RallyLength", a);
		yield return rallyLengthPanel.gxj();
		yield return new WaitForSecondsRealtime(4f);
		rallyLengthPanel.FadeOut();
	}

	private IEnumerator ebo(int a)
	{
		smashSpeedPanel.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = this.gut("Match", "SmashSpeed", a);
		yield return smashSpeedPanel.gxj();
		yield return new WaitForSecondsRealtime(4f);
		smashSpeedPanel.FadeOut();
	}

	public void ebp()
	{
		if (shuttleShouldFallTimeoutCoroutine != null)
		{
			StopCoroutine(shuttleShouldFallTimeoutCoroutine);
			shuttleShouldFallTimeoutCoroutine = null;
		}
	}

	[CompilerGenerated]
	private bool ebq()
	{
		if (!NetworkManager.IsClientStarted)
		{
			return OnlineMatchExit.pfy;
		}
		return true;
	}

	[CompilerGenerated]
	private bool ebr()
	{
		OnlineMatchManager onlineManager = OnlineManager;
		if ((object)onlineManager == null || !onlineManager.pgj)
		{
			return OnlineMatchExit.pfy;
		}
		return true;
	}

	[CompilerGenerated]
	private void ebs()
	{
		lmw = true;
		if (this != null)
		{
			summaryPopup.ptm = false;
		}
	}

	[CompilerGenerated]
	private void ebt()
	{
		lmv = Time.frameCount;
	}

	[CompilerGenerated]
	private void ebu(CharacterManager a)
	{
		a.lhr += eax;
	}

	[CompilerGenerated]
	private void ebv()
	{
		Debug.LogWarning("Shuttle didn't fall after 5s, reset the rally...");
		shuttleShouldFallTimeoutCoroutine = null;
		eay(0f);
	}

	[CompilerGenerated]
	private bool ebw(MatchSettings.PlayerSettings a)
	{
		if (a.DeviceId > 0)
		{
			return lmx ^ !MatchSettings.gcl(a.Position);
		}
		return false;
	}

	[CompilerGenerated]
	private bool ebx(MatchSettings.PlayerSettings a)
	{
		if (a.DeviceId > 0)
		{
			return lmx ^ MatchSettings.gcl(a.Position);
		}
		return false;
	}
}
