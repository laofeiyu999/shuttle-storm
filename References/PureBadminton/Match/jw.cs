using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jw : kd
{
	public byte lrr;

	public uint lrs;

	public short lrt;

	public short lru;

	public short lrv;

	public string lrw = "";

	public bool lrx;

	public bool lry;

	public MatchLogRecordType peu => MatchLogRecordType.PotentialShot;

	public static jw efz(byte a, uint b, Vector3 c, string d, bool e, bool f)
	{
		return new jw
		{
			lrr = a,
			lrs = b,
			lrt = kc.ego(c.x),
			lru = kc.ego(c.y),
			lrv = kc.ego(c.z),
			lrw = (d ?? ""),
			lrx = e,
			lry = f
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lrr);
		a.Write(lrs);
		a.Write(lrt);
		a.Write(lru);
		a.Write(lrv);
		a.Write(lrw);
		a.Write(lrx);
		a.Write(lry);
	}

	public static jw ega(BinaryReader a)
	{
		return new jw
		{
			lrr = a.ReadByte(),
			lrs = a.ReadUInt32(),
			lrt = a.ReadInt16(),
			lru = a.ReadInt16(),
			lrv = a.ReadInt16(),
			lrw = a.ReadString(),
			lrx = a.ReadBoolean(),
			lry = a.ReadBoolean()
		};
	}
}
