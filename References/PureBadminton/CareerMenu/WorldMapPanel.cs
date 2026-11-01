using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Nobi.UiRoundedCorners;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class WorldMapPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hn
	{
		public Continent lfp;

		internal bool ddj((sz t, MedalType?) t)
		{
			return t.t.pol.pkz == lfp;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ho
	{
		public string lfq;

		internal bool ddk(te a)
		{
			if (a.Properties.Id == lfq)
			{
				return a.poq;
			}
			return false;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image map;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject legend;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		ddl();
	}

	private void ddl()
	{
		map.transform.guj();
		List<(sz, MedalType?)> list = (from a in tk.pos
			select (t: a, ddm(a.Id)) into t
			orderby t.Item2 descending
			select t).Reverse().ToList();
		foreach (var item6 in list)
		{
			sz item2 = item6.Item1;
			MedalType? item3 = item6.Item2;
			GameObject gameObject = new GameObject(item2.Id);
			gameObject.transform.SetParent(map.transform, worldPositionStays: false);
			RectTransform rectTransform = gameObject.AddComponent<RectTransform>();
			(float, float) tuple = qk.gam(item2.Location.Item1, item2.Location.Item2);
			float item4 = tuple.Item1;
			float item5 = tuple.Item2;
			Vector2 anchorMin = (rectTransform.anchorMax = new Vector2(item4, item5));
			rectTransform.anchorMin = anchorMin;
			rectTransform.anchoredPosition = Vector2.zero;
			Image image = gameObject.AddComponent<Image>();
			if (!item3.HasValue || item3 == MedalType.None)
			{
				image.color = qh.mrp;
				rectTransform.sizeDelta = new Vector2(8f, 8f);
				ImageWithRoundedCorners imageWithRoundedCorners = gameObject.AddComponent<ImageWithRoundedCorners>();
				imageWithRoundedCorners.radius = 4f;
				imageWithRoundedCorners.Validate();
				imageWithRoundedCorners.Refresh();
			}
			else
			{
				image.sprite = vk.hgr(item3);
				rectTransform.sizeDelta = new Vector2(16f, 16f);
			}
		}
		legend.transform.guj();
		foreach (Continent lfp in Enum.GetValues(typeof(Continent)).Cast<Continent>())
		{
			GameObject gameObject2 = new GameObject(lfp.ToString());
			gameObject2.transform.SetParent(legend.transform, worldPositionStays: false);
			HorizontalLayoutGroup horizontalLayoutGroup = gameObject2.AddComponent<HorizontalLayoutGroup>();
			bool childControlWidth = (horizontalLayoutGroup.childControlHeight = false);
			horizontalLayoutGroup.childControlWidth = childControlWidth;
			horizontalLayoutGroup.childAlignment = TextAnchor.MiddleLeft;
			horizontalLayoutGroup.spacing = 20f;
			GameObject obj = new GameObject("Label");
			obj.transform.SetParent(gameObject2.transform, worldPositionStays: false);
			obj.AddComponent<RectTransform>().sizeDelta = new Vector2(140f, 20f);
			IEnumerable<(sz, MedalType?)> source = list.Where<(sz, MedalType?)>(((sz t, MedalType?) t) => t.t.pol.pkz == lfp);
			TextMeshProUGUI textMeshProUGUI = obj.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI.fontSize = 18f;
			textMeshProUGUI.alignment = TextAlignmentOptions.MidlineLeft;
			textMeshProUGUI.text = this.gut("List_Continent", lfp.ToString()) + $" ({source.Count()})";
			List<MedalType?> list2 = (from item in source
				select item.Item2 into a
				where a.HasValue && a != MedalType.None
				orderby a descending
				select a).ToList();
			if (!list2.Any())
			{
				list2.Add(MedalType.None);
			}
			foreach (IGrouping<MedalType?, MedalType?> item7 in from a in list2
				group a by a)
			{
				UnityEngine.Object.Instantiate(TrophyCount.ptx, gameObject2.transform).hnj(item7.Key, item7.Count());
			}
		}
	}

	private MedalType? ddm(string a)
	{
		IEnumerable<TournamentResultPosition> source = (from a in Career.Current.Tournaments
			select a.Item2 into a
			where a.Properties.Id == a && a.poq
			select a).Select(delegate(te a)
		{
			string a2 = a.Participants.First((string a) => te.gqb(a, Career.Current.MainCharacter.CharacterId));
			return a.gqd(a2);
		});
		if (source.Any((TournamentResultPosition a) => a == TournamentResultPosition.Winner))
		{
			return MedalType.Gold;
		}
		if (source.Any((TournamentResultPosition a) => a == TournamentResultPosition.Finalist))
		{
			return MedalType.Silver;
		}
		if (source.Any((TournamentResultPosition a) => a == TournamentResultPosition.SemiFinalist))
		{
			return MedalType.Bronze;
		}
		if (source.Any())
		{
			return MedalType.None;
		}
		return null;
	}

	[CompilerGenerated]
	private (sz t, MedalType?) ddn(sz a)
	{
		return (t: a, ddm(a.Id));
	}
}
