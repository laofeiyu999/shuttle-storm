using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class ka : kd
{
	public float lsz;

	public float lta;

	public float ltb;

	public float ltc;

	public float ltd;

	public float lte;

	public MatchLogRecordType peu => MatchLogRecordType.ShuttleReseed;

	public static ka egh(Vector3 a, Vector3 b)
	{
		return new ka
		{
			lsz = a.x,
			lta = a.y,
			ltb = a.z,
			ltc = b.x,
			ltd = b.y,
			lte = b.z
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lsz);
		a.Write(lta);
		a.Write(ltb);
		a.Write(ltc);
		a.Write(ltd);
		a.Write(lte);
	}

	public static ka egi(BinaryReader a)
	{
		return new ka
		{
			lsz = a.ReadSingle(),
			lta = a.ReadSingle(),
			ltb = a.ReadSingle(),
			ltc = a.ReadSingle(),
			ltd = a.ReadSingle(),
			lte = a.ReadSingle()
		};
	}
}
