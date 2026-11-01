using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class KnockoutTree : Selectable
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class bdh
	{
		public int odx;

		internal bool iuy(TournamentMatch a)
		{
			return a.RoundId == odx;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Tournament Tournament;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool IsQualification;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Dictionary<TournamentMatch, KnockoutMatchItem> TreeItems = new Dictionary<TournamentMatch, KnockoutMatchItem>();

	private TournamentMatch ody;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool FinalSection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int SectionIndex;

	public TournamentMatch pwd
	{
		get
		{
			return ody;
		}
		set
		{
			if (value != null && !TreeItems.ContainsKey(value))
			{
				if (value.RoundId > pwg)
				{
					FinalSection = false;
				}
				else if (value.RoundId < pwh)
				{
					FinalSection = true;
				}
				int num = (int)Math.Pow(2.0, value.RoundId.Value - pwh);
				SectionIndex = (int)Math.Floor((decimal)value.RoundMatchId / (decimal)num);
				Refresh();
			}
			ody = value;
			ivf();
		}
	}

	public int pwe
	{
		get
		{
			if (!IsQualification)
			{
				return Tournament.Properties.RoundCount;
			}
			return Tournament.Properties.QualificationRounds.Value;
		}
	}

	public List<TournamentMatch> pwf
	{
		get
		{
			if (!IsQualification)
			{
				return Tournament.RoundMatches;
			}
			return Tournament.QualificationMatches;
		}
	}

	public int pwg => Math.Min(FinalSection ? 3 : 6, pwe);

	public int pwh
	{
		get
		{
			if (!FinalSection && pwe > 3)
			{
				return 4;
			}
			return 1;
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Refresh()
	{
		if (pwe <= 3)
		{
			FinalSection = true;
		}
		int num = pwg - pwh + 1;
		int num2 = (int)Math.Pow(2.0, num - 1);
		int num3 = 100;
		int num4 = 500;
		int num5 = 150;
		int num6 = num4 * num;
		int num7 = num3 + num5 * num2;
		RectTransform content = GetComponent<ScrollRect>().content;
		content.GetComponent<RectTransform>().sizeDelta = new Vector2(num6, num7);
		content.guj();
		TreeItems.Clear();
		if (FinalSection && pwe > 3)
		{
			GameObject original = Resources.Load<GameObject>("UI/KnockoutDashLine");
			for (int i = 0; i < num2; i++)
			{
				GameObject gameObject = UnityEngine.Object.Instantiate(original, content.transform);
				gameObject.transform.localScale = Vector3.one;
				gameObject.GetComponent<RectTransform>().anchoredPosition = new Vector2(gameObject.GetComponent<RectTransform>().rect.width / 2f, -num3 - i * num5 - num5 / 2);
			}
			GameObject obj = new GameObject("Previous round title");
			obj.transform.SetParent(content.transform);
			obj.transform.localScale = Vector3.one;
			RectTransform rectTransform = obj.AddComponent<RectTransform>();
			rectTransform.pivot = Vector2.one;
			Vector2 anchorMin = (rectTransform.anchorMax = new Vector2(0f, 1f));
			rectTransform.anchorMin = anchorMin;
			rectTransform.anchoredPosition = new Vector2(-100f, -100f);
			rectTransform.sizeDelta = new Vector2(num7 - 100, 100f);
			rectTransform.localRotation = Quaternion.Euler(0f, 0f, 90f);
			TextMeshProUGUI textMeshProUGUI = obj.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI.alignment = TextAlignmentOptions.Center;
			textMeshProUGUI.color = Color.white;
			textMeshProUGUI.fontStyle = FontStyles.Bold;
			textMeshProUGUI.fontSize = 24f;
			textMeshProUGUI.gur(ss.gnx(Tournament, pwg + 1, IsQualification));
		}
		int odx;
		for (odx = pwg; odx >= pwh; odx--)
		{
			int num8 = num2 / (int)Math.Pow(2.0, pwg - odx);
			GameObject obj2 = new GameObject($"Round {odx} title");
			obj2.transform.SetParent(content.transform);
			obj2.transform.localScale = Vector3.one;
			RectTransform rectTransform2 = obj2.AddComponent<RectTransform>();
			rectTransform2.pivot = new Vector2(0f, 1f);
			Vector2 anchorMin = (rectTransform2.anchorMax = new Vector2(0f, 1f));
			rectTransform2.anchorMin = anchorMin;
			rectTransform2.anchoredPosition = new Vector2(100 + (pwg - odx) * num4, 0f);
			rectTransform2.sizeDelta = new Vector2(400f, num3);
			TextMeshProUGUI textMeshProUGUI2 = obj2.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI2.alignment = TextAlignmentOptions.Center;
			textMeshProUGUI2.fontStyle = FontStyles.Bold;
			textMeshProUGUI2.color = qh.mrq;
			textMeshProUGUI2.gur(ss.gnx(Tournament, odx, IsQualification));
			int num9 = num5 * ((pwg - odx <= 1) ? 1 : 2);
			int num10 = num3 + ((pwg != odx) ? (num9 / 2) : 0);
			foreach (TournamentMatch item in pwf.Where((TournamentMatch a) => a.RoundId == odx).ToList().Skip(SectionIndex * num8)
				.Take(num8)
				.ToList())
			{
				GameObject gameObject2 = UnityEngine.Object.Instantiate(KnockoutMatchItem.pwc, content.transform);
				KnockoutMatchItem component = gameObject2.GetComponent<KnockoutMatchItem>();
				component.Lines.gameObject.SetActive(odx < pwg);
				component.iuw(item);
				if (Tournament.gnn(item.TeamA))
				{
					component.TeamAText.color = qh.mrj;
				}
				if (Tournament.gnn(item.TeamB))
				{
					component.TeamBText.color = qh.mrj;
				}
				if (item.RoundId == pwe)
				{
					component.iuv(item.RoundMatchId * 2 + 1, item.RoundMatchId * 2 + 2);
				}
				RectTransform component2 = gameObject2.GetComponent<RectTransform>();
				component2.anchoredPosition = new Vector2((pwg - odx) * num4, -(item.RoundMatchId - SectionIndex * num8) * num9 * ((num != 3 || item.RoundId - pwh != 1) ? 1 : 2) - num10);
				component2.gum(num9);
				TreeItems.Add(item, gameObject2.GetComponent<KnockoutMatchItem>());
			}
		}
		if (!FinalSection)
		{
			GameObject gameObject3 = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/KnockoutDashLine"), content.transform);
			gameObject3.transform.localScale = new Vector3(-1f, 1f, 1f);
			gameObject3.GetComponent<RectTransform>().anchoredPosition = new Vector2((float)(num * num4) + gameObject3.GetComponent<RectTransform>().rect.width / 2f, -num3 - (num7 - num3) / 2);
			GameObject obj3 = new GameObject("Next round title");
			obj3.transform.SetParent(content.transform);
			obj3.transform.localScale = Vector3.one;
			RectTransform rectTransform3 = obj3.AddComponent<RectTransform>();
			rectTransform3.pivot = Vector2.zero;
			Vector2 anchorMin = (rectTransform3.anchorMax = new Vector2(0f, 1f));
			rectTransform3.anchorMin = anchorMin;
			rectTransform3.anchoredPosition = new Vector2((float)num6 + gameObject3.GetComponent<RectTransform>().rect.width, -100f);
			rectTransform3.sizeDelta = new Vector2(num7 - 100, 100f);
			rectTransform3.localRotation = Quaternion.Euler(0f, 0f, -90f);
			TextMeshProUGUI textMeshProUGUI3 = obj3.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI3.alignment = TextAlignmentOptions.Center;
			textMeshProUGUI3.color = Color.white;
			textMeshProUGUI3.fontStyle = FontStyles.Bold;
			textMeshProUGUI3.fontSize = 24f;
			textMeshProUGUI3.gur(ss.gnx(Tournament, pwh - 1, IsQualification));
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		ivf();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnSelect(BaseEventData eventData)
	{
		base.OnSelect(eventData);
		ivf();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		ivf();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public override void OnMove(AxisEventData eventData)
	{
		AudioManager.PlayMenuChange();
		IOrderedEnumerable<TournamentMatch> source = from a in pwf
			where a.RoundId == pwd.RoundId
			orderby a.RoundMatchId
			select a;
		TournamentMatch tournamentMatch = null;
		if (pwd == null)
		{
			tournamentMatch = TreeItems.Keys.FirstOrDefault();
		}
		else if (eventData.moveDir == MoveDirection.Up)
		{
			tournamentMatch = source.LastOrDefault((TournamentMatch a) => a.RoundMatchId < pwd.RoundMatchId);
		}
		else if (eventData.moveDir == MoveDirection.Down)
		{
			tournamentMatch = source.FirstOrDefault((TournamentMatch a) => a.RoundMatchId > pwd.RoundMatchId);
		}
		else if (eventData.moveDir == MoveDirection.Left)
		{
			tournamentMatch = pwf.FirstOrDefault((TournamentMatch a) => a.RoundId == pwd.RoundId + 1 && a.RoundMatchId == pwd.RoundMatchId * 2);
		}
		else if (eventData.moveDir == MoveDirection.Right)
		{
			tournamentMatch = pwf.FirstOrDefault((TournamentMatch a) => a.RoundId == pwd.RoundId - 1 && a.RoundMatchId == (int)Math.Floor((double)pwd.RoundMatchId / 2.0));
		}
		if (tournamentMatch != null)
		{
			pwd = tournamentMatch;
			ivf();
		}
	}

	public void ivf()
	{
		foreach (KeyValuePair<TournamentMatch, KnockoutMatchItem> treeItem in TreeItems)
		{
			treeItem.Deconstruct(out var key, out var value);
			TournamentMatch tournamentMatch = key;
			value.pwi = EventSystem.current.currentSelectedGameObject == base.gameObject && pwd == tournamentMatch;
		}
	}

	[CompilerGenerated]
	private bool ivg(TournamentMatch a)
	{
		return a.RoundId == pwd.RoundId;
	}

	[CompilerGenerated]
	private bool ivh(TournamentMatch a)
	{
		return a.RoundMatchId < pwd.RoundMatchId;
	}

	[CompilerGenerated]
	private bool ivi(TournamentMatch a)
	{
		return a.RoundMatchId > pwd.RoundMatchId;
	}

	[CompilerGenerated]
	private bool ivj(TournamentMatch a)
	{
		if (a.RoundId == pwd.RoundId + 1)
		{
			return a.RoundMatchId == pwd.RoundMatchId * 2;
		}
		return false;
	}

	[CompilerGenerated]
	private bool ivk(TournamentMatch a)
	{
		if (a.RoundId == pwd.RoundId - 1)
		{
			return a.RoundMatchId == (int)Math.Floor((double)pwd.RoundMatchId / 2.0);
		}
		return false;
	}
}
