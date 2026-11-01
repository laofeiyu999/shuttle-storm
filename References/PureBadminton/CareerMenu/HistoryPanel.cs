using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class HistoryPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hd
	{
		public TournamentCategory lec;

		public HistoryPanel led;

		internal bool dad((CareerDate, te) a)
		{
			if (a.Item2.Category == lec)
			{
				return a.Item2.poq;
			}
			return false;
		}

		internal vu dae((CareerDate, te) a)
		{
			return led.daj(a.Item1, a.Item2);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro singlesTabText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro doublesTabText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table singlesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table doublesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table mixedTables;

	private TabsManager oxx => GetComponent<TabsManager>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		oxx.nmx += dag;
		this.guz(delegate
		{
			dag(oxx.ptp);
		});
		dah();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		oxx.nmx -= dag;
	}

	private void dag(int a)
	{
		List<TabsManager.Tab> tabs = oxx.Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.transform.Find("Border").gameObject.SetActive(i == a);
		}
	}

	private void dah()
	{
		singlesTabText.plk = new LocalizedString("List_TournamentCategory", Career.Current.piu.ToString());
		doublesTabText.plk = new LocalizedString("List_TournamentCategory", Career.Current.piv.ToString());
		dai(Career.Current.piu, singlesTable);
		dai(Career.Current.piv, doublesTable);
		dai(TournamentCategory.MixedDoubles, mixedTables);
	}

	private void dai(TournamentCategory a, Table b)
	{
		b.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("CareerMenu_HistoryTable", "Date"), "Date", TableColumn.ColumnType.String),
			new TableColumn(new LocalizedString("CareerMenu_HistoryTable", "Series"), "Series", TableColumn.ColumnType.String),
			new TableColumn(new LocalizedString("CareerMenu_HistoryTable", "Tournament"), "Tournament", TableColumn.ColumnType.String),
			new TableColumn(new LocalizedString("CareerMenu_HistoryTable", "Position"), "Result", TableColumn.ColumnType.String),
			new TableColumn(new LocalizedString("CareerMenu_HistoryTable", "PointsEarned"), "Points", TableColumn.ColumnType.String)
		};
		b.BodyRowHeight = 40f;
		IEnumerable<(CareerDate, te)> source = Career.Current.Tournaments.Where(((CareerDate, te) a) => a.Item2.Category == a && a.Item2.poq).Reverse();
		b.Rows = source.Select(((CareerDate, te) a) => daj(a.Item1, a.Item2)).ToList();
	}

	private vu daj(CareerDate a, te b)
	{
		string a2 = b.Participants.First((string a) => te.gqb(a, Career.Current.MainCharacter.CharacterId));
		return new vu
		{
			nmq = new Dictionary<string, object>
			{
				{
					"Date",
					a.fos(DayOfWeek.Tuesday).ToString("d", LocalizationSettings.SelectedLocale.Identifier.CultureInfo)
				},
				{
					"Series",
					this.gut("List_TournamentSeries", b.Properties.Series.ToString())
				},
				{
					"Tournament",
					this.gut("List_TournamentType", b.Properties.Id)
				},
				{
					"Result",
					this.gut("List_TournamentResultPosition", b.gqd(a2).ToString())
				},
				{
					"Points",
					b.gqe(a2)
				}
			}
		};
	}

	[CompilerGenerated]
	private void dak()
	{
		dag(oxx.ptp);
	}
}
