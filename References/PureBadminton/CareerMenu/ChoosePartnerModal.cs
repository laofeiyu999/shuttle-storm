using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ChoosePartnerModal : ModalManager
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hb
	{
		public ChoosePartnerModal ldr;

		public sz lds;

		internal Dictionary<string, object> czt(CareerPair a)
		{
			return ldr.daa(a, lds);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table table;

	private sz ldz;

	private List<CareerPair> lea;

	private Action<CareerPair> leb;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += czy;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= czy;
	}

	private void czy(InputAction.CallbackContext a)
	{
		if (lea.Any() && table.pto < lea.Count)
		{
			CareerPair careerPair = lea[table.pto];
			if (careerPair.Rank <= (ldz.pop ?? ldz.poo))
			{
				Close();
				leb(careerPair);
			}
		}
	}

	private IEnumerator czz(sz a, TournamentCategory b)
	{
		yield return new WaitForEndOfFrame();
		lea = (from CareerPair a in Career.Current.Rankings[b]
			where a.fpf(Career.Current.MainCharacter.CharacterId)
			select a).ToList();
		table.Columns = new List<TableColumn>
		{
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Name"), CompetitionParticipantName.hbq),
			new TableColumn("", dab, 150f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Ranking"), "Rank", TableColumn.ColumnType.Rank, 100f),
			new TableColumn(new LocalizedString("CareerMenu_PartnersTable", "Complicity"), "Complicity", TableColumn.ColumnType.Gauge, 200f)
		};
		table.BodyRowHeight = 40f;
		table.Rows = lea.Select((CareerPair a) => daa(a, a)).Select((Dictionary<string, object> a, int b) => new vu
		{
			nmq = a
		}).ToList();
		table.Refresh();
	}

	private Dictionary<string, object> daa(CareerPair a, sz b)
	{
		return new Dictionary<string, object>
		{
			{
				"Country1",
				a.mmr.CharacterInfo.country
			},
			{ "Country2", null },
			{
				"Name1",
				a.mmr.CharacterInfo.pjm
			},
			{ "Name2", null },
			{ "Rank", a.Rank },
			{ "Complicity", a.Complicity }
		};
	}

	private void dab(GameObject a, vu b, int c, bool d, Table e)
	{
		if ((int)b.nmq["Rank"] > ldz.poo)
		{
			TextMeshProUGUI textMeshProUGUI = a.AddComponent<TextMeshProUGUI>();
			e.hlc(textMeshProUGUI, b, d);
			bool flag = ldz.pop.HasValue && (int)b.nmq["Rank"] < ldz.pop;
			textMeshProUGUI.text = this.gut("CareerMenu_TournamentRegistration", flag ? "QualificationsOnly" : "InsufficientRanking");
			textMeshProUGUI.color = (flag ? qh.mrm : qh.mrl);
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Open(sz tournament, TournamentCategory category, Action<CareerPair> onChoosePair)
	{
		ChoosePartnerModal component = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/Career/ChoosePartnerModal")).GetComponent<ChoosePartnerModal>();
		component.AutoClose = true;
		component.CloseOnBack = true;
		component.DestroyOnClose = true;
		component.Open(delegate
		{
		});
		component.ldz = tournament;
		component.leb = onChoosePair;
		component.StartCoroutine(component.czz(tournament, category));
	}
}
