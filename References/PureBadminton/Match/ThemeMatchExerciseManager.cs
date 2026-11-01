using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ThemeMatchExerciseManager : BaseExerciseManager<ts>
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mr
	{
		public Vector2 mhy;

		internal bool fdh(Rect a)
		{
			return a.Contains(mhy);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<HighlightZone> ZonesHighlight = new List<HighlightZone>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<Rect> BothSideZones = new List<Rect>();

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public override void Initialize()
	{
		base.Initialize();
		BotCharacter.gameObject.SetActive(value: true);
		MainCharacter.dms(a: true, b: false);
		BotCharacter.dms(a: true, b: false);
	}

	public override void fcf()
	{
		base.fcf();
		base.phl.Shuttle.gameObject.SetActive(value: true);
		MainCharacter.AllowedAction = CharacterManager.PossibleAction.All;
		BotCharacter.AllowedAction = CharacterManager.PossibleAction.All;
		Score = 0;
		base.phl.lne += fdi;
		if (base.phm.ndd != null)
		{
			Rect[] ndd = base.phm.ndd;
			for (int i = 0; i < ndd.Length; i++)
			{
				Rect source = ndd[i];
				HighlightZone highlightZone = Object.Instantiate(HighlightZone.peg);
				highlightZone.transform.position = base.phl.Court.pcc + source.center.jvo();
				highlightZone.transform.localScale = new Vector3(source.width, 1f, source.height);
				ZonesHighlight.Add(highlightZone);
				Rect item = new Rect(source);
				item.center += base.phl.Court.pcc.jvn();
				BothSideZones.Add(item);
				Rect item2 = new Rect(source);
				item2.center = base.phl.Court.pcc.jvn() - item2.center;
				BothSideZones.Add(item2);
			}
		}
	}

	public override void fch()
	{
		base.fch();
		base.phl.lne -= fdi;
		foreach (HighlightZone item in ZonesHighlight)
		{
			Object.Destroy(item.gameObject);
		}
		ZonesHighlight.Clear();
	}

	private void fdi(CancelEventArgs a)
	{
		re re2 = qu.mug.mui.Last();
		if (base.phm.ndc == null)
		{
			Rect[] ndd = base.phm.ndd;
			if (ndd == null || ndd.Length == 0)
			{
				goto IL_0131;
			}
		}
		rf rf2 = re2.mus.Last();
		if (!rf2.mux && !rf2.muy)
		{
			Vector2 mhy = rf2.mvc.Value.jvn();
			if ((base.phm.ndc == null || base.phm.ndc(rf2)) && (!BothSideZones.Any() || BothSideZones.Any((Rect a) => a.Contains(mhy))))
			{
				for (int i = 1; i < 3; i++)
				{
					re2.mus.Add(fdj(rf2.pmo == true));
				}
				base.phl.ebm("+3", qh.mrr, rf2.mvc.Value, new Vector2(0f, 10f));
				AudioManager.fix();
			}
		}
		goto IL_0131;
		IL_0131:
		fcj();
		if (re2.pmi >= 11 || re2.pmj >= 11)
		{
			Finish();
			a.Cancel = true;
		}
	}

	private rf fdj(bool a)
	{
		MatchSettings.PositionOnCourt positionOnCourt = ((!a) ? MatchSettings.PositionOnCourt.SideBRight : MatchSettings.PositionOnCourt.SideARight);
		return new rf
		{
			muv = positionOnCourt,
			mvb = a,
			mvg = new List<rg>
			{
				new rg
				{
					mvh = positionOnCourt,
					mvi = ShotType.Drop
				}
			},
			muw = true
		};
	}
}
