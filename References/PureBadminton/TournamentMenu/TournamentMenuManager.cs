using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentMenuManager : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentMenuPanel tournamentPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private MatchPreviewPanel matchPreviewPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private SummaryPanel summaryPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel fadeCanvas;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Gauge energyGauge;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharactersPreviewScene CharactersPreview;

	private bool oem;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		RefreshRateManager.gjd();
		if (qu.mug != null)
		{
			Tournament.Current.gnk(qu.mug);
			Save();
			summaryPanel.FadeIn();
			summaryPanel.hko(qu.mug);
			qu.mug = null;
		}
		else
		{
			tournamentPanel.FadeIn();
		}
		energyGauge.hdu(Tournament.Current.pnv.pof.stats);
		energyGauge.prm = Tournament.Current.pnv.CharacterAEnergy;
		Tournament.Current.gnc();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pkm.performed += iwn;
		qi.pli.pkn.performed += iwl;
		qi.pli.pkk.performed += iwm;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkm.performed -= iwn;
		qi.pli.pkn.performed -= iwl;
		qi.pli.pkk.performed -= iwm;
	}

	private void iwl(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (matchPreviewPanel.pqc)
		{
			AudioManager.fiu();
			matchPreviewPanel.FadeOut();
			tournamentPanel.FadeIn();
		}
		else
		{
			if (!tournamentPanel.pqc)
			{
				return;
			}
			if (Tournament.Current.pob && Career.Current != null)
			{
				StartCoroutine(iwp());
				return;
			}
			SimpleModal.hib((Career.Current != null) ? this.gut("CareerMenu", "ExitSaveModal") : this.gut("TournamentMenu", Tournament.Current.pob ? "ExitModal" : "ExitSaveModal"), delegate
			{
				Exit();
			});
		}
	}

	private void iwm(InputAction.CallbackContext a)
	{
		if (this.gus() && matchPreviewPanel.pqc)
		{
			AudioManager.fiu();
			StartCoroutine(iwo());
		}
	}

	private void iwn(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (summaryPanel.pqc)
		{
			AudioManager.fiu();
			summaryPanel.FadeOut();
			tournamentPanel.FadeIn();
			Tournament.Current.pnx.Stats.geo();
			iwq();
		}
		else if (matchPreviewPanel.pqc)
		{
			if (!oem)
			{
				oem = true;
				AudioManager.fiv();
				MatchSettings.Current = Tournament.Current.gnm(Tournament.Current.pnw);
				wn.hpn("StartMatch");
				LoadingScreen.hfx(rr.gji(Tournament.Current.Properties.Stadium));
			}
		}
		else if (tournamentPanel.pqc)
		{
			if (!Tournament.Current.pob)
			{
				AudioManager.fiu();
				tournamentPanel.FadeOut();
				matchPreviewPanel.FadeIn();
			}
			else if (Career.Current != null)
			{
				StartCoroutine(iwp());
			}
		}
	}

	public IEnumerator iwo()
	{
		matchPreviewPanel.FadeOut();
		yield return fadeCanvas.gxj();
		yield return new WaitForSeconds(1f);
		TournamentMatch tournamentMatch = Tournament.Current.pnw;
		MatchSettings matchSettings = Tournament.Current.gnm(tournamentMatch);
		qu qu2 = ri.ggb(matchSettings, tournamentMatch.TeamA.poi, tournamentMatch.TeamB.poi);
		Tournament.Current.gnk(qu2);
		Save();
		tournamentPanel.ixb();
		MatchSettings.PositionOnCourt? positionOnCourt = matchSettings.plv.Find((MatchSettings.PlayerSettings a) => a.DeviceId.HasValue)?.Position;
		if (positionOnCourt.HasValue)
		{
			bool flag = MatchSettings.gcl(positionOnCourt.Value);
			wn.hpn("SkipMatch", new Dictionary<string, object>
			{
				{
					"Scores",
					string.Join(" | ", qu2.mui.Select((re a) => $"{a.pmi}-{a.pmj}"))
				},
				{
					"Win",
					flag ^ !qu2.Recap.pmf
				},
				{
					"ScoreBalance",
					qu2.mui.Sum((re a) => a.pmi - a.pmj) * (flag ? 1 : (-1))
				}
			});
		}
		energyGauge.prm = Tournament.Current.pnv.CharacterAEnergy;
		yield return fadeCanvas.gxk();
		summaryPanel.FadeIn();
		summaryPanel.hko(qu2);
	}

	public IEnumerator iwp()
	{
		yield return fadeCanvas.gxj();
		SceneManager.LoadScene("CareerMenu");
	}

	private void iwq()
	{
		TournamentMatch tournamentMatch = Tournament.Current.pnx;
		TournamentMatch tournamentMatch2 = Tournament.Current.pnw;
		string text = null;
		if (tournamentMatch2 != null && !tournamentMatch2.GroupId.HasValue)
		{
			string text2 = ss.gny(Tournament.Current, Tournament.Current.pnz, Tournament.Current.QualificationMatches.Contains(tournamentMatch2));
			string text3 = this.gut("TournamentMenu_Phases", "The" + text2);
			text = ((!tournamentMatch.GroupId.HasValue) ? this.gut("TournamentMenu", "QualifiedModal", text3) : this.gut("TournamentMenu", "GroupQualifiedModal", text3));
		}
		string text4 = this.gut("List_TournamentType", Tournament.Current.Properties.Id);
		if (Tournament.Current.RoundMatches.Contains(tournamentMatch) && tournamentMatch.RoundId == 1 && Tournament.Current.gnn(tournamentMatch.poc))
		{
			text = this.gut("TournamentMenu", "WinTournamentModal", text4);
		}
		if (tournamentMatch2 == null && (tournamentMatch.GroupId.HasValue || !Tournament.Current.gnn(tournamentMatch.poc)))
		{
			text = this.gut("TournamentMenu", "LostTournamentModal");
		}
		if (text != null)
		{
			SimpleModal.hic(text);
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Save()
	{
		if (Career.Current != null)
		{
			nz.Save();
		}
		else
		{
			qa.Save(Tournament.Current);
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	private void Exit()
	{
		if (Tournament.Current.pob)
		{
			qa.fze(Tournament.Current);
		}
		Tournament.Current = null;
		if (Career.Current != null && nz.mmn)
		{
			LoadingScreen.hfx("Gymnasium", iwr());
		}
		else
		{
			SceneManager.LoadScene("MainMenu");
		}
	}

	private IEnumerator iwr()
	{
		yield return nz.@for(a: false);
		Career.Current = null;
	}

	[CompilerGenerated]
	private void iws()
	{
		Exit();
	}
}
