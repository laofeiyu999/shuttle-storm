using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CountrySelectManager : Selectable
{
	private Button nia;

	private TextMeshProUGUI nib;

	private Country nic;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public UnityEvent<Country> OnValueChanged;

	public Country pre
	{
		get
		{
			return nic;
		}
		set
		{
			if (value != nic)
			{
				nic = value;
				OnValueChanged?.Invoke(value);
				hbw();
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		nia = base.transform.Find("Icon").GetComponent<Button>();
		nib = base.transform.Find("Value").GetComponent<TextMeshProUGUI>();
		hbw();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		LocalizationSettings.SelectedLocaleChanged += hbu;
		qi.pli.pkm.performed += hbt;
		hbx();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		LocalizationSettings.SelectedLocaleChanged -= hbu;
		qi.pli.pkm.performed -= hbt;
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
		hbx(true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		hbx(false);
	}

	private void hbt(InputAction.CallbackContext a)
	{
		if (IsInteractable() && !(EventSystem.current.currentSelectedGameObject != base.gameObject))
		{
			CountryModal.Open(delegate(Country a)
			{
				pre = a;
			}, pre);
		}
	}

	private void hbu(Locale a)
	{
		hbw();
	}

	public void hbv()
	{
		hbw();
		hbx();
	}

	private void hbw()
	{
		if (nib != null)
		{
			nib.text = nic?.name ?? "";
		}
	}

	protected void hbx(bool? a = null)
	{
		nia?.gameObject?.SetActive(a ?? (EventSystem.current?.currentSelectedGameObject == base.gameObject));
	}

	[CompilerGenerated]
	private void hby(Country a)
	{
		pre = a;
	}
}
