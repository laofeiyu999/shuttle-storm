using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CustomizeCommandsMenu : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		this.guv(0.2f, delegate
		{
			if (base.isActiveAndEnabled)
			{
				qi.pli.pkl.performed += eiu;
			}
		});
		TabsManager component = GetComponent<TabsManager>();
		component.nmx += eiv;
		component.ptp = ((Gamepad.current == null) ? 1 : 0);
		eiv(component.ptp);
		eix();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.pli.pkl.performed -= eiu;
		GetComponent<TabsManager>().nmx -= eiv;
	}

	private void eiu(InputAction.CallbackContext a)
	{
		if (this.gus())
		{
			SimpleModal.hia(this.gut("Commands", "ResetControlsModal"), delegate
			{
				rk.pnl = null;
				qi.gaf();
				eix();
			}, delegate
			{
			}, d: true);
		}
	}

	private void eiv(int a)
	{
		List<TabsManager.Tab> tabs = GetComponent<TabsManager>().Tabs;
		for (int i = 0; i < tabs.Count; i++)
		{
			tabs[i].Header.transform.Find("Border").gameObject.SetActive(i == a);
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OnRebindKey(KeyBindingSelectManager bindingItem, string oldPath)
	{
		eiw(bindingItem, oldPath);
		qi.gae();
	}

	public void eiw(KeyBindingSelectManager a, string b)
	{
		InputBinding inputBinding = a.prx;
		string effectivePath = inputBinding.effectivePath;
		if (string.IsNullOrEmpty(effectivePath))
		{
			return;
		}
		KeyBindingSelectManager[] componentsInChildren = GetComponentsInChildren<KeyBindingSelectManager>();
		foreach (KeyBindingSelectManager keyBindingSelectManager in componentsInChildren)
		{
			InputBinding inputBinding2 = keyBindingSelectManager.prx;
			if (!(inputBinding2 == inputBinding) && !inputBinding2.isComposite && inputBinding2.effectivePath == effectivePath)
			{
				keyBindingSelectManager.ActionReference.action.ApplyBindingOverride(keyBindingSelectManager.prw, b);
				rk.pnl = keyBindingSelectManager.ActionReference.asset.SaveBindingOverridesAsJson();
				keyBindingSelectManager.hej();
				break;
			}
		}
	}

	public void eix()
	{
		KeyBindingSelectManager[] componentsInChildren = GetComponentsInChildren<KeyBindingSelectManager>(includeInactive: true);
		foreach (KeyBindingSelectManager keyBindingSelectManager in componentsInChildren)
		{
			keyBindingSelectManager.ActionReference.asset.LoadBindingOverridesFromJson(rk.pnl);
			if (keyBindingSelectManager.gameObject.activeInHierarchy)
			{
				keyBindingSelectManager.hej();
			}
		}
	}

	[CompilerGenerated]
	private void eiy()
	{
		if (base.isActiveAndEnabled)
		{
			qi.pli.pkl.performed += eiu;
		}
	}

	[CompilerGenerated]
	private void eiz()
	{
		rk.pnl = null;
		qi.gaf();
		eix();
	}
}
