using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class PlayersDetailsPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class he
	{
		public CareerPair lee;

		internal bool dar(CareerParticipant a)
		{
			return a.piz == lee.CharacterAId;
		}

		internal bool das(CareerParticipant a)
		{
			return a.piz == lee.CharacterBId;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro title;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication startButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TabsManager tabsManager;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject playerCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PlayersDetailsPanelStats characterAStats;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PlayersDetailsPanelStats characterBStats;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table singlesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table doublesTable;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table mixedTable;

	private List<CareerParticipant> lef;

	private List<CareerPair> leg;

	private List<CareerPair> leh;

	private Action<ob> lei;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool ShowOnlySecondPairPlayer;

	private CharacterIdlePose oxy
	{
		get
		{
			if (!(UnityEngine.Random.value > 0.5f))
			{
				return CharacterIdlePose.Default;
			}
			return CharacterIdlePose.CrossedArms;
		}
	}

	public TournamentCategory oxz => tabsManager.ptp switch
	{
		0 => Career.Current.piu, 
		1 => Career.Current.piv, 
		_ => TournamentCategory.MixedDoubles, 
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += dax;
		tabsManager.nmx += dav;
		singlesTable.nmo += daw;
		doublesTable.nmo += daw;
		mixedTable.nmo += daw;
		this.guz(delegate
		{
			dav(tabsManager.ptp);
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= dax;
		tabsManager.nmx -= dav;
		singlesTable.nmo -= daw;
		doublesTable.nmo -= daw;
		mixedTable.nmo -= daw;
	}

	protected override void cyr()
	{
		base.cyr();
		careerMenu.CharactersPreview.hbi();
	}

	private void dav(int a)
	{
		daz();
		List<TabsManager.Tab> tabs = tabsManager.Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.transform.Find("Border").gameObject.SetActive(i == a);
		}
	}

	private void daw(int a)
	{
		daz();
	}

	private void dax(InputAction.CallbackContext a)
	{
		if (this.gus() && lei != null)
		{
			lei(dbb());
		}
	}

	private void daz()
	{
		ob ob2 = dbb();
		playerCard.SetActive(ob2 != null);
		CareerPair lee = ob2 as CareerPair;
		CareerParticipant careerParticipant = ob2 as CareerParticipant;
		if (lee != null && ShowOnlySecondPairPlayer)
		{
			careerParticipant = lee.mmr;
			lee = null;
		}
		characterBStats.gameObject.SetActive(lee != null);
		if (ob2 == null)
		{
			careerMenu.CharactersPreview.hbi();
		}
		else if (lee != null)
		{
			CharacterInfo characterInfo = lee.mmr.CharacterInfo.fsp();
			characterInfo.fsu(lee.mmq.CharacterInfo.outfit, b: true);
			careerMenu.CharactersPreview.hbh((CharactersPreviewScenePosition.RightPairA, lee.mmq.CharacterInfo, oxy), (CharactersPreviewScenePosition.RightPairB, characterInfo, oxy));
			characterAStats.dbd(Career.Current.Characters.Find((CareerParticipant a) => a.piz == lee.CharacterAId));
			characterBStats.dbd(Career.Current.Characters.Find((CareerParticipant a) => a.piz == lee.CharacterBId));
		}
		else
		{
			careerMenu.CharactersPreview.hbg(CharactersPreviewScenePosition.Right, careerParticipant.CharacterInfo, oxy);
			characterAStats.dbd(careerParticipant);
		}
	}

	public void dba(LocalizedString a, List<CareerParticipant> b, List<CareerPair> c, List<CareerPair> d, Action<Table, TournamentCategory, List<ob>> e, TournamentCategory f, int g, int h, int i, Action<ob> j)
	{
		title.plk = a;
		lef = b;
		leg = c;
		leh = d;
		lei = j;
		tabsManager.Tabs[0].Disabled = b == null;
		tabsManager.Tabs[1].Disabled = c == null;
		tabsManager.Tabs[2].Disabled = d == null;
		if (b != null)
		{
			e(singlesTable, Career.Current.piu, ((IEnumerable<ob>)b).ToList());
		}
		if (c != null)
		{
			e(doublesTable, Career.Current.piv, ((IEnumerable<ob>)c).ToList());
		}
		if (d != null)
		{
			e(mixedTable, TournamentCategory.MixedDoubles, ((IEnumerable<ob>)d).ToList());
		}
		switch (f)
		{
		case TournamentCategory.MixedDoubles:
			tabsManager.ptp = 2;
			break;
		case TournamentCategory.MenDoubles:
		case TournamentCategory.WomenDoubles:
			tabsManager.ptp = 1;
			break;
		default:
			tabsManager.ptp = 0;
			break;
		}
		if (b != null && b.Any())
		{
			singlesTable.pto = g;
		}
		if (c != null && c.Any())
		{
			doublesTable.pto = h;
		}
		if (d != null && d.Any())
		{
			mixedTable.pto = i;
		}
		tabsManager.transform.GetChild(0).gameObject.SetActive(tabsManager.Tabs.Count((TabsManager.Tab a) => !a.Disabled) > 1);
		startButtonIndication.gameObject.SetActive(j != null);
	}

	private ob dbb()
	{
		List<ob> list = tabsManager.ptp switch
		{
			0 => ((IEnumerable<ob>)lef).ToList(), 
			1 => ((IEnumerable<ob>)leg).ToList(), 
			_ => ((IEnumerable<ob>)leh).ToList(), 
		};
		Table table = tabsManager.ptp switch
		{
			0 => singlesTable, 
			1 => doublesTable, 
			_ => mixedTable, 
		};
		if (!list.Any() || list.Count <= table.pto)
		{
			return null;
		}
		return list[table.pto];
	}

	[CompilerGenerated]
	private void dbc()
	{
		dav(tabsManager.ptp);
	}
}
