using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class kj
{
	public const float lto = 30f;

	public const int ltp = 239;

	private readonly MatchLogSliceHeader ltq;

	private readonly uint ltr;

	private readonly Action<ki> lts;

	private readonly List<MatchLogRecord> ltt = new List<MatchLogRecord>();

	private uint ltu;

	private int ltv;

	public bool ltw { get; private set; }

	public event Action<MatchLogRecord> ltx;

	public kj(MatchLogSliceHeader a, double b, uint c, Action<ki> d)
	{
		ltq = a;
		lts = d;
		ltr = (uint)Math.Max(1.0, Math.Round(30.0 / b));
		ltu = c;
	}

	public void ehq(uint a, kd b)
	{
		ehr(a);
		if (!ltw)
		{
			MatchLogRecord matchLogRecord = new MatchLogRecord(a, b);
			ltt.Add(matchLogRecord);
			this.ltx?.Invoke(matchLogRecord);
		}
	}

	public void ehr(uint a)
	{
		while (!ltw && a >= ltu + ltr)
		{
			eht(ltu + ltr - 1, b: false);
		}
	}

	public void ehs(uint a)
	{
		if (!ltw)
		{
			ehr(a);
			if (!ltw)
			{
				eht(Math.Max(a, ltu), b: true);
				ltw = true;
			}
		}
	}

	private void eht(uint a, bool b)
	{
		if (ltv > 239)
		{
			Debug.LogWarning("[MatchLog] match log stopped: more than 240 slices");
			ltw = true;
			ltt.Clear();
			return;
		}
		MatchLogSliceHeader a2 = ltq;
		a2.Seq = (ushort)ltv;
		a2.StartTick = ltu;
		a2.EndTick = a;
		a2.IsFinal = b;
		ki ki2 = null;
		try
		{
			ki2 = new ki
			{
				ltk = ltv,
				ltl = b,
				ltm = kh.ehf(ltv, b),
				ltn = kh.ehg(a2, ltt)
			};
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
		ltt.Clear();
		ltv++;
		ltu = a + 1;
		if (ki2 == null)
		{
			return;
		}
		try
		{
			lts?.Invoke(ki2);
		}
		catch (Exception exception2)
		{
			Debug.LogException(exception2);
		}
	}
}
