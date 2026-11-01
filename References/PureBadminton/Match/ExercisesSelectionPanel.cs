using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ExercisesSelectionPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mu
	{
		public ExercisesSelectionPanel miv;

		public CareerTrainingScore miw;

		internal vu fdy(tp a, int b)
		{
			return new vu(new Dictionary<string, object>
			{
				{
					"Label",
					miv.gut("Training", a.nch)
				},
				{
					"Score",
					(miw.Scores.Count > b) ? miw.Scores[b] : null
				},
				{
					"Medal",
					(miw.Scores.Count > b && miw.Scores[b].HasValue) ? a.gqz(miw.Scores[b].Value) : null
				}
			});
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI title;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table table;

	public int phv => table.pto;

	public void fea(CareerTrainingScore a)
	{
		title.text = this.gut("Training", a.TrainingInfo.nca.ToString()) + " - " + this.gut("Training", "Level", a.TrainingInfo.ncb);
		table.BodyRowHeight = 60f;
		GetComponent<RectTransform>().gum(100f + (float)(a.TrainingInfo.ncc.Count + 1) * table.BodyRowHeight.Value + 5f);
		table.Columns = new List<TableColumn>
		{
			new TableColumn("Medal", feb, 100f),
			new TableColumn("Label", "Label", TableColumn.ColumnType.String)
		};
		table.Rows = a.TrainingInfo.ncc.Select((tp a, int b) => new vu(new Dictionary<string, object>
		{
			{
				"Label",
				this.gut("Training", a.nch)
			},
			{
				"Score",
				(a.Scores.Count > b) ? a.Scores[b] : null
			},
			{
				"Medal",
				(a.Scores.Count > b && a.Scores[b].HasValue) ? a.gqz(a.Scores[b].Value) : null
			}
		})).ToList();
		table.Rows.Add(new vu(new Dictionary<string, object>
		{
			{
				"Label",
				this.gut("Training", "FinishTraining")
			},
			{ "Score", null },
			{ "Medal", null }
		}));
		table.Refresh();
	}

	private static void feb(GameObject a, vu b, int c, bool d, Table e)
	{
		if (b.nmq["Score"] != null)
		{
			GameObject obj = new GameObject("Image");
			obj.transform.SetParent(a.transform, worldPositionStays: false);
			obj.AddComponent<RectTransform>().sizeDelta = new Vector2(30f, 45f);
			obj.AddComponent<Image>().sprite = vk.hgm((MedalType?)b.nmq["Medal"]);
		}
	}
}
