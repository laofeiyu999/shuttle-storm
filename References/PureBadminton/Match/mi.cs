using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class mi
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mg
	{
		public float mew;

		internal float ezt(ShuttleTrajectoryTable.Entry a)
		{
			return a.fae(mew).GetValueOrDefault();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mh
	{
		public float mex;

		internal float ezu(ShuttleTrajectoryTable.Entry a)
		{
			return a.fae(mex).GetValueOrDefault();
		}
	}

	public static readonly mi mey = new mi("Default");

	private ShuttleTrajectoryTable mez;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Initialize()
	{
		if (mey != null)
		{
			mey.mez?.fag();
		}
	}

	public mi(string a)
	{
		mez = Resources.Load<ShuttleTrajectoryTable>("ShuttleTrajectoryTable");
	}

	public Vector3? ezv(Vector3 a, Vector3 b, float c)
	{
		if (mez == null)
		{
			return null;
		}
		Vector2 vector = new Vector2(a.x, a.z);
		Vector2 vector2 = new Vector2(b.x, b.z) - vector;
		float magnitude = vector2.magnitude;
		if (magnitude <= 1E-06f)
		{
			return Vector2.zero;
		}
		Vector2 vector3 = vector2 / magnitude;
		float mew = b.y - a.y;
		int num = mez.faj(c);
		float? num2 = ezx(num, (ShuttleTrajectoryTable.Entry a) => a.fae(mew).GetValueOrDefault(), magnitude);
		if (!num2.HasValue)
		{
			return null;
		}
		Vector2 vector4 = vector3 * num2.Value;
		return new Vector3(vector4.x, mez.uyValues[num], vector4.y);
	}

	public float? ezw(Vector3 a, Vector3 b, Vector2 c)
	{
		if (mez == null)
		{
			return null;
		}
		Vector2 vector = new Vector2(a.x, a.z);
		float magnitude = (new Vector2(b.x, b.z) - vector).magnitude;
		float mex = b.y - a.y;
		float magnitude2 = c.magnitude;
		int a2 = mez.fai(magnitude2);
		return ezy(a2, (ShuttleTrajectoryTable.Entry a) => a.fae(mex).GetValueOrDefault(), magnitude);
	}

	private float? ezx(int a, Func<ShuttleTrajectoryTable.Entry, float> b, float c)
	{
		int num = a * mez.uxValues.Length;
		int num2 = 0;
		int num3 = mez.uxValues.Length - 1;
		while (num2 <= num3)
		{
			int num4 = num2 + (num3 - num2) / 2;
			float num5 = b(mez.entries[num + num4]);
			if (num5 == c)
			{
				return mez.uxValues[num4];
			}
			if (num5 < c)
			{
				num2 = num4 + 1;
			}
			else
			{
				num3 = num4 - 1;
			}
		}
		if (num3 < 0 || num2 >= mez.uxValues.Length)
		{
			return null;
		}
		float num6 = b(mez.entries[num + num3]);
		float num7 = b(mez.entries[num + num2]);
		return Mathf.Lerp(mez.uxValues[num3], mez.uxValues[num2], (c - num6) / (num7 - num6));
	}

	private float? ezy(int a, Func<ShuttleTrajectoryTable.Entry, float> b, float c)
	{
		int num = 0;
		int num2 = mez.uyValues.Length - 1;
		while (num <= num2)
		{
			int num3 = num + (num2 - num) / 2;
			float num4 = b(mez.entries[mez.fah(a, num3)]);
			if (num4 == c)
			{
				return mez.uyValues[num3];
			}
			if (num4 < c)
			{
				num = num3 + 1;
			}
			else
			{
				num2 = num3 - 1;
			}
		}
		if (num2 < 0 || num >= mez.uyValues.Length)
		{
			return null;
		}
		float num5 = b(mez.entries[mez.fah(a, num2)]);
		float num6 = b(mez.entries[mez.fah(a, num)]);
		return Mathf.Lerp(mez.uyValues[num2], mez.uyValues[num], (c - num5) / (num6 - num5));
	}

	public float ezz(float a, Vector3 b, Vector3 c)
	{
		if (mez == null)
		{
			return float.NaN;
		}
		if (Mathf.Approximately(b.z, a))
		{
			return b.y;
		}
		float num = Mathf.Max(0.0005f, mez.timeSampleResolution);
		float mass = mez.mass;
		float dragK = mez.dragK;
		Vector3 gravity = mez.gravity;
		Vector3 vector = b;
		Vector3 vector2 = c;
		float num2 = vector.z;
		float a2 = vector.y;
		float num3 = 0f;
		while (num3 < 10f)
		{
			Vector3 vector3 = (0f - dragK) * vector2 * vector2.magnitude / mass + gravity;
			vector2 += vector3 * num;
			vector += vector2 * num;
			num3 += num;
			float num4 = vector.z;
			float y = vector.y;
			if ((num2 - a) * (num4 - a) <= 0f && !Mathf.Approximately(num2, num4))
			{
				float t = Mathf.Clamp01((a - num2) / (num4 - num2));
				return Mathf.Lerp(a2, y, t);
			}
			if (vector.y <= 0f - mez.maxHitHeight)
			{
				return float.NaN;
			}
			if ((b.jvn() - new Vector2(vector.x, vector.z)).magnitude > mez.maxX + 0.001f)
			{
				return float.NaN;
			}
			num2 = num4;
			a2 = y;
		}
		return float.NaN;
	}

	public float faa(float a, float b, ShuttleTrajectoryTable c, float d, float e)
	{
		Vector3 vector = new Vector3(0f, e, 0f);
		Vector3 vector2 = new Vector3(0f, b, a);
		float timeSampleResolution = c.timeSampleResolution;
		float mass = c.mass;
		float dragK = c.dragK;
		Vector3 gravity = c.gravity;
		float num = 0f;
		float num2 = new Vector2(vector.x, vector.z).magnitude;
		float y = vector.y;
		if (num2 >= d)
		{
			return y;
		}
		while (num < 20f)
		{
			Vector3 vector3 = (0f - dragK) * vector2 * vector2.magnitude / mass + gravity;
			vector2 += vector3 * timeSampleResolution;
			vector += vector2 * timeSampleResolution;
			num += timeSampleResolution;
			float magnitude = new Vector2(vector.x, vector.z).magnitude;
			if (magnitude >= d)
			{
				float t = (d - num2) / Mathf.Max(1E-06f, magnitude - num2);
				return Mathf.Lerp(y, vector.y, t);
			}
			if (vector.y <= 0f - c.maxHitHeight)
			{
				return float.NaN;
			}
			if (vector.y > c.maxY)
			{
				return float.NaN;
			}
			if (magnitude > c.maxX)
			{
				return float.NaN;
			}
			num2 = magnitude;
			y = vector.y;
		}
		return float.NaN;
	}

	public SortedList<float, Vector3> fab(Vector3 a, Vector3 b)
	{
		return fac(a, b, Time.time);
	}

	public SortedList<float, Vector3> fac(Vector3 a, Vector3 b, float c)
	{
		SortedList<float, Vector3> sortedList = new SortedList<float, Vector3>();
		float fixedDeltaTime = Time.fixedDeltaTime;
		float mass = mez.mass;
		float dragK = mez.dragK;
		Vector3 gravity = mez.gravity;
		float num = 0f;
		Vector3 vector = b;
		Vector3 vector2 = a;
		while (num < 10f)
		{
			Vector3 vector3 = (0f - dragK) * vector * vector.magnitude / mass + gravity;
			vector += vector3 * fixedDeltaTime;
			vector2 += vector * fixedDeltaTime;
			num += fixedDeltaTime;
			if (vector2.y < 0f)
			{
				if (sortedList.Any())
				{
					KeyValuePair<float, Vector3> keyValuePair = sortedList.Last();
					float t = keyValuePair.Value.y / (keyValuePair.Value.y - vector2.y);
					sortedList.TryAdd(Mathf.Lerp(keyValuePair.Key, c + num, t), Vector3.Lerp(keyValuePair.Value, vector2, t));
				}
				break;
			}
			sortedList.Add(c + num, vector2);
		}
		return sortedList;
	}
}
