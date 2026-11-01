using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class RefreshRateManager
{
	public static int? myc;

	public static void gjd()
	{
		if (myc.HasValue)
		{
			Application.targetFrameRate = myc.Value;
			return;
		}
		int num = gjf();
		if (num == -1 || num > 60)
		{
			num = 60;
		}
		Application.targetFrameRate = num;
	}

	public static void gje()
	{
		Application.targetFrameRate = myc ?? gjf();
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		myc = null;
	}

	private static int gjf()
	{
		int num = rk.pnj;
		if (num == -1 || num > 0)
		{
			return num;
		}
		return (int)Math.Round(Screen.currentResolution.refreshRateRatio.value);
	}
}
