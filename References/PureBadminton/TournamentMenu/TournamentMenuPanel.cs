using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentMenuPanel : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum TournamentPanelTabs
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Participants,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Groups,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Qualifications,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Knockout
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro tournamentTitle;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro tournamentCategory;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro tournamentStatus;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table participantsTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TournamentGroupsPanel groupsPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private KnockoutTree qualificationsKnockoutTree;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private KnockoutTree knockoutTree;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication startButtonIndication;

	private float pws => Tournament.Current.pny ? 70 : 40;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		ixb();
		GetComponent<TabsManager>().nmx += iwz;
	}

	private void iwz(int a)
	{
		List<TabsManager.Tab> tabs = GetComponent<TabsManager>().Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.GetComponent<Image>().enabled = i == a;
		}
		if (a == 0)
		{
			participantsTable.pto = Tournament.Current.Participants.FindIndex((TournamentParticipant a) => Tournament.Current.gnn(a));
		}
	}

	private TournamentMatch ixa(List<TournamentMatch> a)
	{
		return a.LastOrDefault((TournamentMatch a) => Tournament.Current.gnn(a.TeamA) || Tournament.Current.gnn(a.TeamB)) ?? a.FirstOrDefault((TournamentMatch a) => a.RoundId == 1);
	}

	public void ixb()
	{
		startButtonIndication.gameObject.SetActive(!Tournament.Current.pob || Career.Current != null);
		if (Tournament.Current.pob)
		{
			startButtonIndication.LocalizedString = new LocalizedString("Global", "Continue");
		}
		GetComponent<TabsManager>().Tabs[1].Disabled = !Tournament.Current.Properties.GroupCount.HasValue;
		GetComponent<TabsManager>().Tabs[2].Disabled = !Tournament.Current.Properties.QualificationRounds.HasValue;
		TournamentPanelTabs a2 = TournamentPanelTabs.Knockout;
		if (Tournament.Current.poa == TournamentPhase.Groups)
		{
			a2 = TournamentPanelTabs.Groups;
		}
		if (Tournament.Current.poa == TournamentPhase.Qualifications)
		{
			a2 = TournamentPanelTabs.Qualifications;
		}
		GetComponent<TabsManager>().ptp = (int)a2;
		tournamentTitle.plk = new LocalizedString("List_TournamentType", Tournament.Current.Properties.Id);
		tournamentCategory.plk = new LocalizedString("List_TournamentCategory", Tournament.Current.Category.ToString());
		tournamentStatus.plk = ss.gnx(Tournament.Current, Tournament.Current.pnz, Tournament.Current.poa == TournamentPhase.Qualifications);
		participantsTable.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Name"), CompetitionParticipantName.hbq),
			new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Ranking"), "Ranking", TableColumn.ColumnType.Rank)
		};
		if (Tournament.Current.Properties.GroupCount.HasValue)
		{
			participantsTable.Columns.Add(new TableColumn("Poule", "Group", TableColumn.ColumnType.String));
		}
		participantsTable.BodyRowHeight = pws;
		participantsTable.Rows = (from a in Tournament.Current.Participants.Concat(Tournament.Current.QualificationParticipants)
			orderby a.gor().GetValueOrDefault() descending
			select new vu
			{
				nmt = (Tournament.Current.gnn(a) ? new Color?(qh.mrj) : null),
				nmv = (Tournament.Current.gnn(a) ? new FontStyles?(FontStyles.Bold) : null),
				nmq = new Dictionary<string, object>
				{
					{
						"Country1",
						a.pof.country
					},
					{
						"Country2",
						a.pog?.country
					},
					{
						"Name1",
						a.pof.pjm
					},
					{
						"Name2",
						a.pog?.pjm
					},
					{
						"Ranking",
						a.gos()
					},
					{
						"Group",
						a.GroupId.HasValue ? ("Poule " + a.pok) : null
					}
				}
			}).ToList();
		participantsTable.Refresh();
		groupsPanel.Refresh();
		if (Tournament.Current.Properties.QualificationRounds.HasValue)
		{
			qualificationsKnockoutTree.Tournament = Tournament.Current;
			qualificationsKnockoutTree.Refresh();
			qualificationsKnockoutTree.pwd = ixa(qualificationsKnockoutTree.pwf);
		}
		knockoutTree.Tournament = Tournament.Current;
		knockoutTree.Refresh();
		knockoutTree.pwd = ixa(knockoutTree.pwf);
		iwz(GetComponent<TabsManager>().ptp);
	}
}
