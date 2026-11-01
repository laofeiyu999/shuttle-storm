using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Localization;
using UnityEngine.Localization.SmartFormat.PersistentVariables;
using UnityEngine.UI;

[RequireComponent(typeof(ScrollRect))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentGroupsPanel : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bdi
	{
		public Table oea;

		public TournamentGroupsPanel oeb;

		internal void ivr()
		{
			oeb.ivv(oea.transform);
		}
	}

	private ScrollRect oec;

	private RectTransform pwk => oec.content;

	private float pwl => Tournament.Current.pny ? 70 : 40;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		oec = GetComponent<ScrollRect>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		this.guz(ivu);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Refresh()
	{
		if (!Tournament.Current.Properties.GroupCount.HasValue)
		{
			return;
		}
		Dictionary<int, List<TournamentParticipant>> dictionary = Tournament.Current.gnl();
		if (pwk.childCount == 0)
		{
			GameObject original = Resources.Load<GameObject>("UI/Pool");
			for (int i = 0; i < Tournament.Current.Properties.GroupCount.Value; i++)
			{
				GameObject gameObject = Object.Instantiate(original, pwk);
				gameObject.name = $"Pool {i}";
				gameObject.transform.Find("Title").GetComponent<LocalizedTextMeshPro>().plk = new LocalizedString("TournamentMenu", "GroupX") { 
				{
					"0",
					new StringVariable
					{
						Value = Tournament.gmz(i)
					}
				} };
				Table oea = gameObject.transform.Find("Table").GetComponent<Table>();
				oea.nmp += delegate
				{
					ivv(oea.transform);
				};
			}
		}
		for (int j = 0; j < Tournament.Current.Properties.GroupCount.Value; j++)
		{
			Table component = pwk.GetChild(j).gameObject.transform.Find("Table").GetComponent<Table>();
			component.Columns = new List<TableColumn>
			{
				new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Name"), CompetitionParticipantName.hbq),
				new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Points"), "VictoryPoints", TableColumn.ColumnType.Int, 90f),
				new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Sets"), "Sets", TableColumn.ColumnType.Int, 80f),
				new TableColumn(new LocalizedString("TournamentMenu_PlayersTable", "Points"), "Points", TableColumn.ColumnType.Int, 90f)
			};
			component.BodyRowHeight = pwl;
			component.Rows = dictionary[j].Select((TournamentParticipant a) => new vu
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
						"VictoryPoints",
						a.PoolResults.VictoryPoints
					},
					{
						"Sets",
						a.PoolResults.Sets
					},
					{
						"Points",
						a.PoolResults.Points
					}
				}
			}).ToList();
			component.Refresh();
		}
	}

	public void ivu()
	{
		if (!Tournament.Current.pnv.GroupId.HasValue)
		{
			return;
		}
		int value = Tournament.Current.pnv.GroupId.Value;
		Transform transform = pwk.GetChild(value).Find("Table");
		if (transform != null)
		{
			EventSystem.current.SetSelectedGameObject(transform.gameObject);
			transform.GetComponent<Table>().pto = Tournament.Current.gnl()[value].FindIndex((TournamentParticipant a) => Tournament.Current.gnn(a));
			ivv(transform);
		}
	}

	private void ivv(Transform a)
	{
		Canvas.ForceUpdateCanvases();
		float width = pwk.rect.width;
		float width2 = oec.viewport.rect.width;
		if (!(width <= width2))
		{
			RectTransform obj = (RectTransform)a;
			Vector3 position = obj.TransformPoint(obj.rect.center);
			float num = pwk.InverseTransformPoint(position).x - pwk.rect.xMin;
			oec.horizontalNormalizedPosition = Mathf.Clamp01((num - width2 / 2f) / (width - width2));
		}
	}
}
