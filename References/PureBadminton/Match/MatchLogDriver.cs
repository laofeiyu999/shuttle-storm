using System;
using System.Collections.Generic;
using FishNet;
using FishNet.Managing.Timing;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchLogDriver : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: .Net Framework - Compatibility : Is a special name.")]
	private static MatchLogDriver current;

	private bool lov;

	private bool low;

	private MatchLogTarget lox;

	private TimeManager loy;

	private yp loz;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		GameManager gameManager = GameManager.Current;
		if (!(gameManager == null))
		{
			if (!lov && gameManager.OnlineManager != null && gameManager.OnlineManager.pgj)
			{
				eel(gameManager);
			}
			if (lov && !low && qu.mug != null && qu.mug.plz)
			{
				eem();
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		if (lov && !low)
		{
			eem();
		}
		if (current == this)
		{
			current = null;
		}
	}

	public static void eek()
	{
		if (current != null && current.lov && !current.low)
		{
			current.eem();
		}
	}

	private void eel(GameManager a)
	{
		lov = true;
		MatchSettings.qn online = a.pdy.Online;
		lox = je.edl(online);
		string mta = online.mta;
		MatchLogAuthorKind authorKind = MatchLogAuthorKind.Player;
		if (lox == MatchLogTarget.None)
		{
			low = true;
			return;
		}
		MatchLog.eea();
		Action<ki> action = jh.eeh(lox, online.msw, mta);
		if (action == null)
		{
			low = true;
			return;
		}
		loy = InstanceFinder.TimeManager;
		MatchLogSliceHeader matchLogSliceHeader = default(MatchLogSliceHeader);
		matchLogSliceHeader.NetVersion = 5u;
		matchLogSliceHeader.MatchId = kg.ehe(online.msw);
		matchLogSliceHeader.AuthorKind = authorKind;
		matchLogSliceHeader.AuthorId = kg.ehe(mta);
		MatchLogSliceHeader a2 = matchLogSliceHeader;
		MatchLogFrame b = MatchLogFrame.eet(a.Court.transform);
		if (Quaternion.Angle(a.Court.transform.rotation, Quaternion.identity) > 0.01f)
		{
			Debug.LogError("[MatchLog] the court is rotated: logged velocities are in world axes, the checks assume court axes");
		}
		MatchLog.edw(new kf(d: ees(a), a: a2, b: loy.TickDelta, c: loy.Tick, e: action), b);
		current = this;
		loy.OnTick += een;
		MatchAlerts.nun += eeq;
		if (a.OnlineManager != null)
		{
			a.OnlineManager.mbh += eer;
		}
		loz = ((MatchAbsenceWatcher.lxr != null) ? MatchAbsenceWatcher.lxr.lxs : null);
		if (loz != null)
		{
			loz.nsx += eep;
			for (int i = 0; i < loz.pvc.Count; i++)
			{
				eep(i, loz.pvc[i]);
			}
		}
	}

	private void eem()
	{
		low = true;
		if (loy != null)
		{
			loy.OnTick -= een;
		}
		MatchAlerts.nun -= eeq;
		OnlineMatchManager onlineMatchManager = ((GameManager.Current != null) ? GameManager.Current.OnlineManager : null);
		if (onlineMatchManager != null)
		{
			onlineMatchManager.mbh -= eer;
		}
		if (loz != null)
		{
			loz.nsx -= eep;
		}
		try
		{
			MatchLog.eea();
		}
		finally
		{
			if (lox == MatchLogTarget.Storage)
			{
				MatchLogUploader.iis();
			}
		}
	}

	private void een()
	{
		try
		{
			if (MatchLog.peq)
			{
				if (kf.egx(loy.Tick))
				{
					eeo();
				}
				MatchLog.edz();
			}
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	private static void eeo()
	{
		GameManager gameManager = GameManager.Current;
		if (gameManager == null)
		{
			return;
		}
		List<jv.SeatPosition> list = new List<jv.SeatPosition>(gameManager.Characters.Count);
		foreach (CharacterManager character in gameManager.Characters)
		{
			MatchLogPhase phase = (gameManager.lmu ? MatchLogPhase.Reset : ((character.lhi.lju != null) ? MatchLogPhase.Shot : (character.lhg.lih.HasValue ? MatchLogPhase.Autopilot : MatchLogPhase.Free)));
			list.Add(jv.Seat(MatchLog.eec(character), MatchLog.edv(character.transform.position), character.lhh.liq.GetValueOrDefault(), phase));
		}
		MatchLog.edx(new jv
		{
			lrq = list.ToArray()
		});
	}

	private static void eep(int a, MatchAbsenceEvent b)
	{
		try
		{
			MatchLog.edx(jo.efm(a, b));
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	private static void eeq(string a, string b)
	{
		try
		{
			MatchLog.edx(jp.efo(a, b));
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	private static void eer(string a, float b)
	{
		try
		{
			MatchLog.edx(jm.efh(a, b));
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	private static ji ees(GameManager a)
	{
		MatchSettings matchSettings = a.pdy;
		CharacterManager characterManager = a.Characters.Find((CharacterManager a) => a.pap);
		List<ji.RosterSeat> list = new List<ji.RosterSeat>();
		foreach (MatchSettings.PlayerSettings item in matchSettings.plv)
		{
			CharacterInfo characterInfo = item.CharacterInfo;
			CharacterStats characterStats = characterInfo?.stats;
			list.Add(new ji.RosterSeat
			{
				Defense = (characterStats?.defense ?? 0f),
				Power = (characterStats?.power ?? 0f),
				Precision = (characterStats?.precision ?? 0f),
				Speed = (characterStats?.speed ?? 0f),
				Stamina = (characterStats?.stamina ?? 0f),
				Height = (ushort)Mathf.Clamp(characterInfo?.height ?? 0, 0, 65535),
				Seat = (byte)item.Position,
				PlayerId = (item.OnlinePlayerId ?? ""),
				Team = ((!MatchSettings.gcl(item.Position)) ? ((byte)1) : ((byte)0)),
				Human = !string.IsNullOrEmpty(item.OnlinePlayerId)
			});
		}
		return new ji
		{
			lpd = matchSettings.Online.msw,
			lpe = ((characterManager == null) ? byte.MaxValue : MatchLog.eec(characterManager)),
			lpf = matchSettings.IsDouble,
			lpg = (byte)matchSettings.WinningSets,
			lph = (matchSettings.Stadium ?? ""),
			lpi = a.Court.transform.position.x,
			lpj = a.Court.transform.position.y,
			lpk = a.Court.transform.position.z,
			lpl = matchSettings.plt,
			lpm = (byte)((characterManager?.lhe.ozt is Gamepad) ? 1 : ((characterManager?.lhe.ozt is Keyboard) ? 2 : 0)),
			lpn = (float)InstanceFinder.TimeManager.TickDelta,
			lpo = list.ToArray()
		};
	}
}
