using System;
using System.Collections.Generic;
using Assets.Scripts.UI;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class FpsCounter : MonoBehaviour
{
	private const string llc = "lastFpsCheck";

	private const float lld = 120f;

	private const int lle = 10000;

	private float llf;

	private int llg;

	private float llh;

	private float[] lli = new float[10000];

	public bool llj { get; private set; }

	private static int dxa()
	{
		return $"{Application.version}-{QualitySettings.GetQualityLevel()}-{Screen.currentResolution.width}-{Screen.currentResolution.height}".GetHashCode();
	}

	public static bool dxb()
	{
		if (!wn.nof)
		{
			return false;
		}
		int num = dxa();
		int @int = PlayerPrefs.GetInt("lastFpsCheck", 0);
		if (@int == 0)
		{
			return true;
		}
		return @int != num;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		llj = true;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (!llj || Time.deltaTime == 0f)
		{
			return;
		}
		float unscaledDeltaTime = Time.unscaledDeltaTime;
		if (!(unscaledDeltaTime <= 0f))
		{
			float num = 1f / unscaledDeltaTime;
			if (llg < 10000)
			{
				lli[llg] = num;
			}
			llh += unscaledDeltaTime;
			llg++;
			llf += unscaledDeltaTime;
			if (llf >= 120f)
			{
				dxc();
			}
		}
	}

	private void dxc()
	{
		llj = true;
		int num = Mathf.Min(llg, 10000);
		if (num != 0)
		{
			float f = (float)llg / llh;
			float[] array = new float[num];
			Array.Copy(lli, array, num);
			Array.Sort(array);
			int num2 = Mathf.Clamp(Mathf.FloorToInt((float)num * 0.01f), 0, num - 1);
			float f2 = array[num2];
			int num3 = Mathf.Clamp(Mathf.FloorToInt((float)num * 0.1f), 0, num - 1);
			float f3 = array[num3];
			wn.hpm("FpsCount", new Dictionary<string, object>
			{
				{
					"AppVersion",
					Application.version
				},
				{
					"AverageFps",
					Mathf.RoundToInt(f)
				},
				{
					"OnePercentLowFps",
					Mathf.RoundToInt(f2)
				},
				{
					"TenPercentLowFps",
					Mathf.RoundToInt(f3)
				},
				{
					"QualityLevel",
					QualitySettings.names[QualitySettings.GetQualityLevel()]
				},
				{
					"ResolutionWidth",
					Screen.currentResolution.width
				},
				{
					"ResolutionHeight",
					Screen.currentResolution.height
				},
				{
					"TargetFrameRate",
					Application.targetFrameRate
				},
				{
					"Gpu",
					SystemInfo.graphicsDeviceName
				},
				{
					"Cpu",
					SystemInfo.processorType
				},
				{
					"Ram",
					SystemInfo.systemMemorySize
				}
			});
			PlayerPrefs.SetInt("lastFpsCheck", dxa());
			base.enabled = false;
		}
	}
}
