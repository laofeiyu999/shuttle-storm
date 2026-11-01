using System;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine.EventSystems;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class StartMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedTextMeshPro titleText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager stadiumSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager winningSetsSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager setPointsSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager difficultySelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager gameSpeedSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager placementAssistanceSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager shuttleTrajectorySelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image stadiumImage;

	public int pys
	{
		get
		{
			int num = Array.IndexOf(rk.mwu, rk.pmp);
			if (num == -1)
			{
				rk.pmp = rk.mwu[0];
				return 0;
			}
			return num;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmp = rk.mwu[value];
			jiv();
		}
	}

	public int pyt
	{
		get
		{
			return rk.pmt - 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmt = value + 1;
		}
	}

	public int pyu
	{
		get
		{
			return Array.IndexOf(rk.mwt, rk.pmu);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmu = rk.mwt[value];
		}
	}

	public int pyv
	{
		get
		{
			return (int)rk.pmv;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmv = (rk.DifficultyLevel)value;
		}
	}

	public int pyw
	{
		get
		{
			return (int)rk.pmw;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmw = (rk.GameSpeedLevel)value;
		}
	}

	public int pyx
	{
		get
		{
			return (int)rk.pmx;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmx = (rk.PlacementAssistanceLevel)value;
		}
	}

	public int pyy
	{
		get
		{
			return (int)rk.pmy;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmy = (rk.ShuttleTrajectoryOptions)value;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected void Start()
	{
		jiv();
		setPointsSelect.Options = rk.mwt.Select((int a) => a.ToString()).ToList();
		stadiumSelect.Options = rk.mwu.Select((string a) => a.ToString()).ToList();
		stadiumSelect.psa = pys;
		winningSetsSelect.psa = pyt;
		setPointsSelect.psa = pyu;
		difficultySelect.psa = pyv;
		gameSpeedSelect.psa = pyw;
		placementAssistanceSelect.psa = pyx;
		shuttleTrajectorySelect.psa = pyy;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		string text = "MatchSettings";
		if (rk.pna == rk.PlayModes.Tournament)
		{
			text = "TournamentSettings";
		}
		if (rk.pna == rk.PlayModes.Career)
		{
			text = "CareerSettings";
		}
		titleText.plk = new LocalizedString("MainMenu", text);
		stadiumSelect.transform.parent.gameObject.SetActive(rk.pna == rk.PlayModes.Quick);
		stadiumImage.transform.parent.gameObject.SetActive(rk.pna == rk.PlayModes.Quick);
		EventSystem.current.SetSelectedGameObject((rk.pna == rk.PlayModes.Quick) ? stadiumSelect.gameObject : winningSetsSelect.gameObject);
	}

	private void jiv()
	{
		stadiumImage.sprite = rr.gjk(rk.pmp);
	}
}
