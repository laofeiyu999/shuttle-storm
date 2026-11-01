using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class bdy
	{
		public MatchSettings.PositionOnCourt ohl { get; set; }

		public string ohm { get; set; }

		public bool ohn { get; set; }

		public int? oho { get; set; }

		public int? ohp { get; set; }

		public List<int> ohq { get; set; }

		public CharacterPreview ohr { get; set; }
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bdz
	{
		public bdy ohs;

		public CharacterMenuManager oht;

		public int ohu;

		internal bool jeb(CharacterInfo a)
		{
			return a.id == ohs.ohm;
		}

		internal bool jec(bdy a)
		{
			if (a.ohn)
			{
				return a.ohm == oht.pyg[ohu].id;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bea
	{
		public MatchSettings.PlayerSettings ohv;

		internal bool jed(CharacterInfo a)
		{
			return a.id == ohv.CharacterInfo?.id;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class beb
	{
		public bdy ohw;

		internal bool jee(bdy a)
		{
			return a.ohl == MatchSettings.gcn(ohw.ohl);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bec
	{
		public CharacterInfo ohx;

		internal bool jef(bdy a)
		{
			return a.ohm == ohx.id;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bed
	{
		public bdy ohy;

		public CharacterInfo ohz;

		internal bool jeg(CharacterInfo a)
		{
			return a.id == ohy.ohm;
		}

		internal bool jeh(CharacterInfo a)
		{
			return a.gender != ohz.gender;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bee
	{
		public string oia;

		internal bool jei(bdy a)
		{
			if (a.ohn)
			{
				return a.ohm == oia;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bef
	{
		public int oib;

		public bdy oic;

		internal bool jej(bdy a)
		{
			return a.ohp == oib;
		}

		internal bool jek(bdy a)
		{
			return a.ohl == MatchSettings.gcn(oic.ohl);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class beg
	{
		public bdy oid;

		public bef oie;

		internal bool jel(bdy a)
		{
			if (a.ohl != oie.oic.ohl)
			{
				if (oid != null)
				{
					return a.ohl != oid.ohl;
				}
				return true;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class beh
	{
		public MatchSettings.PositionOnCourt oif;

		public string oig;

		internal bool jem(bdy a)
		{
			return a.ohl == oif;
		}

		internal bool jen(CharacterInfo a)
		{
			return a.id == oig;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bei
	{
		public bdy oih;

		internal bool jeo(bdy a)
		{
			if (a.ohn)
			{
				return a.ohm == oih.ohm;
			}
			return false;
		}

		internal bool jep(CharacterInfo a)
		{
			return a.id == oih.ohm;
		}

		internal bool jeq(CharacterInfo a)
		{
			return a.id == oih.ohm;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bej
	{
		public MatchSettings.PositionOnCourt oii;

		public bdy oij;

		internal bool jer(bdy a)
		{
			return a.ohl == oii;
		}

		internal bool jes(CharacterInfo a)
		{
			return a.id == oij.ohm;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CustomGridLayout CharactersGrid;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject TeamAPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject TeamBPanel;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<bdy> Players;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharactersPreviewScene CharactersPreview;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamACharacterInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamACharacterAInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamACharacterBInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamBCharacterInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamBCharacterAInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterInfos TeamBCharacterBInfos;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static readonly List<MatchSettings.PositionOnCourt> OrderedPositions = new List<MatchSettings.PositionOnCourt>
	{
		MatchSettings.PositionOnCourt.SideALeft,
		MatchSettings.PositionOnCourt.SideARight,
		MatchSettings.PositionOnCourt.SideBRight,
		MatchSettings.PositionOnCourt.SideBLeft
	};

	public bool pye => Players.All((bdy a) => a.ohn);

	public bool pyf => Players.All((bdy a) => !a.ohn);

	public List<CharacterInfo> pyg
	{
		get
		{
			List<CharacterInfo> list = os.pjj.ToList();
			if (rk.pna == rk.PlayModes.Tournament && rk.pms != TournamentCategory.MixedDoubles)
			{
				return list.Where((CharacterInfo a) => a.gender.ToLower() == (new TournamentCategory[2]
				{
					TournamentCategory.MenSingles,
					TournamentCategory.MenDoubles
				}.Contains(rk.pms) ? "m" : "f")).ToList();
			}
			return list;
		}
	}

	private bool pyh => rk.pna == rk.PlayModes.Quick;

	private bool pyi
	{
		get
		{
			if (rk.pna == rk.PlayModes.Tournament)
			{
				return rk.pms == TournamentCategory.MixedDoubles;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		Initialize();
		base.OnEnable();
		CharactersPreview.LeftLight.SetActive(value: true);
		CharactersPreview.RightLight.SetActive(value: true);
		qi.pli.pkn.performed += jfh;
		qi.pli.pkm.performed += jfi;
		qi.msf += jfg;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		CharactersPreview.LeftLight.SetActive(value: false);
		CharactersPreview.RightLight.SetActive(value: false);
		qi.pli.pkn.performed -= jfh;
		qi.pli.pkm.performed -= jfi;
		qi.msf -= jfg;
	}

	private void jfg(MoveDirection a, InputAction.CallbackContext b)
	{
		bdy ohs = jfn(b.control.device.deviceId).FirstOrDefault((bdy a) => !a.ohn);
		if (ohs == null)
		{
			return;
		}
		AudioManager.PlayMenuChange();
		int num = pyg.FindIndex((CharacterInfo a) => a.id == ohs.ohm);
		int ohu = CharactersGrid.hci(num, a);
		while (Players.Any((bdy a) => a.ohn && a.ohm == pyg[ohu].id))
		{
			ohu = CharactersGrid.hci(ohu, a);
			if (ohu == num)
			{
				return;
			}
		}
		ohs.ohm = pyg[ohu].id;
		jfm();
		bool locked = pyg[ohu].locked;
		jfk(ohs.ohl).gameObject.SetActive(!locked);
		jfo(ohs.ohl).gameObject.SetActive(!locked);
		if (!locked)
		{
			jfk(ohs.ohl).has(pyg[ohu]);
			jfo(ohs.ohl).gyp(pyg[ohu], CharacterIdlePose.Default);
		}
	}

	private void jfh(InputAction.CallbackContext a)
	{
		bdy bdy = jfn(a.control.device.deviceId).LastOrDefault((bdy a) => a.ohn);
		if (bdy != null)
		{
			bdy.ohn = false;
			jfo(bdy.ohl).pqh = CharacterIdlePose.Default;
			jfm();
		}
	}

	private void jfi(InputAction.CallbackContext a)
	{
		bdy bdy = jfn(a.control.device.deviceId).FirstOrDefault((bdy a) => !a.ohn);
		if (bdy != null)
		{
			if (jfq(bdy))
			{
				AudioManager.PlayMenuChange();
				bdy.ohn = true;
				jfo(bdy.ohl).pqh = CharacterIdlePose.CrossedArms;
				jfm();
			}
			else
			{
				AudioManager.fiw();
			}
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Initialize()
	{
		if (!pyh)
		{
			CharactersPreview.hbj(new Vector3(-1.2f, 3.1f, -28f));
		}
		TeamBPanel.gameObject.SetActive(pyh);
		CharactersGrid.GetComponent<RectTransform>().anchorMax = new Vector2(pyh ? 0.7f : 1f, 1f);
		Players = MatchSettings.Current.plv.Select((MatchSettings.PlayerSettings a) => new bdy
		{
			ohl = a.Position,
			oho = a.PlayerId,
			ohm = pyg.FirstOrDefault((CharacterInfo a) => a.id == a.CharacterInfo?.id)?.id,
			ohp = a.DeviceId
		}).ToList();
		foreach (bdy ohw in Players.Where((bdy a) => a.ohm == null))
		{
			IEnumerable<CharacterInfo> enumerable = pyg.Where((CharacterInfo a) => !a.locked && !Players.Any((bdy a) => a.ohm == a.id));
			if (pyi)
			{
				bdy ohy = Players.Find((bdy a) => a.ohl == MatchSettings.gcn(ohw.ohl));
				CharacterInfo ohz = ((ohy.ohm != null) ? pyg.Find((CharacterInfo a) => a.id == ohy.ohm) : null);
				if (ohz != null)
				{
					enumerable = enumerable.Where((CharacterInfo a) => a.gender != ohz.gender);
				}
			}
			ohw.ohm = enumerable.gtk()?.id;
		}
		if (!pyh)
		{
			Players = Players.Where((bdy a) => a.ohl == MatchSettings.PositionOnCourt.SideARight || a.ohl == MatchSettings.PositionOnCourt.SideALeft).ToList();
		}
		CharactersGrid.transform.guj();
		GameObject original = Resources.Load<GameObject>("UI/CharacterImage");
		foreach (CharacterInfo item in pyg)
		{
			GameObject obj = UnityEngine.Object.Instantiate(original, Vector3.zero, Quaternion.identity, CharactersGrid.transform);
			obj.name = "Character " + item.id;
			obj.transform.Find("Image").GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Characters/" + item.id);
			obj.transform.Find("LockOverlay").gameObject.SetActive(item.locked);
		}
		StartCoroutine(jfl());
		TeamACharacterInfos.gameObject.SetActive(!MatchSettings.Current.IsDouble);
		TeamBCharacterInfos.gameObject.SetActive(!MatchSettings.Current.IsDouble);
		TeamACharacterAInfos.gameObject.SetActive(MatchSettings.Current.IsDouble);
		TeamACharacterBInfos.gameObject.SetActive(MatchSettings.Current.IsDouble);
		TeamBCharacterAInfos.gameObject.SetActive(MatchSettings.Current.IsDouble);
		TeamBCharacterBInfos.gameObject.SetActive(MatchSettings.Current.IsDouble);
		foreach (bdy player in Players)
		{
			Character3DPreview character3DPreview = jfo(player.ohl);
			character3DPreview.gameObject.SetActive(value: true);
			character3DPreview.pqh = CharacterIdlePose.Default;
			CharacterInfo a2 = jfp(player.ohl);
			character3DPreview.gyp(a2);
			jfk(player.ohl).has(a2);
		}
		jfm();
	}

	protected override void cyr()
	{
		base.cyr();
		CharactersPreview.hbi();
		CharactersPreview.hbj();
	}

	private IEnumerator jfj()
	{
		yield return new WaitForEndOfFrame();
		foreach (bdy player in Players)
		{
			Character3DPreview character3DPreview = jfo(player.ohl);
			character3DPreview.pqh = CharacterIdlePose.Default;
			character3DPreview.gyp(jfp(player.ohl));
		}
	}

	private CharacterInfos jfk(MatchSettings.PositionOnCourt a)
	{
		if (!MatchSettings.Current.IsDouble)
		{
			if (a != 0)
			{
				return TeamBCharacterInfos;
			}
			return TeamACharacterInfos;
		}
		return a switch
		{
			MatchSettings.PositionOnCourt.SideARight => TeamACharacterAInfos, 
			MatchSettings.PositionOnCourt.SideALeft => TeamACharacterBInfos, 
			MatchSettings.PositionOnCourt.SideBRight => TeamBCharacterAInfos, 
			MatchSettings.PositionOnCourt.SideBLeft => TeamBCharacterBInfos, 
			_ => null, 
		};
	}

	private IEnumerator jfl()
	{
		yield return new WaitForEndOfFrame();
		jfm();
	}

	private void jfm()
	{
		Action<Transform, bdy, string> action = delegate(Transform a, bdy b, string c)
		{
			a.gameObject.SetActive(b?.ohm == c);
			if (b?.ohm == c)
			{
				Color color = jfr(b);
				a.Find("Background").GetComponent<Image>().color = color;
				TextMeshProUGUI component3 = a.Find("Text").GetComponent<TextMeshProUGUI>();
				component3.color = qh.fzs(color);
				component3.text = (b.oho.HasValue ? $"P{b.oho}" : "PC");
			}
		};
		IEnumerable<bdy> source = (from a in Players
			where a.ohp.HasValue
			select a.ohp.Value into a
			select jfn(a).FirstOrDefault((bdy a) => !a.ohn) into a
			where a != null
			select a).Distinct();
		bdy arg = source.FirstOrDefault((bdy a) => a.ohl == MatchSettings.PositionOnCourt.SideARight);
		bdy arg2 = source.FirstOrDefault((bdy a) => a.ohl == (MatchSettings.PositionOnCourt)(MatchSettings.Current.IsDouble ? 2 : 3));
		bdy arg3 = source.FirstOrDefault((bdy a) => a.ohl == MatchSettings.PositionOnCourt.SideALeft);
		bdy arg4 = source.FirstOrDefault((bdy a) => a.ohl == (MatchSettings.PositionOnCourt)(MatchSettings.Current.IsDouble ? 3 : 2));
		for (int i = 0; i < pyg.Count; i++)
		{
			Transform child = CharactersGrid.transform.GetChild(i);
			string oia = pyg[i].id;
			bdy bdy = Players.Find((bdy a) => a.ohn && a.ohm == oia);
			RectTransform component = child.Find("Image").GetComponent<RectTransform>();
			component.offsetMin = ((bdy != null) ? new Vector2(5f, 5f) : Vector2.zero);
			component.offsetMax = ((bdy != null) ? new Vector2(-5f, -5f) : Vector2.zero);
			Image component2 = child.GetComponent<Image>();
			component2.enabled = bdy != null;
			if (bdy != null)
			{
				component2.color = jfr(bdy);
			}
			action(child.Find("BottomLeftCorner"), arg, oia);
			action(child.Find("TopRightCorner"), arg2, oia);
			action(child.Find("TopLeftCorner"), arg3, oia);
			action(child.Find("BottomRightCorner"), arg4, oia);
		}
	}

	private List<bdy> jfn(int a)
	{
		List<bdy> list = new List<bdy>();
		bdy oic = Players.Find((bdy a) => a.ohp == a);
		if (MatchSettings.Current.ply && oic == null)
		{
			oic = Players.Find((bdy a) => a.ohp.HasValue);
		}
		if (oic != null)
		{
			bdy oid = Players.Find((bdy a) => a.ohl == MatchSettings.gcn(oic.ohl));
			IOrderedEnumerable<bdy> orderedEnumerable = from a in Players
				where a.ohl != oic.ohl && (oid == null || a.ohl != oid.ohl)
				orderby OrderedPositions.IndexOf(a.ohl)
				select a;
			list.Add(oic);
			if (oid != null && !oid.oho.HasValue)
			{
				list.Add(oid);
			}
			if (!orderedEnumerable.Any((bdy a) => a.oho.HasValue))
			{
				list.AddRange(orderedEnumerable);
			}
		}
		return list;
	}

	private Character3DPreview jfo(MatchSettings.PositionOnCourt a)
	{
		if (!MatchSettings.Current.IsDouble)
		{
			if (a != 0)
			{
				return CharactersPreview.RightCharacter;
			}
			return CharactersPreview.LeftCharacter;
		}
		return a switch
		{
			MatchSettings.PositionOnCourt.SideARight => CharactersPreview.LeftPairACharacter, 
			MatchSettings.PositionOnCourt.SideALeft => CharactersPreview.LeftPairBCharacter, 
			MatchSettings.PositionOnCourt.SideBRight => CharactersPreview.RightPairACharacter, 
			MatchSettings.PositionOnCourt.SideBLeft => CharactersPreview.RightPairBCharacter, 
			_ => null, 
		};
	}

	private CharacterInfo jfp(MatchSettings.PositionOnCourt a)
	{
		string oig = Players.First((bdy a) => a.ohl == a).ohm;
		return pyg.Find((CharacterInfo a) => a.id == oig);
	}

	private bool jfq(bdy a)
	{
		if (Players.Any((bdy a) => a.ohn && a.ohm == a.ohm))
		{
			return false;
		}
		if (pyg.Find((CharacterInfo a) => a.id == a.ohm).locked)
		{
			return false;
		}
		if (pyi)
		{
			MatchSettings.PositionOnCourt oii = MatchSettings.gcn(a.ohl);
			bdy oij = Players.Find((bdy a) => a.ohl == oii);
			if (oij.ohn)
			{
				CharacterInfo characterInfo = pyg.Find((CharacterInfo a) => a.id == a.ohm);
				CharacterInfo characterInfo2 = pyg.Find((CharacterInfo a) => a.id == oij.ohm);
				if (characterInfo.gender == characterInfo2.gender)
				{
					return false;
				}
			}
		}
		return true;
	}

	private Color jfr(bdy a)
	{
		if (!a.oho.HasValue)
		{
			return new Color32(220, 220, 220, byte.MaxValue);
		}
		return TeamsSelection.hmw(a.oho.Value);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Save()
	{
		foreach (bdy player in Players)
		{
			MatchSettings.Current.gcg(player.ohl).CharacterInfo = os.fsk(player.ohm);
		}
		if (!MatchSettings.Current.IsDouble)
		{
			MatchSettings.Current.TeamA.PlayerB.CharacterInfo = null;
			MatchSettings.Current.TeamB.PlayerB.CharacterInfo = null;
		}
	}

	[CompilerGenerated]
	private bdy jfs(MatchSettings.PlayerSettings a)
	{
		return new bdy
		{
			ohl = a.Position,
			oho = a.PlayerId,
			ohm = pyg.FirstOrDefault((CharacterInfo a) => a.id == a.CharacterInfo?.id)?.id,
			ohp = a.DeviceId
		};
	}

	[CompilerGenerated]
	private bool jft(CharacterInfo a)
	{
		if (!a.locked)
		{
			return !Players.Any((bdy a) => a.ohm == a.id);
		}
		return false;
	}

	[CompilerGenerated]
	private void jfu(Transform a, bdy b, string c)
	{
		a.gameObject.SetActive(b?.ohm == c);
		if (b?.ohm == c)
		{
			Color color = jfr(b);
			a.Find("Background").GetComponent<Image>().color = color;
			TextMeshProUGUI component = a.Find("Text").GetComponent<TextMeshProUGUI>();
			component.color = qh.fzs(color);
			component.text = (b.oho.HasValue ? $"P{b.oho}" : "PC");
		}
	}

	[CompilerGenerated]
	private bdy jfv(int a)
	{
		return jfn(a).FirstOrDefault((bdy a) => !a.ohn);
	}
}
