using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CountdownPanel : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnCountdownFinish();

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI text;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private int countdownSeconds = 3;

	private float? mgr;

	public event OnCountdownFinish mgq;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		mgr = Time.unscaledTime;
		text.text = countdownSeconds.ToString();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (mgr.HasValue)
		{
			float num = Time.unscaledTime - mgr.Value;
			if (num > (float)countdownSeconds)
			{
				mgr = null;
				StartCoroutine(gxk());
				this.mgq?.Invoke();
			}
			else
			{
				text.text = (countdownSeconds - Mathf.FloorToInt(num).gth(0, countdownSeconds - 1)).ToString();
				text.color = new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, (byte)Mathf.RoundToInt(Mathf.Lerp(255f, 0f, num % 1f)));
				text.fontSize = Mathf.Lerp(80f, 0f, num % 1f);
			}
		}
	}
}
