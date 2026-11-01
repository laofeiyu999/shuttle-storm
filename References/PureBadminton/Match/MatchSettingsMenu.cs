using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchSettingsMenu : AnimatedPanel
{
	private static readonly List<rk.CameraMode> lve = Enum.GetValues(typeof(rk.CameraMode)).Cast<rk.CameraMode>().ToList();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSliderManager volumeSelection;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager announceScoreSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager showOpponentsStaminaSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager enableFatigueEffectSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager cameraSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager gameSpeedSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager placementAssistanceSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager shuttleTrajectorySelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager advancedAimingSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject announceScorePanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject gameSpeedPanel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI settingDescription;

	public float pfe
	{
		get
		{
			return rk.pni;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pni = value;
			AudioManager.SetVolume(value);
		}
	}

	public int pff
	{
		get
		{
			if (!rk.pnc)
			{
				return 0;
			}
			return 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pnc = value == 1;
		}
	}

	public int pfg
	{
		get
		{
			if (!rk.pnd)
			{
				return 0;
			}
			return 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pnd = value == 1;
			GameManager.Current.EnergyPanel.Initialize(GameManager.Current.Characters);
		}
	}

	public int pfh
	{
		get
		{
			if (!rk.pne)
			{
				return 0;
			}
			return 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pne = value == 1;
			if (value != 1)
			{
				GameManager.Current.FatigueEffect.dwt(a: true);
			}
		}
	}

	public int pfi
	{
		get
		{
			return lve.IndexOf(GameManager.Current.Cameras.lfu);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.CameraMode a = lve[value];
			GameManager.Current.Cameras.dew(a);
			rk.pnb = a;
		}
	}

	public int pfj
	{
		get
		{
			return (int)MatchSettings.Current.GameSpeed;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			MatchSettings.Current.GameSpeed = (rk.GameSpeedLevel)value;
			rk.pmw = MatchSettings.Current.GameSpeed;
		}
	}

	public int pfk
	{
		get
		{
			return (int)MatchSettings.Current.PlacementAssistance;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			MatchSettings.Current.PlacementAssistance = (rk.PlacementAssistanceLevel)value;
			rk.pmx = MatchSettings.Current.PlacementAssistance;
		}
	}

	public int pfl
	{
		get
		{
			return (int)MatchSettings.Current.ShuttleTrajectory;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			MatchSettings.Current.ShuttleTrajectory = (rk.ShuttleTrajectoryOptions)value;
			rk.pmy = MatchSettings.Current.ShuttleTrajectory;
		}
	}

	public int pfm
	{
		get
		{
			if (!rk.pmz)
			{
				return 0;
			}
			return 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmz = value == 1;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.msf += eku;
		CamerasManager cameras = GameManager.Current.Cameras;
		List<rk.CameraMode> list = lve.ToList();
		if (!cameras.oyo || !cameras.oyp)
		{
			list.Remove(rk.CameraMode.Team);
		}
		cameraSelect.Options = list.Select((rk.CameraMode a) => a.ToString()).ToList();
		announceScorePanel.SetActive(MatchSettings.Current.Online == null);
		gameSpeedPanel.SetActive(MatchSettings.Current.Online == null);
		volumeSelection.psb = pfe;
		announceScoreSelect.psa = pff;
		showOpponentsStaminaSelect.psa = pfg;
		enableFatigueEffectSelect.psa = pfh;
		cameraSelect.psa = pfi;
		gameSpeedSelect.psa = pfj;
		placementAssistanceSelect.psa = pfk;
		shuttleTrajectorySelect.psa = pfl;
		advancedAimingSelect.psa = pfm;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.msf -= eku;
	}

	private void eku(MoveDirection a, InputAction.CallbackContext b)
	{
		this.guz(delegate
		{
			settingDescription.gameObject.SetActive(EventSystem.current.currentSelectedGameObject == advancedAimingSelect.gameObject);
		});
	}

	[CompilerGenerated]
	private void ekv()
	{
		settingDescription.gameObject.SetActive(EventSystem.current.currentSelectedGameObject == advancedAimingSelect.gameObject);
	}
}
