using System.Collections.Generic;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CalendarTab : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table table;

	private int lcb;

	public void cvq()
	{
		table.Columns = new List<TableColumn>
		{
			new TableColumn("", cvr)
		};
		table.BodyRowHeight = 80f;
		List<vu> list = new List<vu>();
		for (int i = 0; i < 52; i++)
		{
			CareerDate careerDate = Career.Current.CurrentDate.fov(i);
			list.Add(new vu
			{
				nmq = new Dictionary<string, object>
				{
					{ "Date", careerDate },
					{
						"Tournaments",
						tk.gqk(careerDate).ToArray()
					}
				}
			});
		}
		table.Rows = list;
		table.Refresh();
	}

	public void cvr(GameObject a, vu b, int c, bool d, Table e)
	{
		WeekTournaments weekTournaments = Object.Instantiate(WeekTournaments.puf, a.transform);
		weekTournaments.GetComponent<RectTransform>().guk();
		weekTournaments.hog((CareerDate)b.nmq["Date"], (sz[])b.nmq["Tournaments"], lcb, (c == 0) ? Color.white : qh.mrs, (c == 0) ? new FontStyles?(FontStyles.Bold) : null);
	}
}
