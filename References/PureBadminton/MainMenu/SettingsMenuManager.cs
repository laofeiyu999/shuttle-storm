using System;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SettingsMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager localeSelection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSliderManager volumeSelection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager qualitySelection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager resolutionSelection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager fullscreenSelection;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager fpsCapSelection;

	private float ojq;

	private int ojr;

	private Resolution ojs;

	private bool ojt;

	private int oju;

	private int[] ojv = new int[9] { -2, 30, 60, 90, 120, 144, 165, 240, -1 };

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		localeSelection.Options = LocalizationSettings.AvailableLocales.Locales.Select((Locale a) => a.Identifier.Code).ToList();
		localeSelection.psa = LocalizationSettings.AvailableLocales.Locales.IndexOf(LocalizationSettings.SelectedLocale);
		volumeSelection.psb = (ojq = rk.pni);
		qualitySelection.psa = (ojr = QualitySettings.GetQualityLevel());
		ojs = new Resolution
		{
			width = Screen.width,
			height = Screen.height
		};
		resolutionSelection.Options = Screen.resolutions.Select((Resolution a) => $"{a.width} x {a.height}").ToList();
		int num = Screen.resolutions.ToList().FindIndex((Resolution a) => a.width == ojs.width && a.height == ojs.height);
		if (num == -1)
		{
			num = Screen.resolutions.Length - 1;
		}
		resolutionSelection.psa = num;
		resolutionSelection.hew();
		fullscreenSelection.psa = (Screen.fullScreen ? 1 : 0);
		fpsCapSelection.Options = ojv.Select((int a) => jij(a)).ToList();
		fpsCapSelection.psa = Array.FindIndex(ojv, (int a) => a == rk.pnj);
	}

	public void jih()
	{
		AudioManager.fir();
	}

	public void jii()
	{
		rk.pni = ojq;
		if (ojr != QualitySettings.GetQualityLevel())
		{
			QualitySettings.SetQualityLevel(ojr);
		}
		if (Screen.width != ojs.width || Screen.height != ojs.height || Screen.fullScreen != ojt)
		{
			Screen.SetResolution(ojs.width, ojs.height, ojt);
		}
		nf.fic(ojs.height);
		rk.pnj = oju;
		RefreshRateManager.gjd();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetLocale(int localeIndex)
	{
		rk.pnk = (LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[localeIndex]).Identifier.Code;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetVolume(float volume)
	{
		ojq = volume;
		AudioManager.SetVolume(volume);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetQuality(int qualityIndex)
	{
		ojr = qualityIndex;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetResolution(int resolutionIndex)
	{
		ojs = Screen.resolutions[resolutionIndex];
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetFullscreen(int fullScreenIndex)
	{
		ojt = fullScreenIndex == 1;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void SetFpsCap(int fpsCapIndex)
	{
		oju = ojv[fpsCapIndex];
	}

	public string jij(int a)
	{
		return a switch
		{
			-2 => string.Format("{0} ({1})", this.gut("Global", "Auto"), Math.Round(Screen.currentResolution.refreshRateRatio.value)), 
			-1 => this.gut("MainMenu_Settings", "Unlimited"), 
			_ => a.ToString(), 
		};
	}

	[CompilerGenerated]
	private bool jik(Resolution a)
	{
		if (a.width == ojs.width)
		{
			return a.height == ojs.height;
		}
		return false;
	}

	[CompilerGenerated]
	private string jil(int a)
	{
		return jij(a);
	}
}
