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
using UnityEngine.UI;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TeamsSelection : MonoBehaviour
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class vv
	{
		public int nmz;

		public int nna;

		public GameObject nnb;

		public MatchSettings.PositionOnCourt? nnc;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vw
	{
		public InputAction.CallbackContext nnd;

		internal bool hmd(vv a)
		{
			return a.nna == nnd.control.device.deviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vx
	{
		public MatchSettings.PlayerSettings nne;

		internal bool hme(vv a)
		{
			return a.nna == nne.DeviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vy
	{
		public InputDevice nnf;

		internal bool hmf(vv a)
		{
			return a.nna == nnf.deviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vz
	{
		public MatchSettings.PlayerSettings nng;

		public TeamsSelection nnh;

		internal bool hmg(vv a)
		{
			return a.nnc == (nnh.pts ? MatchSettings.gcm(nng.Position) : nng.Position);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wa
	{
		public InputDevice nni;

		internal bool hmh(vv a)
		{
			return a.nna == nni.deviceId;
		}

		internal bool hmi(KeyValuePair<int, InputDevice> a)
		{
			if (!string.IsNullOrEmpty(nni.description.serial))
			{
				return a.Value.description.serial == nni.description.serial;
			}
			return false;
		}

		internal bool hmj(KeyValuePair<int, InputDevice> a)
		{
			return a.Value.deviceId == nni.deviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wb
	{
		public vv nnj;

		internal bool hmk(InputDevice a)
		{
			return a.deviceId == nnj.nna;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wc
	{
		public Transform nnk;

		internal bool hml(vv a)
		{
			return a.nnb == nnk.gameObject;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wd
	{
		public MatchSettings.PositionOnCourt nnl;

		public Func<vv, bool> nnm;

		internal bool hmm(vv a)
		{
			return a.nnc == nnl;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class we
	{
		public MatchSettings.PositionOnCourt nnn;

		internal bool hmn(vv a)
		{
			return a.nnc == nnn;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static Dictionary<int, InputDevice> HistoricalDevices = new Dictionary<int, InputDevice>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static readonly Color[] PlayersColor = new Color[11]
	{
		new Color32(112, 224, 0, byte.MaxValue),
		new Color32(0, 187, 249, byte.MaxValue),
		new Color32(251, 133, 0, byte.MaxValue),
		new Color32(137, 0, 242, byte.MaxValue),
		new Color32(33, 158, 188, byte.MaxValue),
		new Color32(239, 35, 60, byte.MaxValue),
		new Color32(byte.MaxValue, 214, 10, byte.MaxValue),
		new Color32(114, 239, 221, byte.MaxValue),
		new Color32(byte.MaxValue, 134, 112, byte.MaxValue),
		new Color32(241, 91, 181, byte.MaxValue),
		new Color32(29, 211, 176, byte.MaxValue)
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<vv> Devices = new List<vv>();

	public bool ptq
	{
		get
		{
			if (!Devices.Any((vv a) => a.nnc.HasValue))
			{
				return false;
			}
			if (Career.Current != null && !Devices.Any((vv a) => a.nnc == MatchSettings.PositionOnCourt.SideARight))
			{
				return false;
			}
			if (Tournament.Current != null && Devices.Any((vv a) => a.nnc == MatchSettings.PositionOnCourt.SideBRight || a.nnc == MatchSettings.PositionOnCourt.SideBLeft))
			{
				return false;
			}
			return true;
		}
	}

	public bool ptr
	{
		get
		{
			if (rk.pna != rk.PlayModes.Tournament)
			{
				return Tournament.Current == null;
			}
			return false;
		}
	}

	public bool pts
	{
		get
		{
			if (Tournament.Current != null)
			{
				return MatchSettings.Current.TeamB.pll.Any((MatchSettings.PlayerSettings a) => a.PlayerId.HasValue);
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected void OnEnable()
	{
		InputSystem.onDeviceChange += hms;
		qi.msf += hmr;
		Initialize();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		InputSystem.onDeviceChange -= hms;
		qi.msf -= hmr;
	}

	private void hmr(MoveDirection a, InputAction.CallbackContext b)
	{
		vv vv = Devices.Find((vv a) => a.nna == b.control.device.deviceId);
		MatchSettings.PositionOnCourt? nnc = vv.nnc;
		switch (a)
		{
		case MoveDirection.Left:
			if (vv.nnc == MatchSettings.PositionOnCourt.SideBLeft || vv.nnc == MatchSettings.PositionOnCourt.SideBRight)
			{
				vv.nnc = null;
			}
			else if (!vv.nnc.HasValue)
			{
				if (hmv(MatchSettings.PositionOnCourt.SideALeft))
				{
					vv.nnc = MatchSettings.PositionOnCourt.SideALeft;
				}
				else if (hmv(MatchSettings.PositionOnCourt.SideARight))
				{
					vv.nnc = MatchSettings.PositionOnCourt.SideARight;
				}
			}
			break;
		case MoveDirection.Right:
			if (vv.nnc == MatchSettings.PositionOnCourt.SideALeft || vv.nnc == MatchSettings.PositionOnCourt.SideARight)
			{
				vv.nnc = null;
			}
			else if (!vv.nnc.HasValue)
			{
				if (hmv(MatchSettings.PositionOnCourt.SideBRight))
				{
					vv.nnc = MatchSettings.PositionOnCourt.SideBRight;
				}
				else if (hmv(MatchSettings.PositionOnCourt.SideBLeft))
				{
					vv.nnc = MatchSettings.PositionOnCourt.SideBLeft;
				}
			}
			break;
		case MoveDirection.Up:
			if (vv.nnc == MatchSettings.PositionOnCourt.SideARight && hmv(MatchSettings.PositionOnCourt.SideALeft))
			{
				vv.nnc = MatchSettings.PositionOnCourt.SideALeft;
			}
			if (vv.nnc == MatchSettings.PositionOnCourt.SideBLeft && hmv(MatchSettings.PositionOnCourt.SideBRight))
			{
				vv.nnc = MatchSettings.PositionOnCourt.SideBRight;
			}
			break;
		case MoveDirection.Down:
			if (vv.nnc == MatchSettings.PositionOnCourt.SideALeft && hmv(MatchSettings.PositionOnCourt.SideARight))
			{
				vv.nnc = MatchSettings.PositionOnCourt.SideARight;
			}
			if (vv.nnc == MatchSettings.PositionOnCourt.SideBRight && hmv(MatchSettings.PositionOnCourt.SideBLeft))
			{
				vv.nnc = MatchSettings.PositionOnCourt.SideBLeft;
			}
			break;
		}
		if (nnc != vv.nnc)
		{
			AudioManager.PlayMenuChange();
		}
		hmu();
	}

	private void hms(InputDevice a, InputDeviceChange b)
	{
		hmt();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize()
	{
		MatchSettings current = MatchSettings.Current;
		GetComponent<Image>().sprite = Resources.Load<Sprite>((!ptr) ? (current.IsDouble ? "Images/Court_double_oneside" : "Images/Court_single_oneside") : (current.IsDouble ? "Images/Court_double" : "Images/Court_single"));
		hmt();
		foreach (MatchSettings.PlayerSettings nne in current.plv)
		{
			vv vv = Devices.Find((vv a) => a.nna == nne.DeviceId);
			if (vv != null)
			{
				vv.nnc = (pts ? MatchSettings.gcm(nne.Position) : nne.Position);
			}
		}
		if (!current.IsDouble)
		{
			foreach (vv item in Devices.Where((vv a) => a.nnc == MatchSettings.PositionOnCourt.SideALeft || a.nnc == MatchSettings.PositionOnCourt.SideBLeft))
			{
				item.nnc = null;
			}
		}
		if (!Devices.Any((vv a) => a.nnc.HasValue) && Gamepad.all.Count <= 1)
		{
			InputDevice nnf = Gamepad.all.FirstOrDefault() ?? InputSystem.devices.FirstOrDefault();
			if (nnf != null)
			{
				vv vv2 = Devices.Find((vv a) => a.nna == nnf.deviceId);
				if (vv2 != null)
				{
					vv2.nnc = MatchSettings.PositionOnCourt.SideARight;
				}
			}
		}
		hmu();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Save()
	{
		MatchSettings current = MatchSettings.Current;
		if (Tournament.Current != null)
		{
			qg qg2 = Career.Current?.Settings ?? Tournament.Current?.Settings;
			qg2.mrh = Devices.FirstOrDefault((vv a) => a.nnc == MatchSettings.PositionOnCourt.SideARight)?.nna;
			if (current.IsDouble)
			{
				qg2.mri = Devices.FirstOrDefault((vv a) => a.nnc == MatchSettings.PositionOnCourt.SideALeft)?.nna;
			}
		}
		foreach (MatchSettings.PlayerSettings nng in current.plv)
		{
			vv vv = Devices.FirstOrDefault((vv a) => a.nnc == (pts ? MatchSettings.gcm(nng.Position) : nng.Position));
			if (vv != null)
			{
				nng.PlayerId = vv.nmz;
				nng.DeviceId = vv.nna;
			}
			else
			{
				nng.PlayerId = null;
				nng.DeviceId = null;
			}
		}
	}

	private void hmt()
	{
		foreach (InputDevice nni in from a in InputSystem.devices
			where a is Keyboard || a is Gamepad
			orderby (!(a is Gamepad)) ? 1 : 0
			select a)
		{
			vv vv = Devices.Find((vv a) => a.nna == nni.deviceId);
			if (vv?.nnb == null)
			{
				string text = ((nni is Gamepad) ? "Gamepad" : "Keyboard");
				GameObject gameObject = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/" + text + "Selection"), Vector3.zero, Quaternion.identity);
				gameObject.name = $"{text} {nni.deviceId}";
				gameObject.transform.SetParent(base.transform, worldPositionStays: false);
				vv = new vv
				{
					nna = nni.deviceId,
					nnb = gameObject
				};
				Devices.Add(vv);
			}
			if (vv.nmz == 0)
			{
				vv.nmz = HistoricalDevices.FirstOrDefault((KeyValuePair<int, InputDevice> a) => !string.IsNullOrEmpty(nni.description.serial) && a.Value.description.serial == nni.description.serial).Key;
			}
			if (vv.nmz == 0)
			{
				vv.nmz = HistoricalDevices.FirstOrDefault((KeyValuePair<int, InputDevice> a) => a.Value.deviceId == nni.deviceId).Key;
			}
			if (vv.nmz == 0)
			{
				vv.nmz = (HistoricalDevices.Keys.Any() ? HistoricalDevices.Keys.Max() : 0) + 1;
			}
			if (!HistoricalDevices.ContainsKey(vv.nmz))
			{
				HistoricalDevices.Add(vv.nmz, nni);
			}
		}
		Devices = Devices.Where((vv a) => InputSystem.devices.Any((InputDevice a) => a.deviceId == a.nna)).ToList();
		for (int i = 0; i < base.transform.childCount; i++)
		{
			Transform nnk = base.transform.GetChild(i);
			if (!Devices.Any((vv a) => a.nnb == nnk.gameObject))
			{
				UnityEngine.Object.Destroy(nnk.gameObject);
			}
		}
		foreach (vv device in Devices)
		{
			Color color = hmw(device.nmz);
			TMP_Text component = device.nnb.transform.Find("PlayerNumber/Text").GetComponent<TMP_Text>();
			device.nnb.transform.Find("PlayerNumber").GetComponent<Image>().color = color;
			component.text = this.gut("Global", "PlayerX", device.nmz);
			component.color = qh.fzs(color);
		}
		hmu();
	}

	private void hmu()
	{
		foreach (MatchSettings.PositionOnCourt nnl in Enum.GetValues(typeof(MatchSettings.PositionOnCourt)))
		{
			foreach (vv item in Devices.Where((vv a) => a.nnc == nnl).Skip(1))
			{
				item.nnc = null;
			}
		}
		int num = 100;
		int num2 = (Devices.Count((vv a) => !a.nnc.HasValue) - 1) * num / 2;
		foreach (vv item2 in Devices.OrderBy((vv a) => a.nmz))
		{
			int num3 = 0;
			int num4 = 0;
			if (item2.nnc == MatchSettings.PositionOnCourt.SideALeft || item2.nnc == MatchSettings.PositionOnCourt.SideARight)
			{
				num3 = -350;
			}
			if (item2.nnc == MatchSettings.PositionOnCourt.SideBLeft || item2.nnc == MatchSettings.PositionOnCourt.SideBRight)
			{
				num3 = 350;
			}
			if (!MatchSettings.Current.IsDouble && item2.nnc.HasValue)
			{
				num4 = 0;
			}
			else if (item2.nnc == MatchSettings.PositionOnCourt.SideALeft || item2.nnc == MatchSettings.PositionOnCourt.SideBRight)
			{
				num4 = 95;
			}
			else if (item2.nnc == MatchSettings.PositionOnCourt.SideARight || item2.nnc == MatchSettings.PositionOnCourt.SideBLeft)
			{
				num4 = -95;
			}
			if (!item2.nnc.HasValue)
			{
				num4 = num2;
				num2 -= num;
			}
			item2.nnb.transform.GetComponent<RectTransform>().anchoredPosition = new Vector2(num3, num4);
			item2.nnb.transform.Find("Device/ArrowLeft").GetComponent<Image>().color = ((item2.nnc != MatchSettings.PositionOnCourt.SideALeft && item2.nnc != MatchSettings.PositionOnCourt.SideARight) ? hmw(item2.nmz) : ((Color)new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 76)));
			item2.nnb.transform.Find("Device/ArrowRight").GetComponent<Image>().color = ((item2.nnc != MatchSettings.PositionOnCourt.SideBLeft && item2.nnc != MatchSettings.PositionOnCourt.SideBRight) ? hmw(item2.nmz) : ((Color)new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, 76)));
		}
	}

	private bool hmv(MatchSettings.PositionOnCourt a)
	{
		if (!ptr && (a == MatchSettings.PositionOnCourt.SideBLeft || a == MatchSettings.PositionOnCourt.SideBRight))
		{
			return false;
		}
		if (!MatchSettings.Current.IsDouble && (a == MatchSettings.PositionOnCourt.SideALeft || a == MatchSettings.PositionOnCourt.SideBLeft))
		{
			return false;
		}
		return !Devices.Any((vv a) => a.nnc == a);
	}

	public static Color hmw(int a)
	{
		return PlayersColor[(a - 1) % PlayersColor.Length];
	}
}
