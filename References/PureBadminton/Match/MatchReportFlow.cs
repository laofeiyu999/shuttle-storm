using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class MatchReportFlow
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kn
	{
		public MatchSettings.qn luy;

		public Action luz;

		public Action lva;

		internal void ekf(List<string> a)
		{
			ekj(luy, a, luz, lva);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ko
	{
		public List<string> lvb;

		public kn lvc;

		internal void ekg()
		{
			ekj(lvc.luy, lvb, lvc.luz, lvc.lva);
		}
	}

	private static bool lvd;

	public static bool ekh(MatchSettings a)
	{
		return OnlinePlayerReportService.ipf(a).Count > 0;
	}

	public static void eki(MatchSettings a, Action b, Action c)
	{
		List<OnlinePlayerReportService.bcp> list = OnlinePlayerReportService.ipf(a);
		if (list.Count == 0 || lvd)
		{
			return;
		}
		MatchSettings.qn luy = a.Online;
		if (list.Count == 1)
		{
			List<string> lvb = list.Select((OnlinePlayerReportService.bcp a) => a.oan).ToList();
			SimpleModal.hib(tt.gra("Match", "ReportConfirmSingle", list[0].oao), delegate
			{
				ekj(luy, lvb, b, c);
			}, c: true, c);
		}
		else
		{
			PlayerReportModal.Open(list, delegate(List<string> a)
			{
				ekj(luy, a, b, c);
			}, c);
		}
	}

	private static async void ekj(MatchSettings.qn a, List<string> b, Action c, Action d)
	{
		if (!lvd)
		{
			lvd = true;
			bool flag;
			try
			{
				flag = await OnlinePlayerReportService.ipi(a, b);
			}
			finally
			{
				lvd = false;
			}
			if (flag)
			{
				c?.Invoke();
			}
			else
			{
				SimpleModal.hic(tt.gra("Match", "ReportError"), d);
			}
		}
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		lvd = false;
	}
}
