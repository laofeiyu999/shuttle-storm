using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class me
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct NetHit
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Time;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 Position;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 IncomingVelocity;
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct FloorBounce
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Time;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 Position;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 IncomingVelocity;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class md
	{
		public float mdx;

		internal NetHit eyp(NetHit a)
		{
			NetHit result = default(NetHit);
			result.Time = a.Time + mdx;
			result.Position = a.Position;
			result.IncomingVelocity = a.IncomingVelocity;
			return result;
		}

		internal FloorBounce eyq(FloorBounce a)
		{
			FloorBounce result = default(FloorBounce);
			result.Time = a.Time + mdx;
			result.Position = a.Position;
			result.IncomingVelocity = a.IncomingVelocity;
			return result;
		}
	}

	public readonly float mdy;

	public readonly Vector3 mdz;

	public readonly Vector3 mea;

	public readonly SortedList<float, Vector3> meb;

	public readonly SortedList<float, Vector3> mec;

	public readonly List<NetHit> med;

	public readonly List<FloorBounce> mee;

	public readonly Vector3 mef;

	public readonly bool meg;

	public me(float a, Vector3 b, Vector3 c, SortedList<float, Vector3> d, List<NetHit> e, List<FloorBounce> f, Vector3 g, bool h)
	{
		mdy = a;
		mdz = b;
		mea = c;
		meb = d;
		mec = eyr(d, f);
		med = e;
		mee = f;
		mef = g;
		meg = h;
	}

	private static SortedList<float, Vector3> eyr(SortedList<float, Vector3> a, List<FloorBounce> b)
	{
		if (b.Count == 0)
		{
			return a;
		}
		float time = b[0].Time;
		SortedList<float, Vector3> sortedList = new SortedList<float, Vector3>();
		for (int i = 0; i < a.Count && !(a.Keys[i] >= time); i++)
		{
			sortedList.Add(a.Keys[i], a.Values[i]);
		}
		return sortedList;
	}

	public me eys(float a)
	{
		SortedList<float, Vector3> sortedList = new SortedList<float, Vector3>(meb.Count);
		for (int i = 0; i < meb.Count; i++)
		{
			sortedList.Add(meb.Keys[i] + a, meb.Values[i]);
		}
		List<NetHit> e = med.Select(delegate(NetHit a)
		{
			NetHit result2 = default(NetHit);
			result2.Time = a.Time + a;
			result2.Position = a.Position;
			result2.IncomingVelocity = a.IncomingVelocity;
			return result2;
		}).ToList();
		List<FloorBounce> f = mee.Select(delegate(FloorBounce a)
		{
			FloorBounce result = default(FloorBounce);
			result.Time = a.Time + a;
			result.Position = a.Position;
			result.IncomingVelocity = a.IncomingVelocity;
			return result;
		}).ToList();
		return new me(mdy + a, mdz, mea, sortedList, e, f, mef, meg);
	}
}
