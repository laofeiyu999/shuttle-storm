using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchStatsManager : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kk
	{
		public MatchSettings.PositionOnCourt lty;

		public MatchStatsManager ltz;

		internal bool ehw(rg a)
		{
			return a.mvh == lty;
		}

		internal bool ehx(rg a, int b)
		{
			if (b > 0 && a.mvh == lty && ltz.luc.mvg[b - 1].mvi == ShotType.Smash)
			{
				return ltz.luc.mvg[b - 1].mvj.y < 0f;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	private float? lua;

	private float? lub;

	private Dictionary<MatchSettings.PositionOnCourt, float> lud;

	public re pew => qu.mug.mui.LastOrDefault();

	public rf luc { get; private set; }

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize()
	{
		qu.mug = new qu
		{
			muh = Game.pdy
		};
	}

	public void eib()
	{
		qu.mug.mui.Clear();
		eif();
		eic();
	}

	public void eic()
	{
		luc = new rf
		{
			muv = Game.pdz
		};
		eid();
	}

	private void eid()
	{
		lub = Time.time;
		lud = new Dictionary<MatchSettings.PositionOnCourt, float>();
		foreach (CharacterManager character in Game.Characters)
		{
			lud[character.Player.Position] = character.lhg.lig;
		}
	}

	public void eie(RallyEndInfo a, Vector3? b = null)
	{
		luc.mvf = Time.time - lub.Value;
		luc.mvc = b;
		luc.mux = a.EndedOut;
		luc.muy = a.EndedInNet;
		luc.muz = a.TouchedPartner;
		luc.mva = a.TouchedOpponent;
		luc.mvb = a.LastShotByTeamA;
		luc.muw = true;
		foreach (CharacterManager character in Game.Characters)
		{
			luc.mvd[character.Player.Position] = (int)Mathf.Round(character.lhg.lig - lud[character.Player.Position]);
			character.lhl.dkd();
			luc.mve[character.Player.Position] = (int)Mathf.Round(character.lhl.lgv);
		}
		pew.mus.Add(luc);
		luc = null;
	}

	public void eif()
	{
		qu.mug.gek();
		lua = Time.time;
	}

	public void eig()
	{
		pew.muu = Time.time - lua.Value;
		if (qu.mug.plz)
		{
			qu.mug.gem();
		}
	}

	public void eih(CharacterManager a)
	{
		luc.mvg.Add(new rg
		{
			mvh = a.Player.Position
		});
	}

	public void eii(CharacterManager a, ShotType b, Vector3 c, Vector3 d)
	{
		if (!luc.mvg.Any())
		{
			eid();
		}
		luc.mvg.Add(new rg
		{
			mvh = a.Player.Position,
			mvi = b,
			mvj = d,
			mvk = c - Game.Court.pcc,
			mvl = Game.Shuttle.pgu.meg
		});
		eij();
	}

	private void eij()
	{
		if (Career.Current != null && !Game.pdw && !Game.pdx)
		{
			MatchSettings.PositionOnCourt lty = qu.mug.muh.plv.Find((MatchSettings.PlayerSettings a) => a.CharacterInfo.id == Career.Current.MainCharacter.piz).Position;
			List<rg> source = luc.mvg.Where((rg a) => a.mvh == lty).ToList();
			int num = luc.mvg.Where((rg a, int b) => b > 0 && a.mvh == lty && luc.mvg[b - 1].mvi == ShotType.Smash && luc.mvg[b - 1].mvj.y < 0f).Count();
			if (num >= 5)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_5_DEFENSE_SAME_RALLY);
			}
			if (num >= 10)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_10_DEFENSE_SAME_RALLY);
			}
			int num2 = source.Count((rg a) => a.mvi == ShotType.Drop && Math.Abs(a.mvk.z) < 2f && Math.Abs(a.mvk.x) > 1f && ((a.mvk.x > 0f && a.mvj.x < 1.5f) || (a.mvk.x < 0f && a.mvj.x > 1.5f)));
			if (num2 >= 5)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_5_CROSS_NET_SAME_RALLY);
			}
			if (num2 >= 10)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_10_CROSS_NET_SAME_RALLY);
			}
			if (luc.mvg.Count >= 10)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_10_SHOTS_SAME_RALLY);
			}
			if (luc.mvg.Count >= 20)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_20_SHOTS_SAME_RALLY);
			}
			if (luc.mvg.Count >= 50)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_50_SHOTS_SAME_RALLY);
			}
			if (luc.mvg.Count >= 100)
			{
				Career.Current.flt(AchievementType.CAREER_PLAY_100_SHOTS_SAME_RALLY);
			}
		}
	}
}
