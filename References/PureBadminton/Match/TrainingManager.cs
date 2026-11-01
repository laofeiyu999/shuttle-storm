using System;
using System.Collections;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TrainingManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ExercisesSelectionPanel exercisesSelectionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ExercisesDescriptionPanel exercisesDescriptionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CountdownPanel countdownPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TimeScorePanel timeScorePanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ExerciseResultPanel exerciseResultPanel;

	private BaseExerciseManager mjg;

	private int? mjh;

	public CharacterManager.PossibleAction mjf { get; set; }

	public bool pid => mjg?.mgs ?? false;

	public CareerTrainingScore pie => Career.Current.CurrentTraining;

	public tp pif
	{
		get
		{
			if (!mjh.HasValue)
			{
				return null;
			}
			return pie.TrainingInfo.ncc[mjh.Value];
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.None;
		});
		Game.Cameras.dew(rk.CameraMode.TV);
		StartCoroutine(ffe());
		Game.ScoresPanel.gxs();
		Game.EnergyPanel.gxs();
		exercisesSelectionPanel.fea(pie);
		exercisesSelectionPanel.FadeIn();
	}

	private IEnumerator ffe()
	{
		yield return new WaitForEndOfFrame();
		Game.Shuttle.gameObject.SetActive(value: false);
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.gameObject.SetActive(value: false);
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pkm.performed += fff;
		qi.pli.pkn.performed += ffg;
		countdownPanel.mgq += ffh;
		timeScorePanel.miy += ffi;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkm.performed -= fff;
		qi.pli.pkn.performed -= ffg;
		countdownPanel.mgq -= ffh;
		timeScorePanel.miy -= ffi;
	}

	private void fff(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (exerciseResultPanel.pqc)
		{
			ffo();
		}
		else if (exercisesDescriptionPanel.pqc)
		{
			AudioManager.fiu();
			exercisesDescriptionPanel.FadeOut();
			countdownPanel.FadeIn();
		}
		else
		{
			if (!exercisesSelectionPanel.pqc)
			{
				return;
			}
			AudioManager.fiu();
			if (exercisesSelectionPanel.phv >= pie.TrainingInfo.ncc.Count)
			{
				if (pie.Scores.All((int? a) => a.HasValue))
				{
					ffp();
					return;
				}
				SimpleModal.hib(this.gut("Training", "FinishUncompleteTrainingModal"), delegate
				{
					ffp();
				});
			}
			else
			{
				mjh = exercisesSelectionPanel.phv;
				exercisesSelectionPanel.FadeOut();
				exercisesDescriptionPanel.fdk(pif);
				exercisesDescriptionPanel.FadeIn();
			}
		}
	}

	private void ffg(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (exercisesDescriptionPanel.pqc)
		{
			AudioManager.fiu();
			exercisesDescriptionPanel.FadeOut();
			exercisesSelectionPanel.FadeIn();
		}
		else if (exercisesSelectionPanel.pqc)
		{
			SimpleModal.hib(this.gut("CareerMenu", "ExitSaveModal"), delegate
			{
				Career.Current = null;
				ffq();
			});
		}
	}

	private void ffh()
	{
		Game.eaw();
		switch (pif.pot)
		{
		case ExerciseType.Shadow:
			mjg = base.gameObject.AddComponent<ShadowExerciseManager>();
			break;
		case ExerciseType.MultiShuttle:
			mjg = base.gameObject.AddComponent<MultiShuttleExerciseManager>();
			break;
		case ExerciseType.ThemeMatch:
			mjg = base.gameObject.AddComponent<ThemeMatchExerciseManager>();
			break;
		default:
			throw new NotImplementedException();
		}
		mjg.ExerciseInfo = pif;
		mjg.mgt += ffj;
		mjg.mgu += ffk;
		mjg.mgv += ffl;
		mjg.MainCharacter = Game.Characters.First((CharacterManager a) => a.teamA);
		mjg.BotCharacter = Game.Characters.First((CharacterManager a) => !a.teamA);
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.lhg.doy(null);
			a.lhg.CanRun = true;
		});
		mjg.Initialize();
		Game.Cameras.dew(rk.pnb);
		timeScorePanel.ScoreLimit = pif.nck;
		if (pif.ncj.HasValue)
		{
			timeScorePanel.EndTime = Time.time + (float)pif.ncj.Value;
			timeScorePanel.phx = 0;
		}
		else if (pif.nck.HasValue)
		{
			timeScorePanel.phx = 0;
		}
		else
		{
			timeScorePanel.phy = (0, 0);
		}
		timeScorePanel.FadeIn();
		mjg.fcf();
	}

	private void ffi()
	{
		AudioManager.fiy();
		ffm();
	}

	private void ffj()
	{
		timeScorePanel.phx = mjg.Score;
	}

	private void ffk()
	{
		re re2 = qu.mug.mui.Last();
		(int, int) matchScore = (re2.pmi, re2.pmj);
		timeScorePanel.phy = (mjg.MatchScore = matchScore);
	}

	private void ffl()
	{
		ffm();
	}

	public void ffm()
	{
		StartCoroutine(ffn());
	}

	private IEnumerator ffn()
	{
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.AllowedAction = CharacterManager.PossibleAction.None;
		});
		mjg.fcg();
		if (Game.Shuttle != null)
		{
			Game.Shuttle.eyk();
		}
		yield return this.guu(2f);
		mjg.fch();
		Game.Shuttle.eyi();
		Game.Shuttle.gameObject.SetActive(value: false);
		Game.Cameras.dew(rk.CameraMode.TV);
		Game.Characters.ForEach(delegate(CharacterManager a)
		{
			a.dms(a: true, b: false);
			a.gameObject.SetActive(value: false);
		});
		Game.eaw();
		timeScorePanel.FadeOut();
		if (pif.ncj.HasValue)
		{
			exerciseResultPanel.fdt(pif, mjg.Score, pie.Scores[mjh.Value]);
			exerciseResultPanel.FadeIn();
		}
		else
		{
			ffo();
		}
	}

	private void ffo()
	{
		int num = mjg.Score;
		if (!pif.ncj.HasValue)
		{
			num = ((mjg.MatchScore.Item1 > mjg.MatchScore.Item2) ? 1 : 0);
		}
		if (!pie.Scores[mjh.Value].HasValue || num > pie.Scores[mjh.Value])
		{
			pie.Scores[mjh.Value] = num;
		}
		UnityEngine.Object.Destroy(mjg);
		mjg = null;
		if (exerciseResultPanel.pqc)
		{
			exerciseResultPanel.FadeOut();
		}
		exercisesSelectionPanel.fea(pie);
		exercisesSelectionPanel.FadeIn();
		nz.Save();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void FixedUpdate()
	{
		if (mjg != null)
		{
			mjg.FixedUpdate();
		}
	}

	public void ffp()
	{
		pie.JustFinished = true;
		LoadingScreen.hfx("CareerMenu", nz.@for(a: true));
	}

	public void ffq()
	{
		LoadingScreen.hfx("MainMenu");
	}

	[CompilerGenerated]
	private void ffr()
	{
		ffp();
	}

	[CompilerGenerated]
	private void ffs()
	{
		Career.Current = null;
		ffq();
	}
}
