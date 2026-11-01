using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.Localization;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class RankingTab : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hg
	{
		public string let;

		internal vu dbl(Dictionary<string, object> a)
		{
			return new vu
			{
				nmt = ((let == (string)a.GetValueOrDefault("Id1") || let == (string)a.GetValueOrDefault("Id2")) ? new Color?(qh.mrj) : null),
				nmv = ((let == (string)a.GetValueOrDefault("Id1") || let == (string)a.GetValueOrDefault("Id2")) ? new FontStyles?(FontStyles.Bold) : null),
				nmq = a
			};
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro singlesCardTitle;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro doublesCardTitle;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table singlesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table doublesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table mixedTable;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += dbm;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= dbm;
	}

	private void dbm(InputAction.CallbackContext a)
	{
		if (this.gus())
		{
			PlayersDetailsPanel playersDetailsPanel = careerMenu.cxr();
			GameObject obj = EventSystem.current?.currentSelectedGameObject;
			TournamentCategory f = Career.Current.piu;
			if (obj == mixedTable.gameObject)
			{
				f = TournamentCategory.MixedDoubles;
			}
			if (obj == doublesTable.gameObject)
			{
				f = Career.Current.piv;
			}
			playersDetailsPanel.dba(new LocalizedString("CareerMenu", "Rankings"), Career.Current.pir, Career.Current.pis, Career.Current.pit, dbo, f, singlesTable.pto, doublesTable.pto, mixedTable.pto, null);
		}
	}

	public void dbn()
	{
		singlesCardTitle.plk = new LocalizedString("List_TournamentCategory", Career.Current.piu.ToString());
		doublesCardTitle.plk = new LocalizedString("List_TournamentCategory", Career.Current.piv.ToString());
		dbo(singlesTable, Career.Current.piu, ((IEnumerable<ob>)Career.Current.pir).ToList());
		dbo(doublesTable, Career.Current.piv, ((IEnumerable<ob>)Career.Current.pis).ToList());
		dbo(mixedTable, TournamentCategory.MixedDoubles, ((IEnumerable<ob>)Career.Current.pit).ToList());
		singlesTable.pto = Career.Current.MainCharacter.Rank.Value - 1;
		if (Career.Current.piw != null)
		{
			doublesTable.pto = Career.Current.piw.Rank.Value - 1;
		}
		if (Career.Current.pix != null)
		{
			mixedTable.pto = Career.Current.pix.Rank.Value - 1;
		}
	}

	private void dbo(Table a, TournamentCategory b, List<ob> c)
	{
		a.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("CareerMenu_RankingTable", "Name"), CompetitionParticipantName.hbq),
			new TableColumn(new LocalizedString("CareerMenu_RankingTable", "Points"), "Points", TableColumn.ColumnType.Int, 100f),
			new TableColumn(new LocalizedString("CareerMenu_RankingTable", "Ranking"), "Ranking", TableColumn.ColumnType.Int, 100f)
		};
		a.BodyRowHeight = ((b == Career.Current.piu) ? 40 : 70);
		string let = Career.Current.MainCharacter.CharacterId;
		IEnumerable<Dictionary<string, object>> source = ((b == Career.Current.piu) ? c.Cast<CareerParticipant>().Select(dbp) : c.Cast<CareerPair>().Select(dbq));
		a.Rows = source.Select((Dictionary<string, object> a) => new vu
		{
			nmt = ((let == (string)a.GetValueOrDefault("Id1") || let == (string)a.GetValueOrDefault("Id2")) ? new Color?(qh.mrj) : null),
			nmv = ((let == (string)a.GetValueOrDefault("Id1") || let == (string)a.GetValueOrDefault("Id2")) ? new FontStyles?(FontStyles.Bold) : null),
			nmq = a
		}).ToList();
		a.Refresh();
	}

	private Dictionary<string, object> dbp(CareerParticipant a)
	{
		return new Dictionary<string, object>
		{
			{
				"Country1",
				a.CharacterInfo.country
			},
			{ "Country2", null },
			{ "Id1", a.CharacterId },
			{
				"Name1",
				a.CharacterInfo.pjm
			},
			{ "Name2", null },
			{ "Points", a.Points },
			{
				"Ranking",
				Career.flr(a.Rank, a.PreviousRank)
			}
		};
	}

	private Dictionary<string, object> dbq(CareerPair a)
	{
		return new Dictionary<string, object>
		{
			{
				"Country1",
				a.mmq.CharacterInfo.country
			},
			{
				"Country2",
				a.mmr.CharacterInfo.country
			},
			{ "Id1", a.CharacterAId },
			{ "Id2", a.CharacterBId },
			{
				"Name1",
				a.mmq.CharacterInfo.pjm
			},
			{
				"Name2",
				a.mmr.CharacterInfo.pjm
			},
			{ "Points", a.Points },
			{
				"Ranking",
				Career.flr(a.Rank, a.PreviousRank)
			}
		};
	}
}
