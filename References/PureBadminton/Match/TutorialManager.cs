using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TutorialManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TutorialInitiation initiation;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ExercisesDescriptionPanel exercisesDescriptionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TimeScorePanel timeScorePanel;

	private int mkm;

	private BaseExerciseManager mkn;

	public bool pik
	{
		get
		{
			if (base.isActiveAndEnabled)
			{
				TutorialInitiation tutorialInitiation = initiation;
				if ((object)tutorialInitiation == null)
				{
					return false;
				}
				return !tutorialInitiation.mkf;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		Game.ScoresPanel.gxs();
		Game.EnergyPanel.gxs();
		Game.Cameras.dew(rk.CameraMode.Player);
		CinemachineCamera component = Game.Cameras.TeamAPlayerACamera.transform.parent.GetComponent<CinemachineCamera>();
		component.Lens.FieldOfView = 35f;
		component.transform.gud(13f);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pkm.performed += fhd;
		initiation.mkg += fhc;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkm.performed -= fhd;
		initiation.mkg -= fhc;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void StartTutorial()
	{
		initiation.fgh();
	}

	public void fhb()
	{
		if (!initiation.mkf)
		{
			initiation.fgr();
		}
	}

	private void fhc()
	{
		fhf();
		mkm = 0;
		exercisesDescriptionPanel.fdk(tn.ncg[mkm]);
		exercisesDescriptionPanel.FadeIn();
	}

	private void fhd(InputAction.CallbackContext a)
	{
		if (exercisesDescriptionPanel.pqc)
		{
			AudioManager.fiu();
			exercisesDescriptionPanel.FadeOut();
			mkn = base.gameObject.AddComponent<MultiShuttleExerciseManager>();
			mkn.ExerciseInfo = tn.ncg[mkm];
			mkn.MainCharacter = Game.Characters.First((CharacterManager a) => a.teamA);
			mkn.BotCharacter = Game.Characters.First((CharacterManager a) => !a.teamA);
			mkn.mgt += fhe;
			mkn.mgv += fhg;
			Game.Characters.ForEach(delegate(CharacterManager a)
			{
				a.lhg.doy(null);
				a.lhg.CanRun = true;
			});
			mkn.Initialize();
			timeScorePanel.ScoreLimit = tn.ncg[mkm].nck;
			timeScorePanel.phx = 0;
			timeScorePanel.FadeIn();
			mkn.fcf();
		}
	}

	private void fhe()
	{
		AudioManager.PlayMenuChange();
		timeScorePanel.phx = mkn.Score;
	}

	private void fhf()
	{
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.None;
		});
		if (Game.Shuttle != null && !Game.Shuttle.gameObject.gui())
		{
			Game.Shuttle.eyi();
			Game.Shuttle.gameObject.SetActive(value: false);
		}
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.dms(a: true, b: false);
			a.gameObject.SetActive(value: false);
		});
		Game.eaw();
		if (timeScorePanel.pqc)
		{
			timeScorePanel.FadeOut();
		}
	}

	private void fhg()
	{
		mkn.fcg();
		this.guv(1f, delegate
		{
			fhf();
			mkn.fch();
			if (mkm == tn.ncg.Count - 1)
			{
				wn.hpk("FinishTutorial");
				SimpleModal.hhy(this.gut("Tutorial", "EndModal"), this.gut("Tutorial", "RelaunchTutorial"), RestartTutorial, this.gut("Tutorial", "Finish"), fhh);
				ry.pnt.gjn(AchievementType.COMMON_FINISH_TUTORIAL);
			}
			else
			{
				mkm++;
				exercisesDescriptionPanel.fdk(tn.ncg[mkm]);
				exercisesDescriptionPanel.FadeIn();
			}
		});
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void RestartTutorial()
	{
		wn.hpk("RestartTutorial");
		mkm = 0;
		Game.eay(0f, delegate
		{
			Game.Characters.ForEach(delegate(CharacterManager a)
			{
				a.gameObject.SetActive(value: true);
			});
			Game.Shuttle.gameObject.SetActive(value: true);
		});
	}

	public void fhh()
	{
		wn.hpk("ExitTutorial");
		if (rk.pnh == rk.AfterTutorialAction.LaunchMatch)
		{
			LoadingScreen.hfx(rr.gji(MatchSettings.Current.Stadium));
		}
		else
		{
			LoadingScreen.hfx("MainMenu");
		}
	}

	[CompilerGenerated]
	private void fhi()
	{
		fhf();
		mkn.fch();
		if (mkm == tn.ncg.Count - 1)
		{
			wn.hpk("FinishTutorial");
			SimpleModal.hhy(this.gut("Tutorial", "EndModal"), this.gut("Tutorial", "RelaunchTutorial"), RestartTutorial, this.gut("Tutorial", "Finish"), fhh);
			ry.pnt.gjn(AchievementType.COMMON_FINISH_TUTORIAL);
		}
		else
		{
			mkm++;
			exercisesDescriptionPanel.fdk(tn.ncg[mkm]);
			exercisesDescriptionPanel.FadeIn();
		}
	}

	[CompilerGenerated]
	private void fhj()
	{
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.gameObject.SetActive(value: true);
		});
		Game.Shuttle.gameObject.SetActive(value: true);
	}
}
