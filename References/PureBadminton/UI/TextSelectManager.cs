using System;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextSelectManager : Selectable
{
	private Button nno;

	private TextMeshProUGUI nnp;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedString ModalTitleLocalizedString;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public UnityEvent<string> OnValueChanged;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Func<string, Task<string>> AsyncValidator;

	private TextMeshProUGUI ptt
	{
		get
		{
			if (nnp == null)
			{
				nnp = base.transform.Find("Value").GetComponent<TextMeshProUGUI>();
			}
			return nnp;
		}
	}

	public string ptu
	{
		get
		{
			return ptt.text;
		}
		set
		{
			if (value != ptt.text)
			{
				ptt.text = value;
				OnValueChanged?.Invoke(value);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		nno = base.transform.Find("Icon").GetComponent<Button>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += hna;
		hnb();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= hna;
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
		hnb(true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		hnb(false);
	}

	private void hna(InputAction.CallbackContext a)
	{
		if (!IsInteractable() || EventSystem.current.currentSelectedGameObject != base.gameObject)
		{
			return;
		}
		if (AsyncValidator == null)
		{
			TextModal.Open(delegate(string a)
			{
				ptu = a;
			}, ptu, ModalTitleLocalizedString);
			return;
		}
		TextModal.Open(async delegate(string a)
		{
			string obj = await AsyncValidator(a);
			if (obj == null)
			{
				ptu = a;
			}
			return obj;
		}, ptu, ModalTitleLocalizedString);
	}

	protected void hnb(bool? a = null)
	{
		nno?.gameObject?.SetActive(a ?? (EventSystem.current?.currentSelectedGameObject == base.gameObject));
	}

	[CompilerGenerated]
	private void hnc(string a)
	{
		ptu = a;
	}

	[CompilerGenerated]
	private async Task<string> hnd(string a)
	{
		string obj = await AsyncValidator(a);
		if (obj == null)
		{
			ptu = a;
		}
		return obj;
	}
}
