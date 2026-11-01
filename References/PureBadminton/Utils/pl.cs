using System;
using System.Linq;
using System.Text.RegularExpressions;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class pl
{
	public static void fxk()
	{
		try
		{
			if (!rk.mwr)
			{
				return;
			}
			int num = 0;
			string graphicsDeviceName = SystemInfo.graphicsDeviceName;
			int graphicsMemorySize = SystemInfo.graphicsMemorySize;
			if (!graphicsDeviceName.StartsWith("Apple"))
			{
				num = (graphicsDeviceName.StartsWith("Intel(R) HD Graphics") ? 1 : (graphicsDeviceName.StartsWith("Intel(R) UHD Graphics") ? 2 : ((graphicsDeviceName.StartsWith("Intel(R) Iris(R) Xe Graphics") || graphicsDeviceName.StartsWith("AMD Radeon(TM) Graphics")) ? 3 : ((graphicsMemorySize < 3000) ? 2 : ((graphicsMemorySize < 5000) ? 4 : ((graphicsMemorySize < 7000) ? 5 : ((graphicsMemorySize < 10000) ? 6 : 0)))))));
			}
			else
			{
				MatchCollection matchCollection = new Regex("Apple M(\\d+)( (\\S+))?").Matches(graphicsDeviceName);
				if (matchCollection.Count > 0)
				{
					int result = 0;
					int.TryParse(matchCollection[0].Groups[1].ToString(), out result);
					string text = matchCollection[0].Groups[3].ToString();
					if (result > 0)
					{
						if (text == "" && result <= 4)
						{
							num = 4;
						}
						else if ((text == "" && result >= 5) || (text == "Pro" && result <= 3))
						{
							num = 5;
						}
						else if ((text == "Pro" && result == 4) || (text == "Max" && result <= 2))
						{
							num = 6;
						}
					}
				}
			}
			int a = Screen.height;
			switch (num)
			{
			case 1:
				QualitySettings.SetQualityLevel(0);
				a = fxm();
				break;
			case 2:
				QualitySettings.SetQualityLevel(0);
				a = fxl();
				break;
			case 3:
				QualitySettings.SetQualityLevel(1);
				a = fxl();
				break;
			case 4:
				QualitySettings.SetQualityLevel(4);
				a = fxl();
				break;
			case 5:
				if (Screen.height <= 1080)
				{
					QualitySettings.SetQualityLevel(4);
				}
				else
				{
					QualitySettings.SetQualityLevel(2);
				}
				break;
			case 6:
				if (Screen.height > 1080)
				{
					QualitySettings.SetQualityLevel(4);
				}
				break;
			}
			nf.fic(a);
		}
		catch (Exception exception)
		{
			Debug.LogError("Unable to compute default settings. GPU Name: " + SystemInfo.graphicsDeviceName);
			Debug.LogException(exception);
		}
	}

	private static int fxl()
	{
		if (Screen.fullScreen && Screen.height > 1080)
		{
			Resolution resolution = Screen.resolutions.FirstOrDefault((Resolution a) => a.height == 1080);
			if (resolution.height == 1080)
			{
				Screen.SetResolution(resolution.width, resolution.height, fullscreen: true);
				return resolution.height;
			}
		}
		return Screen.height;
	}

	private static int fxm()
	{
		if (Screen.fullScreen && Screen.height >= 1080)
		{
			Resolution resolution = Screen.resolutions.FirstOrDefault((Resolution a) => a.height < 1080);
			if (resolution.height > 0)
			{
				Screen.SetResolution(resolution.width, resolution.height, fullscreen: true);
				return resolution.height;
			}
		}
		return Screen.height;
	}
}
