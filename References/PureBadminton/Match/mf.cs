using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class mf
{
	private const float meh = 0.01f;

	public static me eyt(float a, Vector3 b, Vector3 c, ShuttleBounceParameters d, float e = 0f)
	{
		SortedList<float, Vector3> sortedList = new SortedList<float, Vector3>();
		sortedList.Add(a, b);
		List<me.NetHit> list = new List<me.NetHit>();
		List<me.FloorBounce> list2 = new List<me.FloorBounce>();
		float num = 1.55f;
		float num2 = a;
		Vector3 a2 = b;
		Vector3 b2 = c;
		int num3 = 0;
		for (int i = 0; i < 8; i++)
		{
			SortedList<float, Vector3> sortedList2 = mi.mey.fab(a2, b2);
			if (sortedList2 == null || sortedList2.Count == 0)
			{
				break;
			}
			int num4 = -1;
			bool flag = false;
			for (int j = 1; j < sortedList2.Count; j++)
			{
				Vector3 vector = sortedList2.Values[j - 1];
				Vector3 vector2 = sortedList2.Values[j];
				if ((vector.z - e) * (vector2.z - e) < 0f)
				{
					float t = (e - vector.z) / (vector2.z - vector.z);
					if (Mathf.Lerp(vector.y, vector2.y, t) < num + 0.01f)
					{
						num4 = j;
						flag = true;
						break;
					}
				}
				if (vector.y > d.floorContactHeight && vector2.y <= d.floorContactHeight)
				{
					num4 = j;
					flag = false;
					break;
				}
			}
			float num5 = sortedList2.Keys[0] - Time.fixedDeltaTime;
			if (num4 < 0)
			{
				eyv(sortedList, sortedList2, num2, num5);
				break;
			}
			Vector3 vector3 = sortedList2.Values[num4 - 1];
			Vector3 b3 = sortedList2.Values[num4];
			float num6 = sortedList2.Keys[num4 - 1] - num5;
			float b4 = sortedList2.Keys[num4] - num5;
			float t2 = ((!flag) ? ((vector3.y - d.floorContactHeight) / (vector3.y - b3.y)) : ((e - vector3.z) / (b3.z - vector3.z)));
			Vector3 vector4 = Vector3.Lerp(vector3, b3, t2);
			float num7 = Mathf.Lerp(num6, b4, t2);
			float num8 = num2 + num7;
			eyw(sortedList, sortedList2, num2, num5, num4, num7, vector4);
			float num9 = Mathf.Max(num7 - num6, 1E-06f);
			Vector3 incomingVelocity = (vector4 - vector3) / num9;
			Vector3 vector5;
			if (flag)
			{
				vector5 = new Vector3(incomingVelocity.x * d.netFriction, incomingVelocity.y * d.netFriction, (0f - incomingVelocity.z) * d.netRestitution);
				list.Add(new me.NetHit
				{
					Time = num8,
					Position = vector4,
					IncomingVelocity = incomingVelocity
				});
			}
			else
			{
				float y = Mathf.Clamp(Mathf.Abs(incomingVelocity.y) * d.floorRestitution, d.floorMinBounceVelocity, d.floorMaxBounceVelocity);
				vector5 = new Vector3(incomingVelocity.x * d.floorFriction, y, incomingVelocity.z * d.floorFriction);
				list2.Add(new me.FloorBounce
				{
					Time = num8,
					Position = vector4,
					IncomingVelocity = incomingVelocity
				});
				num3++;
			}
			if (vector5.magnitude < d.stopVelocityThreshold || (!flag && num3 >= d.maxFloorBounces))
			{
				break;
			}
			num2 = num8;
			a2 = vector4;
			b2 = vector5;
		}
		Vector3 vector6 = ((list2.Count > 0) ? list2[0].Position : ((sortedList.Count > 0) ? sortedList.Values[sortedList.Count - 1] : b));
		bool h = eyu(b, vector6, sortedList, e, num);
		return new me(a, b, c, sortedList, list, list2, vector6, h);
	}

	private static bool eyu(Vector3 a, Vector3 b, SortedList<float, Vector3> c, float d, float e)
	{
		bool num = a.z < d;
		bool flag = b.z < d;
		if (num == flag)
		{
			return false;
		}
		for (int i = 1; i < c.Count; i++)
		{
			Vector3 vector = c.Values[i - 1];
			Vector3 vector2 = c.Values[i];
			if (!((vector.z - d) * (vector2.z - d) >= 0f))
			{
				float t = (d - vector.z) / (vector2.z - vector.z);
				return Mathf.Lerp(vector.y, vector2.y, t) > e;
			}
		}
		return false;
	}

	private static void eyv(SortedList<float, Vector3> a, SortedList<float, Vector3> b, float c, float d)
	{
		for (int i = 0; i < b.Count; i++)
		{
			float key = c + (b.Keys[i] - d);
			if (!a.ContainsKey(key))
			{
				a.Add(key, b.Values[i]);
			}
		}
	}

	private static void eyw(SortedList<float, Vector3> a, SortedList<float, Vector3> b, float c, float d, int e, float f, Vector3 g)
	{
		for (int i = 0; i < e; i++)
		{
			float key = c + (b.Keys[i] - d);
			if (!a.ContainsKey(key))
			{
				a.Add(key, b.Values[i]);
			}
		}
		float key2 = c + f;
		if (!a.ContainsKey(key2))
		{
			a.Add(key2, g);
		}
	}
}
