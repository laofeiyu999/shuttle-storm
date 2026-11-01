using System;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SettingsPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager winningSetsSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager setPointsSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager difficultySelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager gameSpeedSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager placementAssistanceSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager shuttleTrajectorySelect;

	public qg oyc => Career.Current.Settings;

	public int oyd
	{
		get
		{
			return oyc.WinningSets - 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			oyc.WinningSets = value + 1;
		}
	}

	public int oye
	{
		get
		{
			return Array.IndexOf(rk.mwt, oyc.SetPoints);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			oyc.SetPoints = rk.mwt[value];
		}
	}

	public int oyf
	{
		get
		{
			return (int)oyc.Difficulty;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			oyc.Difficulty = (rk.DifficultyLevel)value;
		}
	}

	public int oyg
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

	public int oyh
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

	public int oyi
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
	protected override void OnEnable()
	{
		base.OnEnable();
		setPointsSelect.Options = rk.mwt.Select((int a) => a.ToString()).ToList();
		winningSetsSelect.psa = oyd;
		setPointsSelect.psa = oye;
		difficultySelect.psa = oyf;
		gameSpeedSelect.psa = oyg;
		placementAssistanceSelect.psa = oyh;
		shuttleTrajectorySelect.psa = oyi;
	}
}
