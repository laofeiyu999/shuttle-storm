using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;
using UnityEngine.SceneManagement;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MainMenuManager : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bem
	{
		public qf.qe oiq;

		internal void jgd()
		{
			oiq.fzi();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ben
	{
		public Task oir;

		internal bool jge()
		{
			return oir.IsCompleted;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class beo
	{
		public string ois;

		public MainMenuManager oit;

		internal async void jgf()
		{
			qa.fzb(ois);
			TournamentLoadMenuManager tournamentLoadMenuManager = oit.tournamentLoadMenuManager;
			tournamentLoadMenuManager.jjh(await Task.Run((Func<Dictionary<string, sb>>)qa.fzd));
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bep
	{
		public string oiu;

		public MainMenuManager oiv;

		internal async void jgg()
		{
			qa.fzb(oiu);
			CareerLoadMenuManager careerLoadMenuManager = oiv.careerLoadMenuManager;
			careerLoadMenuManager.jcr(await Task.Run((Func<Dictionary<string, ng>>)qa.fzf));
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class beq
	{
		public List<int> oiw;

		internal bool jgh(MatchSettings.PlayerSettings a)
		{
			if (a.DeviceId.HasValue)
			{
				return oiw.Contains(a.DeviceId.Value);
			}
			return false;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel homeMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private MatchTypeMenuManager matchTypeMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TeamMenuManager teamMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterMenuManager characterMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterCustomizationPanel careerCharacterCreationMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterCustomizationPanel onlineCharacterCreationMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private StartMenuManager startMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentLoadMenuManager tournamentLoadMenuManager;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerLoadMenuManager careerLoadMenuManager;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentSelectionMenuManager tournamentSelectionMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentCategoryMenuManager tournamentCategoryMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private SettingsMenuManager settingsMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CreditsMenuManager creditsMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel characterImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel fadeCanvas;

	private bool ojl;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharactersPreviewScene CharactersPreview;

	private static bool ojm;

	private Stack<string> ojn = new Stack<string>();

	private bool ojo;

	private string ojp;

	private static CharacterInfo pyp => new CharacterInfo
	{
		firstName = "",
		lastName = "",
		gender = "m",
		country = "CHN",
		birthDate = new DateTime(2026, 1, 1).AddYears(-19),
		leftHanded = false,
		stats = CharacterStats.pjq,
		outfit = Countries.fxc("CHN").Outfit
	};

	private static CharacterInfo pyq => new CharacterInfo
	{
		lastName = "",
		gender = "m",
		birthDate = new DateTime(2026, 1, 1).AddYears(-19),
		leftHanded = false,
		country = "CHN",
		stats = CharacterStats.pjp,
		outfit = CharacterOutfit.ftb("CHN")
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		if (!ojm)
		{
			StartCoroutine(jgx());
		}
		else
		{
			this.guv(0.5f, delegate
			{
				jhc(a: true);
			});
		}
		qu.mug = null;
		RefreshRateManager.gjd();
		if (Tournament.Current != null || Career.Current != null)
		{
			MatchSettings.Current = MatchSettings.gce();
			Tournament.Current = null;
			Career.Current = null;
		}
	}

	private IEnumerator jgx()
	{
		rt.gjl();
		Cursor.lockState = CursorLockMode.Locked;
		Cursor.visible = false;
		_ = ry.pnt;
		nf.fib();
		pl.fxk();
		if (!string.IsNullOrEmpty(rk.pnk) && rk.pnk != LocalizationSettings.SelectedLocale.Identifier.Code)
		{
			Locale locale = LocalizationSettings.AvailableLocales.Locales.Find((Locale a) => a.Identifier.Code == rk.pnk);
			if (locale != null)
			{
				LocalizationSettings.SelectedLocale = locale;
			}
		}
		List<qf.qe> list = qf.fzk();
		if (list.Count > 0)
		{
			Debug.Log($"Found {list.Count} files to migrate. Start migration...");
			int num = 0;
			LoadingModal loadingModal = LoadingModal.Open(this.gut("Global", "MigratingSaveFiles", 1, list.Count));
			yield return new WaitForEndOfFrame();
			foreach (qf.qe oiq in list)
			{
				loadingModal.MessageText.text = this.gut("Global", "MigratingSaveFiles", num + 1, list.Count);
				Task oir = Task.Run(delegate
				{
					oiq.fzi();
				});
				yield return new WaitUntil(() => oir.IsCompleted, TimeSpan.FromSeconds(60.0), delegate
				{
				});
				num++;
			}
			loadingModal.Close();
			Debug.Log("Migration of save files done");
		}
		if (pp.pla != null)
		{
			wn.Initialize();
		}
		ojm = true;
		if (!rk.mwr && (rk.mws ?? "0.0.0").CompareTo("1.2.0") == -1)
		{
			ojn.Push(this.gut("Global", "StartNotif-v1.2.0-NewIntensityFeature"));
		}
		if (ojn.Any())
		{
			jhd();
			yield break;
		}
		yield return new WaitForSeconds(0.5f);
		jhc(a: true);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		OnlineMaintenance.nya += jhl;
		OnlineSessionReplaced.ocn += jhm;
		qi.pli.pkm.performed += jha;
		qi.pli.pkn.performed += jgz;
		qi.pli.pkl.performed += jgy;
		qi.plh.pka.performed += jhb;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		OnlineMaintenance.nya -= jhl;
		OnlineSessionReplaced.ocn -= jhm;
		qi.pli.pkm.performed -= jha;
		qi.pli.pkn.performed -= jgz;
		qi.pli.pkl.performed -= jgy;
		qi.plh.pka.performed -= jhb;
	}

	private void jgy(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (tournamentLoadMenuManager.pqc && tournamentLoadMenuManager.pzc != null)
		{
			string ois = tournamentLoadMenuManager.pzc;
			SimpleModal.hib(this.gut("MainMenu", "DeleteSaveModal"), async delegate
			{
				qa.fzb(ois);
				TournamentLoadMenuManager tournamentLoadMenuManager = this.tournamentLoadMenuManager;
				tournamentLoadMenuManager.jjh(await Task.Run((Func<Dictionary<string, sb>>)qa.fzd));
			});
		}
		else if (careerLoadMenuManager.pqc && careerLoadMenuManager.pxz != null)
		{
			string oiu = careerLoadMenuManager.pxz;
			SimpleModal.hib(this.gut("MainMenu", "DeleteSaveModal"), async delegate
			{
				qa.fzb(oiu);
				CareerLoadMenuManager careerLoadMenuManager = this.careerLoadMenuManager;
				careerLoadMenuManager.jcr(await Task.Run((Func<Dictionary<string, ng>>)qa.fzf));
			});
		}
	}

	private void jgz(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (startMenu.pqc)
		{
			AudioManager.fiu();
			startMenu.SlideRightFadeOut();
			if (rk.pna == rk.PlayModes.Career)
			{
				careerCharacterCreationMenu.SlideLeftFadeIn();
			}
			else
			{
				characterMenu.SlideLeftFadeIn();
			}
		}
		else if (characterMenu.pqc)
		{
			if (characterMenu.pyf)
			{
				AudioManager.fiu();
				characterMenu.SlideRightFadeOut();
				if (rk.pna == rk.PlayModes.Tournament && !Tournament.gmy(rk.pms))
				{
					tournamentCategoryMenu.SlideLeftFadeIn();
				}
				else
				{
					teamMenu.SlideLeftFadeIn();
				}
			}
		}
		else if (teamMenu.pqc)
		{
			AudioManager.fiu();
			teamMenu.SlideRightFadeOut();
			if (rk.pna == rk.PlayModes.Tournament)
			{
				tournamentCategoryMenu.SlideLeftFadeIn();
			}
			else
			{
				matchTypeMenu.SlideLeftFadeIn();
			}
		}
		else if (matchTypeMenu.pqc)
		{
			AudioManager.fiu();
			matchTypeMenu.SlideRightFadeOut();
			jhc(a: true);
		}
		else if (tournamentCategoryMenu.pqc)
		{
			AudioManager.fiu();
			tournamentCategoryMenu.FadeOut();
			tournamentSelectionMenu.SlideLeftFadeIn();
		}
		else if (tournamentSelectionMenu.pqc)
		{
			AudioManager.fiu();
			tournamentSelectionMenu.FadeOut();
			jhc(a: true);
		}
		else if (tournamentLoadMenuManager.pqc)
		{
			AudioManager.fiu();
			tournamentLoadMenuManager.FadeOut();
			jhc(a: true);
		}
		else if (careerCharacterCreationMenu.pqc && careerCharacterCreationMenu.pql)
		{
			AudioManager.fiu();
			careerCharacterCreationMenu.FadeOut();
			jhc(a: true);
		}
		else if (careerLoadMenuManager.pqc)
		{
			AudioManager.fiu();
			careerLoadMenuManager.FadeOut();
			jhc(a: true);
		}
		else if (onlineCharacterCreationMenu.pqc && onlineCharacterCreationMenu.pql)
		{
			AudioManager.fiu();
			onlineCharacterCreationMenu.FadeOut();
			jhq();
		}
		else if (settingsMenu.pqc)
		{
			AudioManager.fiu();
			settingsMenu.jih();
			settingsMenu.SlideRightFadeOut();
			jhc(a: true);
		}
		else if (creditsMenu.pqc)
		{
			AudioManager.fiu();
			creditsMenu.SlideRightFadeOut();
			jhc(a: true);
		}
	}

	private void jha(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (startMenu.pqc)
		{
			qg settings = new qg
			{
				WinningSets = rk.pmt,
				SetPoints = rk.pmu,
				Difficulty = rk.pmv
			};
			if (rk.pna == rk.PlayModes.Tournament)
			{
				TournamentParticipant playerParticipant = (Tournament.gmy(rk.pms) ? new TournamentParticipant(new PairInfo
				{
					characterId1 = MatchSettings.Current.TeamA.PlayerA.CharacterInfo.id,
					characterId2 = MatchSettings.Current.TeamA.PlayerB.CharacterInfo.id
				}) : new TournamentParticipant(MatchSettings.Current.TeamA.PlayerA.CharacterInfo));
				Tournament.Current = new Tournament(tk.gqj(rk.pmr), rk.pms, playerParticipant, placePlayerInSecondPosition: true);
				Tournament.Current.Settings = settings;
				wn.hpm("StartTournamentOff", new Dictionary<string, object>
				{
					{
						"TournamentType",
						rk.pmr.ToString()
					},
					{
						"Category",
						rk.pms.ToString()
					}
				});
				SceneManager.LoadScene("TournamentMenu");
				return;
			}
			if (rk.pna == rk.PlayModes.Career)
			{
				CharacterInfo characterInfo = MatchSettings.Current.TeamA.PlayerA.CharacterInfo;
				Career.Current = new Career(characterInfo, settings);
				wn.hpm("StartCareer", new Dictionary<string, object>
				{
					{ "ModelId", characterInfo.modelId },
					{ "Country", characterInfo.country },
					{ "Gender", characterInfo.gender }
				});
				LoadingScreen.hfx("CareerMenu");
				return;
			}
			MatchSettings.Current.Stadium = rk.pmp;
			MatchSettings.Current.WinningSets = rk.pmt;
			MatchSettings.Current.SetPoints = rk.pmu;
			MatchSettings.Current.Difficulty = rk.pmv;
			MatchSettings.Current.GameSpeed = rk.pmw;
			MatchSettings.Current.PlacementAssistance = rk.pmx;
			MatchSettings.Current.ShuttleTrajectory = rk.pmy;
			wn.hpn("StartMatch");
			if (rk.pnf)
			{
				AudioManager.fiu();
				startMenu.FadeOut();
				SimpleModal.hia(this.gut("MainMenu", "FirstMatchModal"), jhe, StartMatch, d: true, delegate
				{
					startMenu.FadeIn();
				});
			}
			else
			{
				StartMatch();
			}
		}
		else if (characterMenu.pqc)
		{
			if (characterMenu.pye)
			{
				AudioManager.fiu();
				characterMenu.Save();
				characterMenu.SlideLeftFadeOut();
				startMenu.SlideRightFadeIn();
			}
		}
		else if (teamMenu.pqc)
		{
			if (teamMenu.TeamsSelection.ptq)
			{
				AudioManager.fiu();
				teamMenu.TeamsSelection.Save();
				Action action = delegate
				{
					teamMenu.SlideLeftFadeOut();
					characterMenu.SlideRightFadeIn();
				};
				List<int> oiw = (from a in InputSystem.devices
					where a is Keyboard
					select a.deviceId).ToList();
				if (MatchSettings.Current.plv.Any((MatchSettings.PlayerSettings a) => a.DeviceId.HasValue && oiw.Contains(a.DeviceId.Value)))
				{
					SimpleModal.hic(this.gut("MainMenu", "PreferGamepadModal"), action);
				}
				else
				{
					action();
				}
			}
		}
		else if (matchTypeMenu.pqc)
		{
			AudioManager.fiu();
			MatchSettings.Current.IsDouble = matchTypeMenu.pyr;
			matchTypeMenu.SlideLeftFadeOut();
			teamMenu.SlideRightFadeIn();
		}
		else if (tournamentCategoryMenu.pqc)
		{
			AudioManager.fiu();
			rk.pms = tournamentCategoryMenu.pyz;
			tournamentCategoryMenu.SlideLeftFadeOut();
			if (Tournament.gmy(rk.pms))
			{
				MatchSettings.Current.IsDouble = true;
				teamMenu.SlideRightFadeIn();
			}
			else
			{
				MatchSettings.Current.IsDouble = false;
				MatchSettings.Current.gcj();
				characterMenu.SlideRightFadeIn();
			}
		}
		else if (tournamentSelectionMenu.pqc)
		{
			AudioManager.fiu();
			tournamentSelectionMenu.SlideLeftFadeOut();
			tournamentCategoryMenu.SlideRightFadeIn();
		}
		else if (tournamentLoadMenuManager.pqc)
		{
			if (tournamentLoadMenuManager.pzc != null)
			{
				StartCoroutine(jhg(tournamentLoadMenuManager.pzc));
				return;
			}
			AudioManager.fiu();
			tournamentLoadMenuManager.SlideLeftFadeOut();
			tournamentSelectionMenu.SlideRightFadeIn();
		}
		else if (careerCharacterCreationMenu.pqc)
		{
			if (careerCharacterCreationMenu.pqj)
			{
				if (!careerCharacterCreationMenu.Validate(displayErrorModal: true))
				{
					AudioManager.fiw();
					return;
				}
				AudioManager.fiu();
				careerCharacterCreationMenu.nhh.id = "1";
				MatchSettings.Current.TeamA.PlayerA.CharacterInfo = careerCharacterCreationMenu.nhh;
				careerCharacterCreationMenu.SlideLeftFadeOut();
				startMenu.SlideRightFadeIn();
			}
		}
		else if (careerLoadMenuManager.pqc)
		{
			if (careerLoadMenuManager.pxz != null)
			{
				StartCoroutine(jhi(careerLoadMenuManager.pxz));
				return;
			}
			AudioManager.fiu();
			MatchSettings.Current.gcj();
			AudioManager.fiu();
			careerLoadMenuManager.SlideLeftFadeOut();
			if (careerCharacterCreationMenu.nhh == null)
			{
				careerCharacterCreationMenu.nhh = pyp;
			}
			careerCharacterCreationMenu.SlideRightFadeIn();
		}
		else if (onlineCharacterCreationMenu.pqc)
		{
			if (onlineCharacterCreationMenu.pqj)
			{
				if (!onlineCharacterCreationMenu.Validate(displayErrorModal: true))
				{
					AudioManager.fiw();
					return;
				}
				AudioManager.fiu();
				jho();
			}
		}
		else if (settingsMenu.pqc)
		{
			AudioManager.fiu();
			settingsMenu.jii();
			settingsMenu.SlideRightFadeOut();
			homeMenu.SlideLeftFadeIn();
			characterImage.SlideRightFadeIn();
		}
	}

	private void jhb(InputAction.CallbackContext a)
	{
	}

	private void jhc(bool a)
	{
		if (a)
		{
			homeMenu.SlideLeftFadeIn();
			characterImage.SlideRightFadeIn();
		}
		else
		{
			homeMenu.SlideLeftFadeOut();
			characterImage.SlideRightFadeOut();
		}
	}

	private void jhd()
	{
		if (ojn.Any())
		{
			SimpleModal.hic(ojn.Pop(), jhd, c: true, new SimpleModal.vp
			{
				nla = 800f,
				nlb = 400f,
				nlc = TextAlignmentOptions.Left
			});
		}
		else
		{
			jhc(a: true);
		}
	}

	public void jhe()
	{
		rk.png = true;
		rk.pnh = rk.AfterTutorialAction.LaunchMatch;
		StartMatch("Gymnasium");
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartMatch()
	{
		StartMatch(null);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartMatch(string stadium = null)
	{
		if (!ojl)
		{
			ojl = true;
			if (string.IsNullOrEmpty(stadium))
			{
				stadium = rr.gji(MatchSettings.Current.Stadium);
			}
			rk.pnf = false;
			AudioManager.fiv();
			LoadingScreen.hfx(stadium);
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenStartMenu()
	{
		AudioManager.fiu();
		rk.pna = rk.PlayModes.Quick;
		jhc(a: false);
		matchTypeMenu.SlideRightFadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartTutorial()
	{
		wn.hpk("StartTutorial");
		rk.png = true;
		rk.pnh = rk.AfterTutorialAction.BackToMenu;
		StartMatch("Gymnasium");
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartTournament()
	{
		jhf();
	}

	private async void jhf()
	{
		AudioManager.fiu();
		rk.pna = rk.PlayModes.Tournament;
		jhc(a: false);
		Dictionary<string, sb> dictionary = await Task.Run((Func<Dictionary<string, sb>>)qa.fzd);
		if (dictionary.Any())
		{
			tournamentLoadMenuManager.jjh(dictionary);
			tournamentLoadMenuManager.SlideRightFadeIn();
		}
		else
		{
			tournamentSelectionMenu.SlideRightFadeIn();
		}
	}

	private IEnumerator jhg(string a)
	{
		AudioManager.fiv();
		yield return fadeCanvas.gxj();
		Tournament.Current = qa.fyz(a);
		SceneManager.LoadScene("TournamentMenu");
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartCareer()
	{
		jhh();
	}

	private async void jhh()
	{
		AudioManager.fiu();
		rk.pna = rk.PlayModes.Career;
		jhc(a: false);
		Dictionary<string, ng> dictionary = await Task.Run((Func<Dictionary<string, ng>>)qa.fzf);
		if (dictionary.Any())
		{
			careerLoadMenuManager.jcr(dictionary);
			careerLoadMenuManager.SlideRightFadeIn();
			return;
		}
		MatchSettings.Current.gcj();
		if (careerCharacterCreationMenu.nhh == null)
		{
			careerCharacterCreationMenu.nhh = pyp;
		}
		careerCharacterCreationMenu.SlideRightFadeIn();
	}

	private IEnumerator jhi(string a)
	{
		AudioManager.fiv();
		yield return LoadingScreen.psj.gxj();
		Career.Current = qa.fyy(a);
		Tournament tournament = Career.Current.CurrentRegisteredTournaments.FirstOrDefault((Tournament a) => !a.pob);
		if (tournament != null)
		{
			Tournament.Current = tournament;
			LoadingScreen.hfx("TournamentMenu");
			yield break;
		}
		CareerTrainingScore currentTraining = Career.Current.CurrentTraining;
		if (currentTraining != null && !currentTraining.JustFinished)
		{
			MatchSettings.Current = Career.Current.flu();
			LoadingScreen.hfx("Gymnasium");
		}
		else
		{
			LoadingScreen.hfx("CareerMenu");
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void OpenOnlineMenu()
	{
		wn.hpk("OpenOnlineMenu");
		AudioManager.fiu();
		jhc(a: false);
		jhj(a: false);
	}

	private async void jhj(bool a)
	{
		LoadingModal loadingModal = LoadingModal.Open(this.gut("Online", "Connecting"));
		bbe bbe2 = await bbb.ijv(a);
		loadingModal.Close();
		ojp = null;
		if (bbe2.nwd == OnlineConnectOutcome.Success)
		{
			if (bcu.pvv)
			{
				jhk();
			}
			else
			{
				LoadingScreen.hfx("OnlineMenu");
			}
		}
		else
		{
			jhr(bbe2);
		}
	}

	private void jhk()
	{
		if (onlineCharacterCreationMenu.nhh == null)
		{
			onlineCharacterCreationMenu.nhh = pyq;
		}
		onlineCharacterCreationMenu.nhh.lastName = bcu.obm ?? bcu.obz ?? "";
		onlineCharacterCreationMenu.pqn = jhp;
		onlineCharacterCreationMenu.statsCard.BuildBudget = bcu.obq;
		onlineCharacterCreationMenu.statsCard.BuildStatCap = bcu.obr;
		onlineCharacterCreationMenu.SlideRightFadeIn();
	}

	private void jhl(DateTimeOffset? a)
	{
		ojp = OnlineMaintenance.imc(a);
	}

	private void jhm()
	{
		ojp = OnlineSessionReplaced.ism();
	}

	private bool jhn()
	{
		if (ojp == null)
		{
			return false;
		}
		string a = ojp;
		ojp = null;
		onlineCharacterCreationMenu.FadeOut();
		OnlineSessionExit.ise();
		bcu.Clear();
		AudioManager.fiw();
		jhs(a);
		return true;
	}

	private async void jho()
	{
		if (ojo)
		{
			return;
		}
		ojo = true;
		CharacterStats stats = onlineCharacterCreationMenu.statsCard.Stats ?? CharacterStats.pjp;
		onlineCharacterCreationMenu.nhh.stats = stats;
		onlineCharacterCreationMenu.FadeOut();
		LoadingModal loadingModal = LoadingModal.Open(this.gut("Online", "CharacterSaving"));
		if (bcu.obw)
		{
			string text = await jhp(onlineCharacterCreationMenu.nhh.lastName);
			if (text != null)
			{
				loadingModal.Close();
				ojo = false;
				if (!(this == null) && !jhn())
				{
					onlineCharacterCreationMenu.FadeIn();
					AudioManager.fiw();
					SimpleModal.hic(text);
				}
				return;
			}
		}
		yt yt2 = await bbc.ijy(stats, onlineCharacterCreationMenu.nhh);
		loadingModal.Close();
		ojo = false;
		if (!(this == null) && (yt2.nta == CharacterSetOutcome.Success || !jhn()))
		{
			if (yt2.nta != 0)
			{
				onlineCharacterCreationMenu.FadeIn();
			}
			switch (yt2.nta)
			{
			case CharacterSetOutcome.Success:
				LoadingScreen.hfx("OnlineMenu");
				break;
			case CharacterSetOutcome.NetworkError:
				AudioManager.fiw();
				SimpleModal.hic(this.gut("Online", "ErrorNetwork"));
				break;
			default:
				AudioManager.fiw();
				SimpleModal.hic(this.gut("Online", "CharacterInvalid"));
				break;
			}
		}
	}

	private async Task<string> jhp(string a)
	{
		yu yu2 = await bbg.ikf(a);
		if (yu2.ntd != 0 && ojp != null)
		{
			return ojp;
		}
		switch (yu2.ntd)
		{
		case DisplayNameOutcome.Success:
			return null;
		case DisplayNameOutcome.TooShort:
			return this.gut("Online", "DisplayNameTooShort", 3);
		case DisplayNameOutcome.TooLong:
			return this.gut("Online", "DisplayNameTooLong", 20);
		case DisplayNameOutcome.InvalidCharacters:
			return this.gut("Online", "DisplayNameInvalidCharacters");
		case DisplayNameOutcome.Filtered:
			return this.gut("Online", "DisplayNameFiltered");
		case DisplayNameOutcome.Taken:
			return this.gut("Online", "DisplayNameTaken");
		case DisplayNameOutcome.RenameTooSoon:
		{
			Locale selectedLocale = LocalizationSettings.SelectedLocale;
			CultureInfo cultureInfo = ((selectedLocale != null) ? selectedLocale.Identifier.CultureInfo : null);
			return this.gut("Online", "DisplayNameRenameTooSoon", yu2.nte?.ToLocalTime().ToString("d", cultureInfo));
		}
		default:
			return this.gut("Online", "ErrorNetwork");
		}
	}

	private void jhq()
	{
		OnlineSessionExit.ise();
		bcu.Clear();
		jhc(a: true);
	}

	private void jhr(bbe a)
	{
		AudioManager.fiw();
		switch (a.nwd)
		{
		case OnlineConnectOutcome.VersionBlocked:
		case OnlineConnectOutcome.CharacterUnreadable:
			jhs(this.gut("Online", "ErrorVersionBlocked"));
			break;
		case OnlineConnectOutcome.Banned:
		{
			string a2 = (string.IsNullOrEmpty(a.nwe) ? this.gut("Online", "ErrorBanned") : this.gut("Online", "ErrorBannedWithReason", a.nwe));
			jhs(a2);
			break;
		}
		case OnlineConnectOutcome.Maintenance:
			jhs(OnlineMaintenance.imc(a.nwf));
			break;
		case OnlineConnectOutcome.AlreadyConnected:
			SimpleModal.hia(this.gut("Online", "AlreadyConnected"), delegate
			{
				jhj(a: true);
			}, delegate
			{
				jhc(a: true);
			});
			break;
		case OnlineConnectOutcome.AlreadyInMatch:
			jhs(this.gut("Online", "ErrorAlreadyInMatch"));
			break;
		case OnlineConnectOutcome.PlatformUnavailable:
			jht(this.gut("Online", "ErrorPlatformUnavailable"));
			break;
		case OnlineConnectOutcome.AuthRejected:
			jht(this.gut("Online", "ErrorAuthRejected"));
			break;
		default:
			jht(this.gut("Online", "ErrorNetwork"));
			break;
		}
	}

	private void jhs(string a)
	{
		SimpleModal.hhz(a, tt.gra("Global", "Ok").ToUpper(), delegate
		{
			jhc(a: true);
		});
	}

	private void jht(string a)
	{
		SimpleModal.hhy(a, this.gut("Global", "Cancel"), delegate
		{
			jhc(a: true);
		}, this.gut("Global", "Retry"), OpenOnlineMenu);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void OpenSettingsMenu()
	{
		wn.hpk("OpenSettingsMenu");
		AudioManager.fiu();
		jhc(a: false);
		settingsMenu.SlideRightFadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void OpenCreditsMenu()
	{
		wn.hpk("OpenCreditsMenu");
		AudioManager.fiu();
		jhc(a: false);
		creditsMenu.SlideRightFadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Exit()
	{
		Debug.Log("Game closed");
		Application.Quit();
	}

	[CompilerGenerated]
	private void jhu()
	{
		jhc(a: true);
	}

	[CompilerGenerated]
	private void jhv()
	{
		startMenu.FadeIn();
	}

	[CompilerGenerated]
	private void jhw()
	{
		teamMenu.SlideLeftFadeOut();
		characterMenu.SlideRightFadeIn();
	}

	[CompilerGenerated]
	private void jhx()
	{
		jhj(a: true);
	}

	[CompilerGenerated]
	private void jhy()
	{
		jhc(a: true);
	}

	[CompilerGenerated]
	private void jhz()
	{
		jhc(a: true);
	}

	[CompilerGenerated]
	private void jia()
	{
		jhc(a: true);
	}
}
