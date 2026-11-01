using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterAimPreview : CharacterComponent
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float DECAL_MAX_SPEED = 30f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float LENGTH_WIDTH_RATIO = 1.33f;

	public void dfb()
	{
		base.ozd.AimingDecal.enabled = false;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (!base.ozj || base.ozc.lhi.lju == null || base.ozc.lhi.lju.pbl || !base.ozc.lhi.nextShotType.HasValue)
		{
			return;
		}
		float nextShotPower = base.ozc.lhi.nextShotPower;
		ShotType value = base.ozc.lhi.nextShotType.Value;
		Vector2 vector = base.ozc.lhi.nextShotDirection ?? base.ozc.lhe.diu();
		Vector3 vector2 = base.ozc.lhi.lju.ljf;
		CharacterStats stats = base.ozc.Player.CharacterInfo.stats;
		float num = (base.ozl ? base.oze.pch : base.oze.pcg);
		if (!base.ozd.peb && base.ozd.pdy.IsDouble)
		{
			num -= CourtManager.rearZoneLength * (float)(base.ozl ? 1 : (-1));
		}
		float num2 = (vector.y + 1f) / 2f;
		float num3 = Mathf.Lerp(0.5f, 0.2f, CharacterStats.ftj(stats.precision));
		float num4 = num3;
		if (value == ShotType.Smash)
		{
			num3 *= 1.5f;
			num4 = Mathf.Lerp(num3 * 1.5f, 1.5f, (nextShotPower - 0.7f) / 0.3f);
		}
		else
		{
			num4 = Mathf.Lerp(num3, 1.2f, (nextShotPower - 0.7f) / 0.3f);
		}
		float num5 = num4 * 1.33f;
		num += num3 * (float)((!base.ozl) ? 1 : (-1));
		float x = base.oze.dvt(vector.x, b: true, num3 * 0.4f);
		float y = 0f;
		switch (value)
		{
		case ShotType.Clear:
			y = num;
			y += nextShotPower - 0.7f;
			break;
		case ShotType.Smash:
		{
			float num6 = vector2.z + (base.oze.pci - vector2.z) * vector2.y / (vector2.y - 1.55f);
			num6 -= 2f;
			y = ((!(base.ozl ^ (num6 > num)) || !(base.ozl ^ (num6 < base.oze.pci))) ? (num + ((vector.y < 0f) ? vector.y : 0f) * (float)(base.ozl ? 1 : (-1))) : Mathf.Lerp(num6, num, num2));
			break;
		}
		case ShotType.Drop:
		{
			float num7 = (0.6f * Mathf.Abs(base.oze.pci - vector2.z)).gtg(0.4f, 1.2f);
			if (base.ozd.StatsManager.luc.mvg.Any() && base.ozd.StatsManager.luc.mvg.Last().mvi == ShotType.Smash)
			{
				num7 += 1f;
			}
			if (!base.ozd.peb)
			{
				num2 = ((num2 - 0.5f) * 2f).gtg(0f, 1f);
				num7 = CourtManager.frontZoneLength + (1f - num2) * num5 / 2f;
			}
			float b = Mathf.Lerp(num7, (num7 + 1.5f).gtg(2.5f, 3.5f), num2);
			y = base.oze.pci + Mathf.Max(1f, b) * (float)(base.ozl ? 1 : (-1));
			break;
		}
		case ShotType.Midcourt:
			y = base.oze.pci + CourtManager.halfCourtLength / 2f * (float)(base.ozl ? 1 : (-1)) + Mathf.Lerp(-1f, 1f, num2);
			break;
		}
		dfc(new Vector2(x, y));
		base.ozd.AimingDecal.size = new Vector3(num4, num5, base.ozd.AimingDecal.size.z);
		base.ozd.AimingDecal.fadeFactor = Mathf.Lerp(0.8f, 0.2f, num4 - 0.2f);
	}

	private void dfc(Vector2 a)
	{
		Vector3 vector = new Vector3(a.x, base.ozd.AimingDecal.transform.position.y, a.y);
		if (!base.ozd.AimingDecal.enabled)
		{
			base.ozd.AimingDecal.gameObject.layer = base.ozc.dmw();
			base.ozd.AimingDecal.enabled = true;
			base.ozd.AimingDecal.transform.position = vector;
			return;
		}
		float num = 30f * Time.deltaTime;
		if ((vector - base.ozd.AimingDecal.transform.position).magnitude > num)
		{
			vector = base.ozd.AimingDecal.transform.position + (vector - base.ozd.AimingDecal.transform.position).normalized * num;
		}
		base.ozd.AimingDecal.transform.position = vector;
	}
}
