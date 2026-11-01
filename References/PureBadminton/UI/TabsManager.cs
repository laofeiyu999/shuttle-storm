using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TabsManager : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnTabChanged(int tabIndex);

	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class Tab
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public GameObject Header;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public GameObject Content;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public bool Disabled;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int DefaultSelectedTabIndex;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<Tab> Tabs;

	private int nmy = -1;

	public int ptp
	{
		get
		{
			return nmy;
		}
		set
		{
			int num = value.gth(0, Tabs.Count - 1);
			if (num != nmy)
			{
				nmy = num;
				hln();
				this.nmx?.Invoke(nmy);
			}
		}
	}

	public event OnTabChanged nmx;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (nmy == -1)
		{
			nmy = DefaultSelectedTabIndex;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.pli.pki.performed += hll;
		qi.pli.pkj.performed += hlm;
		hln(a: false);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pki.performed -= hll;
		qi.pli.pkj.performed -= hlm;
	}

	private void hll(InputAction.CallbackContext a)
	{
		if (this.gus() && Tabs.Count((Tab a) => !a.Disabled) >= 2)
		{
			AudioManager.fiu();
			Func<int, int> func = (int a) => (a <= 0) ? (Tabs.Count - 1) : (a - 1);
			int num = nmy;
			do
			{
				num = func(num);
			}
			while (Tabs[num].Disabled);
			ptp = num;
		}
	}

	private void hlm(InputAction.CallbackContext a)
	{
		if (this.gus() && Tabs.Count((Tab a) => !a.Disabled) >= 2)
		{
			AudioManager.fiu();
			Func<int, int> func = (int a) => (a < Tabs.Count - 1) ? (a + 1) : 0;
			int num = nmy;
			do
			{
				num = func(num);
			}
			while (Tabs[num].Disabled);
			ptp = num;
		}
	}

	private void hln(bool a = true)
	{
		for (int i = 0; i < Tabs.Count; i++)
		{
			Tabs[i].Header.SetActive(!Tabs[i].Disabled);
		}
		if (Tabs.Count((Tab a) => !a.Disabled) == 0)
		{
			return;
		}
		while (Tabs[ptp].Disabled)
		{
			if (ptp >= Tabs.Count - 1)
			{
				nmy = 0;
			}
			else
			{
				nmy++;
			}
		}
		List<GameObject> list = new List<GameObject>();
		List<GameObject> list2 = new List<GameObject>();
		for (int j = 0; j < Tabs.Count; j++)
		{
			bool num = j == ptp;
			GameObject content = Tabs[j].Content;
			AnimatedPanel component = content.GetComponent<AnimatedPanel>();
			if (num && ((object)component == null || !component.pqc))
			{
				list.Add(content);
			}
			if (!num && ((object)component == null || component.pqc))
			{
				list2.Add(content);
			}
		}
		foreach (GameObject item in list2)
		{
			AnimatedPanel component2 = item.GetComponent<AnimatedPanel>();
			if ((bool)component2)
			{
				if (a)
				{
					component2.FadeOut();
				}
				else
				{
					component2.gxs();
				}
			}
			else
			{
				item.SetActive(value: false);
			}
		}
		foreach (GameObject item2 in list)
		{
			AnimatedPanel component3 = item2.GetComponent<AnimatedPanel>();
			if ((bool)component3)
			{
				if (a)
				{
					component3.FadeIn();
				}
				else
				{
					component3.gxr();
				}
			}
			else
			{
				item2.SetActive(value: true);
			}
		}
	}

	[CompilerGenerated]
	private int hlo(int a)
	{
		if (a <= 0)
		{
			return Tabs.Count - 1;
		}
		return a - 1;
	}

	[CompilerGenerated]
	private int hlp(int a)
	{
		if (a >= Tabs.Count - 1)
		{
			return 0;
		}
		return a + 1;
	}
}
