using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CustomSelectManager : Selectable
{
	private Button nii;

	private TMP_Text nij;

	private bool nik;

	public string prh
	{
		get
		{
			return pri?.text;
		}
		set
		{
			if (pri != null)
			{
				pri.text = value;
			}
		}
	}

	private TMP_Text pri
	{
		get
		{
			if (!nik)
			{
				nij = base.transform.Find("Value")?.GetComponent<TMP_Text>();
				nik = true;
			}
			return nij;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		nii = base.transform.Find("Icon").GetComponent<Button>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		hco();
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
		hco(true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		hco(false);
	}

	protected void hco(bool? a = null)
	{
		nii?.gameObject?.SetActive(a ?? (EventSystem.current?.currentSelectedGameObject == base.gameObject));
	}
}
