using System;
using FishNet;
using FishNet.Managing.Timing;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class MatchLog
{
	private static kf loq;

	private static uint lor;

	public static bool peq
	{
		get
		{
			if (loq != null)
			{
				return loq.pev;
			}
			return false;
		}
	}

	public static uint per
	{
		get
		{
			TimeManager timeManager = InstanceFinder.TimeManager;
			return jf.edn((timeManager != null) ? new uint?(timeManager.Tick) : null, ref lor);
		}
	}

	public static double pes
	{
		get
		{
			if (!(InstanceFinder.TimeManager != null))
			{
				return 0.02;
			}
			return InstanceFinder.TimeManager.TickDelta;
		}
	}

	public static MatchLogFrame lot { get; private set; } = MatchLogFrame.Identity;


	public static event Action<MatchLogRecord> los;

	public static Vector3 edv(Vector3 a)
	{
		return lot.eeu(a);
	}

	public static void edw(kf a, MatchLogFrame b)
	{
		eea();
		lot = b;
		loq = a;
		loq.qao += eed;
	}

	public static void edx(kd a)
	{
		if (!peq)
		{
			return;
		}
		try
		{
			loq.egy(per, a);
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	public static void edy(js a)
	{
		if (!peq)
		{
			return;
		}
		try
		{
			loq.egz(per, a);
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	public static void edz()
	{
		if (!peq)
		{
			return;
		}
		try
		{
			loq.eha(per);
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	public static void eea()
	{
		if (loq != null)
		{
			kf kf2 = loq;
			loq = null;
			kf2.qao -= eed;
			try
			{
				kf2.ehb(per);
			}
			catch (Exception exception)
			{
				Debug.LogException(exception);
			}
			lot = MatchLogFrame.Identity;
		}
	}

	public static uint eeb(float a)
	{
		return jf.edm(per, a, pes);
	}

	public static byte eec(CharacterManager a)
	{
		if (!(a != null))
		{
			return byte.MaxValue;
		}
		return (byte)a.Player.Position;
	}

	private static void eed(MatchLogRecord a)
	{
		MatchLog.los?.Invoke(a);
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		loq = null;
		lot = MatchLogFrame.Identity;
		lor = 0u;
		MatchLog.los = null;
	}
}
