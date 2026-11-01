using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Nobi.UiRoundedCorners;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class RewardsPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hh
	{
		public TournamentSeries leu;

		public Func<(sz t, MedalType?), bool> lev;

		internal bool dbx((sz t, MedalType?) item)
		{
			return item.t.Series == leu;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hi
	{
		public string lew;

		internal bool dby(te a)
		{
			if (a.Properties.Id == lew)
			{
				return a.poq;
			}
			return false;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: .Net Framework - Compatibility : Is a special name.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject container;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		dbz();
	}

	private void dbz()
	{
		container.transform.guj();
		List<(sz, MedalType?)> source = tk.pos.Select((sz a) => (t: a, dca(a.Id))).ToList();
		foreach (TournamentSeries leu in Enum.GetValues(typeof(TournamentSeries)).Cast<TournamentSeries>())
		{
			if (leu == TournamentSeries.InternationalChallenge)
			{
				continue;
			}
			if (leu != 0)
			{
				GameObject gameObject = new GameObject($"{leu} header");
				gameObject.transform.SetParent(container.transform, worldPositionStays: false);
				gameObject.AddComponent<RectTransform>();
				GameObject gameObject2 = new GameObject("Badge");
				gameObject2.transform.SetParent(gameObject.transform, worldPositionStays: false);
				gameObject2.AddComponent<RectTransform>().sizeDelta = new Vector2(200f, 36f);
				gameObject2.AddComponent<Image>().color = qh.fzq(leu);
				ImageWithRoundedCorners imageWithRoundedCorners = gameObject2.AddComponent<ImageWithRoundedCorners>();
				imageWithRoundedCorners.radius = 10f;
				imageWithRoundedCorners.Validate();
				imageWithRoundedCorners.Refresh();
				GameObject obj = new GameObject("Label");
				obj.transform.SetParent(gameObject2.transform, worldPositionStays: false);
				obj.AddComponent<RectTransform>().guk(10f);
				TextMeshProUGUI textMeshProUGUI = obj.AddComponent<TextMeshProUGUI>();
				textMeshProUGUI.fontSize = 18f;
				textMeshProUGUI.alignment = TextAlignmentOptions.Center;
				textMeshProUGUI.fontStyle = FontStyles.Bold | FontStyles.UpperCase;
				obj.AddComponent<LocalizedTextMeshPro>().plk = new LocalizedString("List_TournamentSeries", leu.ToString() + ((leu == TournamentSeries.WorldTournaments || leu == TournamentSeries.InternationalChallenge) ? "_Short" : ""));
			}
			GameObject gameObject3 = new GameObject($"{leu} tournaments");
			gameObject3.transform.SetParent(container.transform, worldPositionStays: false);
			gameObject3.AddComponent<HorizontalLayoutGroup>();
			foreach (var (a2, b) in source.Where<(sz, MedalType?)>(((sz t, MedalType?) item) => item.t.Series == leu))
			{
				UnityEngine.Object.Instantiate(TournamentWithFlag.ptw, gameObject3.transform).hnh(a2, b);
			}
		}
	}

	private MedalType? dca(string a)
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
	private (sz t, MedalType?) dcb(sz a)
	{
		return (t: a, dca(a.Id));
	}
}
