using System;
using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class bfu
{
	public static Vector2 jvn(this Vector3 a)
	{
		return new Vector2(a.x, a.z);
	}

	public static Vector3 jvo(this Vector2 a)
	{
		return new Vector3(a.x, 0f, a.y);
	}

	public static Vector3 jvp(this Vector3 a)
	{
		return new Vector3(a.x, 0f, a.z);
	}

	public static Rect jvq(this Rect a, float b)
	{
		return Rect.MinMaxRect(a.xMin - b, a.yMin - b, a.xMax + b, a.yMax + b);
	}

	public static Rect jvr(this Rect a, float b, float c)
	{
		return Rect.MinMaxRect(a.xMin - b, a.yMin - c, a.xMax + b, a.yMax + c);
	}

	public static Rect jvs(this Rect a, float b)
	{
		return a.jvq(0f - b);
	}

	public static Rect jvt(this Rect a, float b, float c)
	{
		return a.jvr(0f - b, 0f - c);
	}

	public static float jvu(this MonoBehaviour a, Vector3 b)
	{
		return (b.jvn() - a.transform.position.jvn()).magnitude;
	}

	public static float jvv(this MonoBehaviour a, Vector2 b)
	{
		return (b - a.transform.position.jvn()).magnitude;
	}

	public static Vector3 jvw<a>(this IEnumerable<a> a, Func<a, Vector3> b)
	{
		Vector3 zero = Vector3.zero;
		if (!a.Any())
		{
			return zero;
		}
		foreach (a item in a)
		{
			zero += b(item);
		}
		return zero / a.Count();
	}
}
