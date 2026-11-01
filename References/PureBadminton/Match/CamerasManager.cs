using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CamerasManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const int SIDE_A_LAYER = 20;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const int SIDE_B_LAYER = 21;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera SideACamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera SideBCamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera TeamAPlayerACamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera TeamAPlayerBCamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera TeamBPlayerACamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera TeamBPlayerBCamera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioListener GlobalAudioListener;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<rk.CameraMode> PlayerCameraModes = new List<rk.CameraMode>
	{
		rk.CameraMode.Player,
		rk.CameraMode.PlayerClose,
		rk.CameraMode.PlayerFar,
		rk.CameraMode.PlayerLow
	};

	public rk.CameraMode lfu { get; private set; }

	public List<Camera> lfv { get; private set; }

	public List<CharacterManager> oyn => Game.Characters.Where((CharacterManager a) => a.pap).ToList();

	public bool oyo => oyn.Any((CharacterManager a) => a.par);

	public bool oyp => oyn.Any((CharacterManager a) => !a.par);

	public List<Camera> oyq => new List<Camera> { TeamAPlayerACamera, TeamAPlayerBCamera, TeamBPlayerACamera, TeamBPlayerBCamera };

	public List<Camera> oyr => new List<Camera> { SideACamera, SideBCamera }.Concat(oyq).ToList();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		lfu = rk.pnb;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		des();
		dex();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.plh.pkb.performed += deu;
		Game.lnf += der;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.plh.pkb.performed -= deu;
		Game.lnf -= der;
	}

	private void der()
	{
		des();
	}

	private void des()
	{
		foreach (CharacterManager character in Game.Characters)
		{
			det(character);
		}
	}

	private void det(CharacterManager a)
	{
		Camera camera = dez(a);
		CinemachineCamera component = camera.transform.parent.GetComponent<CinemachineCamera>();
		component.Follow = a.transform;
		int num = 10;
		if (lfu == rk.CameraMode.PlayerClose)
		{
			num = 6;
		}
		else if (lfu == rk.CameraMode.PlayerFar)
		{
			num = 12;
		}
		else if (lfu == rk.CameraMode.PlayerLow)
		{
			num = 8;
		}
		float y = 4f;
		if (lfu == rk.CameraMode.PlayerClose)
		{
			y = 2.8f;
		}
		else if (lfu == rk.CameraMode.PlayerLow)
		{
			y = 2f;
		}
		float x = 11f;
		if (lfu == rk.CameraMode.PlayerClose)
		{
			x = 8f;
		}
		else if (lfu == rk.CameraMode.PlayerLow)
		{
			x = 1f;
		}
		component.transform.eulerAngles = new Vector3(x, (!a.par) ? 180 : 0, 0f);
		component.GetComponent<CinemachineFollow>().FollowOffset = new Vector3(0f, y, num * ((!a.par) ? 1 : (-1)));
		camera.gvj(a.par ? 20 : 21);
		camera.gvi(a.par ? 21 : 20);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		foreach (CharacterManager item in oyn)
		{
			Camera camera = ((oyp && !oyo) ? SideBCamera : SideACamera);
			if (PlayerCameraModes.Contains(lfu))
			{
				camera = dez(item);
			}
			else if (lfu == rk.CameraMode.Team)
			{
				camera = (item.par ? SideACamera : SideBCamera);
			}
			Vector3 vector = camera.WorldToScreenPoint(item.transform.position + new Vector3(0f, (float)item.Player.CharacterInfo.height / 100f, 0f));
			item.lhw.transform.position = new Vector3(vector.x.gtg(20f, Screen.width - 20), (vector.y + 20f).gtg(20f, Screen.height - 20), vector.z);
			item.lhi.ljt.transform.position = new Vector3((vector.x - 60f).gtg(20f, Screen.width - 20), (vector.y - 20f).gtg(20f, Screen.height - 20), vector.z);
			Vector3 vector2 = camera.WorldToScreenPoint(item.transform.position);
			item.lhk.EnergyBar.transform.position = new Vector3(vector2.x.gtg(30f, Screen.width - 30), Mathf.Max(vector2.y - 25f, 0f).gtg(30f, Screen.height - 30), vector2.z);
		}
	}

	private void deu(InputAction.CallbackContext a)
	{
		if (!Game.pdu && !Game.pdw)
		{
			lfu = dev();
			rk.pnb = lfu;
			wn.hpm("SwitchCamera", new Dictionary<string, object> { 
			{
				"CameraMode",
				lfu.ToString()
			} });
			dex();
		}
	}

	private rk.CameraMode dev()
	{
		switch (lfu)
		{
		case rk.CameraMode.Player:
			return rk.CameraMode.PlayerClose;
		case rk.CameraMode.PlayerClose:
			return rk.CameraMode.PlayerFar;
		case rk.CameraMode.PlayerFar:
			return rk.CameraMode.PlayerLow;
		case rk.CameraMode.PlayerLow:
			return rk.CameraMode.TV;
		case rk.CameraMode.TV:
			return rk.CameraMode.Up;
		case rk.CameraMode.Up:
			if (!oyo || !oyp)
			{
				return rk.CameraMode.Player;
			}
			return rk.CameraMode.Team;
		default:
			return rk.CameraMode.Player;
		}
	}

	public void dew(rk.CameraMode a)
	{
		if (a != lfu)
		{
			lfu = a;
			dex();
		}
	}

	public void dex()
	{
		rk.CameraMode cameraMode = lfu;
		if (cameraMode == rk.CameraMode.Team && (!oyo || !oyp))
		{
			cameraMode = rk.CameraMode.TV;
		}
		if (PlayerCameraModes.Contains(cameraMode) && !oyn.Any())
		{
			cameraMode = rk.CameraMode.TV;
		}
		switch (cameraMode)
		{
		case rk.CameraMode.Team:
		{
			List<Camera> a2 = new List<Camera> { SideACamera, SideBCamera };
			lfv = a2;
			SideACamera.transform.localPosition = new Vector3(0f, 5f, -18f);
			SideACamera.transform.rotation = Quaternion.Euler(11f, 0f, 0f);
			SideACamera.fieldOfView = 35f;
			break;
		}
		case rk.CameraMode.Player:
		case rk.CameraMode.PlayerClose:
		case rk.CameraMode.PlayerFar:
		case rk.CameraMode.PlayerLow:
			lfv = oyn.Select((CharacterManager a) => dez(a)).ToList();
			foreach (CharacterManager item in oyn)
			{
				det(item);
			}
			break;
		case rk.CameraMode.Up:
			lfv = new List<Camera> { (oyp && !oyo) ? SideBCamera : SideACamera };
			SideACamera.transform.localPosition = new Vector3(0f, 7f, -20f);
			SideACamera.transform.rotation = Quaternion.Euler(18f, 0f, 0f);
			SideACamera.fieldOfView = 20f;
			break;
		default:
			lfv = new List<Camera> { (oyp && !oyo) ? SideBCamera : SideACamera };
			SideACamera.transform.localPosition = new Vector3(0f, 5f, -20f);
			SideACamera.transform.rotation = Quaternion.Euler(11f, 0f, 0f);
			SideACamera.fieldOfView = 20f;
			break;
		}
		SideBCamera.transform.localPosition = new Vector3(SideACamera.transform.localPosition.x, SideACamera.transform.localPosition.y, 0f - SideACamera.transform.localPosition.z);
		SideBCamera.transform.rotation = Quaternion.Euler(SideACamera.transform.rotation.eulerAngles.x, 180f, SideACamera.transform.rotation.eulerAngles.z);
		SideBCamera.fieldOfView = SideACamera.fieldOfView;
		float num = 1f;
		float num2 = 1f;
		switch (lfv.Count)
		{
		case 2:
			num = 0.5f;
			break;
		case 3:
			num = 1f / 3f;
			break;
		case 4:
			num = 0.5f;
			num2 = 0.5f;
			break;
		}
		float num3 = 0f;
		float num4 = 0f;
		foreach (Camera item2 in oyr)
		{
			bool flag = lfv.Contains(item2);
			item2.gameObject.SetActive(flag);
			if (flag)
			{
				item2.GetComponent<AudioListener>().enabled = lfv.Count == 1;
				item2.rect = new Rect(num3, num4, num, num2);
				num3 += num;
				if (num3 == 1f)
				{
					num3 = 0f;
					num4 += num2;
				}
			}
		}
		GlobalAudioListener.enabled = lfv.Count > 1;
	}

	public bool dey(CharacterManager a)
	{
		if (!lfv.Contains(dez(a)))
		{
			return lfv.Contains(a.par ? SideACamera : SideBCamera);
		}
		return true;
	}

	private Camera dez(CharacterManager a)
	{
		return a.Player.Position switch
		{
			MatchSettings.PositionOnCourt.SideARight => TeamAPlayerACamera, 
			MatchSettings.PositionOnCourt.SideALeft => TeamAPlayerBCamera, 
			MatchSettings.PositionOnCourt.SideBRight => TeamBPlayerACamera, 
			_ => TeamBPlayerBCamera, 
		};
	}

	[CompilerGenerated]
	private Camera dfa(CharacterManager a)
	{
		return dez(a);
	}
}
