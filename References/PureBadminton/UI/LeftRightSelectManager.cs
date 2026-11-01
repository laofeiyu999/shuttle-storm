using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.Events;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class LeftRightSelectManager : LeftRightInputManager
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnValueChangedDelegate(LeftRightSelectManager obj, int value);

	private TMP_Text njf;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedStringTable StringTable;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<string> Options;

	protected int njg;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public UnityEvent<int> OnValueChanged;

	protected override bool pry => njg <= 0;

	protected override bool prz => njg >= Options.Count - 1;

	public int psa
	{
		get
		{
			return njg;
		}
		set
		{
			if (value < 0)
			{
				value = 0;
			}
			if (value >= Options.Count)
			{
				value = Options.Count - 1;
			}
			if (value != njg)
			{
				njg = value;
				OnValueChanged.Invoke(psa);
				this.njh?.Invoke(this, psa);
			}
			hex();
			heo();
		}
	}

	public event OnValueChangedDelegate njh;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		njf = base.transform.Find("Value").GetComponent<TMP_Text>();
		hex();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		LocalizationSettings.SelectedLocaleChanged += hev;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		LocalizationSettings.SelectedLocaleChanged -= hev;
	}

	private void hev(Locale a)
	{
		hex();
	}

	public void hew()
	{
		hex();
		heo();
	}

	private void hex()
	{
		if (njf != null)
		{
			njf.text = hey(njg);
		}
	}

	private string hey(int a)
	{
		if (a < 0 || a > Options.Count - 1)
		{
			return string.Empty;
		}
		return (StringTable.IsEmpty ? null : StringTable.GetTable()?.GetEntry(Options[a])?.Value) ?? Options[a] ?? string.Empty;
	}

	protected override void hem()
	{
		psa--;
	}

	protected override void hen()
	{
		psa++;
	}
}
