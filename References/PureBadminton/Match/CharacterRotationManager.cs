using System;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterRotationManager : CharacterComponent
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float ROTATION_SPEED = 360f;

	private float? lir;

	public float? liq { get; set; }

	public float pbi => base.transform.eulerAngles.y - pbj;

	public float pbj => (!base.ozl) ? 180 : 0;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Update()
	{
		if (!liq.HasValue)
		{
			return;
		}
		float y = base.ozg.rotation.eulerAngles.y;
		float current = y - pbj;
		float num = (Time.deltaTime * lir) ?? 360f;
		float num2 = Mathf.DeltaAngle(current, liq.Value);
		if (!(Math.Abs(num2) < 5f))
		{
			if (Math.Abs(num2) < num * 3f)
			{
				base.ozg.rotation = Quaternion.Euler(0f, liq.Value + pbj, 0f);
			}
			else
			{
				base.ozg.rotation = Quaternion.Euler(0f, y + num2.gtg(0f - num, num), 0f);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Reset()
	{
		dpm(0f, 0f);
	}

	public void dpm(float a, float? b)
	{
		liq = a;
		if (!b.HasValue)
		{
			return;
		}
		if (b == 0f)
		{
			base.ozg.rotation = Quaternion.Euler(0f, a + pbj, 0f);
			return;
		}
		float current = base.ozg.rotation.eulerAngles.y - pbj;
		lir = Mathf.Abs(Mathf.DeltaAngle(current, a)) / b;
		this.gux(b.Value, delegate
		{
			lir = null;
		});
	}

	[CompilerGenerated]
	private void dpn()
	{
		lir = null;
	}
}
