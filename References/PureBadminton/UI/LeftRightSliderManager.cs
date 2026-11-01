using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class LeftRightSliderManager : LeftRightInputManager
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Slider slider;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public UnityEvent<float> OnValueChanged;

	protected override bool pry => slider.value <= slider.minValue;

	protected override bool prz => slider.value >= slider.maxValue;

	public float psb
	{
		get
		{
			return slider.value;
		}
		set
		{
			slider.value = value;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		slider.onValueChanged.AddListener(OnValueChanged.Invoke);
	}

	protected override void hem()
	{
		slider.value -= (slider.maxValue - slider.minValue) / 20f;
		heo();
	}

	protected override void hen()
	{
		slider.value += (slider.maxValue - slider.minValue) / 20f;
		heo();
	}
}
