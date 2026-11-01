using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public readonly struct CourtGeometry
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly float CenterX;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly float NetZ;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly bool IsDouble;

	public float pbs
	{
		get
		{
			if (!IsDouble)
			{
				return CourtManager.singleCourtWidth;
			}
			return CourtManager.doubleCourtWidth;
		}
	}

	public float pbt => CenterX - pbs / 2f;

	public float pbu => CenterX + pbs / 2f;

	public float pbv => NetZ - CourtManager.courtLength / 2f;

	public float pbw => NetZ + CourtManager.courtLength / 2f;

	public Rect pbx => new Rect(pbt, pbv, pbs, CourtManager.courtLength);

	public float pby => pbs / 2f;

	public float pbz => CourtManager.halfCourtLength - CourtManager.frontZoneLength - (IsDouble ? CourtManager.rearZoneLength : 0f);

	public CourtGeometry(float centerX, float netZ, bool isDouble)
	{
		CenterX = centerX;
		NetZ = netZ;
		IsDouble = isDouble;
	}

	public Rect dup(bool a, bool b)
	{
		float num = (IsDouble ? CourtManager.rearZoneLength : 0f);
		if (a)
		{
			if (!b)
			{
				return new Rect(pbt, pbv + num, pby, pbz);
			}
			return new Rect(pbt + pbs / 2f, pbv + num, pby, pbz);
		}
		if (!b)
		{
			return new Rect(pbt + pbs / 2f, NetZ + CourtManager.frontZoneLength, pby, pbz);
		}
		return new Rect(pbt, NetZ + CourtManager.frontZoneLength, pby, pbz);
	}

	public float duq(Vector3 a)
	{
		return (a.x - CenterX) * 2f / pbs;
	}

	public float dur(float a, float b = 0f)
	{
		return CenterX + a * (pbs / 2f - b);
	}

	public float dus(float a, float b, float c = 0f)
	{
		return CenterX + a * (pbs / 4f - c) + b * pbs / 4f;
	}

	public static float dut(bool a, bool b)
	{
		return (!(a ^ !b)) ? 1 : (-1);
	}

	public bool duu(Vector3 a)
	{
		return a.z < NetZ;
	}

	public float duv(Rect a, Vector2 b)
	{
		float a2 = Mathf.Min(Mathf.Abs(b.x - a.xMin), Mathf.Abs(b.x - a.xMax));
		float b2 = Mathf.Min(Mathf.Abs(b.y - a.yMin), Mathf.Abs(b.y - a.yMax));
		if (a.Contains(b))
		{
			return Mathf.Min(a2, b2);
		}
		float num = Mathf.Max(a.xMin - b.x, 0f, b.x - a.xMax);
		float num2 = Mathf.Max(a.yMin - b.y, 0f, b.y - a.yMax);
		if (!(num > 0f) || !(num2 > 0f))
		{
			return Mathf.Max(num, num2);
		}
		return Mathf.Sqrt(num * num + num2 * num2);
	}
}
