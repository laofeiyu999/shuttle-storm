using System;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class KeyBindingSelectManager : Selectable
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vg
	{
		public KeyBindingSelectManager niy;

		public string niz;

		internal void hdx()
		{
			niy.hej();
			niy.njc.Dispose();
			niy.njc = null;
			niy.guv(0.1f, delegate
			{
				qi.msd.Enable();
			});
		}

		internal void hdy(InputActionRebindingExtensions.RebindingOperation a)
		{
			rk.pnl = a.action.actionMap.asset.SaveBindingOverridesAsJson();
			niy.OnBindingChanged?.Invoke(niy, niz);
			hdx();
		}

		internal void hdz(InputActionRebindingExtensions.RebindingOperation a)
		{
			hdx();
		}
	}

	private TextMeshProUGUI nja;

	private Button njb;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public InputActionReference ActionReference;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool IsGamepad;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public string CompositePartName;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public UnityEvent<KeyBindingSelectManager, string> OnBindingChanged;

	public InputActionRebindingExtensions.RebindingOperation njc { get; private set; }

	private string pru
	{
		get
		{
			if (!IsGamepad)
			{
				return "Keyboard";
			}
			return "Gamepad";
		}
	}

	private string prv
	{
		get
		{
			if (!IsGamepad)
			{
				return "<Keyboard>";
			}
			return "<Gamepad>";
		}
	}

	public int prw
	{
		get
		{
			InputAction action = ActionReference.action;
			for (int i = 0; i < action.bindings.Count; i++)
			{
				InputBinding inputBinding = action.bindings[i];
				if ((string.IsNullOrEmpty(CompositePartName) || (inputBinding.isPartOfComposite && !(inputBinding.name != CompositePartName))) && inputBinding.groups.Contains(pru))
				{
					return i;
				}
			}
			return -1;
		}
	}

	public InputBinding prx => ActionReference.action.bindings[prw];

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		nja = base.transform.Find("Value").GetComponent<TextMeshProUGUI>();
		njb = base.transform.Find("Icon").GetComponent<Button>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += heg;
		hej();
		hei();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= heg;
		if (njc != null)
		{
			njc.Cancel();
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnPointerEnter(PointerEventData eventData)
	{
		AudioManager.PlayMenuChange();
		EventSystem.current.SetSelectedGameObject(base.gameObject);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnSelect(BaseEventData eventData)
	{
		base.OnSelect(eventData);
		hei(true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		hei(false);
		if (njc != null)
		{
			njc.Cancel();
		}
	}

	private void heg(InputAction.CallbackContext a)
	{
		if (IsInteractable() && !(EventSystem.current.currentSelectedGameObject != base.gameObject))
		{
			heh();
		}
	}

	private void heh()
	{
		vg CS_0024_003C_003E8__locals0 = new vg();
		CS_0024_003C_003E8__locals0.niy = this;
		int num = prw;
		if (num == -1)
		{
			throw new InvalidOperationException("Binding not found");
		}
		InputAction action = ActionReference.action;
		qi.msd.Disable();
		nja.text = this.gut("Commands", "PressKey");
		CS_0024_003C_003E8__locals0.niz = action.bindings[num].effectivePath;
		njc = action.PerformInteractiveRebinding(num).WithCancelingThrough("<Keyboard>/escape").OnMatchWaitForAnother(0.1f)
			.OnComplete(delegate(InputActionRebindingExtensions.RebindingOperation a)
			{
				rk.pnl = a.action.actionMap.asset.SaveBindingOverridesAsJson();
				CS_0024_003C_003E8__locals0.niy.OnBindingChanged?.Invoke(CS_0024_003C_003E8__locals0.niy, CS_0024_003C_003E8__locals0.niz);
				CS_0024_003C_003E8__locals0.hdx();
			})
			.OnCancel(delegate
			{
				CS_0024_003C_003E8__locals0.hdx();
			});
		njc.Start();
	}

	protected void hei(bool? a = null)
	{
		njb?.gameObject?.SetActive(a ?? (EventSystem.current?.currentSelectedGameObject == base.gameObject));
	}

	public void hej()
	{
		nja.text = ActionReference.action.GetBindingDisplayString(prw);
	}
}
