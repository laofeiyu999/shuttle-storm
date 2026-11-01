using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.SceneManagement;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CareerMenuManager : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gl
	{
		public CareerPair lcc;

		public CareerMenuManager lcd;

		internal void cwa()
		{
			wn.hpm("AcceptPartnerInvitation", new Dictionary<string, object>
			{
				{
					"Category",
					lcc.Category.ToString()
				},
				{
					"PartnerBestRank",
					Career.Current.flq(lcc.mmr)
				}
			});
			Career.Current.AcceptPartnerInvitation(lcc);
			lcd.cxu(lcd.playersDetailsPanel.oxz);
			lcd.cxq();
		}

		internal void cwb()
		{
			wn.hpm("DeclinePartnerInvitation", new Dictionary<string, object>
			{
				{
					"Category",
					lcc.Category.ToString()
				},
				{
					"PartnerBestRank",
					Career.Current.flq(lcc.mmr)
				}
			});
			Career.Current.DeclinePartnerInvitation(lcc);
			lcd.cxu(lcd.playersDetailsPanel.oxz);
			lcd.cxq();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gm
	{
		public TournamentCategory lce;

		internal bool cwc(CareerPair a)
		{
			return a.Category == lce;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gn
	{
		public bool lcf;

		public int lcg;

		public CareerMenuManager lch;

		public Action lci;

		internal bool cwd(CareerParticipant a)
		{
			if (a.CharacterInfo.country == Career.Current.MainCharacter.CharacterInfo.country && a.CharacterInfo.gender == (lcf ? "m" : "f"))
			{
				return a.CharacterId != Career.Current.MainCharacter.CharacterId;
			}
			return false;
		}

		internal bool cwe(CareerParticipant a)
		{
			return Career.Current.flq(a) > lcg;
		}

		internal void cwf(ob a)
		{
			go CS_0024_003C_003E8__locals0 = new go
			{
				lcj = (CareerParticipant)a
			};
			if (Career.Current.Pairs.Where((CareerPair a) => a.fpf(Career.Current.MainCharacter.CharacterId)).Any((CareerPair a) => a.fpf(CS_0024_003C_003E8__locals0.lcj.CharacterId)))
			{
				SimpleModal.hic(lch.gut("CareerMenu", "CharacterAlreadyPaired", CS_0024_003C_003E8__locals0.lcj.CharacterInfo.pjm));
				return;
			}
			if (Career.Current.MainCharacter.PendingPairs.Any((CareerPair a) => a.fpf(CS_0024_003C_003E8__locals0.lcj.CharacterId)))
			{
				SimpleModal.hic(lch.gut("CareerMenu", "InvitationAlreadySent", CS_0024_003C_003E8__locals0.lcj.CharacterInfo.pjm));
				return;
			}
			if (Career.Current.MainCharacter.PendingPairs.Count >= 5)
			{
				SimpleModal.hic(lch.gut("CareerMenu", "MaxInvitationsReached", 5));
				return;
			}
			wn.hpm("InvitePartner", new Dictionary<string, object>
			{
				{
					"Category",
					lch.ldj.Value.ToString()
				},
				{
					"PartnerBestRank",
					Career.Current.flq(CS_0024_003C_003E8__locals0.lcj)
				}
			});
			Career.Current.InvitePartner(CS_0024_003C_003E8__locals0.lcj, lch.ldj.Value);
			SimpleModal.hic(lch.gut("CareerMenu", "InvitationSentModal", CS_0024_003C_003E8__locals0.lcj.CharacterInfo.pjm), delegate
			{
				AudioManager.fiu();
				nz.Save();
				lch.careerPanel.cyp();
				lch.StartCoroutine(lch.cyb());
			});
		}

		internal void cwg()
		{
			AudioManager.fiu();
			nz.Save();
			lch.careerPanel.cyp();
			lch.StartCoroutine(lch.cyb());
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class go
	{
		public CareerParticipant lcj;

		internal bool cwh(CareerPair a)
		{
			return a.fpf(lcj.CharacterId);
		}

		internal bool cwi(CareerPair a)
		{
			return a.fpf(lcj.CharacterId);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gp
	{
		public int lck;

		internal bool cwj(ob a)
		{
			return Career.Current.flq((CareerParticipant)a) > lck;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class gq
	{
		public ob lcl;

		internal bool cwk(CareerPair a)
		{
			if (a.fpf(Career.Current.MainCharacter.piz))
			{
				return a.fpf(lcl.piz);
			}
			return false;
		}

		internal bool cwl(CareerPair a)
		{
			return a.fpf(lcl.piz);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel fadeCanvas;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuPanel careerPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ProgressionPanel progressionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PlayersDetailsPanel playersDetailsPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterCustomizationPanel appearancePanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private HistoryPanel historyPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private RewardsPanel rewardsPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private WorldMapPanel worldMapPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ChallengesPanel challengesPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private WeekActionPanel weekActionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentRegistrationPanel tournamentRegistrationPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TrainingSelectionPanel trainingSelectionPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private SettingsPanel settingsPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharactersPreviewScene CharactersPreview;

	private TournamentCategory? ldj;

	private bool ldk;

	public sz ldi { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		RefreshRateManager.gjd();
		if (LoadingScreen.psk)
		{
			LoadingScreen.nkb += cxm;
		}
		else
		{
			cxn();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		LoadingScreen.nkb -= cxm;
	}

	private void cxm()
	{
		LoadingScreen.nkb -= cxm;
		cxn();
	}

	private void cxn()
	{
		qu.mug = null;
		if (Career.Current.CurrentTraining != null)
		{
			if (Career.Current.CurrentTraining.JustFinished)
			{
				wn.hpm("FinishTraining", new Dictionary<string, object>
				{
					{
						"CareerStartDate",
						Career.Current.StartedDate.ToString()
					},
					{
						"CareerDate",
						Career.Current.CurrentDate.ToString()
					},
					{
						"Rankings",
						Career.Current.piy
					},
					{
						"Stats",
						Career.Current.MainCharacter.CharacterInfo.stats.ToString()
					},
					{
						"TrainingType",
						Career.Current.CurrentTraining.TrainingInfo.nca.ToString()
					},
					{
						"TrainingLevel",
						Career.Current.CurrentTraining.TrainingInfo.ncb
					},
					{
						"TrainingScores",
						string.Join(',', Career.Current.CurrentTraining.Scores)
					}
				});
				Career.Current.Trainings.Add((Career.Current.CurrentDate, Career.Current.CurrentTraining));
				Career.Current.CurrentTraining = null;
				Career.Current.flh();
				cxq();
				cxs();
			}
			else
			{
				StartTraining();
			}
		}
		else if (Career.Current.CurrentRegisteredTournaments.Any())
		{
			Tournament tournament = Career.Current.CurrentRegisteredTournaments.FirstOrDefault((Tournament a) => !a.pob);
			if (tournament != null)
			{
				StartTournament(tournament);
				return;
			}
			wn.hpm("FinishTournament", new Dictionary<string, object>
			{
				{
					"CareerStartDate",
					Career.Current.StartedDate.ToString()
				},
				{
					"CareerDate",
					Career.Current.CurrentDate.ToString()
				},
				{
					"Rankings",
					Career.Current.piy
				},
				{
					"Stats",
					Career.Current.MainCharacter.CharacterInfo.stats.ToString()
				},
				{
					"TournamentType",
					Career.Current.CurrentRegisteredTournaments[0].Properties.Id
				},
				{
					"Categories",
					string.Join(',', Career.Current.CurrentRegisteredTournaments.Select((Tournament a) => a.Category.ToString()))
				},
				{
					"TournamentResults",
					string.Join(',', Career.Current.CurrentRegisteredTournaments.Select((Tournament a) => a.gnp(a.pnv).ToString()))
				}
			});
			Career.Current.flh();
			cxq();
			cxs();
		}
		else
		{
			if (Career.Current.LastSavedDate == default(DateTime))
			{
				nz.Save();
			}
			careerPanel.FadeIn();
			cyi();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pkm.performed += cxp;
		qi.pli.pkn.performed += cxo;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkm.performed -= cxp;
		qi.pli.pkn.performed -= cxo;
	}

	private void cxo(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (trainingSelectionPanel.pqc)
		{
			AudioManager.fiu();
			trainingSelectionPanel.FadeOut();
			weekActionPanel.FadeIn();
		}
		else if (tournamentRegistrationPanel.pqc)
		{
			ldi = null;
			AudioManager.fiu();
			tournamentRegistrationPanel.FadeOut();
			weekActionPanel.FadeIn();
		}
		else if (weekActionPanel.pqc)
		{
			AudioManager.fiu();
			weekActionPanel.FadeOut();
			careerPanel.FadeIn();
		}
		else if (appearancePanel.pqc)
		{
			if (appearancePanel.pql)
			{
				AudioManager.fiu();
				Career.Current.MainCharacter.CharacterInfo = appearancePanel.nhh;
				nz.Save();
				appearancePanel.FadeOut();
				careerPanel.FadeIn();
			}
		}
		else if (historyPanel.pqc)
		{
			AudioManager.fiu();
			historyPanel.FadeOut();
			careerPanel.FadeIn();
		}
		else if (rewardsPanel.pqc)
		{
			AudioManager.fiu();
			rewardsPanel.FadeOut();
			careerPanel.FadeIn();
		}
		else if (worldMapPanel.pqc)
		{
			AudioManager.fiu();
			worldMapPanel.FadeOut();
			careerPanel.FadeIn();
		}
		else if (challengesPanel.pqc)
		{
			AudioManager.fiu();
			challengesPanel.FadeOut();
			careerPanel.FadeIn();
		}
		else if (playersDetailsPanel.pqc)
		{
			AudioManager.fiu();
			if (ldj.HasValue)
			{
				StartCoroutine(cyb());
				return;
			}
			playersDetailsPanel.FadeOut();
			playersDetailsPanel.ShowOnlySecondPairPlayer = false;
			careerPanel.FadeIn();
		}
		else if (settingsPanel.pqc)
		{
			AudioManager.fiu();
			settingsPanel.FadeOut();
			nz.Save();
			careerPanel.FadeIn();
		}
		else if (careerPanel.pqc)
		{
			SimpleModal.hib(this.gut("CareerMenu", "ExitSaveModal"), delegate
			{
				StartCoroutine(cyh());
			});
		}
		else
		{
			careerPanel.FadeIn();
		}
	}

	private void cxp(InputAction.CallbackContext a)
	{
		if (this.gus() && progressionPanel.pqc)
		{
			progressionPanel.FadeOut();
			if (ldk)
			{
				ldk = false;
				challengesPanel.FadeIn();
			}
			else
			{
				careerPanel.FadeIn();
			}
			cyi();
		}
	}

	public void cxq()
	{
		nz.Save();
		careerPanel.cyp();
	}

	public PlayersDetailsPanel cxr()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		playersDetailsPanel.FadeIn();
		return playersDetailsPanel;
	}

	public void cxs(CharacterStats a = null, CharacterStats b = null)
	{
		if (challengesPanel.pqc)
		{
			ldk = true;
			challengesPanel.FadeOut();
		}
		StartCoroutine(cxt(a, b));
	}

	private IEnumerator cxt(CharacterStats a = null, CharacterStats b = null)
	{
		progressionPanel.FadeIn();
		yield return new WaitForEndOfFrame();
		if (a != null && b != null)
		{
			progressionPanel.dbi(a, b);
		}
		else
		{
			progressionPanel.dbi(Career.Current.MainCharacter.StatsEvolution.SkipLast(1).Last().Value, Career.Current.MainCharacter.StatsEvolution.Last().Value);
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenPartnersPanel()
	{
		OpenPartnersPanel(null);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenPartnersPanel(TournamentCategory? category)
	{
		cxr();
		playersDetailsPanel.ShowOnlySecondPairPlayer = true;
		cxu(category);
	}

	private void cxu(TournamentCategory? a)
	{
		playersDetailsPanel.dba(new LocalizedString("CareerMenu", "Partners"), null, new CareerPair[1].Concat(cxv(Career.Current.piv)).ToList(), new CareerPair[1].Concat(cxv(TournamentCategory.MixedDoubles)).ToList(), cxw, a ?? Career.Current.piv, 0, 0, 0, delegate(ob a)
		{
			CareerPair lcc = a as CareerPair;
			if (lcc != null)
			{
				CareerPair careerPair = lcc;
				if (careerPair != null && careerPair.InvitationStatus == PairInvitationStatus.InvitationReceived)
				{
					SimpleModal.hia(this.gut("CareerMenu", "AcceptInvitationModal", lcc.mmr.CharacterInfo.pjm), delegate
					{
						wn.hpm("AcceptPartnerInvitation", new Dictionary<string, object>
						{
							{
								"Category",
								lcc.Category.ToString()
							},
							{
								"PartnerBestRank",
								Career.Current.flq(lcc.mmr)
							}
						});
						Career.Current.AcceptPartnerInvitation(lcc);
						cxu(playersDetailsPanel.oxz);
						cxq();
					}, delegate
					{
						wn.hpm("DeclinePartnerInvitation", new Dictionary<string, object>
						{
							{
								"Category",
								lcc.Category.ToString()
							},
							{
								"PartnerBestRank",
								Career.Current.flq(lcc.mmr)
							}
						});
						Career.Current.DeclinePartnerInvitation(lcc);
						cxu(playersDetailsPanel.oxz);
						cxq();
					}, d: true);
				}
			}
			else if (Career.Current.MainCharacter.Points == 0)
			{
				SimpleModal.hic(this.gut("CareerMenu", "ProveYourselfBeforeInviteModal"));
			}
			else
			{
				StartCoroutine(cxz());
			}
		});
	}

	private List<CareerPair> cxv(TournamentCategory a)
	{
		return (from a in Career.Current.MainCharacter.PendingPairs.Where((CareerPair a) => a.Category == a).Concat(Career.Current.flo(Career.Current.MainCharacter, a))
			orderby a.Complicity descending
			select a).ToList();
	}

	private void cxw(Table a, TournamentCategory b, List<ob> c)
	{
		a.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Name"), CompetitionParticipantName.hbq),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Ranking"), "Rank", TableColumn.ColumnType.Rank, 100f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Complicity"), "Complicity", TableColumn.ColumnType.Gauge, 200f)
		};
		a.BodyRowHeight = 40f;
		a.Rows = c.Select(cxx).Select((Dictionary<string, object> a, int b) => (a != null) ? new vu
		{
			nmq = a,
			nmt = ((a["Rank"] == null) ? new Color?(new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 76)) : new Color?(Color.white))
		} : new vu(cxy)).ToList();
		a.Refresh();
	}

	private Dictionary<string, object> cxx(ob a)
	{
		if (a == null)
		{
			return null;
		}
		CareerPair careerPair = (CareerPair)a;
		return new Dictionary<string, object>
		{
			{
				"Country1",
				careerPair.mmr.CharacterInfo.country
			},
			{ "Country2", null },
			{
				"Name1",
				careerPair.mmr.CharacterInfo.pjm
			},
			{ "Name2", null },
			{
				"Points",
				careerPair.pja ? ((object)careerPair.Points) : null
			},
			{
				"Rank",
				careerPair.pja ? careerPair.Rank : null
			},
			{
				"Complicity",
				careerPair.pja ? ((object)careerPair.Complicity) : this.gut("List_PairInvitationStatus", careerPair.InvitationStatus.ToString())
			}
		};
	}

	private static void cxy(GameObject a, vu b, int c, bool d, Table e)
	{
		GameObject obj = new GameObject("Text");
		obj.transform.SetParent(a.transform);
		obj.transform.localScale = Vector3.one;
		obj.AddComponent<RectTransform>().guk();
		TextMeshProUGUI textMeshProUGUI = obj.AddComponent<TextMeshProUGUI>();
		textMeshProUGUI.alignment = TextAlignmentOptions.Center;
		textMeshProUGUI.color = e.BodyForegroundColor;
		textMeshProUGUI.fontStyle = e.BodyFontStyle;
		textMeshProUGUI.fontSize = e.BodyFontSize;
		textMeshProUGUI.gur(new LocalizedString("CareerMenu_PartnersTable", "InvitePartner"));
	}

	private IEnumerator cxz()
	{
		ldj = playersDetailsPanel.oxz;
		yield return playersDetailsPanel.gxk();
		bool lcf = ((ldj == TournamentCategory.MixedDoubles) ? (Career.Current.MainCharacter.CharacterInfo.gender == "f") : (ldj == TournamentCategory.MenDoubles));
		List<CareerParticipant> list = (from a in Career.Current.Characters
			where a.CharacterInfo.country == Career.Current.MainCharacter.CharacterInfo.country && a.CharacterInfo.gender == (lcf ? "m" : "f") && a.CharacterId != Career.Current.MainCharacter.CharacterId
			orderby Career.Current.flq(a)
			select a).ToList();
		int lcg = Career.Current.flq(Career.Current.MainCharacter);
		int num = list.FindIndex((CareerParticipant a) => Career.Current.flq(a) > lcg);
		playersDetailsPanel.dba(new LocalizedString("CareerMenu_PartnersTable", "InvitePartner"), list, null, null, cya, Career.Current.piu, (num == -1) ? (list.Count - 1) : num, 0, 0, delegate(ob a)
		{
			CareerParticipant lcj = (CareerParticipant)a;
			if (Career.Current.Pairs.Where((CareerPair a) => a.fpf(Career.Current.MainCharacter.CharacterId)).Any((CareerPair a) => a.fpf(lcj.CharacterId)))
			{
				SimpleModal.hic(this.gut("CareerMenu", "CharacterAlreadyPaired", lcj.CharacterInfo.pjm));
			}
			else if (Career.Current.MainCharacter.PendingPairs.Any((CareerPair a) => a.fpf(lcj.CharacterId)))
			{
				SimpleModal.hic(this.gut("CareerMenu", "InvitationAlreadySent", lcj.CharacterInfo.pjm));
			}
			else if (Career.Current.MainCharacter.PendingPairs.Count >= 5)
			{
				SimpleModal.hic(this.gut("CareerMenu", "MaxInvitationsReached", 5));
			}
			else
			{
				wn.hpm("InvitePartner", new Dictionary<string, object>
				{
					{
						"Category",
						ldj.Value.ToString()
					},
					{
						"PartnerBestRank",
						Career.Current.flq(lcj)
					}
				});
				Career.Current.InvitePartner(lcj, ldj.Value);
				SimpleModal.hic(this.gut("CareerMenu", "InvitationSentModal", lcj.CharacterInfo.pjm), delegate
				{
					AudioManager.fiu();
					nz.Save();
					careerPanel.cyp();
					StartCoroutine(cyb());
				});
			}
		});
		playersDetailsPanel.FadeIn();
	}

	private void cya(Table a, TournamentCategory b, List<ob> c)
	{
		a.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Name"), CompetitionParticipantName.hbq),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Age"), "Age", TableColumn.ColumnType.Int, 80f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "SinglesRanking"), "SingleRank", TableColumn.ColumnType.Rank, 80f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "DoublesRanking"), "DoublesRank", TableColumn.ColumnType.Rank, 80f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "MixedRanking"), "MixedRank", TableColumn.ColumnType.Rank, 80f)
		};
		a.BodyRowHeight = 40f;
		a.Rows = c.Select(cyc).Select((Dictionary<string, object> a, int b) => new vu
		{
			nmq = a,
			nmt = (((bool)a["AlreadyPaired"]) ? new Color?(new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 76)) : new Color?(Color.white))
		}).ToList();
		a.Refresh();
		if (c.Any())
		{
			int lck = Career.Current.flq(Career.Current.MainCharacter);
			int num = c.FindIndex((ob a) => Career.Current.flq((CareerParticipant)a) > lck);
			a.pto = ((num == -1) ? (c.Count - 1) : num);
		}
	}

	private IEnumerator cyb()
	{
		yield return playersDetailsPanel.gxk();
		OpenPartnersPanel(ldj);
		ldj = null;
	}

	private Dictionary<string, object> cyc(ob a)
	{
		CareerParticipant careerParticipant = (CareerParticipant)a;
		return new Dictionary<string, object>
		{
			{
				"Country1",
				careerParticipant.CharacterInfo.country
			},
			{ "Country2", null },
			{
				"Name1",
				careerParticipant.CharacterInfo.pjm
			},
			{ "Name2", null },
			{ "Age", careerParticipant.pjc },
			{ "SingleRank", careerParticipant.Rank },
			{
				"DoublesRank",
				Career.Current.flp(careerParticipant, careerParticipant.pjb)?.Rank
			},
			{
				"MixedRank",
				Career.Current.flp(careerParticipant, TournamentCategory.MixedDoubles)?.Rank
			},
			{
				"AlreadyPaired",
				Career.Current.Pairs.Any((CareerPair a) => a.fpf(Career.Current.MainCharacter.piz) && a.fpf(a.piz)) || Career.Current.MainCharacter.PendingPairs.Any((CareerPair a) => a.fpf(a.piz))
			}
		};
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenWeekActions()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		weekActionPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenSettings()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		settingsPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenAppearance()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		appearancePanel.nhh = Career.Current.MainCharacter.CharacterInfo.fsp();
		appearancePanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenHistory()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		historyPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenRewards()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		rewardsPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenWorldMap()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		worldMapPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenChallenges()
	{
		AudioManager.fiu();
		careerPanel.FadeOut();
		challengesPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SelectRest()
	{
		AudioManager.fiv();
		wn.hpm("Rest", new Dictionary<string, object>
		{
			{
				"CareerStartDate",
				Career.Current.StartedDate.ToString()
			},
			{
				"CareerDate",
				Career.Current.CurrentDate.ToString()
			},
			{
				"Rankings",
				Career.Current.piy
			},
			{
				"Stats",
				Career.Current.MainCharacter.CharacterInfo.stats.ToString()
			}
		});
		weekActionPanel.FadeOut();
		StartCoroutine(cyd());
	}

	public IEnumerator cyd()
	{
		yield return fadeCanvas.gxj();
		Career.Current.flh();
		nz.Save();
		careerPanel.cyp();
		yield return fadeCanvas.gxk();
		careerPanel.FadeIn();
		cyi();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SelectTraining()
	{
		AudioManager.fiu();
		weekActionPanel.FadeOut();
		trainingSelectionPanel.FadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SelectTraining(tn trainingInfo)
	{
		AudioManager.fiv();
		Career.Current.CurrentTraining = new CareerTrainingScore(trainingInfo);
		wn.hpm("StartTraining", new Dictionary<string, object>
		{
			{
				"CareerStartDate",
				Career.Current.StartedDate.ToString()
			},
			{
				"CareerDate",
				Career.Current.CurrentDate.ToString()
			},
			{
				"Rankings",
				Career.Current.piy
			},
			{
				"Stats",
				Career.Current.MainCharacter.CharacterInfo.stats.ToString()
			},
			{
				"TrainingType",
				trainingInfo.nca.ToString()
			},
			{ "TrainingLevel", trainingInfo.ncb }
		});
		nz.Save();
		StartTraining();
	}

	public void cye(sz a)
	{
		AudioManager.fiu();
		ldi = a;
		weekActionPanel.FadeOut();
		tournamentRegistrationPanel.FadeIn();
	}

	public void cyf(Dictionary<TournamentCategory, CareerPair> a)
	{
		AudioManager.fiv();
		tournamentRegistrationPanel.FadeOut();
		foreach (KeyValuePair<TournamentCategory, CareerPair> item in a)
		{
			item.Deconstruct(out var key, out var value);
			TournamentCategory tournamentCategory = key;
			CareerPair pair = value;
			TournamentParticipant tournamentParticipant = (Tournament.gmy(tournamentCategory) ? new TournamentParticipant(pair) : new TournamentParticipant(Career.Current.MainCharacter.CharacterInfo));
			Career.Current.CurrentRegisteredTournaments.Add(new Tournament(ldi, tournamentCategory, tournamentParticipant, placePlayerInSecondPosition: false, tournamentParticipant.poj.Rank > ldi.poo));
		}
		wn.hpm("StartTournament", new Dictionary<string, object>
		{
			{
				"CareerStartDate",
				Career.Current.StartedDate.ToString()
			},
			{
				"CareerDate",
				Career.Current.CurrentDate.ToString()
			},
			{
				"Rankings",
				Career.Current.piy
			},
			{
				"Stats",
				Career.Current.MainCharacter.CharacterInfo.stats.ToString()
			},
			{ "TournamentType", ldi.Id },
			{
				"Categories",
				string.Join(',', a.Keys.ToList())
			}
		});
		nz.Save();
		StartTournament(Career.Current.CurrentRegisteredTournaments.First());
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartTraining()
	{
		MatchSettings.Current = Career.Current.flu();
		LoadingScreen.hfx("Gymnasium", nz.@for(a: true));
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void StartTournament(Tournament tournament)
	{
		StartCoroutine(cyg(tournament));
	}

	public IEnumerator cyg(Tournament a)
	{
		Tournament.Current = a;
		if (nz.mmn)
		{
			LoadingScreen.hfx("TournamentMenu", nz.@for(a: true));
			yield break;
		}
		yield return fadeCanvas.gxj();
		SceneManager.LoadScene("TournamentMenu");
	}

	public IEnumerator cyh()
	{
		if (nz.mmn)
		{
			LoadingScreen.hfx("MainMenu", nz.@for(a: false));
			yield break;
		}
		yield return fadeCanvas.gxj();
		Career.Current = null;
		SceneManager.LoadScene("MainMenu");
	}

	private void cyi()
	{
		if (Career.Current.Messages.Any())
		{
			SimpleModal.hic(Career.Current.Messages.Pop(), delegate
			{
				nz.Save();
				cyi();
			});
		}
	}

	[CompilerGenerated]
	private void cyj()
	{
		StartCoroutine(cyh());
	}

	[CompilerGenerated]
	private void cyk(ob a)
	{
		CareerPair lcc = a as CareerPair;
		if (lcc != null)
		{
			CareerPair careerPair = lcc;
			if (careerPair != null && careerPair.InvitationStatus == PairInvitationStatus.InvitationReceived)
			{
				SimpleModal.hia(this.gut("CareerMenu", "AcceptInvitationModal", lcc.mmr.CharacterInfo.pjm), delegate
				{
					wn.hpm("AcceptPartnerInvitation", new Dictionary<string, object>
					{
						{
							"Category",
							lcc.Category.ToString()
						},
						{
							"PartnerBestRank",
							Career.Current.flq(lcc.mmr)
						}
					});
					Career.Current.AcceptPartnerInvitation(lcc);
					cxu(playersDetailsPanel.oxz);
					cxq();
				}, delegate
				{
					wn.hpm("DeclinePartnerInvitation", new Dictionary<string, object>
					{
						{
							"Category",
							lcc.Category.ToString()
						},
						{
							"PartnerBestRank",
							Career.Current.flq(lcc.mmr)
						}
					});
					Career.Current.DeclinePartnerInvitation(lcc);
					cxu(playersDetailsPanel.oxz);
					cxq();
				}, d: true);
			}
		}
		else if (Career.Current.MainCharacter.Points == 0)
		{
			SimpleModal.hic(this.gut("CareerMenu", "ProveYourselfBeforeInviteModal"));
		}
		else
		{
			StartCoroutine(cxz());
		}
	}

	[CompilerGenerated]
	private void cyl()
	{
		nz.Save();
		cyi();
	}
}
