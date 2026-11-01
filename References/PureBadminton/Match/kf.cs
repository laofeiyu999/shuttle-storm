using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class kf
{
	private readonly kj lth;

	private readonly Dictionary<(byte seat, byte channel, bool received), js> lti = new Dictionary<(byte, byte, bool), js>();

	public bool pev => !lth.ltw;

	public event Action<MatchLogRecord> qao
	{
		add
		{
			lth.ltx += value;
		}
		remove
		{
			lth.ltx -= value;
		}
	}

	public kf(MatchLogSliceHeader a, double b, uint c, ji d, Action<ki> e)
	{
		lth = new kj(a, b, c, e);
		lth.ehq(c, d);
	}

	public static bool egw(uint a)
	{
		return a % 5 == 0;
	}

	public static bool egx(uint a)
	{
		return a % 5 == 0;
	}

	public void egy(uint a, kd b)
	{
		lth.ehq(a, b);
	}

	public void egz(uint a, js b)
	{
		if (pev && b != null)
		{
			(byte, byte, bool) key = (b.lqu, b.lqv, b.lqt);
			if (!lti.TryGetValue(key, out var value) || !value.efs(b))
			{
				lti[key] = b;
				lth.ehq(a, b);
			}
		}
	}

	public void eha(uint a)
	{
		lth.ehr(a);
	}

	public void ehb(uint a)
	{
		lth.ehs(a);
	}
}
