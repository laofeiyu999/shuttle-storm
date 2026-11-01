using System;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TimeScorePanel : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnTimeEnds();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject timerIcon;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI timeText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI scoreText;

	private AudioSource mix;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float? EndTime;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int? ScoreLimit;

	public int phx
	{
		set
		{
			scoreText.text = value + (ScoreLimit.HasValue ? $"<sub>/{ScoreLimit}</sub>" : "");
		}
	}

	public (int, int) phy
	{
		set
		{
			scoreText.text = $"{value.Item1} - {value.Item2}";
		}
	}

	public event OnTimeEnds miy;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		timerIcon.SetActive(EndTime.HasValue);
		timeText.gameObject.SetActive(EndTime.HasValue);
		RectTransform component = scoreText.GetComponent<RectTransform>();
		component.anchorMin = (EndTime.HasValue ? new Vector2(0f, 0.4f) : Vector2.zero);
		Vector2 offsetMin = (component.offsetMax = Vector2.zero);
		component.offsetMin = offsetMin;
		if (EndTime.HasValue)
		{
			mix = GetComponent<AudioSource>();
			mix.volume = 0.2f;
			mix.Play();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Update()
	{
		if (EndTime.HasValue)
		{
			if (Time.time < EndTime)
			{
				float num = EndTime.Value - Time.time;
				timeText.text = Mathf.FloorToInt(num / 60f).ToString().PadLeft(2, '0') + ":" + Math.Ceiling(num % 60f).ToString().PadLeft(2, '0');
				mix.volume = Mathf.Lerp(1f, 0.2f, (EndTime.Value - 5f - Time.time) / 10f);
			}
			else
			{
				mix.Stop();
				EndTime = null;
				timeText.text = "00:00";
				this.miy?.Invoke();
			}
		}
	}
}
